package kr.or.onesome.publicdues;

import kr.or.onesome.publicdues.service.PublicduesService;
import kr.or.onesome.publicdues.vo.PublicduesVO;
import kr.or.onesome.util.DateCalculater;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RequestMapping("/frcs/publicdues")
@Controller
public class FrcsPublicduesController {

    @Autowired
    PublicduesService publicduesService;

    @ResponseBody
    @GetMapping("/getDuesChartData")
    public List<PublicduesVO> getDuesChartData(HttpServletRequest req){
        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        return publicduesService.oneYearRegistrations(crrFrcsNo);
    }

    @PostMapping("/update")
    public String frcsPublicduesUpdate(HttpServletRequest req, PublicduesVO publicduesVO){

        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        publicduesVO.setFrcsNo(crrFrcsNo);

        publicduesService.publicduesUpdate(publicduesVO);

        return "redirect:/frcs/publicdues/main?viewDate="+publicduesVO.getDuesClmYm();
    }

    @PostMapping("/registration")
    public String frcsPublicduesRegistration(HttpServletRequest req, PublicduesVO publicduesVO){

        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        publicduesVO.setFrcsNo(crrFrcsNo);

        publicduesService.publicduesRegistration(publicduesVO);

        return "redirect:/frcs/publicdues/main?viewDate="+publicduesVO.getDuesClmYm();
    }

    @GetMapping("/main")
    public String frcsPublicduesMain(HttpServletRequest req, Model model,
                                     @RequestParam(value = "viewDate", required = false, defaultValue = "") String viewDate){

        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("crrFrcsNo", crrFrcsNo);

        //현재 날짜를 생성
        String crrDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM"));

        //파라미터로 날짜를 전달 받으면 해당 날짜를, 없을시 현재 날짜를 맵에 담음
        if (!viewDate.equals("")){
            paramMap.put("viewDate", viewDate);
        } else {
            viewDate = crrDate;
            paramMap.put("viewDate", viewDate);
        }

        PublicduesVO publicdues = publicduesService.getPublicdues(paramMap);

        DateCalculater dateCalculater = new DateCalculater();

        String previousMonth = dateCalculater.getPreviousMonth(viewDate);
        String nextMonth = dateCalculater.getNextMonth(viewDate);

        model.addAttribute("viewDate", viewDate);
        model.addAttribute("publicdues", publicdues);
        model.addAttribute("previousMonth", previousMonth);
        model.addAttribute("nextMonth", nextMonth);
        model.addAttribute("crrDate",crrDate);

        return "frcs/publicdues/main";
    }
}
