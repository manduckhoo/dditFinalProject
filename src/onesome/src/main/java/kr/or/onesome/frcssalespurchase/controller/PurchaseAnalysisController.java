package kr.or.onesome.frcssalespurchase.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.onesome.frcssalespurchase.service.FrcsSalesPurchaseService;
import kr.or.onesome.frcssalespurchase.service.PurchaseAnalysisService;
import kr.or.onesome.frcssalespurchase.vo.FrcsOrderDetailVO;
import kr.or.onesome.frcssalespurchase.vo.FrcsOrderVO;
import kr.or.onesome.util.DateCalculater;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/frcs/salespurchase")

//매입분석
public class PurchaseAnalysisController {

	@Autowired
	PurchaseAnalysisService purchaseAnalysisService;
	
	//매입 내역 리스트
	@GetMapping("/purchaseAnalysis")
	public String list(HttpServletRequest req,
					   Model model,
					   FrcsOrderDetailVO frcsOrderDetailVO,
					   @RequestParam(value="viewDate", required=false, defaultValue="")String viewDate) {
		
		//현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
        
        //발주상세VO에 현재 로그인 된 FrcsNo를 넣었음
        frcsOrderDetailVO.setFrcsNo(crrFrcsNo);
        
        //날짜 이슈로 Map 생성
        Map<String, Object> purchaseAnalysisMap = new HashMap<>();
        purchaseAnalysisMap.put("frcsNo", crrFrcsNo);
        
        //map에 frcsOrderDetailVO 정보 넣기
        purchaseAnalysisMap.put("frcsOrderDetailVO", frcsOrderDetailVO);
        
        //현재 날짜 생성
        String crrDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM"));
        
        //파라미터로 날짜를 전달 받으면 해당 날짜를, 없을 시 현재 날짜를 맵에 담음
        if(!viewDate.equals("")) {
        	purchaseAnalysisMap.put("viewDate", viewDate);
        }else {
        	viewDate = crrDate;
        	purchaseAnalysisMap.put("viewDate", viewDate);
        }
        
        //날짜 놀음 위해 추가(1/1)
        DateCalculater dateCalculater = new DateCalculater();
        String previousMonth = dateCalculater.getPreviousMonth(viewDate);
        String nextMonth = dateCalculater.getNextMonth(viewDate);
        
		//표에 출력할 내용
		List<FrcsOrderDetailVO> frcsOrderDetailVOList = this.purchaseAnalysisService.list(purchaseAnalysisMap);
		log.info("예가체프@@" + frcsOrderDetailVOList);
		
		model.addAttribute("frcsOrderDetailVOList", frcsOrderDetailVOList);
		
        //날짜놀음
        model.addAttribute("viewDate", viewDate);
        model.addAttribute("previousMonth", previousMonth);
        model.addAttribute("nextMonth", nextMonth);
        model.addAttribute("crrDate", crrDate);
		
		return "frcs/salespurchase/purchaseAnalysis";
	}
	
	//일단 파이차트
	@ResponseBody
	@PostMapping("/purchaseAnalysis")
	public Map<String, Object> chart(HttpServletRequest req,
										FrcsOrderDetailVO frcsOrderDetailVO,
										FrcsOrderVO frcsOrderVO,
										@RequestBody Map<String, Object> map){
		
		//현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
        
        //발주상세VO에 현재 로그인 된 FrcsNo를 넣었음
        frcsOrderDetailVO.setFrcsNo(crrFrcsNo);
		
        //Map 생성
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("frcsNo", crrFrcsNo);		
		log.warn("map :" + map);
		
		//날짜 놀음
		DateCalculater dateCalculater = new DateCalculater();
		
		String previousMonth = dateCalculater.getPreviousMonth((String)map.get("viewDate"));
        String nextMonth = dateCalculater.getNextMonth((String)map.get("viewDate"));
        
        //맵에 날짜 관련 put 때리기
        resultMap.put("frcsOrderVO", frcsOrderVO);
        resultMap.put("frcsOrderDetailVO", frcsOrderDetailVO);
        resultMap.put("viewDate", (String)map.get("viewDate"));
        resultMap.put("previousMonth", previousMonth);
        resultMap.put("nextMonth", nextMonth);
		
		List<FrcsOrderDetailVO> pie = this.purchaseAnalysisService.pieChart(resultMap);
		List<FrcsOrderVO> bar = this.purchaseAnalysisService.barChart(map);
		
		
		log.info("파이파이" + pie);
		log.info("바바바바" + bar);
		
		resultMap.put("pie", pie);
		resultMap.put("bar", bar);
		
		return resultMap;
	}
}














