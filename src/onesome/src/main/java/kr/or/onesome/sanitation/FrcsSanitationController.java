package kr.or.onesome.sanitation;

import kr.or.onesome.franchise.service.FranchiseInfoService;
import kr.or.onesome.sanitation.service.SanitationCheckManagementService;
import kr.or.onesome.sanitation.service.SanitationListService;
import kr.or.onesome.sanitation.vo.SanitationCheckManagementVO;
import kr.or.onesome.sanitation.vo.SanitationListVO;
import kr.or.onesome.util.ArticlePage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RequestMapping("/frcs/sanitation")
@Controller
public class FrcsSanitationController {

    @Autowired
    SanitationListService sanitationListService;

    @Autowired
    SanitationCheckManagementService sanitationCheckManagementService;

    @PostMapping("/registration")
    public String sanitationRegistration(HttpServletRequest req, SanitationListVO sanitationListVO){

        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        sanitationListVO.setFrcsNo(crrFrcsNo);

        sanitationListService.sanitationRegistration(sanitationListVO);

        return "redirect:/frcs/sanitation/list";
    }

    @GetMapping("/list")
    public String sanitationList(Model model,
                                 HttpServletRequest req,
                                 @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){

        Map<String, Object> pramMap = new HashMap<>();

        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        pramMap.put("crrFrcsNo", crrFrcsNo);
        pramMap.put("currentPage", currentPage);

        //위생점검 내역조회
        List<SanitationListVO> sanitationListVOS
                = sanitationListService.getSanitationListByFrcsNo(pramMap);
        //총 갯수 조회
        int total = sanitationListService.getTotal(pramMap);
        //페이징 처리
        ArticlePage<SanitationListVO> sanitationList
                = new ArticlePage<>(total, currentPage, 10, sanitationListVOS);

        //현재 가맹점명 조회
        String franchiseName = sanitationListService.getFranchiseName(crrFrcsNo);

        //본사 위생점검 내역 조회
        List<SanitationCheckManagementVO> managementByFrcsNo
                = sanitationCheckManagementService.getSanitationCheckManagementByFrcsNo(crrFrcsNo);

        model.addAttribute("sanitationList", sanitationList);
        model.addAttribute("franchiseName", franchiseName);
        model.addAttribute("managementByFrcsNo", managementByFrcsNo);

        return "frcs/sanitation/list";
    }
}
