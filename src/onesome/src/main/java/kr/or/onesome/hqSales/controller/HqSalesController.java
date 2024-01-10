package kr.or.onesome.hqSales.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.MultiValueMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.onesome.hqSales.service.HqSalesService;
import lombok.extern.slf4j.Slf4j;


// 관리자 페이지 매출 관리
@Slf4j
@RequestMapping("/admin/hqSales")
@Controller
public class HqSalesController {
	
	@Autowired
	HqSalesService hqSalesService;
	
	//본사 카테고리별 매출 페이지
	@GetMapping("/category")
	public String category() {
		
		
		return "admin/hqSales/category";
	}
	
	//본사 카테고리 매출 조회값
	@PostMapping("/ctgryList")
	@ResponseBody
	public Map<String,Object> ctgryList(@RequestBody Map<String, Object> data){
		
		Map<String,Object> ctgryList = this.hqSalesService.ctgryList(data);
		
		return ctgryList;
	}
	
	//본사 음료 매출 조회값
	@PostMapping("/ctgryBeverageList")
	@ResponseBody
	public Map<String,Object> ctgryBeverageList(@RequestBody Map<String, Object> data){
		
		Map<String,Object> ctgryBeverageList = this.hqSalesService.ctgryBeverageList(data);
		
		return ctgryBeverageList;
	}
	
	//본사 푸드 매출 조회값
	@PostMapping("/ctgryFoodList")
	@ResponseBody
	public Map<String,Object> ctgryFoodList(@RequestBody Map<String, Object> data){
		
		Map<String,Object> ctgryFoodList = this.hqSalesService.ctgryFoodList(data);
		
		return ctgryFoodList;
	}

	//본사 상품 매출 조회값
	@PostMapping("/ctgryGoodsList")
	@ResponseBody
	public Map<String,Object> ctgryGoodsList(@RequestBody Map<String, Object> data){
		
		Map<String,Object> ctgryGoodsList = this.hqSalesService.ctgryGoodsList(data);
		
		return ctgryGoodsList;
	}

	
	//본사 매출
	@GetMapping("/main")
	public String main(Model model) throws Exception {
		
		Map<String,Object> mainData = this.hqSalesService.mainData();
		
		ObjectMapper mapper = new ObjectMapper();
		 String jsonList = mapper.writeValueAsString(mainData);
		
		model.addAttribute("maindata", jsonList);
		
		
		log.info("maindata ->"+ mainData);
		
		return "admin/hqSales/main";
	}
	
	//본사 지역별 매출
	@GetMapping("/region")
	public String region() {
		
		return "admin/hqSales/region";
	}
	
	
	//지역매출 전체 가맹점 list
	@PostMapping("/regionList")
	@ResponseBody
	public List<Map<String,Object>> regionList(@RequestBody Map<String,Object> data){
		
		List<Map<String,Object>> regionList = this.hqSalesService.regionList(data);
		
		return regionList;
	}
	
	//지역매출의 하위차트data
	@PostMapping("/regionChartData")
	@ResponseBody
	public Map<String,Object> regionChartData(@RequestBody Map<String,Object>data){
		
		Map<String,Object> regionChartData = this.hqSalesService.regionChartData(data);
		
		log.info("regionData -> "+ regionChartData);
		return regionChartData;
	}
	
	//본사 메뉴별 매출
	@GetMapping("/menu")
	public String menu() {
		
		return "admin/hqSales/menu";
	}
	
	//메뉴분석 페이지 data
	@ResponseBody
	@PostMapping("/menuData")
	public Map<String,Object> menuData(@RequestBody Map<String,Object>data){
		
		Map<String,Object> menuData = this.hqSalesService.menuData(data);
		
		log.info("menuData -> "+ menuData);
		return menuData;
	}
	
}
