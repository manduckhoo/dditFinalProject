package kr.or.onesome.websocket;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.onesome.alarm.mapper.AlarmMapper;
import kr.or.onesome.alarm.vo.AlarmVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @Title 웹소켓 핸들러
 * @author 원종찬
 */
@Slf4j
@Component
@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {

	@Autowired
	private AlarmMapper alarmMapper;

	// 로그인한 모든 유저
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();

	// 현재 로그인 중인 개별 유저
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	/**
	 * 웹소켓 연결 성공 시
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("afterConnectionEstablished(소켓 연결): {}" + session);
		
		String userId = getId(session);
		
		if(userId != null) {
			log.info("userId: {}", userId, "연결됨");
			users.put(userId, session); // 로그인중 개별유저 저장 
		}
		
		sessions.add(session); // 웹 소켓이 생성될때마다 리스트에 넣어줌
	}

	/**
	 * 웹소켓 메시지 수신 및 송신
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String userId = getId(session);
		
		// 특정 유저에게 메시지 보내기
		String msg = message.getPayload(); // jsp에서 받은 메시지 (ajax에서 socket.send()로 보낸 메시지... ex)주문 버튼을 눌렀을때)
		log.info("msg: {}", msg);
		if(msg != null) {
			String[] strs = msg.split(",");
			
			if(strs != null && strs.length == 3) {
				String alarmRcverId = strs[0]; 	// 알람 수신자 아이디
				String alarmConts = strs[1]; 	// 알람 내용
				String movUrl = strs[2];		// 이동할 url 주소
				WebSocketSession alarmRcverIdSession = users.get(alarmRcverId); // 메시지를 받을 세션 조회
				
				// DB에서 알람 온거 가져오기
				List<AlarmVO> alarmList = this.alarmMapper.selectAlarm(userId);
				
				ObjectMapper objectMapper = new ObjectMapper();
				
				log.info("알람리스트: {}", alarmList);
				log.info("로그인 사용자: {}", alarmRcverIdSession);
				
				// 실시간 접속시
				if(alarmRcverIdSession != null) {
					TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+ movUrl +"'>" + alarmConts + "</a>");
//					TextMessage tmpMsg = new TextMessage(objectMapper.writeValueAsString(alarmList));
					alarmRcverIdSession.sendMessage(tmpMsg);
				}
			}
		}
		
		
		
	}
	
	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		logMessage(session.getId() + "익셉션 발생: " + exception.getMessage());
	}
	
	// 로그 메시지
	private void logMessage(String logmsg) {
		log.info("알람로그: " + new Date() + " : " + logmsg);
	}

	/**
	 * 웹소켓 연결 죵료 시
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String senderId = session.getId();
		if (senderId != null) {
			log.info(senderId + "연결 종료됨");
			
			users.remove(senderId);
			sessions.remove(session);
		}
	}
	
	// 웹소켓 아이디 가져오기
	// 접속한 유저의 http세션을 조회하여 id를 얻는 메서드
	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String userId = (String) httpSession.get("userId"); // 세션에 저장된 userId 기준 조회
		
		return userId==null?null:userId;
	}

	
}