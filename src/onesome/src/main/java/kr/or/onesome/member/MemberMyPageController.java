package kr.or.onesome.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.onesome.member.service.MemberService;
import kr.or.onesome.security.CustomUser;
import kr.or.onesome.vo.MemberMenuVO;
import kr.or.onesome.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/mem")
@Slf4j
@Controller
public class MemberMyPageController {

   @Autowired
    MemberService memberService;
	
	// 매장 관리 페이지
	@GetMapping("/mypage")
	public String memMyPage() {
		return "mem/mypage/mypage";
	}
	
	// 마이페이지 => 위시리스트 조회
	@GetMapping("/menu/wishList")
	public String wishList() {
		return "mem/menu/wishList";
	}
}