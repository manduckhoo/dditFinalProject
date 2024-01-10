package kr.or.onesome.wish.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.onesome.security.CustomUser;
import kr.or.onesome.vo.MemberMenuVO;
import kr.or.onesome.vo.MemberVO;
import kr.or.onesome.vo.MemberWishVO;
import kr.or.onesome.wish.service.MemberWishService;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/mem")
@Slf4j
@Controller
public class MemberWishController {

	@Autowired
	MemberWishService memberWishService;
	
	// 메뉴 상세조회에서 위시리스트 추가하기
	@PostMapping("/wishListInsert")
	@ResponseBody
	public String wishListInsert(@RequestBody MemberWishVO memberWishVO, Authentication auth, Model model) {
		log.info("wishListInsert : 여기서부터 memNo가 null" + memberWishVO);

		// 로그인중인 회원정보 가져오기
		if (auth != null) {
			CustomUser currUser = (CustomUser) auth.getPrincipal();
			MemberVO memberVO = currUser.getMemberVO();
			log.info("memberVO : " + memberVO);
			model.addAttribute("user", currUser);
			model.addAttribute("memberVO", memberVO);
			memberWishVO.setMemNo(memberVO.getMemNo());
			memberWishVO.setMenuNo(memberWishVO.getMenuNo());
		}
		
		log.info("wishListInsert -> memberMenuVO : " + memberWishVO);
		int result = memberWishService.wishListInsert(memberWishVO);
		log.info("wishListInsert->result : " + result);//0 : insert안됨, 1 : insert됨
		if (result > 0) {
			return "success";
		}else {
			return "exists";
		}
	}
	
	// 위시리스트 조회하기
	@GetMapping("/wishList")
	public String wishList(Model model, Authentication auth, 
			MemberWishVO memberWishVO, Principal principal) {
		log.info("wishList->principal : " + principal.getName());

		// 로그인중인 회원정보 가져오기
		if (auth != null) {
			CustomUser currUser = (CustomUser) auth.getPrincipal();
			MemberVO memberVO = currUser.getMemberVO();
			log.info("memberVO : " + memberVO);
			model.addAttribute("user", currUser);
			model.addAttribute("memberVO", memberVO);
			memberWishVO.setMemNo(memberVO.getMemNo());
			memberWishVO.setMenuNo(memberWishVO.getMenuNo());
		}

		List<MemberWishVO> wishList = this.memberWishService.wishList(memberWishVO);
		model.addAttribute("wishList", wishList);
		
		return "mem/wish/wishList";
	}
	
	// 위시리스트 삭제하기
	@PostMapping("/wishListDelete")
	@ResponseBody
	public int wishListDelete(@RequestBody MemberWishVO memberWishVO
			,Authentication auth
			,Model model) {
		log.info("memberWishVO:"+memberWishVO);
		
		// 로그인중인 회원정보 가져오기
		if (auth != null) {
			CustomUser currUser = (CustomUser) auth.getPrincipal();
			MemberVO memberVO = currUser.getMemberVO();
			log.info("memberVO : " + memberVO);
			model.addAttribute("user", currUser);
			model.addAttribute("memberVO", memberVO);
			memberWishVO.setMemNo(memberVO.getMemNo());
			memberWishVO.setMenuNo(memberWishVO.getMenuNo());
		}
		
		int result = memberWishService.wishListDelete(memberWishVO);
		log.info("result : "+ result);
		
		return result;
	}
}
