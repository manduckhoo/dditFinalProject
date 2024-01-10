package kr.or.onesome.hqSales.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HqSalesMapper {
	
	// 전체
	// 1) 전체 카테고리별 매출과 판매갯수 및 전체 판매갯수와 매출 1)
	List<Map<String, Object>> totalSales(Map<String, Object> data);
	// 2) 전체 카테고리의 판매된 메뉴 갯수 2)
	Map<String, Object> menuCnt(Map<String, Object> data);
	// 3) 전체 카테고리별 월별 매출 3)
	List<Map<String, Object>> monthSales(Map<String, Object> data);
	// 4) 전체카테고리 중 최다 판매  메뉴 1개  4)
	Map<String, Object> topSales(Map<String, Object> data);
	
	
	// 음료
	// 1) 음료카테고리별 매출과 판매갯수 및 전체 판매갯수와 매출 
	List<Map<String, Object>> beverageTotalSales(Map<String, Object> data);
	// 2) 음료 카테고리의 판매된 메뉴 갯수 
	Map<String, Object> beverageMenuCnt(Map<String, Object> data);
	// 3) 음료카테고리 중 최다 판매  메뉴 1개  
	Map<String, Object> beverageTopSales(Map<String, Object> data);
	// 4) 음료 카테고리별 월별 매출 
	List<Map<String, Object>> beverageMonthSales(Map<String, Object> data);
	
	// 푸드
	// 1) 푸드카테고리별 매출과 판매갯수 및 전체 판매갯수와 매출 
	List<Map<String, Object>> foodTotalSales(Map<String, Object> data);
	// 2) 푸드 카테고리의 판매된 메뉴 갯수 	
	Map<String, Object> foodMenuCnt(Map<String, Object> data);
	// 3) 푸드 카테고리 중 최다 판매  메뉴 1개  
	Map<String, Object> foodTopSales(Map<String, Object> data);
	// 4) 푸드 카테고리별 월별 매출 
	List<Map<String, Object>> foodMonthSales(Map<String, Object> data);
	
	//상품
	// 1) 상품 카테고리별 매출과 판매갯수 및 전체 판매갯수와 매출
	List<Map<String, Object>> goodsTotalSales(Map<String, Object> data);
	// 2) 상품 카테고리의 판매된 메뉴 갯수 	
	Map<String, Object> goodsMenuCnt(Map<String, Object> data);
	// 3) 상품 카테고리 중 최다 판매  메뉴 1개  	
	List<Map<String, Object>> goodsMonthSales(Map<String, Object> data);
	// 4) 상품 카테고리별 월별 매출 
	Map<String, Object> goodsTopSales(Map<String, Object> data);
	
	
	//지역분석의 전체 가맹점 매출 list
	List<Map<String, Object>> regionList(Map<String, Object> data);
	//지역분석의 해당지역의 월별 매출
	List<Map<String, Object>> regionSales(Map<String, Object> data);
	//지역분석의 해당지역의 가맹점 목록
	List<Map<String, Object>>regionFrcsList(Map<String, Object> data);
	//지역분석의 해당지역의 판매순 메뉴 TOP10
	List<Map<String, Object>> regionMenuTop10(Map<String, Object> data);
	
	
	//메뉴분석의 메뉴판매 TOP10
	List<Map<String, Object>> menuSalesTop10(Map<String, Object> data);
	//전년동월 대비 판매 증가한 제품 
	List<Map<String, Object>> menuSalesMp(Map<String, Object> data);
	
	
	//메인 yearData
	List<Map<String, Object>> yearData();
	//누적매출금액의 각각 퍼센트
	List<Map<String, Object>> sales();
	//해당 년도의 월별data
	List<Map<String, Object>> monthData();
	//해당 년도의 매출%
	List<Map<String, Object>> mainMonthSales();
	
	
	
	

	
	

}
