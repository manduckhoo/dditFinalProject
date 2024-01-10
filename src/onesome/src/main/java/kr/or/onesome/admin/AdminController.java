package kr.or.onesome.admin;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.onesome.admin.service.AdminService;
import kr.or.onesome.admin.vo.InOutVO;
import kr.or.onesome.franchise.service.FranchiseInfoService;
import kr.or.onesome.frcsorder.vo.FrcsOrderVO;
import kr.or.onesome.frcsordermanage.service.FrcsOrderManageService;
import kr.or.onesome.inquirer.service.InquirerService;
import kr.or.onesome.inquiry.service.InquiryService;
import kr.or.onesome.royalty.service.RoyaltyService;
import kr.or.onesome.royalty.vo.RoyaltyVO;
import kr.or.onesome.security.CustomUser;
import kr.or.onesome.util.DateCalculater;
import kr.or.onesome.vo.AdminVO;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import kr.or.onesome.vo.FranchiseOwnerVO;
import kr.or.onesome.vo.FranchiseVO;
import kr.or.onesome.vo.InquirerVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private InquirerService inquirerService;
	
	@Autowired
	private AdminService adminService;
	
    @Autowired
    private FrcsOrderManageService frcsOrderManageService;
    
    @Autowired
    private FranchiseInfoService franchiseInfoService;
	
    @Autowired
    private RoyaltyService royaltyService; 
    
	@GetMapping("/main")
	public String main(Authentication auth, HttpServletRequest req, Model model,
			@RequestParam(value = "viewDate", required = false, defaultValue = "") String viewDate) {
		
		log.info("main!!!!!!!!!!!!!: {}", viewDate);
		
		if(auth != null) {
			CustomUser admin = (CustomUser) auth.getPrincipal();
			AdminVO adminVO = admin.getAdminVO();
			
			log.info("adminVO: {}",adminVO);
			model.addAttribute("adminVO", adminVO);
		}
		
		// 창업상담 대기
		List<FranchiseOwnerVO> waitList = inquirerService.waitList();
		
		// 가맹점 발주 대기 내역
		ComDetCodeInfoVO comDetCodeInfoVO = new ComDetCodeInfoVO();
		String comDetCode = comDetCodeInfoVO.getComDetCode();
		List<FrcsOrderVO> frcsOrderVOList = adminService.frcsOrderWaitList(comDetCode);

		// 오픈 준비중인 상태 공통코드
		comDetCode = "FRST01";
		List<FranchiseOwnerVO> openList = this.franchiseInfoService.openList(comDetCode);
		log.info("openList: {}", openList);
		
		// 오픈 준비중인 상태 공통코드
		comDetCode = "FRST02";
		List<FranchiseOwnerVO> openedList = this.franchiseInfoService.openList(comDetCode);
		log.info("openedList: {}", openedList);
		
		/////////////////////////// 가맹비 미납 지역 ///////////////////////////
		//현재 날짜를 생성
        String crrDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM"));

        //파라미터로 날짜를 전달 받으면 해당 날짜를, 없을시 현재 날짜를 이용해서 조회
        if (viewDate.equals("")){
            viewDate = crrDate;
        }

        //전체 가맹점 청구서 세팅
        royaltyService.updateAllFrcsRoyalty(viewDate);

        List<RoyaltyVO> royaltyVOList = adminService.adminNonPayRoyaltyList(viewDate);

        log.warn("royaltyVOList : " + royaltyVOList);

        //이전달, 다음달 계산
        DateCalculater dateCalculater = new DateCalculater();

        String previousMonth = dateCalculater.getPreviousMonth(viewDate);
        String nextMonth = dateCalculater.getNextMonth(viewDate);

        model.addAttribute("royaltyVOList",royaltyVOList);
        model.addAttribute("viewDate", viewDate);
        model.addAttribute("previousMonth", previousMonth);
        model.addAttribute("nextMonth", nextMonth);
        model.addAttribute("crrDate", crrDate);
        /////////////////////////// 가맹비 미납 지역 끝 ///////////////////////////
        
		// 가맹점 매출 순위 top3
		comDetCode ="FRST02";
		List<FranchiseVO> salesList = this.adminService.salesList(comDetCode);
        
		log.info("salesList: {}", salesList);
		
		model.addAttribute("salesList", salesList);
		model.addAttribute("openList", openList);
		model.addAttribute("openedList", openedList);
		model.addAttribute("waitList", waitList);
		model.addAttribute("frcsOrderVOList", frcsOrderVOList);
		
		return "admin/main/main";
	}
	
	@ResponseBody
	@GetMapping("/main/getMonthlyInOut")
	public List<InOutVO> getMonthlyInOut(@RequestParam(value = "viewDate2", required = false, defaultValue = "") String viewDate2, Model model) {
		
		log.info("viewDate2: {}", viewDate2);
		//현재 날짜를 생성
        String crrDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM"));
		if (viewDate2.equals("")){
            viewDate2 = crrDate;
        }
		
		List<InOutVO> monthlyInOut = adminService.getMonthlyInOut(viewDate2);
		log.info("monthlyInOut: {}", monthlyInOut);
		
		 //이전달, 다음달 계산
        DateCalculater dateCalculater = new DateCalculater();

        String previousMonth = dateCalculater.getPreviousMonth(viewDate2);
        String nextMonth = dateCalculater.getNextMonth(viewDate2);

        model.addAttribute("viewDate2", viewDate2);
        model.addAttribute("previousMonth2", previousMonth);
        model.addAttribute("nextMonth2", nextMonth);
        model.addAttribute("crrDate2", crrDate);
		
		return monthlyInOut;
	}
	
	@GetMapping("/login")
	public String adminLogin(){
		return "admin/login";
	}
}
