package kr.or.onesome.alarm.vo;

import lombok.Data;

@Data
public class AlarmVO {
	private int alarmNo;
	private String alarmRcverId; // 알림 수신자의 PK
	private String alarmConts;   // 알림 내용
	private String alarmChecked; // 알람 확인 유무 디폴트값 N
	private String movUrl;		 // 이동할URL
}
