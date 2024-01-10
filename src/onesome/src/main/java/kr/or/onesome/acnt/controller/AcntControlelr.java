package kr.or.onesome.acnt.controller;

import kr.or.onesome.acnt.service.AcntService;
import kr.or.onesome.vo.AcntVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RequestMapping("/admin")
@Controller
public class AcntControlelr {

    @Autowired
    AcntService acntService;

    //거래처 목록 조회
    @GetMapping("/acnt")
    public String acntList(Model model){
        List<AcntVO> acntVOList = this.acntService.acntList();
        model.addAttribute("acntVOList", acntVOList);

        log.info("list -> acntVOList" + acntVOList);

        return "admin/acnt/acnt";
    }

    //거래처 검색 조회
    @ResponseBody
    @PostMapping("/acnt/searchAjax")
    public List<AcntVO> searchAjax(@RequestBody Map<String, String> acntMap){
        log.info("acntMap : " + acntMap);

        List<AcntVO> result = this.acntService.searchAjax(acntMap);
        log.info("searchAjax -> result : " + result);

        return result;
    }

    //거래처 상세 조회
    @ResponseBody
    @PostMapping("/acnt/selectAjax")
    public AcntVO selectAjax(@RequestBody Map<String, String> acntMap){
        log.info("acntMap : " + acntMap);

        AcntVO result = this.acntService.selectAjax(acntMap);
        log.info("selectAjax -> result : " + result);

        return result;
    }

    //새로운 거래처 등록
    @PostMapping("/acnt/createAcnt")
    public String createAcnt(Model model, AcntVO acntVO){

        log.info("acntVO : " + acntVO);

        int result = this.acntService.createAcnt(acntVO);
        log.info("createAcnt -> result : " + result);
        
        return "redirect:/admin/acnt";
    }

    //거래처 삭제
    @ResponseBody
    @PostMapping("/acnt/deleteAcnt")
    public Map<String, String> deleteAcnt(Model model, @RequestBody AcntVO acntVO){
        log.info("AcntVO : " + acntVO);

        Map<String, String> result = new HashMap<>();

        int cnt = this.acntService.deleteAcnt(acntVO);

        if(cnt>0) {
            result.put("result", "okay");
        } else {
            result.put("result", "fail");
        }

        log.info("deleteAcnt -> result : " + cnt);

        return result;
    }

    //거래처 정보 수정
    @PostMapping("/acnt/modifyAcnt")
    public String modifyAcnt(Model model, AcntVO acntVO) {

        log.info("AcntVO : " + acntVO);

        int result = this.acntService.modifyAcnt(acntVO);
        log.info("modifyAcnt -> result : " + result);

        return "redirect:/admin/acnt";
    }


}
