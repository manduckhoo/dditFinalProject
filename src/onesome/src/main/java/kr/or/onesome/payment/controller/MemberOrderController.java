package kr.or.onesome.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import kr.or.onesome.payment.service.MemberOrderService;
import kr.or.onesome.security.CustomUser;
import kr.or.onesome.vo.FranchiseVO;
import kr.or.onesome.vo.MemberCartVO;
import kr.or.onesome.vo.MemberVO;
import kr.or.onesome.vo.PaymentDetailVO;
import kr.or.onesome.vo.PaymentVO;
import kr.or.onesome.vo.RecipeVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 일반회원이 주문 결제를 이용하기 위한 컨트롤러 클래스
 * @author 김형민
 * @since 2023.12.27
 *
 */

@RequestMapping("/mem")
@Slf4j
@Controller
public class MemberOrderController {
    
	@Autowired
	MemberOrderService memberOrderService;
	
	/** 주문된 메뉴를 구성하는 레시피에서 상품의 재고수와 주문한 수를 따져서 주문가능여부 체킹  */
    @PostMapping("/cartStockCheck")
    @ResponseBody
    public List<MemberCartVO> cartStockCheck(@RequestBody MemberCartVO memberCartVO
    		, Model model, Authentication auth) {
    	
    	MemberVO memberVO = new MemberVO();
		// 로그인중인 회원정보 가져오기
		if (auth != null) {
			CustomUser currUser = (CustomUser) auth.getPrincipal();
			memberVO = currUser.getMemberVO();
			log.info("memberVO : " + memberVO);
			model.addAttribute("user", currUser);
			model.addAttribute("memberVO", memberVO);
			memberCartVO.setMemNo(memberVO.getMemNo());
		}
    	
    	List<MemberCartVO> memberCartVOList = this.memberOrderService.cartStockCheck(memberCartVO);

    	return memberCartVOList;
    }
    
    
    /** 결제 API 완료 시 주문 테이블에 insert하기 */
    @PostMapping("/orderInsert")
    @ResponseBody
    public Map<String, Object> orderInsert(@RequestBody PaymentVO paymentVO, Model model
    		,Authentication auth) {
    	log.info("orderInsert : " + paymentVO);
    	
    	MemberVO memberVO = new MemberVO();
		// 로그인중인 회원정보 가져오기
		if (auth != null) {
			CustomUser currUser = (CustomUser) auth.getPrincipal();
			memberVO = currUser.getMemberVO();
			log.info("memberVO : " + memberVO);
			model.addAttribute("user", currUser);
			model.addAttribute("memberVO", memberVO);
			paymentVO.setMemNo(memberVO.getMemNo());
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		int cnt = memberOrderService.orderInsert(paymentVO);
		log.info("cnt: " + cnt);
		
		if(cnt > 0) {
			Map<String, Object> detailMap = new HashMap<>();
			for (int i = 0; i< paymentVO.getMenuNos().length; i++) {
				detailMap.put("pynmNo", paymentVO.getPynmNo());
				detailMap.put("pynmCnt", paymentVO.getCartCnts()[i]);
			}
		}
		// 배열에 담긴 값들 메뉴들의 길이만큼 돌림.. 즉, 모든 메뉴들을 포문 돌려서 담아줘야함 
		if (cnt > 0) {
			Map<String, Object> detailMap = new HashMap<>();
			for(int i = 0; i < paymentVO.getMenuNos().length; i++) {
				detailMap.put("pynmNo", paymentVO.getPynmNo()); 			// 주문 번호
				detailMap.put("pynmCnt", paymentVO.getCartCnts()[i]);		// 주문 수량은 카트 수량 배열로 맞춰줌(배열의 특정 위치)
				detailMap.put("menuNo", paymentVO.getMenuNos()[i]);			// 메뉴 넘버 동일
				detailMap.put("menuNm", paymentVO.getMenuNms()[i]);			// 메뉴 명 동일
				detailMap.put("menuPrice", paymentVO.getMenuPrices()[i]);	// 메뉴 가격 동일
				detailMap.put("atchFileNo", paymentVO.getAtchFileNos()[i]);	// 파일 번호 동일
				detailMap.put("menuSize", paymentVO.getMenuSizes()[i]);		// 메뉴 사이즈 동일
				detailMap.put("menuIceYn", paymentVO.getMenuIceYns()[i]);	// 메뉴 얼음유무 동일
				cnt += memberOrderService.orderDetailInsert(detailMap);		// 이제 메뉴 1개에 담긴 이 주문번호~얼음유무까지의 내용들을 cnt에 누적해서, 주문 테이블에 있는것들 => 주문상세로 넘길거임
			}
			//주문 상세로 가기전에 가맹점 재고 떨구기
			memberOrderService.frcsInventoryUpdate(paymentVO.getPynmNo());
			
			long totalPrice = paymentVO.getPynmTotalAmt(); // 체크해서 주문한 총 금액을 가져와서 totalPrice라는 총 합계에 담아줌
			result.put("result", "success"); 			   // cnt 1이상 들어오면 result키에 밸류를 success로 보내고
			result.put("pynmNo", paymentVO.getPynmNo());   // 주문번호 키값에 현재 주문테이블에서 들어간 주문번호를 value값으로 넣음
			result.put("frcsNo", paymentVO.getFrcsNo());   // 가맹점 번호 키값에 현재 주문테이블에서 선택한 지점의 가맹점번호를 value값으로 넣음
			result.put("orderTotalPrice", totalPrice);	   // 주문한 총 금액에 아까 위에서 선언한 totalPrice를 value값으로 넣어줌
		} else {
			result.put("result", "fail"); 	 // cnt 0이 들어오면 result키에 밸류를 fail로 보냄
		}
		return result; // 현재 result에 맞는 결과들을 리턴함
    }    
   
    
    /** 결제 API 완료 시 주문 테이블에서 => 주문 상세테이블로 insert하기 */
    @PostMapping("/orderDetailInsert")
    public String orderDetailInsert(@RequestParam("pynmNo") int pynmNo
    		,@RequestParam("orderTotalPrice") int orderTotalPrice
    		,@RequestParam("orderFrcsNo") int orderFrcsNo 
    		,PaymentDetailVO paymentDetailVO, Model model
    		,Authentication auth) {
    		log.info("orderDetailInsert -> paymentDetailVO : " + paymentDetailVO);
    		
    	MemberVO memberVO = new MemberVO();
    	// 로그인중인 회원정보 가져오기
    	if (auth != null) {
    		CustomUser currUser = (CustomUser) auth.getPrincipal();
    		memberVO = currUser.getMemberVO();
    		log.info("memberVO : " + memberVO);
    		model.addAttribute("user", currUser);
    		model.addAttribute("memberVO", memberVO);
    		paymentDetailVO.setMemNo(memberVO.getMemNo());
    	}
    	
    	FranchiseVO franchiseVO = memberOrderService.orderFrcsDetail(orderFrcsNo); // 가맹점 번호 가져오기
    	PaymentVO paymentVO = memberOrderService.orderDetail(pynmNo); // 주문번호 가져오기
    	
    	List<PaymentDetailVO> list = memberOrderService.orderDetailList(pynmNo); // 주문 상세내역들 가져오기(jsp가서 forEach 돌릴거임)
    	model.addAttribute("list", list);
    	model.addAttribute("orderTotalPrice", orderTotalPrice); // 리퀘파로 받은 변수
    	model.addAttribute("franchiseVO", franchiseVO); // 주문상세내역jsp에 뽑아줄 데이터가 필요해서 model에 담았음
    	model.addAttribute("paymentVO", paymentVO);
    	
    	memberOrderService.cartOrderListDelete(paymentDetailVO);
    	// 주문한 메뉴들만 장바구니에서 삭제하기
    	log.info("cartOrderListDelete -> paymentDetailVO : " + paymentDetailVO);
    	
    	return "mem/order/orderComplete";
    }
    
    //마이페이지 주문내역 확인하기
    @GetMapping("/myOrderList")
    public String myOrderList(PaymentDetailVO paymentDetailVO, Model model, Authentication auth) {
    	
    	MemberVO memberVO = new MemberVO();
    	// 로그인중인 회원정보 가져오기
    	if (auth != null) {
    		CustomUser currUser = (CustomUser) auth.getPrincipal();
    		memberVO = currUser.getMemberVO();
    		log.info("memberVO : " + memberVO);
    		model.addAttribute("user", currUser);
    		model.addAttribute("memberVO", memberVO);
    		paymentDetailVO.setMemNo(memberVO.getMemNo());
    	}
    	
    	List<PaymentDetailVO> list = memberOrderService.myOrderList(paymentDetailVO);
    	log.info("list : " + list);
    	model.addAttribute("list", list);
    	
    	return "mem/mypage/myOrderList";
    }
    
    // 주문내역 취소
    @PostMapping("/orderListCancel")
    @ResponseBody
    public int orderListCancel(@RequestBody PaymentDetailVO paymentDetailVO) {
    	
    	int result = 0;
    	
    	result = memberOrderService.orderListCancel(paymentDetailVO);
    	
    	return result;
    }
}
