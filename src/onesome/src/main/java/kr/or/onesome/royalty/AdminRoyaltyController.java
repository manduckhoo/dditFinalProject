package kr.or.onesome.royalty;

import kr.or.onesome.royalty.service.RoyaltyService;
import kr.or.onesome.royalty.vo.RoyaltyVO;
import kr.or.onesome.util.ArticlePage;
import kr.or.onesome.util.DateCalculater;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RequestMapping("/admin/royalty")
@Controller
public class AdminRoyaltyController {

    @Autowired
    RoyaltyService royaltyService;

    @GetMapping("/list")
    public String adminRoyaltyList(Model model,
                                   @RequestParam(value = "viewDate", required = false, defaultValue = "") String viewDate){


        //현재 날짜를 생성
        String crrDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM"));

        //파라미터로 날짜를 전달 받으면 해당 날짜를, 없을시 현재 날짜를 이용해서 조회
        if (viewDate.equals("")){
            viewDate = crrDate;
        }

        //전체 가맹점 청구서 세팅
        royaltyService.updateAllFrcsRoyalty(viewDate);

        List<RoyaltyVO> royaltyVOList = royaltyService.adminRoyaltyList(viewDate);

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

        return "admin/royalty/list";
    }
}
