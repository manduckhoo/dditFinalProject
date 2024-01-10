package kr.or.onesome.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/mem")
@Slf4j
@Controller
public class MemberMapController {

	// 매장 관리 페이지
	@GetMapping("/map")
	public String memMap() {
		return "mem/map/map";
	}
	
}
