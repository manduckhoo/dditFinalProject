package kr.or.onesome.frcssalespurchase.mapper;

import java.util.List;
import java.util.Map;

import kr.or.onesome.frcssalespurchase.vo.FrcsOrderDetailVO;
import kr.or.onesome.frcssalespurchase.vo.FrcsOrderVO;

public interface PurchaseAnalysisMapper {

	//파이차트
	List<FrcsOrderDetailVO> pieChart(Map<String, Object> resultMap);

	//바차트
	List<FrcsOrderVO> barChart(Map<String, Object> map);

	//매입 내역 표에 출력 할 내용
	List<FrcsOrderDetailVO> list(Map<String, Object> purchaseAnalysisMap);
}
