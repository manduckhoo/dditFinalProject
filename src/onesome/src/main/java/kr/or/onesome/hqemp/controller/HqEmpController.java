package kr.or.onesome.hqemp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.onesome.comcode.service.ComDetCodeService;
import kr.or.onesome.hqemp.service.impl.HqEmpService;
import kr.or.onesome.hqemp.vo.HqEmpVO;
import kr.or.onesome.product.service.ProductService;
import kr.or.onesome.product.vo.ProductVO;
import kr.or.onesome.util.ArticlePage;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import kr.or.onesome.vo.OjtVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 본사직원 관리
 * <p> 본사 직원들을 관리하는 컨트롤러
 * @author 원종찬
 *
 */
@Slf4j
@Controller
@RequestMapping("/admin/hqemp")
public class HqEmpController {
	
	@Autowired
	private HqEmpService hqEmpService;
	
	@Autowired
	private ComDetCodeService comDetCodeService;
	
	@GetMapping("/list")
	public String hqEmpList(Model model, Authentication auth,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "keyword", required = false, defaultValue="") String keyword) {
		
		if(auth != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("currentPage", currentPage);
			map.put("keyword", keyword);
			
			List<HqEmpVO> hqEmpList = hqEmpService.hqEmpList(map);
			List<ComDetCodeInfoVO> comDetCodeInfoVOList1 = comDetCodeService.comDetCodeListByComCode("PSTN");
			List<ComDetCodeInfoVO> comDetCodeInfoVOList2 = comDetCodeService.comDetCodeListByComCode("DEPT");
			List<ComDetCodeInfoVO> comDetCodeInfoVOList3 = comDetCodeService.comDetCodeListByComCode("WKPL");
			List<ComDetCodeInfoVO> comDetCodeInfoVOList4 = comDetCodeService.comDetCodeListByComCode("TASK");
			List<ComDetCodeInfoVO> comDetCodeInfoVOList5 = comDetCodeService.comDetCodeListByComCode("HQCD");
			
			int total = hqEmpService.getTotal(map);
			
			log.info("HqEmpEduController -> hqEmpList: {}", hqEmpList);
			
			ArticlePage<HqEmpVO> hqEmpVOList = new ArticlePage<HqEmpVO>(total, currentPage, 5, hqEmpList);
			hqEmpVOList.setUrl("/admin/hqemp/list");
			
			model.addAttribute("pstn", comDetCodeInfoVOList1);
			model.addAttribute("dept", comDetCodeInfoVOList2);
			model.addAttribute("wkpl", comDetCodeInfoVOList3);
			model.addAttribute("task", comDetCodeInfoVOList4);
			model.addAttribute("HQCD", comDetCodeInfoVOList5);
			model.addAttribute("hqEmpVOList", hqEmpVOList);
			return "admin/hqemp/list";
		} else {
			return "admin/login";
		}
	}
	
	@GetMapping("/detail")
	public String hqEmpDetail(Model model, @RequestParam int hqEmpNo) {
		HqEmpVO hqEmpVO = hqEmpService.hqEmpDetail(hqEmpNo);
		
		List<ComDetCodeInfoVO> comDetCodeInfoVOList1 = comDetCodeService.comDetCodeListByComCode("PSTN");
		List<ComDetCodeInfoVO> comDetCodeInfoVOList2 = comDetCodeService.comDetCodeListByComCode("DEPT");
		List<ComDetCodeInfoVO> comDetCodeInfoVOList3 = comDetCodeService.comDetCodeListByComCode("WKPL");
		List<ComDetCodeInfoVO> comDetCodeInfoVOList4 = comDetCodeService.comDetCodeListByComCode("TASK");
		List<ComDetCodeInfoVO> comDetCodeInfoVOList5 = comDetCodeService.comDetCodeListByComCode("HQCD");
		
		log.info("hqEmpDetail -> detail: {}", hqEmpVO);
		
		model.addAttribute("pstn", comDetCodeInfoVOList1);
		model.addAttribute("dept", comDetCodeInfoVOList2);
		model.addAttribute("wkpl", comDetCodeInfoVOList3);
		model.addAttribute("task", comDetCodeInfoVOList4);
		model.addAttribute("HQCD", comDetCodeInfoVOList5);
		model.addAttribute("hqEmpVO", hqEmpVO);
		return "admin/hqemp/detail";
	}
	
	@ResponseBody
	@PostMapping("/regist")
	public int regHqEmp(@ModelAttribute HqEmpVO hqempVO) {
		int result = hqEmpService.regHqEmp(hqempVO);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/modify")
	public int modHqEmp(@ModelAttribute HqEmpVO hqEmpVO) {
		int result = hqEmpService.modHqEmp(hqEmpVO);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public String delHqEmp(@RequestBody HqEmpVO hqEmpVO) {
		int result = hqEmpService.delHqEmp(hqEmpVO);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 근태관리
	@GetMapping("/calendarList")
	public String hqEmpCalendarList() {
		return "admin/hqemp/calendarList";
	}
}
