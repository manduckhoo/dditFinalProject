package kr.or.onesome.frcssalespurchase.service;

import java.util.List;

import kr.or.onesome.vo.PaymentDetailVO;
import kr.or.onesome.vo.PaymentVO;

public interface DaysService {

	//일일 매출 내역
	List<PaymentVO> daysList(PaymentVO paymentVO);

	//파이 차트
	List<PaymentVO> pieChart(PaymentVO paymentVO);

	//상세 리스트?
	List<PaymentVO> detailList(PaymentVO paymentVO);

	//주문내역 상세(ajax)
	List<PaymentDetailVO> daysDetail(PaymentDetailVO paymentDetailVO);

}
