package kr.or.onesome.frcssalespurchase.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/frcs/salespurchase")
public class CommercialAnalysisController {

	@GetMapping("/commercialAnalysis")
	public String view() {
		
		return "frcs/salespurchase/commercialAnalysis";
	}
}
