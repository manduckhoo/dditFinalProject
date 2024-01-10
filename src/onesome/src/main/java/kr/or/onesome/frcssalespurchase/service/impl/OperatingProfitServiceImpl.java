package kr.or.onesome.frcssalespurchase.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.frcssalespurchase.mapper.OperatingProfitMapper;
import kr.or.onesome.frcssalespurchase.service.OperatingProfitService;
import kr.or.onesome.frcssalespurchase.vo.FrcsOrderDetailVO;
import kr.or.onesome.frcssalespurchase.vo.FrcsOrderVO;
import kr.or.onesome.frcssalespurchase.vo.PpublicduesVO;
import kr.or.onesome.frcssalespurchase.vo.RroyaltyVO;
import kr.or.onesome.vo.PaymentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OperatingProfitServiceImpl implements OperatingProfitService {

	@Autowired
	OperatingProfitMapper operatingProfitMapper;
	
	//매출액 내역(1개월)
	@Override
	public PaymentVO paymentList(Map<String, Object> operatingProfitMap) {
		return this.operatingProfitMapper.paymentList(operatingProfitMap);
	}

	//매입액 내역(1개월)
	@Override
	public FrcsOrderVO frcsOrderList(Map<String, Object> operatingProfitMap) {
		return this.operatingProfitMapper.frcsOrderList(operatingProfitMap);
	}

	//가맹비, 로열티 내역(1개월)
	@Override
	public RroyaltyVO royaltyList(Map<String, Object> operatingProfitMap) {
		return this.operatingProfitMapper.royaltyList(operatingProfitMap);
	}

	//공과금(수도세, 전기세, 월세 등)(1개월)
	@Override
	public PpublicduesVO publicduesList(Map<String, Object> operatingProfitMap) {
		return this.operatingProfitMapper.publicduesList(operatingProfitMap);
	}

	//로얄티 파이 차트
	@Override
	public List<RroyaltyVO> royaltyPie(Map<String, Object> operatingProfitChartMap) {
		return this.operatingProfitMapper.royaltyPie(operatingProfitChartMap);
	}

	//매입 파이 차트
	@Override
	public List<FrcsOrderDetailVO> frcsOrderDetailPie(Map<String, Object> operatingProfitChartMap) {
		return this.operatingProfitMapper.frcsOrderDetailPie(operatingProfitChartMap);
	}

	//공과금 파이 차트
	@Override
	public List<PpublicduesVO> publicduesPie(Map<String, Object> operatingProfitChartMap) {
		return this.operatingProfitMapper.publicduesPie(operatingProfitChartMap);
	}

}
