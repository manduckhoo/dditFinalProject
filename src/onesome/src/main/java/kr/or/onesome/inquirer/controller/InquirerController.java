package kr.or.onesome.inquirer.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.onesome.inquirer.service.InquirerService;
import kr.or.onesome.util.RandomNumberGenerator;
import kr.or.onesome.util.SmsService;
import kr.or.onesome.vo.FranchiseOwnerVO;
import kr.or.onesome.vo.InquirerVO;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;


@Slf4j
@Controller
public class InquirerController { // 창업 상담 신청자 컨트롤러
	
	@Autowired
	SmsService smsService;
	
	@Autowired
    RandomNumberGenerator generator;
	
	@Autowired
	InquirerService inquirerService;

	@GetMapping("/admin/inqr/createForm")
	public String form() {
		
		return "admin/inqr/createForm";
	}
	
	// 창업 상담자 신청
	@PostMapping("/inqr/createPost")
	public String insert(InquirerVO inquirerVO) {
	
	log.info("inqr 입력 data : ", inquirerVO);
	System.out.println(inquirerVO);	
	int result = this.inquirerService.createPost(inquirerVO);
		
		return "redirect:/mem/main";
	}
	
	@GetMapping("/admin/inqr/list")
	public String list(Model model) {

		List<InquirerVO> dataList = this.inquirerService.list();
		model.addAttribute("dataList", dataList);

		return "admin/inqr/list";
	}
	
	@ResponseBody
	@GetMapping("/admin/inqr/getList")
	public List<InquirerVO> getlist() {
		
		List<InquirerVO> data = this.inquirerService.list();
		log.info("INQR list data=> " + data);
		return data;
	}
	
	@GetMapping("/admin/inqr/waitList")
	public String waitList(Model model) {
		
		List <FranchiseOwnerVO> list = this.inquirerService.waitList();
		log.info("점주 list " + list);
		Gson gson = new Gson();
		String jsonList = gson.toJson(list);

		model.addAttribute("dataList", list);
		model.addAttribute("data", jsonList);
		return "admin/inqr/waitList";
	}
	
	
	
	//list에서 수정 
	@ResponseBody
	@PostMapping("/admin/inqr/updatePost")
	public InquirerVO updatePost(@RequestBody InquirerVO inquirerVO){
		
		int result = this.inquirerService.updatePost(inquirerVO);
		
		return inquirerVO;
	}
	
	
	@PostMapping("/admin/inqr/update")
	public String update(InquirerVO inquirerVO) {
		System.out.println(inquirerVO);
		int result = this.inquirerService.update(inquirerVO);
		
		return "admin/inqr/list";
	}
	
	@ResponseBody
	@PostMapping("/admin/inqr/deletePost")
	public InquirerVO deletePost(@RequestBody InquirerVO inquirerVO) {
		
		int result = this.inquirerService.deletePost(inquirerVO);
		
		return inquirerVO;
	}
	
	@ResponseBody
	@PostMapping("/admin/inqr/detail")
	public Integer InqrNo(@RequestBody InquirerVO inquirerVO) {
		
		
		return inquirerVO.getInqrNo();
	}
	
	
	@GetMapping("/admin/inqr/detail")
	public String detail(@RequestParam String InqrNo, Model model) {
		
		InquirerVO inquirerVO = this.inquirerService.detail(InqrNo);
		
		int cnt[] = {100000000,150000000,200000000,250000000,300000000};
		String regions[] ={"서울","인천","경기도","충청도","전라도","경상도","강원/제주","해외"}; 
		model.addAttribute("cnt", cnt);
		model.addAttribute("regions",regions);
		model.addAttribute("inquirerVO",inquirerVO);
		
		return "admin/inqr/detail";
	}
	
	@ResponseBody
	@PostMapping("/admin/inqr/status")
	public Map<String,String> confirm(@RequestBody InquirerVO inquirerVO) {
		
		Map<String, String> rst = new HashMap<>();
		int result = this.inquirerService.status(inquirerVO);
		
		rst.put("rst", inquirerVO.getInqrStatusYn());
		System.out.println(inquirerVO.getInqrStatusYn());
		return rst;
	}
	
	
	//메인 홈페이지 창업상담 신청 페이지
	@GetMapping("/mem/inqr/storeStartupCounselApply")
	public String storeStartupCounselApply() {
		return "mem/inqr/storeStartupCounselApply";
	}
	
	
	//메인 홈페이지 창업 설명 페이지
	@GetMapping("/mem/inqr/startInfo")
	public String startInfo() {
		return "mem/inqr/startInfo";
	}
	
	
	//메인 홈페이지 창업 설명회
	@GetMapping("/mem/inqr/startExplan")
	public String startExplan() {
		return "mem/inqr/startExplan";
	}
	
	
	//메인 홈페이지 창업 금융상품 안내
	@GetMapping("/mem/inqr/storeFinanceProduct")
	public String storeFinanceProduct() {
		return "mem/inqr/storeFinanceProduct";
	}
	
	
	//메인 홈페이지 창업 금융상품 안내
	@GetMapping("/mem/bi")
	public String bi() {
		return "mem/inqr/bi";
	}
	
	
	//메일 인증 
	@ResponseBody
	@PostMapping("/mem/inqr/phone")
	public Map<String,String> phone(@RequestBody Map<String,String>map) {
	
	log.info("전화번호 : " + map);
	
	String recipientNumber = map.get("recipientNumber");
	
	//- 제거
	recipientNumber = recipientNumber.replaceAll("-", "");
	
	//인증번호 생성
	String code = generator.codeGeneration(8, true);
	
	SingleMessageSentResponse result = smsService.sendSmsCode(recipientNumber, code);
	map.put("인증번호",code);			
	
	return map;
	}
}
