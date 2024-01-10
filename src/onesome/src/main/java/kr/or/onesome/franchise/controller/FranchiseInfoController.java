package kr.or.onesome.franchise.controller;

import java.util.List;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.onesome.franchise.service.FranchiseInfoService;
import kr.or.onesome.security.CustomUser;
import kr.or.onesome.vo.FranchiseOwnerVO;
import kr.or.onesome.vo.FranchiseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@MultipartConfig
@RequestMapping("/frcs/info")
public class FranchiseInfoController {

	@Autowired
	FranchiseInfoService franchiseInfoService;
	
	/**
	 * 가맹점 정보 관리 -- 가맹점 정보 관리
	 * @param model
	 * @return
	 */
	@GetMapping("frcsInfo")
	public String info(Model model, FranchiseVO franchiseVO) {
		
		log.info("info =====>" + franchiseVO);
		franchiseVO = this.franchiseInfoService.info(franchiseVO);
		
		log.info("info @@@---@@@--->: " + franchiseVO);
		
		model.addAttribute("franchiseVO", franchiseVO);
				
		return "frcs/info/frcsInfo";
	}
	

}
