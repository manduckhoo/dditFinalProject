package kr.or.onesome.websocket;

import java.util.Map;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebsocketHandshakeInterceptor extends HttpSessionHandshakeInterceptor{
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		
		log.info("beforeHandshake() 호출됨.");
		
		log.info("SecurityContextHolder: {}" , SecurityContextHolder.getContext().getAuthentication());
		
		// 필요정보를 attributes 에 미리 설정해주면 웹소켓 핸들러에서 웹소켓 세션의 getAttributes()를 이용하여 꺼내 사용할 수 있다.
		attributes.put("name", "홍길동");
		
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}
	
	
	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		
		log.info("afterHandshake() 호출됨.");
		
		super.afterHandshake(request, response, wsHandler, ex);
	}
}
