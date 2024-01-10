package kr.or.onesome.franchise.controller;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.onesome.franchise.service.FranchiseDcmntService;
import kr.or.onesome.franchise.service.FranchiseEmployeeService;
import kr.or.onesome.vo.FranchiseDcmntVO;
import kr.or.onesome.vo.FranchiseEmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@MultipartConfig
@RequestMapping("/frcs/emp")
public class FranchiseDcmntController {

	@Autowired
	FranchiseDcmntService franchiseDcmntService;
	
	@Autowired
	FranchiseEmployeeService franchiseEmployeeService;
	
	@PostMapping("/insertDcmnt")
	public String insertDcmnt(Model model, FranchiseDcmntVO franchiseDcmntVO) {
		
		
		log.info("dsafasdf" + franchiseDcmntVO);
		FranchiseEmployeeVO franchiseEmployeeVO = new FranchiseEmployeeVO();
		
		FranchiseEmployeeVO data = this.franchiseEmployeeService.detail(franchiseEmployeeVO);
		log.info("detail -> franchiseEmployeeVO "+ data);
		
		//직원 서류 등록하기
		int result = this.franchiseDcmntService.insertDcmnt(franchiseDcmntVO);
		log.info("franchiseDcmntVO@@@@: " + franchiseDcmntVO);
		
		
		model.addAttribute("data", data);
		
		log.info("insertDcmnt -> result : " + result);
		
		//이걸 어디로 return?
		//이력서가 등록된 그 화면으로 다시 보내고 싶은데 경로를 어떻게 매핑해야할까요?
		return "frcs/main";
	}
}
