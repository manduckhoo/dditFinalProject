package kr.or.onesome.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.or.onesome.cart.controller.MemberCartController;
import kr.or.onesome.cart.service.MemberCartService;
import kr.or.onesome.member.MemberAjaxController;
import kr.or.onesome.member.MemberMainController;
import kr.or.onesome.member.MemberMapController;
import kr.or.onesome.member.MemberMyPageController;
import kr.or.onesome.payment.controller.MemberOrderController;
import kr.or.onesome.security.CustomUser;
import kr.or.onesome.vo.MemberVO;
import net.sf.json.JSONArray;

@ControllerAdvice(assignableTypes={MemberCartController.class, MemberAjaxController.class, MemberMainController.class, MemberMapController.class, MemberMyPageController.class, MemberOrderController.class})
public class BaseControllerAdvice {

	@Autowired
	MemberCartService memberCartService;

	@ModelAttribute
	public void cartList(HttpServletRequest req, HttpServletResponse res, Authentication auth)
			throws UnsupportedEncodingException {
		if (auth != null) {
			CustomUser currUser = (CustomUser) auth.getPrincipal();
			MemberVO memberVO = currUser.getMemberVO();
			
			if(memberVO != null) {
			// 장바구니 조회
			List<Map<String, Object>> cartList = memberCartService.cartList2(memberVO);

			JSONArray result = JSONArray.fromObject(cartList);

			Cookie cookie = new Cookie("cartList", URLEncoder.encode(result.toString(), "UTF-8"));
			cookie.setMaxAge(60 * 60 * 24); // 쿠키 유효 기간: 하루로 설정(60초 * 60분 * 24시간)
			cookie.setPath("/"); // 모든 경로에서 접근 가능하도록 설정
			res.addCookie(cookie); // response에 Cookie 추가
			}
			
		} else {
			Cookie[] cookies = req.getCookies();
			if(cookies != null) {
               for (Cookie cookie : cookies) {
                   if (cookie.getName().equals("cartList")) {
                       cookie.setPath("/");
                       cookie.setMaxAge(0);
                       res.addCookie(cookie);
                   }
               }
           }
		}
	}
}