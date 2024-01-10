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

import kr.or.onesome.frcssalespurchase.service.GrossProfitService;
import kr.or.onesome.frcssalespurchase.service.OperatingProfitService;
import kr.or.onesome.frcssalespurchase.vo.FrcsOrderDetailVO;
import kr.or.onesome.frcssalespurchase.vo.FrcsOrderVO;
import kr.or.onesome.frcssalespurchase.vo.PpublicduesVO;
import kr.or.onesome.frcssalespurchase.vo.RroyaltyVO;
import kr.or.onesome.util.DateCalculater;
import kr.or.onesome.vo.PaymentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/frcs/salespurchase")
public class OperatingProfitController {

	@Autowired
	OperatingProfitService operatingProfitService;
	
	@GetMapping("/operatingProfit")
	public String list(HttpServletRequest req,
					   Model model,
					   PaymentVO paymentVO,
					   FrcsOrderVO frcsOrderVO,
					   RroyaltyVO royaltyVO,
					   PpublicduesVO publicduesVO,
					   @RequestParam(value="viewDate", required=false, defaultValue="")String viewDate) {
		
		//현재 선택된 가맹점 번호를 세션에서 꺼냄
		HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
		
        //paymentVO에 현재 로그인 된 FrcsNo를 넣었음
        paymentVO.setFrcsNo(crrFrcsNo);
        frcsOrderVO.setFrcsNo(crrFrcsNo);
        royaltyVO.setFrcsNo(crrFrcsNo);
        publicduesVO.setFrcsNo(crrFrcsNo);
        
        //Map 생성
        Map<String, Object> operatingProfitMap = new HashMap<>();
        operatingProfitMap.put("frcsNo", crrFrcsNo);
        
        //현재 날짜 생성
        String crrDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM"));
        
        //파라미터로 날짜를 전달 받으면 해당 날짜를, 없을 시 현재 날짜를 맵에 담음
        if(!viewDate.equals("")) {
        	operatingProfitMap.put("viewDate", viewDate);
        }else {
        	viewDate = crrDate;
        	operatingProfitMap.put("viewDate", viewDate);
        }
        
        //Map에 operatingProfit에 필요한 정보 추가
        operatingProfitMap.put("paymentVO", paymentVO);
        operatingProfitMap.put("frcsOrderVO", frcsOrderVO);
        operatingProfitMap.put("royaltyVO", royaltyVO);
        operatingProfitMap.put("publicduesVO", publicduesVO);
        
        //날짜 놀음 위해 추가(1/1)
        DateCalculater dateCalculater = new DateCalculater();
        String previousMonth = dateCalculater.getPreviousMonth(viewDate);
        String nextMonth = dateCalculater.getNextMonth(viewDate);
        
        //매출액 내역(1개월)
        PaymentVO paymentVOList = this.operatingProfitService.paymentList(operatingProfitMap);
        log.info("paymentVOList ====>매출액===>>==>> : " + paymentVOList);
        
        //매입액 내역(1개월)
        FrcsOrderVO frcsOrderVOList = this.operatingProfitService.frcsOrderList(operatingProfitMap);
        log.info("frcsOrderVOList ====>매입액===>>==>> : " + frcsOrderVOList);
        
        //가맹비, 로열티 내역(1개월)
        RroyaltyVO royaltyVOList = this.operatingProfitService.royaltyList(operatingProfitMap);
        log.info("royaltyVOList ====>로얄티===>>==>> : " + royaltyVOList);
        
        //공과금(수도세, 전기세, 월세 등)(1개월)
        PpublicduesVO publicduesVOList = this.operatingProfitService.publicduesList(operatingProfitMap);
        log.info("publicduesVOList ====>공과금===>>==>> : "+publicduesVOList);
        
        ///////////////////////////////////////////////////
        
        model.addAttribute("paymentVOList", paymentVOList);
        model.addAttribute("frcsOrderVOList", frcsOrderVOList);
        model.addAttribute("royaltyVOList", royaltyVOList);
        model.addAttribute("publicduesVOList", publicduesVOList);
        
        ///////////////////////////////////////////////////
        
        //날짜놀음
        model.addAttribute("viewDate", viewDate);
        model.addAttribute("previousMonth", previousMonth);
        model.addAttribute("nextMonth", nextMonth);
        model.addAttribute("crrDate", crrDate);
        
        
		return "frcs/salespurchase/operatingProfit";
	}
	
	//차트 때리기
	@ResponseBody
	@PostMapping("/operatingProfit")
	public Map<String, Object> chart(HttpServletRequest req,
									 PaymentVO paymentVO,
									 FrcsOrderDetailVO frcsOrderDetailVO,
									 RroyaltyVO royaltyVO,
									 PpublicduesVO publicduesVO,
									 @RequestBody Map<String, Object> map){
		
		//현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
		
        //paymentVO에 현재 로그인 된 FrcsNo를 넣었음
        paymentVO.setFrcsNo(crrFrcsNo);
        frcsOrderDetailVO.setFrcsNo(crrFrcsNo);
        royaltyVO.setFrcsNo(crrFrcsNo);
        publicduesVO.setFrcsNo(crrFrcsNo);
        
        //Map 생성
        Map<String, Object> operatingProfitChartMap = new HashMap<>();
        operatingProfitChartMap.put("frcsNo", crrFrcsNo);
        
        //날짜 놀음
        DateCalculater dateCalculater = new DateCalculater();
		
		String previousMonth = dateCalculater.getPreviousMonth((String)map.get("viewDate"));
        String nextMonth = dateCalculater.getNextMonth((String)map.get("viewDate"));
        
        //맵에 VO put
        operatingProfitChartMap.put("paymentVO", paymentVO);		//매출
        operatingProfitChartMap.put("frcsOrderDetailVO", frcsOrderDetailVO);	//매입
        operatingProfitChartMap.put("royaltyVO", royaltyVO);		//로열티
        operatingProfitChartMap.put("publicduesVO", publicduesVO);	//공과금
        
        //맵에 날짜놀음 put
        operatingProfitChartMap.put("previousMonth", previousMonth);
        operatingProfitChartMap.put("nextMonth", nextMonth);
        operatingProfitChartMap.put("viewDate", (String)map.get("viewDate"));
        
        //로얄티
        List<RroyaltyVO> royaltyPie = this.operatingProfitService.royaltyPie(operatingProfitChartMap);
        
        //매입
        List<FrcsOrderDetailVO> frcsOrderDetailPie = this.operatingProfitService.frcsOrderDetailPie(operatingProfitChartMap);
        
        //공과금
        List<PpublicduesVO> publicduesPie = this.operatingProfitService.publicduesPie(operatingProfitChartMap);
        
        log.info("royaltyPie==>로얄튀===>" + royaltyPie);
        log.info("frcsOrderDetailPie==매입==>" + frcsOrderDetailPie);
        log.info("publicduesPie=공과금==>" + publicduesPie);
        
        operatingProfitChartMap.put("royaltyPie", royaltyPie);
        operatingProfitChartMap.put("frcsOrderDetailPie", frcsOrderDetailPie);
        operatingProfitChartMap.put("publicduesPie", publicduesPie);
        
        return operatingProfitChartMap;
	}
	
}

































