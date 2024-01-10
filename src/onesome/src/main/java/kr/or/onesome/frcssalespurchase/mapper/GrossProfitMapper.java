package kr.or.onesome.frcssalespurchase.mapper;

import java.util.List;
import java.util.Map;

import kr.or.onesome.frcssalespurchase.vo.FrcsOrderVO;
import kr.or.onesome.vo.PaymentDetailVO;
import kr.or.onesome.vo.PaymentVO;

public interface GrossProfitMapper {

	//매출 내역
	List<PaymentVO> paymentList(PaymentVO paymentVO);

	//매입 내역
	List<FrcsOrderVO> frcsOrderList(FrcsOrderVO frcsOrderVO);

	//매출액 내역(1개월 씩)
	PaymentVO monthPaymentList(Map<String, Object> grossProfitMap);

	//매입액 내역(1개월 씩)
	FrcsOrderVO monthFrcsOrderList(Map<String, Object> grossProfitMap);

	//판매 수량 내림차순
	List<PaymentDetailVO> paymentTopList(Map<String, Object> grossProfitMap);

	//판매 수량 내림차순
	//List<PaymentDetailVO> paymentTopList(PaymentDetailVO paymentDetailVO);
}
