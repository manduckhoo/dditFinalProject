package kr.or.onesome.alarm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.onesome.alarm.vo.AlarmVO;

@Mapper
public interface AlarmMapper {
	
	/**
	 * 알림 조회
	 * @param memId
	 * @return
	 */
	public List<AlarmVO> selectAlarm(String memId);
	
	/**
	 * 알람 저장
	 * @param alarmVO
	 * @return
	 */
	public int saveAlarm(AlarmVO alarmVO);

}
