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
import kr.or.onesome.frcssalespurchase.vo.FrcsOrderVO;
import kr.or.onesome.util.DateCalculater;
import kr.or.onesome.vo.PaymentDetailVO;
import kr.or.onesome.vo.PaymentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/frcs/salespurchase")
public class GrossProfitController {

	@Autowired
	GrossProfitService grossProfitService;
	
	//매출 총 그래프 1년
	@GetMapping("/grossProfit")
	public String list(HttpServletRequest req,
					   Model model,
					   PaymentVO paymentVO,
					   FrcsOrderVO frcsOrderVO,
					   PaymentDetailVO paymentDetailVO,
					   @RequestParam(value="viewDate", required=false, defaultValue="")String viewDate) {
		
		//현재 선택된 가맹점 번호를 세션에서 꺼냄
		HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
        
        //paymentVO에 현재 로그인 된 FrcsNo를 넣었음
        paymentVO.setFrcsNo(crrFrcsNo);
        frcsOrderVO.setFrcsNo(crrFrcsNo);
        paymentDetailVO.setFrcsNo(crrFrcsNo);
        
        //날짜 이슈로 Map 생성
        Map<String, Object> grossProfitMap = new HashMap<>();
        grossProfitMap.put("frcsNo", crrFrcsNo);
        
        //나는 지금 grossProfit에 근데 payment나 frcsOrder를 안넣었는데?
        grossProfitMap.put("paymentVO", paymentVO);
        grossProfitMap.put("frcsOrderVO", frcsOrderVO);
        grossProfitMap.put("paymentDetailVO", paymentDetailVO);
        
        //현재 날짜 생성
        String crrDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM"));
        
        //파라미터로 날짜를 전달 받으면 해당 날짜를, 없을 시 현재 날짜를 맵에 담음
        if(!viewDate.equals("")) {
        	grossProfitMap.put("viewDate", viewDate);
        }else {
        	viewDate = crrDate;
        	grossProfitMap.put("viewDate", viewDate);
        }
        
        //날짜 놀음 위해 추가(1/1)
        DateCalculater dateCalculater = new DateCalculater();
        String previousMonth = dateCalculater.getPreviousMonth(viewDate);
        String nextMonth = dateCalculater.getNextMonth(viewDate);
        
        //매출액 내역
        List<PaymentVO> paymentVOList = this.grossProfitService.paymentList(paymentVO);
        log.info("paymentVOList ===>===>매출액 : " + paymentVOList);
        
        //매입액 내역
        List<FrcsOrderVO> frcsOrderVOList = this.grossProfitService.frcsOrderList(frcsOrderVO);
        log.info("frcsOrderVOList ===>===>매입액 : " + frcsOrderVOList);
        
        //매출액 내역 1개월 씩
        PaymentVO monthPaymentVO = this.grossProfitService.monthPaymentList(grossProfitMap);
        log.info("monthPaymentVO ===>===>1달짜리@@매출액 : " + grossProfitMap);
        
        //매입액 내역 1개월 씩
        FrcsOrderVO monthFrcsOrderVO = this.grossProfitService.monthFrcsOrderList(grossProfitMap);
        log.info("monthFrcsOrderVO ===>===>1달짜리@@매입액 : " + grossProfitMap);
        
        //수량 TOP 5
        List<PaymentDetailVO> paymentTopList = this.grossProfitService.paymentTopList(grossProfitMap);
        log.info("paymentTopList ===>===>내림차순 : " + paymentTopList);
        
        model.addAttribute("paymentVOList", paymentVOList);
        model.addAttribute("frcsOrderVOList", frcsOrderVOList);
        model.addAttribute("paymentTopList", paymentTopList);
        
        model.addAttribute("monthPaymentVO", monthPaymentVO);
        model.addAttribute("monthFrcsOrderVO", monthFrcsOrderVO);
        
        //날짜놀음
        model.addAttribute("viewDate", viewDate);
        model.addAttribute("previousMonth", previousMonth);
        model.addAttribute("nextMonth", nextMonth);
        model.addAttribute("crrDate", crrDate);
        
		return "frcs/salespurchase/grossProfit";
	}
	
	@ResponseBody
	@PostMapping("/grossProfit")
	public Map<String, Object> chart(HttpServletRequest req,
									 PaymentVO paymentVO,
									 FrcsOrderVO frcsOrderVO,
									 PaymentDetailVO paymentDetailVO,
									 @RequestBody Map<String, Object> map){
		
		//현재 선택된 가맹점 번호를 세션에서 꺼냄
		HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
        
        //paymentVO에 현재 로그인 된 FrcsNo를 넣었음
        paymentVO.setFrcsNo(crrFrcsNo);
        frcsOrderVO.setFrcsNo(crrFrcsNo);
        paymentDetailVO.setFrcsNo(crrFrcsNo);
      
        //날짜 이슈로 Map 생성
		Map<String, Object> grossProfitMap = new HashMap<>();
		grossProfitMap.put("frcsNo", crrFrcsNo);
		log.warn("map :" + map);
		
		
        //날짜 놀음 위해 추가(1/1)
        DateCalculater dateCalculater = new DateCalculater();
        
        String previousMonth = dateCalculater.getPreviousMonth((String)map.get("viewDate"));
        String nextMonth = dateCalculater.getNextMonth((String)map.get("viewDate"));
        
        //맵에 날짜 관련 put 때리기
    	grossProfitMap.put("paymentDetailVO", paymentDetailVO);
		grossProfitMap.put("viewDate", (String)map.get("viewDate"));
		grossProfitMap.put("previousMonth", previousMonth);
		grossProfitMap.put("nextMonth", nextMonth);
        
		//매출액 내역
        List<PaymentVO> salesBar = this.grossProfitService.paymentList(paymentVO);
        log.info("salesBar차트차트===>===>매출액 : " + salesBar);
        
        //매입액 내역
        List<FrcsOrderVO> purchaseBar = this.grossProfitService.frcsOrderList(frcsOrderVO);
        log.info("purchaseBar차트차트===>===>매입액 : " + purchaseBar);
		
        //수량 TOP 5
        List<PaymentDetailVO> pie = this.grossProfitService.paymentTopList(grossProfitMap);
        log.info("pie차트차트 ===>===>내림차순 : " + pie);
        
        grossProfitMap.put("salesBar", salesBar);
        grossProfitMap.put("purchaseBar", purchaseBar);
        grossProfitMap.put("pie", pie);
        
		return grossProfitMap;
	}
}



















