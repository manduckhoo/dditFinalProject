package kr.or.onesome.frcssalespurchase.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.or.onesome.vo.PaymentDetailVO;
import lombok.Data;

@Data
public class FrcsSalesPurchaseVO {

	private int pynmNo;				//주문 번호
	private int memNo;				//회원 고유 번호
	private int frcsNo;				//가맹점 번호
	private String pynmMthdId;		//결제 수단 ID
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pynmDt;			//결제 일시
	private int pynmTotalAmt;		//주문 총 금액
	private String setupMenuYn;		//메뉴 준비 완료 여부
	
	private int total;				//총합 sum 함수 집계용
	
	//주문 : 주문상세
	private List<PaymentDetailVO> paymentDetailVOList;
}
