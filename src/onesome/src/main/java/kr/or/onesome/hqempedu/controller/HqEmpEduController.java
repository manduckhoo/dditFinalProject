package kr.or.onesome.hqempedu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.onesome.comcode.service.ComDetCodeService;
import kr.or.onesome.hqempedu.service.HqEmpEduService;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import kr.or.onesome.vo.OjtVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/edu")
public class HqEmpEduController {
	
	@Autowired
	private HqEmpEduService hqEmpEduService;
	
	@Autowired
	private ComDetCodeService comDetCodeService;
	@GetMapping("/list")
	public String eduList(Model model) {
		
		List<OjtVO> ojtList = hqEmpEduService.eduList();
		
		List<ComDetCodeInfoVO> comDetCodeInfoVOList = comDetCodeService.comDetCodeListByComCode("OJT");
		
		log.info("HqEmpEduController -> ojtList: {}", ojtList);
		
		model.addAttribute("comDetCodeInfoVOList", comDetCodeInfoVOList);
		model.addAttribute("ojtList", ojtList);
		return "admin/edu/list";
	}
	
	@GetMapping("/detail")
	public String eduDetail(Model model, int ojtNo) {
		
		OjtVO ojtVO = hqEmpEduService.eduDetail(ojtNo);
		
		List<ComDetCodeInfoVO> comDetCodeInfoVOList = comDetCodeService.comDetCodeListByComCode("OJT");
		log.info("HqEmpEduController -> ojtVO: {}", ojtVO);
		
		model.addAttribute("comDetCodeInfoVOList", comDetCodeInfoVOList);
		model.addAttribute("ojtVO", ojtVO);
		return "admin/edu/detail";
	}
	
	@PostMapping("/addEdu")
	@ResponseBody
	public int addEdu(Model model, OjtVO ojtVO) { 
		// ajax 파일로 넘어올땐 json으로 넘어오지 않아서 requestbody를 적어주지 않는다
		// @RequestBody는 json으로 들어오는 바디 데이터를 파싱해주는거라고 한다
		// 이걸 쓰려면 raw-json으로 날려야 한다
		
		log.info("addEdu -> ojtVO: {}", ojtVO);
		
		int result = hqEmpEduService.addEdu(ojtVO);
		log.info("addEdu -> result: {}", result);
		return result;
	}
	
	@PostMapping("/delEdu")
	@ResponseBody
	public int delEdu(@RequestBody OjtVO ojtVO) {
		
		log.info("ojtNo: {}", ojtVO);
		
		int result = hqEmpEduService.delEdu(ojtVO);
		
		return result;
	}
	
	@PostMapping("/updateEdu")
	@ResponseBody
	public int updateEdu(OjtVO ojtVO) {
		
		int result = hqEmpEduService.updateEdu(ojtVO);
		log.info("result", result);
		return result;
	}
}


















