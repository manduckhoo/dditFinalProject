package kr.or.onesome.frcssalespurchase.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PproductVO {

	private int prdctNo;			//제품번호
	private String prdctNm;			//제품명
	private int prdctRcvnAmt;		//입고 단가
	
	//private String prdctClsfCd;		//제품분류공통코드
	//private String prdctExpln;		//제품 설명
	//private Date prdctPrchsStrtDt;	//구매 시작일
	//private Date prdctPrchsEndDt;	//구매 종료일
	//private String prdctDscnYn;		//단종 여부
	//private String allergensYn;		//알레르기 유발 유무
	//private int hqInvenCnt;			//본사재고수량
	//private int hqInvenProperCnt;	//본사적정수량
	//private int acntNo;				//거래처 번호
	
}
