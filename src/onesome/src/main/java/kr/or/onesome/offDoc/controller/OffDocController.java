package kr.or.onesome.offDoc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import kr.or.onesome.franchise.service.FranchiseInfoService;
import kr.or.onesome.offDoc.mapper.OffDocMapper;
import kr.or.onesome.offDoc.service.OffDocService;
import kr.or.onesome.security.CustomUser;
import kr.or.onesome.vo.AdminVO;
import kr.or.onesome.vo.FranchiseVO;
import kr.or.onesome.vo.OffDocVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OffDocController {
	
	@Autowired
	private OffDocService offDocService;
	
	//가맹점(Franchise)을 가져온다(가맹점 리스트 쓰기 위해서 여기다가 서비스 의존성 주입)
	@Autowired
	private FranchiseInfoService franchiseInfoService;
	
	//공문 쓰기
	@GetMapping("/admin/offDoc/create") //FRANCHISE 가맹점
	public String offDocCreate(OffDocVO offDocVO, Model model, Authentication auth) {
		// 가맹점을 모델에 담아서 jsp로 넘겨주면 되나??
		
		log.info("공문create-> 공문VO : " + offDocVO);
		
		// auth에 있는 로그인 정보에서 로그인 한사람의 정보를 loginUser이름에 담아준다
		CustomUser loginUser = (CustomUser)auth.getPrincipal();
		
		// loginUser안에 있는 어드민VO를 adminUserVO에 담아준다
		AdminVO adminUserVO = loginUser.getAdminVO();
		log.info("adminUserVO -------> " + adminUserVO);
		
		// 가맹점 가져오기
		List<FranchiseVO> frcsList = franchiseInfoService.list();
		log.info("frcsList에서 frcsNm=나중에 꺼내서 쓸거 : " + frcsList);
		
		
		//adminUserVO에서 '어드민 이름(AdminNm)'을 adminNm 으로 넣는다
		model.addAttribute("adminNm", adminUserVO.getAdminNm());
		model.addAttribute("frcsList", frcsList); // 얘안에있는 frcsNm이거 jsp에서 꺼내보기(포이치로)
		
		// 가맹점 가져오기
		
//		int offDocCreate = 0;
//		
//		// 글쓰기 부분
//		if (offDocCreate > 0) {
//			// 글쓰기 성공시 리스트로 가기
//			return "redirect:/admin/offDoc/list";
//		} else {
//			// 글쓰기 실패
//			model.addAttribute("message", "글쓰기에 실패했습니다.");
//			return "error";
//		}
		return "admin/offDoc/create";
	}//여기까글쓰기 메서드 끝!
	
	// 공문 쓰기
	@ResponseBody
	@PostMapping("/admin/offDoc/createPost")
	public int offDocCreatePost (@RequestBody OffDocVO offDocVO, Authentication auth) {
		log.info("나오니??---------->" + offDocVO);
		
		
		// 세션에서 로그인 정보(공문 발신인)를 가져오기
		CustomUser loginUser = (CustomUser)auth.getPrincipal();
		String adminNo = String.valueOf(loginUser.getAdminVO().getAdminNo());
		
		offDocVO.setOffDocFrom(adminNo);
		
		return this.offDocService.offDocCreate(offDocVO);
	}
	
	//공문(발송) 디테일
	@GetMapping("/admin/offDoc/detail")
	public String offDocDetail (@RequestParam int offDocNo, Model model) {
		OffDocVO offDocFromDetail = offDocService.offDocFromDetail(offDocNo);
		
		//JSP에서 꺼내 쓸 수 있게 모델에 담기
		model.addAttribute("offDocFromDetail", offDocFromDetail);
		return "admin/offDoc/detail";
	}
	
	//공문(발송) 리스트 
	@GetMapping("/admin/offDoc/list")
	public String offDocList(Model model) {
		List<OffDocVO> offDocVOList = offDocService.offDocList();
		
		model.addAttribute("offDocVOList", offDocVOList);
		return "admin/offDoc/list";
	}
	
	// 공문(수신) 리스트
	@GetMapping("/frcs/offDoc/list")
	public String offDocToList(Model model, HttpServletRequest req) {
		// 가맹점 정보(가맹점 번호)를 세션에서 가져오기
	    HttpSession session = req.getSession();
	    int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

	    // 가맹점이 수신한 공문 목록 가져오기
	    List<OffDocVO> receivedOffDocList = offDocService.getReceivedOffDocList(crrFrcsNo);
	    
	    log.info("가녀오니???------->" + receivedOffDocList);
	    model.addAttribute("receivedOffDocList", receivedOffDocList);
	    return "frcs/offDoc/list";
	}


	// 공문 디테일

	@GetMapping("/frcs/offDoc/detail")
	public String offDocToDetail(@RequestParam int offDocNo, Model model) {
		OffDocVO offDocToDetail = offDocService.offDocToDetail(offDocNo);

		log.info("상태 변화 되었는가???" + offDocToDetail);
		
		//JSP에서 꺼내 쓸 수 있게 모델에 담기
		model.addAttribute("offDocToDetail", offDocToDetail);
		return "frcs/offDoc/detail";
	}
}
