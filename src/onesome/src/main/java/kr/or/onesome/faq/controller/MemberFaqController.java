package kr.or.onesome.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.onesome.faq.service.MemberFaqService;
import kr.or.onesome.vo.FaqVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberFaqController {
	
	@Autowired
	MemberFaqService memberFaqService;
	
	/*	
	 요청URI : /mem/faq
	 요청방식 : GET
	 */
	@GetMapping("/mem/faq")
	public String faqList(Model model) {
		
		List<FaqVO> faqVOList = this.memberFaqService.faqList();
		model.addAttribute("faqVOList", faqVOList);

		log.info("list -> faqVOList" + faqVOList);
		
		return "mem/faq/faq";
	}

}
