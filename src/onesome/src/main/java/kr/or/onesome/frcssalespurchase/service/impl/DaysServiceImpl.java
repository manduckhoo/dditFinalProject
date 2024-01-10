package kr.or.onesome.frcssalespurchase.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.frcssalespurchase.mapper.DaysMapper;
import kr.or.onesome.frcssalespurchase.service.DaysService;
import kr.or.onesome.vo.PaymentDetailVO;
import kr.or.onesome.vo.PaymentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DaysServiceImpl implements DaysService {

	@Autowired
	DaysMapper daysMapper;
	
	//일일 매출 내역
	@Override
	public List<PaymentVO> daysList(PaymentVO paymentVO) {
		return this.daysMapper.daysList(paymentVO);
	}

	//일일 파이 차트
	@Override
	public List<PaymentVO> pieChart(PaymentVO paymentVO) {
		return this.daysMapper.pieChart(paymentVO);
	}

	//상세 리스트?
	@Override
	public List<PaymentVO> detailList(PaymentVO paymentVO) {
		return this.daysMapper.detailList(paymentVO);
	}

	//주문내역 상세 ( ajax)
	@Override
	public List<PaymentDetailVO> daysDetail(PaymentDetailVO paymentDetailVO) {
		return this.daysMapper.daysDetail(paymentDetailVO);
	}

}
