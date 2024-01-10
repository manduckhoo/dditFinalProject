package kr.or.onesome.cart.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.onesome.cart.service.MemberCartService;
import kr.or.onesome.security.CustomUser;
import kr.or.onesome.vo.CtgryDetailVO;
import kr.or.onesome.vo.FranchiseVO;
import kr.or.onesome.vo.MemberCartVO;
import kr.or.onesome.vo.MemberMenuVO;
import kr.or.onesome.vo.MemberVO;
import kr.or.onesome.vo.PaymentDetailVO;
import kr.or.onesome.vo.PaymentMethodVO;
import kr.or.onesome.vo.PaymentVO;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;

/**
 * 일반회원이 장바구니를 이용하기 위한 컨트롤러 클래스
 * 
 * @author 김형민
 * @since 2023.12.09
 * @version 1.0
 * 
 *          <pre>
 * << 개정이력(Modification Information) >>
 *  수정일		   수정자	  		수정 내용
 *  ----------	 ----------- 	--------------------------------
 *  2023.12.09       김형민            		최초 생성
 *          </pre>
 */

@RequestMapping("/mem")
@Slf4j
@Controller
public class MemberCartController {

	@Autowired
	MemberCartService memberCartService;

	// 장바구니 "음료" 담기 메소드
	@PostMapping("/cartInsert")
	@ResponseBody
	public String cartInsert(@RequestBody MemberCartVO memberCartVO, Model model,
			HttpServletResponse res, Authentication auth, MemberMenuVO memberMenuVO) throws UnsupportedEncodingException {
		log.info("memberCartVO : " + memberCartVO);
		log.info("cartInsert->auth : " + auth);
		
		MemberVO memberVO = new MemberVO();
		// 로그인중인 회원정보 가져오기
		if (auth != null) {
			CustomUser currUser = (CustomUser) auth.getPrincipal();
			memberVO = currUser.getMemberVO();
			log.info("memberVO : " + memberVO);
			model.addAttribute("user", currUser);
			model.addAttribute("memberVO", memberVO);
			memberMenuVO.setMemNo(memberVO.getMemNo());
			memberCartVO.setMemNo(memberVO.getMemNo());
		}
		
		/** 장바구니 체크, 등록, 업데이트 */
		// 0 : 카트에 메뉴가 없음 => 신규 등록
		// 1 : 카트에 메뉴가 있고 수량도 같음 => 이미 존재 모달 창
		// 2 : 카트에 메뉴가 있는데 수량은 다름 => 업데이트
		memberMenuVO.setMenuSize(memberCartVO.getMenuSize());
		memberMenuVO.setMenuIceYn(memberCartVO.getMenuIceYn());
		memberMenuVO.setMenuNo(memberCartVO.getMenuNo());
		memberMenuVO.setCartCnt(0); // 최초 메뉴VO의 카트수량을 0으로 세팅하고
		int isAlreadyExisted = memberCartService.findCartMenu(memberMenuVO); //이미 존재하는 메뉸지 부터 찾는다.
		if (isAlreadyExisted > 0) { // 만약 0보다 크면 이미 존재하는거니까
			memberMenuVO.setCartCnt(memberCartVO.getCartCnt()); // 현재 존재하는 카트의 수량을 가져와서 세팅해준다.
			isAlreadyExisted = memberCartService.findCartMenu(memberMenuVO); // 그리고 다시 메뉴를 찾으면 if문을 타게된다.
			if (isAlreadyExisted == 1) {
				return "already_existed"; // 카운트가 1이 들어오면 이미 존재하는 메뉴에 존재하는 수량과 같음을 표시한다.
			}else {
				memberCartService.cartUpdate(memberCartVO); // 카운트가 2 이상 들어오면 업데이트를 해준다.
				shoppingCartCheck(res, auth); // 여긴 사이드바 카트랑 연동
				return "update_success";
			}
		} else { // 0 : 카트에 메뉴가 없음 => 신규 등록
			log.info("isAlreadyExisted 신규등록 : " + isAlreadyExisted);
			memberCartService.cartInsert(memberCartVO);
			shoppingCartCheck(res, auth); // 여긴 사이드바 카트랑 연동
			return "add_success";
		}
	}
	
