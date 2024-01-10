package kr.or.onesome.franchise.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.onesome.franchise.mapper.FranchiseEmployeeMapper;
import kr.or.onesome.franchise.service.FranchiseDcmntService;
import kr.or.onesome.franchise.service.FranchiseEmployeeService;
import kr.or.onesome.notice.mapper.NoticeMapper;
import kr.or.onesome.util.PagingHandler;
import kr.or.onesome.vo.AttendanceManagementVO;
import kr.or.onesome.vo.ComCodeInfoVO;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import kr.or.onesome.vo.FranchiseDcmntVO;
import kr.or.onesome.vo.FranchiseEmployeeVO;
import kr.or.onesome.vo.FranchiseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@MultipartConfig
@RequestMapping("/frcs/emp")
public class FranchiseEmployeeController {
	
	@Autowired
	FranchiseEmployeeService franchiseEmployeeService;
	
	@Autowired
	FranchiseDcmntService franchiseDcmntService;
	
	@Autowired
	String uploadFolder;
	
	@Autowired
	FranchiseEmployeeMapper franchiseEmployeeMapper;
	
	//가맹점 직원 목록
	@GetMapping("/list")
	public String list(Model model, HttpSession session,
			@RequestParam(required = false, defaultValue =  "1") int currentPage) {
		
		PagingHandler pagingHandler = new PagingHandler(currentPage, 4, franchiseEmployeeMapper.getCount());
		
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNo", pagingHandler.getStartNo());
		map.put("endNo", pagingHandler.getEndNo());
		
		// 근무 타입 정보 가져오기
		List<ComDetCodeInfoVO> comDetCodeInfoVOList2 = this.franchiseEmployeeService.getWKTP();
		
		List<FranchiseEmployeeVO> data = this.franchiseEmployeeService.list(map);
		log.info("list : 가져온겨?" + data);
		
		
		model.addAttribute("pagingHandler", pagingHandler);
		model.addAttribute("data", data);
		model.addAttribute("comDetCodeInfoVOList2", comDetCodeInfoVOList2);
		
		log.info("지금이거 안찍힘?");
		
		return "frcs/emp/list";
	}
	
	//가맹점 직원 상세
	@RequestMapping("/detail")
	public String detail(Model model, FranchiseEmployeeVO franchiseEmployeeVO, FranchiseDcmntVO franchiseDcmntVO) {
		
		
		FranchiseEmployeeVO data = this.franchiseEmployeeService.detail(franchiseEmployeeVO);
		FranchiseDcmntVO franchiseDcmntVO2 = new FranchiseDcmntVO();
		log.info("detail -> franchiseEmployeeVO "+ data);
		
		//이력서 보여주기
		franchiseDcmntVO = this.franchiseDcmntService.showCareer(franchiseDcmntVO);
		//보건증 보여주기
		franchiseDcmntVO2 = this.franchiseDcmntService.showHealth(franchiseDcmntVO);
		
		// 근무 타입 정보 가져오기
		List<ComDetCodeInfoVO> comDetCodeInfoVOList2 = this.franchiseEmployeeService.getWKTP();
		
		model.addAttribute("data", data);
		model.addAttribute("comDetCodeInfoVOList2", comDetCodeInfoVOList2);
		//실험용 추가
		model.addAttribute("franchiseDcmntVO", franchiseDcmntVO);
		model.addAttribute("franchiseDcmntVO2", franchiseDcmntVO2);
		log.info("@@뭐가들었니@@ : " + franchiseDcmntVO);
 
		return "frcs/emp/detail";
	}
	
	//가맹점 직원 등록
	@PostMapping("/create")
	public String createPost(FranchiseEmployeeVO franchiseEmployeeVO) {
		
		log.error("createPost -> franchiseEmployeeVO" + franchiseEmployeeVO);
		
		int result = this.franchiseEmployeeService.createPost(franchiseEmployeeVO);
		log.info("franchiseEmployeeVO : " + franchiseEmployeeVO);
		
		log.info("createPost -> result : " + result);

		return "redirect:/frcs/emp/detail?frcsEmpNo="+franchiseEmployeeVO.getFrcsEmpNo();
	}
	
