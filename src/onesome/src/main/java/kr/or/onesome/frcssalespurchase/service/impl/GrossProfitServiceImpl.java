package kr.or.onesome.frcssalespurchase.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.frcssalespurchase.mapper.GrossProfitMapper;
import kr.or.onesome.frcssalespurchase.service.GrossProfitService;
import kr.or.onesome.frcssalespurchase.vo.FrcsOrderVO;
import kr.or.onesome.vo.PaymentDetailVO;
import kr.or.onesome.vo.PaymentVO;

@Service
public class GrossProfitServiceImpl implements GrossProfitService {

	@Autowired
	GrossProfitMapper grossProfitMapper; 
	
	//매출 내역
	@Override
	public List<PaymentVO> paymentList(PaymentVO paymentVO) {
		return this.grossProfitMapper.paymentList(paymentVO);
	}

	//매입 내역
	@Override
	public List<FrcsOrderVO> frcsOrderList(FrcsOrderVO frcsOrderVO) {
		return this.grossProfitMapper.frcsOrderList(frcsOrderVO);
	}

	//매출액 내역(1개월씩)
	@Override
	public PaymentVO monthPaymentList(Map<String, Object> grossProfitMap) {
		return this.grossProfitMapper.monthPaymentList(grossProfitMap);
	}

	//매입액 내역(1개월씩)
	@Override
	public FrcsOrderVO monthFrcsOrderList(Map<String, Object> grossProfitMap) {
		return this.grossProfitMapper.monthFrcsOrderList(grossProfitMap);
	}

	//TOP 5
	@Override
	public List<PaymentDetailVO> paymentTopList(Map<String, Object> grossProfitMap) {
		return this.grossProfitMapper.paymentTopList(grossProfitMap);
	}
	
	//TOP 5
//	@Override
//	public List<PaymentDetailVO> paymentTopList(PaymentDetailVO paymentDetailVO) {
//		return this.grossProfitMapper.paymentTopList(paymentDetailVO);
//	}


}
