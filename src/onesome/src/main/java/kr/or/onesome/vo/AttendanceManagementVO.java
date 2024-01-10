package kr.or.onesome.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AttendanceManagementVO {
	
	private int attndceNo;			//근태 관리 번호
	private int frcsEmpNo;			//가맹점 직원 번호
	private int frcsNo;				//가맹점 번호
	private String attndceTypeCd;	//근태유형 공통코드
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
	private Date attndceStrDt;		//시작 일시
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
	private Date attndceEndDt;		//종료 일시
}
