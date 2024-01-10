package kr.or.onesome.frcssalespurchase.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.frcssalespurchase.mapper.FrcsSalesPurchaseMapper;
import kr.or.onesome.frcssalespurchase.service.FrcsSalesPurchaseService;
import kr.or.onesome.frcssalespurchase.vo.FrcsSalesPurchaseVO;
import kr.or.onesome.vo.PaymentDetailVO;

@Service
public class FrcsSalesPurchaseServiceImpl implements FrcsSalesPurchaseService {

	@Autowired
	FrcsSalesPurchaseMapper frcsSalesPurchaseMapper;

	//일일 매출 분석 차트
	@Override
	public List<FrcsSalesPurchaseVO> days(Map<String, Object> map) {
		return this.frcsSalesPurchaseMapper.days(map);
	}

	//파이차트
	@Override
	public List<PaymentDetailVO> pieChart(Map<String, Object> map) {
		return this.frcsSalesPurchaseMapper.pieChart(map);
	}

	//하단 매출 내역
	@Override
	public List<FrcsSalesPurchaseVO> list(FrcsSalesPurchaseVO frcsSalesPurchaseVO) {
		return this.frcsSalesPurchaseMapper.list(frcsSalesPurchaseVO);
	}
	
	//하단 매출 내역 상세
	@Override
	public List<PaymentDetailVO> detail(PaymentDetailVO paymentDetailVO) {
		return this.frcsSalesPurchaseMapper.detail(paymentDetailVO);
	}

}
