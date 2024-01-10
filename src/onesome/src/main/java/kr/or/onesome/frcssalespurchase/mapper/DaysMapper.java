package kr.or.onesome.frcssalespurchase.mapper;

import java.util.List;

import kr.or.onesome.vo.PaymentDetailVO;
import kr.or.onesome.vo.PaymentVO;

public interface DaysMapper {

	//일일 매출 내역
	List<PaymentVO> daysList(PaymentVO paymentVO);

	//일일 파이 차트
	List<PaymentVO> pieChart(PaymentVO paymentVO);

	//일일 상세 디테일?
	List<PaymentVO> detailList(PaymentVO paymentVO);

	//주문내역상세(ajax)
	List<PaymentDetailVO> daysDetail(PaymentDetailVO paymentDetailVO);

}
