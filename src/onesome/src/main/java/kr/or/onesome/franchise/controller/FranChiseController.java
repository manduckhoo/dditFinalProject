package kr.or.onesome.franchise.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import kr.or.onesome.franchise.service.FranchiseInfoService;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import kr.or.onesome.vo.FranchiseOwnerVO;
import kr.or.onesome.vo.FranchiseVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/admin/frcs")
@Slf4j
@Controller
public class FranChiseController {


	@Autowired
	FranchiseInfoService franchiseInfoService;

	// 가맹점 생성폼 
	@PostMapping("/createForm")
	public String createPost(FranchiseOwnerVO franchiseOwnerVO, Model model) {
		
		//점주 가져오기
		FranchiseOwnerVO frcOwnerVO = this.franchiseInfoService.selectFrcOwnerVO(franchiseOwnerVO);
		
		//지역 코드 공통코드
		String comCode = "RC";
		List<ComDetCodeInfoVO> RegionCode = this.franchiseInfoService.RegionList(comCode);
		
		model.addAttribute("franchiseOwnerVO", frcOwnerVO);
		model.addAttribute("RegionCode", RegionCode);
		
		return "admin/frcs/createForm";
	}
	
	// 가맹점 DB입력
	@PostMapping("/create")
	public String create(FranchiseVO franchiseVO) {
		
		int cnt = this.franchiseInfoService.create(franchiseVO);	
		
		return "redirect:/admin/frcs/list";
	}
	
	// 가맹점 list 출력
	@GetMapping("/list")
	public String list(FranchiseVO franchiseVO,Model model) throws Exception {
		
		List<FranchiseVO> list = this.franchiseInfoService.list();
		
		 ObjectMapper mapper = new ObjectMapper();
		 String jsonList = mapper.writeValueAsString(list);
		
		model.addAttribute("data", jsonList);
		
		return "admin/frcs/list";
	}
	
	@GetMapping("/openList")
	public String openList(Model model) {
		
		//오픈 준비중인 상태 공통코드
		String comDetCode = "FRST01";
		
		List<FranchiseOwnerVO> list = this.franchiseInfoService.openList(comDetCode);
		model.addAttribute("data", list);
		
		
		return "admin/frcs/openList";
	}
	
	//openList 의 상세페이지 
	@ResponseBody
	@PostMapping("/detail")
	public FranchiseVO frscVO(@RequestBody FranchiseVO franchise) {
		log.warn("=== Map ==== :"+franchise);
		FranchiseVO franchiseVO = this.franchiseInfoService.detail(franchise);
		log.info("fullcalendar 정보 :" +franchiseVO);
		return franchiseVO;
	}
	
	//openList 추가
	@PostMapping("/addEvent")
	@ResponseBody
	public String addEvent(@RequestBody Map<String,Object> map) {
	log.info("addEvent data : " + map);
	int result = this.franchiseInfoService.addEvent(map);	
		  if (result > 0){
	            return "{\"stat\" :\"ok\"}";
	        }else {
	            return "{\"stat\" :\"fail\"}";
	        }
		  
	}
	//opneList 수정
	@ResponseBody
	@PostMapping("/update")
	public String update(@RequestBody FranchiseVO franchiseVO){
		
	   int result = this.franchiseInfoService.update(franchiseVO);	
		  if (result > 0){
	            return "{\"stat\" :\"ok\"}";
	        }else {
	            return "{\"stat\" :\"fail\"}";
	        } 
	}

	//list의 상세페이지
	@GetMapping("/detail")
	public String detail(@ModelAttribute FranchiseVO franchiseVO, Model model) {
		log.info("상세 페이지 파라미터 값 : " + franchiseVO); 
		FranchiseVO franVO = this.franchiseInfoService.detail(franchiseVO);
		
		log.info("detail 상세값"+ franVO);
		//가맹점 운영상태 리스트 공통코드
		String comCode="FRST";
		List<ComDetCodeInfoVO> comdetVO = this.franchiseInfoService.frscStsCd(comCode);
		log.info("상세 코드 :" + comdetVO );
		model.addAttribute("comDetVO",comdetVO);
		model.addAttribute("FranchiseVO", franVO);
		return "admin/frcs/detail";
	}
	
	@PostMapping("/detailUpdate")
	public String detailUpdate(@ModelAttribute FranchiseVO franchiseVO, Model model) {
		
		int cnt = franchiseInfoService.detailUpdate(franchiseVO);
		
		return "redirect:/admin/frcs/detail?frcsNo="+franchiseVO.getFrcsNo();
	}
	
	//가맹점 - 매출 분석
	@GetMapping("/salesAnalysis")
	public String salesAnalysis(Model model) {
		
		//판매중인 점주 공통코드 
		String comDetCode ="FRST02";
		List<FranchiseVO> frsc = this.franchiseInfoService.salesList(comDetCode);
		
		log.info("매출 분석 가맹점 list -> " + frsc);
		
		model.addAttribute("data", frsc);
		
		return "admin/frcs/salesAnalysis";
	}
	
	//가맹점 - 연간 매출
	@ResponseBody
	@PostMapping("/yearSales")
	public List<Map<String,Object>> yearSales(@RequestBody Map<String, Object>data){
		Map<String,Object> map = new HashMap<String, Object>(); 
		
		//받은 파라미터 data 출력해보기
		log.info("매출분석 상세 data : "+ data );
		//1) 담아서 return 해줄 map객체 선언 및 월별 매출		
		List<Map<String, Object>> response =this.franchiseInfoService.sales(data);
		
		//2) 총매출 과 월평균 매출
		List<Map<String, Object>> total =this.franchiseInfoService.totalsales(data);
		
		//3) 가맹점 상세 정보
		Map<String,Object> frscVO = this.franchiseInfoService.detailOne(data);
		
		//4) 가맹점 인건비 
		Map<String,Object> Laborcost = this.franchiseInfoService.Laborcost(data);
		
		//5) 비용
		List<Map<String, Object>> cost = this.franchiseInfoService.cost(data); 
		

		//map에 추가
		map.put("month", response);
		map.put("total", total);
		map.put("vo",frscVO);
		map.put("laborCost",Laborcost);
		map.put("cost",cost);
		
		log.info("map controller: " + map);
		
		//통합 쿼리 만듬
		List<Map<String,Object>> totalData = this.franchiseInfoService.totalData(data);
		
		return totalData;
	}
}
