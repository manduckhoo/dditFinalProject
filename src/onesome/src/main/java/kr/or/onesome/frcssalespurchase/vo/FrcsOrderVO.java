package kr.or.onesome.frcssalespurchase.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class FrcsOrderVO {

	private int frcsOrderNo;			//가맹점 발주번호
	private int frcsNo;					//가맹점 번호
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date frcsOrderDt;			//가맹점 발주 일자
	private long frcsOrderOrderAmt;		//가맹점 총 발주금액
	
	private String yyyymm;	//쿼리 뽑아내기 용(월별 구분)
	private long total;		//쿼리 뽑아내기 용(매입 내역 합계) 
	//private String frcsOrderTypeCd;	//가맹점 발주상태 공통코드
	
	//발주상세VO - 발주상세VOList
	private List<FrcsOrderDetailVO> frcsOrderDetailVOList;
	
}