	//가맹점 직원 등록
	@GetMapping("/create")
	public String create(Model model) {
		
		// 가맹점 정보 가져오기
		List<FranchiseVO> franchiseVOList = this.franchiseEmployeeService.getFranchise();
		
		// 근무 상태 정보 가져오기
		List<ComDetCodeInfoVO> comDetCodeInfoVOList = this.franchiseEmployeeService.getCWST();
		// 근무 타입 정보 가져오기
		List<ComDetCodeInfoVO> comDetCodeInfoVOList2 = this.franchiseEmployeeService.getWKTP();
		
		log.error("comDetCodeInfoVOList" + comDetCodeInfoVOList);
		log.info("이거다" + comDetCodeInfoVOList );
		model.addAttribute("franchiseVOList", franchiseVOList);
		model.addAttribute("comDetCodeInfoVOList", comDetCodeInfoVOList);
		model.addAttribute("comDetCodeInfoVOList2", comDetCodeInfoVOList2);
		
		return "frcs/emp/create";
	}
	
	//가맹점 직원 정보 수정
	@PostMapping("/update")
	public String update(Model model, FranchiseEmployeeVO franchiseEmployeeVO) {
		
		log.info("update -> franchiseEmployeeVO" + franchiseEmployeeVO);
		
		//업데이트
		int result = this.franchiseEmployeeService.update(franchiseEmployeeVO);
		log.info("update -> result : " + result);
		
		return "redirect:/frcs/emp/detail?frcsEmpNo="+franchiseEmployeeVO.getFrcsEmpNo();
	}
	
	//가맹점 직원 정보 삭제
	@PostMapping("/delete")
	public String delete(Model model, FranchiseEmployeeVO franchiseEmployeeVO) {
		
		log.info("delete -> franchiseEmployeeVO : " + franchiseEmployeeVO);
		
		//삭제
		int result = this.franchiseEmployeeService.delete(franchiseEmployeeVO);
		log.info("delete -> result : " + result);
		
		return "redirect:/frcs/emp/list";
	}
	
	/*
	 * //가맹점 직원 근무일정
	 * 
	 * @GetMapping("/calendar") public String
	 * baseCalendar(@RequestParam(name="frcsEmpNo") int frcsEmpNo, Model model) {
	 * 
	 * model.addAttribute("frcsEmpNo", frcsEmpNo);
	 * 
	 * return "frcs/emp/calendar"; }
	 */
	
	//가맹점 직원 근무일정
	@GetMapping("/calendar")
	public String baseCalendar(FranchiseEmployeeVO franchiseEmployeeVO, Model model) {
		
		log.info("vo ==> {}", franchiseEmployeeVO);
		
		franchiseEmployeeVO = this.franchiseEmployeeService.detail(franchiseEmployeeVO);
		
		model.addAttribute("franchiseEmployeeVO", franchiseEmployeeVO);
		
		return "frcs/emp/calendar";
	}
	
	//가맹점 직원 근무일정 -- 불러오기
	@PostMapping("/getEvents")
	@ResponseBody
	public List<Map<String, Object>> getEvents(@RequestBody AttendanceManagementVO attendanceManagementVO){
		
		log.info("attendanceManagementVO@@@@" + attendanceManagementVO);
		
		List<Map<String, Object>> eventList = franchiseEmployeeService.getEvents(attendanceManagementVO);
		
		log.info("event -> " + eventList);
		return eventList;
	}
	
	//가맹점 직원 근무일정 -- 추가하기
	@PostMapping("/addEvent")
	@ResponseBody
	public String addEvent(@RequestBody AttendanceManagementVO event){
		
		log.info("event @@@@:" + event);
		
		int result = franchiseEmployeeService.addEvent(event);
		
		log.info("event :" + event);
		
		//이거 무슨 의미?
		if (result > 0){
            return "{\"stat\" :\"ok\"}";
        }else {
            return "{\"stat\" :\"fail\"}";
        }
		
	}
	
	//가맹점 직원 근무일정 -- 수정하기
	@PostMapping("/updateEvent")
	@ResponseBody
	public String updateEvent(@RequestBody AttendanceManagementVO event) {
		
		int result = franchiseEmployeeService.updateEvent(event);
		
        if (result > 0){
            return "{\"stat\" :\"ok\"}";
        }else {
            return "{\"stat\" :\"fail\"}";
        }
	}
	
	//가맹점 직원 근무일정 -- 삭제하기
	@PostMapping("/deleteEvent")
	@ResponseBody
	public String deleteEvent(@RequestBody AttendanceManagementVO event) {
		
		int result = franchiseEmployeeService.deleteEvent(event.getAttndceNo());
		
		if (result > 0){
            return "{\"stat\" :\"ok\"}";
        }else {
            return "{\"stat\" :\"fail\"}";
        }
	}
}
