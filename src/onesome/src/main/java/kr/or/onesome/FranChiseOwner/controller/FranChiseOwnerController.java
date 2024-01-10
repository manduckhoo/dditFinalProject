package kr.or.onesome.FranChiseOwner.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import kr.or.onesome.FranChiseOwner.service.FranChiseOwnerService;
import kr.or.onesome.vo.FranchiseOwnerVO;
import kr.or.onesome.vo.InquirerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/admin/FranChiseOwner")
@Controller
public class FranChiseOwnerController {
	
	@Autowired
	FranChiseOwnerService franChiseOwnerService;
	
	@PostMapping("/createForm")
	public String createPost(InquirerVO inquirerVO, Model model) {
		model.addAttribute("inquirerVO", inquirerVO);
		
		return "admin/franchiseOwner/createForm";
	}
	
	@PostMapping("/create")
	public String create(FranchiseOwnerVO franchiseOwnerVO) {
		
		int result = this.franChiseOwnerService.create(franchiseOwnerVO);
		
		return "redirect:/admin/FranChiseOwner/list";
	}
	
	@GetMapping("/list")
	public String list(Model model) throws Exception {
	    List<FranchiseOwnerVO> list = this.franChiseOwnerService.list();
	    ObjectMapper mapper = new ObjectMapper();
	    String jsonList = mapper.writeValueAsString(list);

	    model.addAttribute("data", jsonList);
	    model.addAttribute("dataList", list);

	    return "admin/franchiseOwner/list";
	}
	
	
	@GetMapping("/detail")
	public String detail(@RequestParam String frcsOwnrNo, Model model) {
		
		FranchiseOwnerVO franchiseOwnerVO = this.franChiseOwnerService.detail(frcsOwnrNo);
		
		model.addAttribute("FranchiseOwnerVO", franchiseOwnerVO);
		
		return "admin/franchiseOwner/detail";
				
	}
	
	@PostMapping("/update")
	public String update(FranchiseOwnerVO franchiseOwnerVO) {
		
		int result = this.franChiseOwnerService.update(franchiseOwnerVO);
		
		return "redirect:/admin/FranChiseOwner/detail?frcsOwnrNo="+franchiseOwnerVO.getFrcsOwnrNo();
	}
	
}
