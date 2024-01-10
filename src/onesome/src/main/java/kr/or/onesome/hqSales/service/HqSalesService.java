package kr.or.onesome.hqSales.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.onesome.hqSales.service.Impl.HqSalesServiceImpl;

public interface HqSalesService {
	
	
	//카테고리별 조회 data
	Map<String, Object> ctgryList(Map<String, Object> data);
	//음료별 조회 data
	Map<String, Object> ctgryBeverageList(Map<String, Object> data);
	//푸드별 조회 data
	Map<String, Object> ctgryFoodList(Map<String, Object> data);
	//상품별 조회 data
	Map<String, Object> ctgryGoodsList(Map<String, Object> data);
	
	//지역분석의 전체 가맹점 매출 list
	List<Map<String, Object>> regionList(Map<String, Object> data);
	//지역분석의 하위차트 data
	Map<String, Object> regionChartData(Map<String, Object> data);
	//메뉴분석 data
	Map<String, Object> menuData(Map<String, Object> data);
	//본사 data
	Map<String, Object> mainData();

}
