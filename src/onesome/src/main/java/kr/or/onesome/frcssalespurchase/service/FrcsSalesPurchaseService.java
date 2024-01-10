package kr.or.onesome.frcssalespurchase.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.onesome.frcssalespurchase.vo.FrcsSalesPurchaseVO;
import kr.or.onesome.vo.PaymentDetailVO;

public interface FrcsSalesPurchaseService {

	//차트 아래 표에 출력할 내용
	List<FrcsSalesPurchaseVO> list(FrcsSalesPurchaseVO frcsSalesPurchaseVO);

	//일일 매출 분석 차트
	List<FrcsSalesPurchaseVO> days(Map<String, Object> map);

	//파이차트
	List<PaymentDetailVO> pieChart(Map<String, Object> resultMap);

	//상세
	List<PaymentDetailVO> detail(PaymentDetailVO paymentDetailVO);

}
