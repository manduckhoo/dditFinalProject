package kr.or.onesome.frcssalespurchase.mapper;

import java.util.List;
import java.util.Map;

import kr.or.onesome.frcssalespurchase.vo.FrcsOrderDetailVO;
import kr.or.onesome.frcssalespurchase.vo.FrcsOrderVO;
import kr.or.onesome.frcssalespurchase.vo.PpublicduesVO;
import kr.or.onesome.frcssalespurchase.vo.RroyaltyVO;
import kr.or.onesome.vo.PaymentVO;

public interface OperatingProfitMapper {

	//매출액 내역(1개월)
	PaymentVO paymentList(Map<String, Object> operatingProfitMap);

	//매입액 내역(1개월)
	FrcsOrderVO frcsOrderList(Map<String, Object> operatingProfitMap);

	//가맹비, 로열티 내역(1개월)
	RroyaltyVO royaltyList(Map<String, Object> operatingProfitMap);

	//공과금(수도세, 전기세, 월세 등)(1개월)
	PpublicduesVO publicduesList(Map<String, Object> operatingProfitMap);

	//로얄티 파이 차트
	List<RroyaltyVO> royaltyPie(Map<String, Object> operatingProfitChartMap);

	//매입 파이 차트
	List<FrcsOrderDetailVO> frcsOrderDetailPie(Map<String, Object> operatingProfitChartMap);

	//공과금 파이 차트
	List<PpublicduesVO> publicduesPie(Map<String, Object> operatingProfitChartMap);

}
