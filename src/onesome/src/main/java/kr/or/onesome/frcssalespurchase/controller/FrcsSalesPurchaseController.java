package kr.or.onesome.frcssalespurchase.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.onesome.frcssalespurchase.service.FrcsSalesPurchaseService;
import kr.or.onesome.frcssalespurchase.vo.FrcsSalesPurchaseVO;
import kr.or.onesome.vo.PaymentDetailVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/frcs/salespurchase")
public class FrcsSalesPurchaseController {

	@Autowired
	FrcsSalesPurchaseService frcsSalesPurchaseService;
	
	
	/**
	 * 일일 매출 분석 차트(상단)
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/days")
	public Map<String, Object> days(@RequestBody Map<String, Object> map) {
		
		Map<String, Object> resultMap = new HashMap<>();
		log.warn("map : " + map);
		
		//일일 매출 분석 차트
		List<FrcsSalesPurchaseVO> result = this.frcsSalesPurchaseService.days(map);
		log.info("frcsSalesPurchaseVOList>>>=>>>" + result);
		
		//파이차트 ===> 나중에 하단 매출 내역 상세 뽑을 때 pieChart가 payment_detail 가져오는거니까 갖다 써도 되겠다.
		List<PaymentDetailVO> pie = this.frcsSalesPurchaseService.pieChart(map);
		log.info("PaymentDetailVO>>>=>>>" + pie);
		
		//Map에 담기
		resultMap.put("result", result);
		resultMap.put("pie", pie);

		//AJAX는 리턴값을 보내주는 값으로 해야함
		return resultMap;
	}
	
	//일일 매출 내역(하단)
	@GetMapping("/days")
	public String list(Model model, FrcsSalesPurchaseVO frcsSalesPurchaseVO) {
		
		//차트 아래 표에 출력할 내용
		List<FrcsSalesPurchaseVO> frcsSalesPurchaseVOList = this.frcsSalesPurchaseService.list(frcsSalesPurchaseVO);
		
		
		model.addAttribute("frcsSalesPurchaseVOList", frcsSalesPurchaseVOList);		
		log.info("list===>>==" + frcsSalesPurchaseVOList);
		
		return "frcs/salespurchase/days";
	}
	
	//일일 매출 내역 상세
	@GetMapping("/daysDetail")
	public String detail(Model model, FrcsSalesPurchaseVO frcsSalesPurchaseVO, PaymentDetailVO paymentDetailVO) {
		
		List<PaymentDetailVO> paymentDetailVOList = this.frcsSalesPurchaseService.detail(paymentDetailVO);
		log.info("paymentDetailVOList====>>==>>"+paymentDetailVOList);
				
		model.addAttribute("paymentDetailVOList", paymentDetailVOList);
		
		return "frcs/salespurchase/daysDetail";
	}
	
}
