package kr.or.onesome.frcssalespurchase.mapper;

import java.util.List;
import java.util.Map;

import kr.or.onesome.frcssalespurchase.vo.FrcsSalesPurchaseVO;
import kr.or.onesome.vo.PaymentDetailVO;

public interface FrcsSalesPurchaseMapper {

	//일일 매출 분석 차트
	List<FrcsSalesPurchaseVO> days(Map<String, Object> map);

	//파이차트
	List<PaymentDetailVO> pieChart(Map<String, Object> map);
	
	//하단 매출 내역
	List<FrcsSalesPurchaseVO> list(FrcsSalesPurchaseVO frcsSalesPurchaseVO);
	
	//하단 매출 내역 상세
	List<PaymentDetailVO> detail(PaymentDetailVO paymentDetailVO);

}