	// 장바구니 "푸드, 상품" 담기 메소드
	@PostMapping("/cartInsert2")
	@ResponseBody
	public String cartInsert2(@RequestBody MemberCartVO memberCartVO, Model model,
			HttpServletResponse res, Authentication auth, MemberMenuVO memberMenuVO) throws UnsupportedEncodingException {
		log.info("memberCartVO : " + memberCartVO);
		log.info("cartInsert->auth : " + auth);
		
		MemberVO memberVO = new MemberVO();
		// 로그인중인 회원정보 가져오기
		if (auth != null) {
			CustomUser currUser = (CustomUser) auth.getPrincipal();
			memberVO = currUser.getMemberVO();
			log.info("memberVO : " + memberVO);
			model.addAttribute("user", currUser);
			model.addAttribute("memberVO", memberVO);
			memberMenuVO.setMemNo(memberVO.getMemNo());
			memberCartVO.setMemNo(memberVO.getMemNo());
		}
		
		/** 장바구니 체크, 등록, 업데이트 */
		// 0 : 카트에 메뉴가 없음 => 신규 등록
		// 1 : 카트에 메뉴가 있는데 수량은 다름 => 업데이트
		// 2 : 카트에 메뉴도 있고 수량도 같음 => 이미 존재 모달 창
		memberMenuVO.setMenuNo(memberCartVO.getMenuNo()); //현존하는 카트의 메뉴를 세팅해줌.
		memberMenuVO.setCartCnt(memberCartVO.getCartCnt()); // 현존하는 카트의 수량을 세팅해줌
		int isAlreadyExisted2 = memberCartService.findCartMenu2(memberMenuVO); //이미 존재하는 메뉴인지 찾는다.
		
		if (isAlreadyExisted2 > 0) { // 만약 0보다 크면 이미 존재하는거니까 이너 if문 타
			if (isAlreadyExisted2 == 1) {
				memberCartService.cartUpdate2(memberCartVO); // 카운트가 1이 들어오면 업데이트를 해준다.
				shoppingCartCheck(res, auth); // 여긴 사이드바 카트랑 연동
				return "update_success2";
			}else {
				return "already_existed2"; // 2가 들어오면 이미 존재한다는 모달창을 띄운다.
			}
		} else { // 0 : 카트에 메뉴가 없음 => 신규 등록
			memberCartService.cartInsert2(memberCartVO);
			shoppingCartCheck(res, auth); // 여긴 사이드바 카트랑 연동
			return "add_success2";
		}
	}

	// 장바구니 리스트 조회
	@GetMapping("/cartList")
	public String cartList(Model model, Authentication auth
			, MemberCartVO memberCartVO, PaymentVO paymentVO) {
		
		// 로그인중인 회원정보 가져오기
		if (auth != null) {
			CustomUser currUser = (CustomUser) auth.getPrincipal();
			MemberVO memberVO = currUser.getMemberVO();
			log.info("memberVO : " + memberVO);
			model.addAttribute("user", currUser);
			model.addAttribute("memberVO", memberVO);
			memberCartVO.setMemNo(memberVO.getMemNo());
			paymentVO.setMemNo(memberVO.getMemNo());
			memberCartVO.setMenuNo(memberCartVO.getMenuNo());
			memberCartVO.setMenuSize(memberCartVO.getMenuSize());
			memberCartVO.setMenuIceYn(memberCartVO.getMenuIceYn());
		}
		
		FranchiseVO franchiseVO = new FranchiseVO();
		//가맹점 정보 가져오기 
		List<FranchiseVO> franchiseVOList = this.memberCartService.franchiseVOList(franchiseVO);
		model.addAttribute("franchiseVOList", franchiseVOList);
		
		List<PaymentMethodVO> paymentMethodVOList = this.memberCartService.selectPayId();
		model.addAttribute("paymentMethodVOList", paymentMethodVOList);
		log.info("paymentMethodVOList: " + paymentMethodVOList);
		
		//장바구니 정보 가져오기
		List<MemberCartVO> cartList = this.memberCartService.cartList(memberCartVO);
		log.info("cartList : " + cartList);
		model.addAttribute("cartList", cartList);
		return "mem/cart/cartList";
	}

	// 장바구니 조회 2(사이드바)
	public void shoppingCartCheck(HttpServletResponse res, Authentication auth) throws UnsupportedEncodingException {
		if (auth != null) {
			CustomUser currUser = (CustomUser) auth.getPrincipal();
			MemberVO memberVO = currUser.getMemberVO();

			// 장바구니 조회
			List<Map<String, Object>> cartList = memberCartService.cartList2(memberVO);

			JSONArray result = JSONArray.fromObject(cartList);

			Cookie cookie = new Cookie("cartList", URLEncoder.encode(result.toString(), "UTF-8"));
			cookie.setMaxAge(60 * 60 * 24); // 쿠키 유효 기간: 하루로 설정(60초 * 60분 * 24시간)
			cookie.setPath("/"); // 모든 경로에서 접근 가능하도록 설정
			res.addCookie(cookie); // response에 Cookie 추가
		}
	}
	
	// 장바구니 내역 삭제
	@PostMapping("/cartListDelete")
	@ResponseBody
	public int cartListDelete(@RequestBody MemberCartVO memberCartVO
			, Authentication auth
			, Model model) {
		log.info("cartListDelete -> memberCartVO : " + memberCartVO);
		
		int result = 0;
		
		if(memberCartVO.getCartSeqs() != null) {//VO에 새로 추가한 메뉴번호들의 배열의 길이가 0이 아니라면
			for(int i = 0; i < memberCartVO.getCartSeqs().length; i++) { //카트VO에 담긴 메뉴번호들 배열의 길이만큼 포문 돌린다.
				memberCartVO.setCartSeq(Integer.parseInt(memberCartVO.getCartSeqs()[i])); //하나씩 VO애서 겟메뉴번호들의 i값 배열 꺼내서 파싱해주고 세팅한다.
				result = memberCartService.cartListDelete(memberCartVO); //하나씩 모두 지워버린다.
			}
		}else {
			result = memberCartService.cartListDelete(memberCartVO); //그냥 아이콘 눌러서 삭제하는 경우는 여기로
		}
		
		return result;
	}
}