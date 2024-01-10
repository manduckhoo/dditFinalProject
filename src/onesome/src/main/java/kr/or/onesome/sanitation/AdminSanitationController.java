package kr.or.onesome.sanitation;

import kr.or.onesome.sanitation.service.SanitationCheckManagementService;
import kr.or.onesome.sanitation.service.SanitationListService;
import kr.or.onesome.sanitation.vo.SanitationCheckManagementVO;
import kr.or.onesome.sanitation.vo.SanitationListVO;
import kr.or.onesome.util.ArticlePage;
import kr.or.onesome.vo.FranchiseVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RequestMapping("/admin/sanitation")
@Controller
public class AdminSanitationController {

    @Autowired
    SanitationCheckManagementService managementService;

    @Autowired
    SanitationListService sanitationListService;

    @PostMapping("/delete")
    public String sanitationDelete(SanitationCheckManagementVO managementVO){

        log.warn("managementVO : " + managementVO);

        managementService.sanitationDelete(managementVO);

        return "redirect:/admin/sanitation/list";
    }

    @ResponseBody
    @PostMapping("/detail")
    public List<SanitationListVO> sanitationDerail(@RequestBody SanitationCheckManagementVO managementVO){
        log.warn("paramMap" + managementVO);

        return sanitationListService.getFrcsSanitationListByDate(managementVO);
    }

    @PostMapping("/registration")
    public String sanitationRegistration(SanitationCheckManagementVO managementVO){

        log.warn("managementVO : " + managementVO);

        managementService.sanitationRegistration(managementVO);

        return "redirect:/admin/sanitation/list";
    }

    @GetMapping("/list")
    public String sanitationList(@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
                                 @RequestParam(value="keyword",required=false,defaultValue="") String keyword,
                                 Model model){

        //페이징 처리를 위한 맵객체 생성
        Map<String, Object> map = new HashMap<>();
        map.put("currentPage", currentPage);
        map.put("keyword", keyword);

        //위생점검 목록 조회
        List<SanitationCheckManagementVO> managementVOList
                = managementService.adminSanitationList(map);
        //검색된 갯수 조회
        int total = managementService.getTotal(map);

        //페이징 처리
        ArticlePage<SanitationCheckManagementVO> managementList
                = new ArticlePage<>(total, currentPage, 10, managementVOList);
        managementList.setUrl("/admin/sanitation/list");

        //가맹점 목록 조회
        List<FranchiseVO> franchiseList = managementService.getFranchiseList();

        model.addAttribute("managementList", managementList);
        model.addAttribute("franchiseList", franchiseList);

        return "admin/sanitation/list";
    }
}
