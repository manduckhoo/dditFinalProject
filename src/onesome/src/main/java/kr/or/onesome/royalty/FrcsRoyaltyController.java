package kr.or.onesome.royalty;

import kr.or.onesome.royalty.service.RoyaltyService;
import kr.or.onesome.royalty.vo.RoyaltyVO;
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
@RequestMapping("/frcs/royalty")
@Controller
public class FrcsRoyaltyController {

    @Autowired
    RoyaltyService royaltyService;

    @PostMapping("royaltyPayment")
    public String royaltyPayment(String viewDate, HttpServletRequest req){
        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("crrFrcsNo", crrFrcsNo);
        paramMap.put("viewDate", viewDate);

        royaltyService.royaltyPayment(paramMap);

        return "redirect:/frcs/royalty/main";
    }

    @ResponseBody
    @PostMapping("/npmntDetail")
    public List<Map<String, Object>> npmntDetail(@RequestBody Map<String, Object> paramMap, HttpServletRequest req){
        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
        paramMap.put("crrFrcsNo", crrFrcsNo);

        return royaltyService.getNpmntDetail(paramMap);
    }

    @ResponseBody
    @PostMapping("/orderDetail")
    public List<Map<String, Object>> orderDetail(@RequestBody Map<String, Object> paramMap, HttpServletRequest req){
        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
        paramMap.put("crrFrcsNo", crrFrcsNo);

        return royaltyService.getOrderDetail(paramMap);
    }

    @ResponseBody
    @PostMapping("/royaltyDetail")
    public Map<String, Object> royaltyDetail(@RequestBody Map<String, Object> paramMap, HttpServletRequest req){
        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
        paramMap.put("crrFrcsNo", crrFrcsNo);

        return royaltyService.getRoyaltyDetail(paramMap);
    }

    @GetMapping("/main")
    public String frcsRoyaltymain(HttpServletRequest req,
                                  Model model,
                                  @RequestParam(value = "viewDate", required = false, defaultValue = "") String viewDate){

        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        Map<String, Object> royaltyMap = new HashMap<>();
        royaltyMap.put("crrFrcsNo", crrFrcsNo);

        //현재 날짜를 생성
        String crrDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM"));

        //파라미터로 날짜를 전달 받으면 해당 날짜를, 없을시 현재 날짜를 맵에 담음
        if (!viewDate.equals("")){
            royaltyMap.put("viewDate", viewDate);
        } else {
            viewDate = crrDate;
            royaltyMap.put("viewDate", viewDate);
        }

        //청구액 세팅 및 조회
        RoyaltyVO royalty = royaltyService.setAndGetRoyalty(royaltyMap);

        DateCalculater dateCalculater = new DateCalculater();

        String previousMonth = dateCalculater.getPreviousMonth(viewDate);
        String nextMonth = dateCalculater.getNextMonth(viewDate);

        model.addAttribute("viewDate", viewDate);
        model.addAttribute("royalty", royalty);
        model.addAttribute("previousMonth", previousMonth);
        model.addAttribute("nextMonth", nextMonth);
        model.addAttribute("crrDate",crrDate);

        return "frcs/royalty/main";
    }
}
