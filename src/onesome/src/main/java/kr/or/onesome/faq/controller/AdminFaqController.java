package kr.or.onesome.faq.controller;

import kr.or.onesome.faq.service.AdminFaqService;
import kr.or.onesome.vo.FaqVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RequestMapping(value = "/admin")
@Controller
public class AdminFaqController {

    @Autowired
    AdminFaqService adminFaqService;

    @GetMapping("/faq")
    public String faqList(Model model){

        List<FaqVO> faqVOList = this.adminFaqService.faqList();
        model.addAttribute("faqVOList", faqVOList);

        log.info("list -> faqVOList" + faqVOList);

        return "admin/faq/faq";
    }

    @PostMapping("/createFaq")
    public String createFaq(Model model, FaqVO faqVO){

        log.info("faqVO : " + faqVO);

        int result = this.adminFaqService.createFaq(faqVO);
        log.info("createFaq -> result : " + result);

        return "redirect:/admin/faq";
    }

    @ResponseBody
    @PostMapping ("/selectAjax")
    public FaqVO selectAjax(@RequestBody Map<String, String> faqMap) {
        log.info("faqMap : " + faqMap);

        FaqVO result = this.adminFaqService.selectAjax(faqMap);
        log.info("selectAjax -> result : " + result);

        return result;
    }

    @PostMapping("/modifyFaq")
    public String modifyFaq(Model model, FaqVO faqVO) {

        log.info("FaqVO : " + faqVO);

        int result = this.adminFaqService.modifyFaq(faqVO);
        log.info("modifyFaq -> result " + result);

        return "redirect:/admin/faq";
    }

    @ResponseBody
    @PostMapping("/deleteFaq")
    public Map<String, String> deleteFaq(Model model, @RequestBody FaqVO faqVO) {
        log.info("FaqVO : " + faqVO);

        Map<String, String> result = new HashMap<>();

        int cnt = this.adminFaqService.deleteFaq(faqVO);

        if(cnt>0) {
            result.put("result", "okay");
        } else {
            result.put("result", "fail");
        }

        log.info("deleteFaq -> result : " + cnt);

        return result;
    }

}
