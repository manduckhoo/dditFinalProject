package kr.or.onesome.frcssalespurchase.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.frcssalespurchase.mapper.PurchaseAnalysisMapper;
import kr.or.onesome.frcssalespurchase.service.PurchaseAnalysisService;
import kr.or.onesome.frcssalespurchase.vo.FrcsOrderDetailVO;
import kr.or.onesome.frcssalespurchase.vo.FrcsOrderVO;

@Service
public class PurchaseAnalysisServiceImpl implements PurchaseAnalysisService {

	@Autowired
	PurchaseAnalysisMapper purchaseAnalysisMapper;

	//파이차트
	@Override
	public List<FrcsOrderDetailVO> pieChart(Map<String, Object> map) {
		return this.purchaseAnalysisMapper.pieChart(map);
	}

	//바차트
	@Override
	public List<FrcsOrderVO> barChart(Map<String, Object> map) {
		return this.purchaseAnalysisMapper.barChart(map);
	}

	//매출내역 표에 출력할 내용
	@Override
	public List<FrcsOrderDetailVO> list(Map<String, Object> purchaseAnalysisMap) {
		return this.purchaseAnalysisMapper.list(purchaseAnalysisMap);
	}
}
