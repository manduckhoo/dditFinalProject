package kr.or.onesome.franchise;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.onesome.franchise.service.FranchiseMainService;
import kr.or.onesome.vo.FranchiseVO;
import kr.or.onesome.vo.PaymentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.or.onesome.FranChiseOwner.service.FranChiseOwnerService;
import kr.or.onesome.franchise.service.FranchiseEmployeeService;
import kr.or.onesome.security.CustomUser;
import kr.or.onesome.vo.FranchiseOwnerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/frcs")
public class FrcsController {

	@Autowired
	FranchiseEmployeeService franchiseEmployeeService;
	
	@Autowired
	FranChiseOwnerService franChiseOwnerService;

	@Autowired
	FranchiseMainService franchiseMainService;
	
	// 프랜차이즈 ERP 메인화면
	@GetMapping("/main")
	public String frcsHome(Model model, HttpServletRequest req, Authentication auth) {

		//로그인 직후 가맹점주의 첫번째 매장번호를 세션에 저장 ※ 삭제하지 말것
		HttpSession session = req.getSession();
		if(auth != null) {
			CustomUser franchiseOwner = (CustomUser)auth.getPrincipal();
			//로그인 정보에서 매장들을 가져옴
			FranchiseOwnerVO franchiseOwnerVO = franchiseOwner.getOwnerVO();
			log.info("franchiseOwnerVO ===>"+franchiseOwner.getOwnerVO());
			if (session.getAttribute("crrFrcsNo") == null) {
				session.setAttribute("crrFrcsNo", franchiseOwnerVO.getFranchiseVOList().get(0).getFrcsNo());
			}
			model.addAttribute("franchiseOwnerVO", franchiseOwnerVO);
		}

		int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

		//금일주문건수, 금일 매출, 처리중인 발주건, 미확인 공문 조회
		Map<String, Object> frcsMainHeader = franchiseMainService.getFrcsMainHeader(crrFrcsNo);

		//가맹점 재고중 적정재고 보다 적은 제품목록 조회
		List<Map<String, Object>> inventoryCntList = franchiseMainService.getInventoryCntList(crrFrcsNo);

		model.addAttribute("frcsMainHeader", frcsMainHeader);
		model.addAttribute("inventoryCntList", inventoryCntList);

		return "frcs/main/main";
	}

	//대기중인 주문의 상세정보를 조회
	@ResponseBody
	@PostMapping("/main/getOrderDetail")
	public PaymentVO getOrderDetail(HttpServletRequest req, @RequestBody Map<String, Object> paramMap){
		//세션에서 현재 가맹점 번호를 꺼냄
		HttpSession session = req.getSession();
		int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

		paramMap.put("crrFrcsNo", crrFrcsNo);

		return franchiseMainService.getOrderDetail(paramMap);
	}

	//메뉴 준비상태를 변경(ajax)
	@ResponseBody
	@PostMapping("/main/changeOrderStatus")
	public Map<String, String>changeOrderStatus(HttpServletRequest req, @RequestBody Map<String, Object> paramMap){
		//세션에서 현재 가맹점 번호를 꺼냄
		HttpSession session = req.getSession();
		int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

		paramMap.put("crrFrcsNo", crrFrcsNo);

		int result = franchiseMainService.changeOrderStatus(paramMap);

		Map<String, String> resultMap = new HashMap<>();

		if (result > 0){
			resultMap.put("rst", "ok");
		}else {
			resultMap.put("rst", "fail");
		}

		return resultMap;
	}

	//가맹점 대기중인 주문 목록 조회(ajax)
	@ResponseBody
	@GetMapping("/main/getPendingOrder")
	public List<PaymentVO> getPendingOrder(HttpServletRequest req){
		//세션에서 현재 가맹점 번호를 꺼냄
		HttpSession session = req.getSession();
		int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("crrFrcsNo", crrFrcsNo);

		return franchiseMainService.getPendingOrder(paramMap);
	}

	//가맹점 매출 추이 조회(ajax)
	@ResponseBody
	@GetMapping("/main/getWeeklySalesTrend")
	public List<Map<String, Object>> getWeeklySalesTrend(HttpServletRequest req){
		//세션에서 현재 가맹점 번호를 꺼냄
		HttpSession session = req.getSession();
		int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        return franchiseMainService.getWeeklySalesTrend(crrFrcsNo);
	}

	@PostMapping("/changeFrcs")
	public String changeFrcs(HttpServletRequest req, FranchiseVO frcsVO){

		HttpSession session = req.getSession();
		session.setAttribute("crrFrcsNo", frcsVO.getFrcsNo());

		return "redirect:/frcs/main";
	}
}
