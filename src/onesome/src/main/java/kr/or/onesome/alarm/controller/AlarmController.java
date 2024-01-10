package kr.or.onesome.alarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.onesome.alarm.service.AlarmService;
import kr.or.onesome.alarm.vo.AlarmVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/alarm")
public class AlarmController {
	
	@Autowired
	private AlarmService alarmService;
	
	@PostMapping("/saveAlarm")
	public String saveAlarm(AlarmVO alarmVO) {
		log.info("saveAlarm ->  alarmVO: {}", alarmVO);
		int result = alarmService.saveAlarm(alarmVO);
		
		log.info("result: {}", result);
		return "";
	}
}
