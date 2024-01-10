package kr.or.onesome.hqSales.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.hqSales.mapper.HqSalesMapper;
import kr.or.onesome.hqSales.service.HqSalesService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class HqSalesServiceImpl implements HqSalesService {

	@Autowired
	HqSalesMapper hqSalesMapper;
	
	//카테고리 조회 data
	@Override
	public Map<String, Object> ctgryList(Map<String, Object> data) {
		
		
		//data안에는 기간을 조회하는 날짜가 존재
		log.info("전체service data -> "+data);
		
	    // 결과를 저장할 새로운 맵 생성
	    Map<String, Object> result = new HashMap<>();
		
		// 1) 카테고리별 매출과 판매갯수 및 전체 판매갯수와 매출 
		List<Map<String,Object>> totalSales = this.hqSalesMapper.totalSales(data);
		
		// 2) 전체 카테고리의 판매된 메뉴 갯수 
		Map<String,Object> menuCnt = this.hqSalesMapper.menuCnt(data);
		
		// 3) 카테고리별 월별 매출 
 		List<Map<String,Object>> monthSales = this.hqSalesMapper.monthSales(data);
		
 		// 4) 해당 기간 중 최다 판매 카테고리 1개  
 		Map<String,Object> topSales = this.hqSalesMapper.topSales(data);  
		
		result.put("totalSales",totalSales);
		result.put("menuCnt",menuCnt);
		result.put("monthSales",monthSales);
		result.put("topSales",topSales);
		
		log.info("hqSales Map -> "+result);
		
		return result;
	}
	
	//음료 카테고리별 data
	@Override
	public Map<String, Object> ctgryBeverageList(Map<String, Object> data) {
		
		//data안에는 기간을 조회하는 날짜가 존재
		log.info("음료service data -> "+data);
		
	    // 결과를 저장할 새로운 맵 생성
	    Map<String, Object> result = new HashMap<>();
		
		// 1) 음료 카테고리별 매출과 판매갯수 및 전체 판매갯수와 매출 
		List<Map<String,Object>> beverageTotalSales = this.hqSalesMapper.beverageTotalSales(data);
		
		// 2) 음료 카테고리의 판매된 메뉴 갯수 
		Map<String,Object> beverageMenuCnt = this.hqSalesMapper.beverageMenuCnt(data);
		
		// 3) 음료별 월별 매출 
 		List<Map<String,Object>> beverageMonthSales = this.hqSalesMapper.beverageMonthSales(data);
		
 		// 4) 해당 기간 중 최다 판매 메뉴 1개  
 		Map<String,Object> beverageTopSales = this.hqSalesMapper.beverageTopSales(data);  
		
		result.put("totalSales",beverageTotalSales);
		result.put("menuCnt",beverageMenuCnt);
		result.put("monthSales",beverageMonthSales);
		result.put("topSales",beverageTopSales);
		
		log.info("hqSales Map -> "+result);
		
		return result;
	}

	//푸드 카테고리별 data
	@Override
	public Map<String, Object> ctgryFoodList(Map<String, Object> data) {
		
		//data안에는 기간을 조회하는 날짜가 존재
		log.info("푸드service data -> "+data);
		
	    // 결과를 저장할 새로운 맵 생성
	    Map<String, Object> result = new HashMap<>();
		
		// 1) 푸드 카테고리별 매출과 판매갯수 및 전체 판매갯수와 매출 
		List<Map<String,Object>> foodTotalSales = this.hqSalesMapper.foodTotalSales(data);
		
		// 2) 푸드 카테고리의 판매된 메뉴 갯수 
		Map<String,Object> foodMenuCnt = this.hqSalesMapper.foodMenuCnt(data);
		
		// 3) 푸드별 월별 매출 
 		List<Map<String,Object>> foodMonthSales = this.hqSalesMapper.foodMonthSales(data);
		
 		// 4) 해당 기간 중 최다 판매 메뉴 1개  
 		Map<String,Object> foodTopSales = this.hqSalesMapper.foodTopSales(data);  
		
		result.put("totalSales",foodTotalSales);
		result.put("menuCnt",foodMenuCnt);
		result.put("monthSales",foodMonthSales);
		result.put("topSales",foodTopSales);
		
		log.info("hqSales Map -> "+result);
		
		return result;
	}

	
	//상품 카테고리별 data
	@Override
	public Map<String, Object> ctgryGoodsList(Map<String, Object> data) {
		//data안에는 기간을 조회하는 날짜가 존재
		log.info("상품service data -> "+data);
		
	    // 결과를 저장할 새로운 맵 생성
	    Map<String, Object> result = new HashMap<>();
		
		// 1) 상품 카테고리별 매출과 판매갯수 및 전체 판매갯수와 매출 
		List<Map<String,Object>> goodsTotalSales = this.hqSalesMapper.goodsTotalSales(data);
		
		// 2) 상품 카테고리의 판매된 메뉴 갯수 
		Map<String,Object> goodsMenuCnt = this.hqSalesMapper.goodsMenuCnt(data);
		
		// 3) 상품별 월별 매출 
 		List<Map<String,Object>> goodsMonthSales = this.hqSalesMapper.goodsMonthSales(data);
		
 		// 4) 해당 기간 중 최다 판매 메뉴 1개  
 		Map<String,Object> goodsTopSales = this.hqSalesMapper.goodsTopSales(data);  
		
		result.put("totalSales",goodsTotalSales);
		result.put("menuCnt",goodsMenuCnt);
		result.put("monthSales",goodsMonthSales);
		result.put("topSales",goodsTopSales);
		
		log.info("hqSales Map -> "+result);
		
		return result;
	}

	//지역분석의 전체 가맹점 매출 list
	@Override
	public List<Map<String, Object>> regionList(Map<String, Object> data) {
		
		log.info("지역service data -> "+data);
		
		return this.hqSalesMapper.regionList(data);
	}
	
	//지역분석의 하위차트 data
	@Override
	public Map<String, Object> regionChartData(Map<String, Object> data) {
		
		log.info("지역 하위차트service data -> "+data);
		
		Map<String,Object> result = new HashMap<>();
		
		//해당 지역의 월별 매출 
		List<Map<String,Object>>regionSales = this.hqSalesMapper.regionSales(data);
		
		//해당지역의 가맹점 목록
		List<Map<String,Object>>regionFrcsList = this.hqSalesMapper.regionFrcsList(data);
		
		//해당지역의 메뉴 판매순위 TOP10
		List<Map<String,Object>>regionMenuTop10 = this.hqSalesMapper.regionMenuTop10(data);
		
		result.put("sales",regionSales);
		result.put("frscList",regionFrcsList);
		result.put("menu",regionMenuTop10);
		
		
		return result;
	}
	
	//메뉴분석 data 
	@Override
	public Map<String, Object> menuData(Map<String, Object> data) {
		
		log.info("메뉴 service data -> "+data);
		
		Map<String,Object> result = new HashMap<>();
		
		//해당 월의 판매갯수 TOP10
		List<Map<String,Object>>menuSalesTop10 = this.hqSalesMapper.menuSalesTop10(data);
		
		//전년동월 대비 판매증감data  
		List<Map<String,Object>>menuSalesMp = this.hqSalesMapper.menuSalesMp(data);
		
		
		result.put("menuTop10",menuSalesTop10);
		result.put("menuSalesMp",menuSalesMp);
		
		return result;
	}

	//본사 data
	@Override
	public Map<String, Object> mainData() {
		
		//return 할 map
		Map<String,Object> result = new HashMap<>();
		
		//모든 년도의 매출,매출원가,인건비
		List<Map<String,Object>>yearData = this.hqSalesMapper.yearData();
		
		//누적 매출의 %
		List<Map<String,Object>>sales = this.hqSalesMapper.sales();
		
		//해당년도의 월별data
		List<Map<String,Object>>monthData = this.hqSalesMapper.monthData();
		
		//해당년도의 매출 %
		List<Map<String,Object>>mainMonthSales = this.hqSalesMapper.mainMonthSales();
		
		
		result.put("yearData",yearData);
		result.put("salesP",sales);
		result.put("month",monthData);
		result.put("monthSales",mainMonthSales);
		
		return result;
	}

}
