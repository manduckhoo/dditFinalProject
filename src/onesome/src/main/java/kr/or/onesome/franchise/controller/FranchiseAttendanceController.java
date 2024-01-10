package kr.or.onesome.franchise.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.onesome.franchise.service.FranchiseAttendanceService;
import kr.or.onesome.vo.AttendanceManagementVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/frcs/emp")
public class FranchiseAttendanceController {
	
	@Autowired
	FranchiseAttendanceService franchiseAttendanceService;
	
	//가맹점 전체 직원 근무일정
	//똑같이 해서 가맹점 번호를 끌고 와야한다 ---> 가맹점 직원 끌어온 것 처럼 나중에 처리해주기
	@GetMapping("/frcsCalendar")
	public String baseFrcsCalendar() {
		
		return "frcs/emp/frcsCalendar";
	}
	
	//가맹점 전체 직원 근무일정 -- 불러오기
	@GetMapping("/getFrcsEvents")
	@ResponseBody
	public List<Map<String, Object>> getFrcsEvents(){
		
		
		List<Map<String, Object>> eventList = franchiseAttendanceService.getFrcsEvents();
		
		log.info("event -> " + eventList);
		return eventList;
	}
	
	//가맹점 전체 직원 근무일정 -- 추가하기
	@PostMapping("/addFrcsEvent")
	@ResponseBody
	public String addFrcsEvent(@RequestBody AttendanceManagementVO event){
		
		log.info("event :" + event);
		
		int result = franchiseAttendanceService.addFrcsEvent(event);
		
		if (result > 0){
            return "{\"stat\" :\"ok\"}";
        }else {
            return "{\"stat\" :\"fail\"}";
        }
	}
	
	//가맹점 전체 직원 근무일정 -- 수정하기
	@PostMapping("/updateFrcsEvent")
	@ResponseBody
	public String updateFrcsEvent(@RequestBody AttendanceManagementVO event) {
		
		int result = franchiseAttendanceService.updateFrcsEvent(event);
		
        if (result > 0){
            return "{\"stat\" :\"ok\"}";
        }else {
            return "{\"stat\" :\"fail\"}";
        }
	}
	
	//가맹점 전체 직원 근무일정 -- 삭제하기
	@PostMapping("/deleteFrcsEvent")
	@ResponseBody
	public String deleteFrcsEvent(@RequestBody AttendanceManagementVO event) {
		
		
		int result = franchiseAttendanceService.deleteFrcsEvent(event.getAttndceNo());
		
		if (result > 0){
            return "{\"stat\" :\"ok\"}";
        }else {
            return "{\"stat\" :\"fail\"}";
        }
	}
	
}
