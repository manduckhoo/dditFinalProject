package kr.or.onesome.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OffDocVO {
	private int offDocNo; //가맹점 공문 번호
	private String offDocFrom; //공문 발신인
	private String offDocTo; //공문 수신인
	private String offDocTitle; //제목
	private String offDocConts; //내용
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date offDocFwdDt; //발신일
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date offDocRecDt; //수신일
	private String offDocStatusYn;  //공문 확인 여부
	
	int[] frcsNmCheck;        //체크된 가맹점
	String offDocFromNm;      //공문 발신인 이름
	String offDocToNm;		  //공문 수신 가맹점
}
