package kr.or.onesome.ojt.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.onesome.ojt.service.OjtService;
import kr.or.onesome.vo.OjtVO;
import lombok.extern.slf4j.Slf4j;


//교육 테이블 컨트롤러

@RequestMapping("/frcs/ojt")
@Slf4j
@Controller
public class OjtController {

	@Autowired
	OjtService ojtService;
	
	
	//교육 신규 인력
	@PostMapping("/insert")
	public String  insert(Map<String,Object>map) {
		
		int result = this.ojtService.insert(map);
		
		  if (result > 0){
	            return "{\"stat\" :\"ok\"}";
	        }else {
	            return "{\"stat\" :\"fail\"}";
	        }
		
	}
	
	@ResponseBody
	@PostMapping("/update")
	public String update(@RequestBody Map<String,Object> map) {
	
		log.info("update Map Cont :" + map);
		int result = this.ojtService.update(map);
		
		  if (result > 0){
	            return "{\"stat\" :\"ok\"}";
	        }else {
	            return "{\"stat\" :\"fail\"}";
	        }
	}
}
