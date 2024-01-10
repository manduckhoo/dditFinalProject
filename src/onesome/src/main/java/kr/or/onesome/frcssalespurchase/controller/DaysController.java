package kr.or.onesome.frcssalespurchase.controller;

import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.onesome.frcssalespurchase.service.DaysService;
import kr.or.onesome.vo.PaymentDetailVO;
import kr.or.onesome.vo.PaymentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/frcs/salespurchase")
public class DaysController {

	@Autowired
	DaysService daysService;
	
	@GetMapping("/dayss")
	public String list(HttpServletRequest req,
			   		   Model model,
			   		   PaymentVO paymentVO) {
		
		//현재 선택된 가맹점 번호를 세션에서 꺼낸다.
		HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
        
        //paymentVO에 현재 로그인 된 FrcsNo를 넣었음
        paymentVO.setFrcsNo(crrFrcsNo);
        
        //일일 매출 내역
        List<PaymentVO> daysList = this.daysService.daysList(paymentVO);
		log.info("daysList===>날짜있나?===>" + daysList);
		
        model.addAttribute("daysList", daysList);
		
		return "frcs/salespurchase/dayss";
	}
	
	//일일 매출 차트 
	@ResponseBody
	@PostMapping("/dayss")
	public Map<String, Object> chart(HttpServletRequest req,
			 						 @RequestBody PaymentVO paymentVO){
		
		//현재 선택된 가맹점 번호를 세션에서 꺼냄
		HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
        log.info("여기 : " + paymentVO.getPynmDt());
        //paymentVO에 현재 로그인 된 FrcsNo 투입
        paymentVO.setFrcsNo(crrFrcsNo);
        
        //paymentVO.setPynmDt(pynmDt);
       
        //실험(01/05 - 18시 32분)
        //Date yyyymmdd = paymentVO.getPynmDt();

        //실험(01/05 - 18시 32분)
        //pymnDt 날짜 입력
        //paymentVO.setPynmDt(yyyymmdd);
        
		//Map생성
		Map<String, Object> daysMap = new HashMap<>();
		
		//파이 차트
		List<PaymentVO> pieChart = this.daysService.pieChart(paymentVO);
		log.info("pieChart==>>왔니==>> : " + pieChart);
		
		//라인 차트로 보여줄게
		List<PaymentVO> daysList = this.daysService.daysList(paymentVO);
		log.info("라인보자===> : " + daysList);
		
		daysMap.put("pieChart", pieChart);
		daysMap.put("lineChart", daysList);
		
		return daysMap;
	}
	
	//상세 주문 내역 리스트(좌측)
	@GetMapping("/dayssDetail")
	public String detailList(HttpServletRequest req,
						 Model model,
						 PaymentVO paymentVO) {
		
		//현재 선택된 가맹점 번호를 세션에서 꺼냄
		HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
        
        //paymentVO에 현재 로그인 된 FrcsNo 투입
        paymentVO.setFrcsNo(crrFrcsNo);
        
        List<PaymentVO> detailList = this.daysService.detailList(paymentVO);
        log.info("detailList", detailList);
        
        model.addAttribute("detailList", detailList);
        
		return "frcs/salespurchase/dayssDetail";
	}
	
	//상세 주문 내역
	@ResponseBody
	@PostMapping("/dayssDetail")
	public Map<String, Object> detail(HttpServletRequest req, 
									  PaymentVO paymentVO,
									  @RequestBody PaymentDetailVO paymentDetailVO){
		
		//현재 선택된 가맹점 번호를 세션에서 꺼냄
		HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
        
        //paymentVO에 현재 로그인 된 FrcsNo 투입
        paymentVO.setFrcsNo(crrFrcsNo);
        
        Map <String, Object> orderList = new HashMap<>();
        
        //주문 내역 상세
        List<PaymentDetailVO> daysDetail = this.daysService.daysDetail(paymentDetailVO);
        log.info("주문내역상세===>잘왔니===> : " + daysDetail);
        
        orderList.put("daysDetail", daysDetail);

        return orderList;
        
	}
	
	
}
