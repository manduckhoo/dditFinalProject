package kr.or.onesome.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;


//창업 상담 신청자
@Data
public class InquirerVO {

	private int inqrNo;				// 창업 상담 코드 (PK)
	private String inqrStatusYn;    // 창업 승인 여부
	private String inqrRm;			// 창업 비고란 
	private String inqrNm;			// 상담자 이름
	private String inqrTel;			// 상담자 연락처
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm")
	private String inqrReqDt;			// 상담자 신청 일시
	private String inqrEmail;		// 신청자 이메일
	private String inqrRgnlHope;	// 창업 희망 지역
	private String inqrExpctCost;		// 예상 비용
	private String inqrStoreYn;		// 상가 보유 유무
	private String inqrStoreAddr;	// 상가 주소
	private String inqrStrtpXp;		// 창업 경험 
	
}
