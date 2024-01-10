package kr.or.onesome.inquiry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.onesome.atchFile.controller.FileController;
import kr.or.onesome.comcode.service.ComDetCodeService;
import kr.or.onesome.inquiry.service.InquiryService;
import kr.or.onesome.inquiry.vo.InquiryVO;
import kr.or.onesome.security.CustomUser;
import kr.or.onesome.vo.AtchFileVO;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import kr.or.onesome.vo.FranchiseVO;
import kr.or.onesome.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class InquiryController {

    @Autowired
    ComDetCodeService comDetCodeService;

    @Autowired
    InquiryService inquiryService;

    @PostMapping("/admin/inquiry/answerRegistration")
    public String answerRegistration(InquiryVO inquiryVO, Authentication auth){
        log.warn("answerRegistration -> " + inquiryVO);

        if (auth != null) {
            CustomUser user = (CustomUser) auth.getPrincipal();
            inquiryVO.setAnsWrtrNo(user.getAdminVO().getAdminNo());

            inquiryService.answerRegistration(inquiryVO);
        }else {
            return "redirect:/admin/login";
        }
        return "redirect:/admin/inquiry/detail?inqNo="+inquiryVO.getInqNo();
    }


    @GetMapping("/admin/inquiry/detail")
    public String adminInquiryDetail(@RequestParam int inqNo, Model model){

        InquiryVO inquiryVO = inquiryService.inqDetail(inqNo);
        log.warn("admin/inquiry/detail -> " + inquiryVO);
        model.addAttribute("inquiryVO", inquiryVO);
        return "admin/inquiry/detail";
    }

    @GetMapping("/admin/inquiry/list")
    public String adminInquiryList(Model model){

        List<InquiryVO> inquiryVOList = inquiryService.adminInqList();

        model.addAttribute("inquiryVOList", inquiryVOList);

        return "admin/inquiry/list";
    }

    @GetMapping("/mem/inquiry/detail")
    public String memberInquiryDetail(@RequestParam int inqNo, Model model){
        log.warn("====== inqNo : " + inqNo);

        InquiryVO inquiryVO = inquiryService.inqDetail(inqNo);

        log.warn("inquiryVO : " + inquiryVO);

        model.addAttribute("inquiryVO", inquiryVO);
        return "mem/inquiry/detail";
    }

    @GetMapping("/mem/inquiry/list")
    public String memberinquiryList(Model model, Authentication auth) {
        //현재 로그인된 일반회원의 정보를 가져옴
        if (auth != null) {
            CustomUser currUser = (CustomUser) auth.getPrincipal();
            MemberVO memberVO = currUser.getMemberVO();
            log.warn("memVO : " + memberVO);

            List<InquiryVO> inquiryVOList = inquiryService.memberInqList(memberVO);
            log.warn("inquiryVOList : " + inquiryVOList);

            model.addAttribute("inquiryVOList", inquiryVOList);
        } else {
            return "redirect:/mem/login";
        }
        return "mem/inquiry/list";
    }

    @GetMapping("/mem/inquiry/write")
    public void inquiryWrite(Model model) {

        //문의유형 공통코드를 가져옴
        List<ComDetCodeInfoVO> comDetCodeList
                = comDetCodeService.comDetCodeListByComCode("INQTP");

        //가맹점의 목록을 가져옴
        List<FranchiseVO> franchiseList = inquiryService.getFranchiseList();

        model.addAttribute("inquiryTypeList", comDetCodeList);
        model.addAttribute("franchiseList", franchiseList);
    }

    @PostMapping("/mem/inquiry/write")
    public String inquiryWritePost(InquiryVO inquiryVO, Authentication auth) {
        log.warn("inquiryVO : " + inquiryVO);

        //현재 로그인된 회원의 정보를 가져옴
        CustomUser currUser = (CustomUser) auth.getPrincipal();
        MemberVO memberVO = currUser.getMemberVO();

        //로그인된 유저의 회원번호를 입력
        inquiryVO.setMemNo(memberVO.getMemNo());

        inquiryService.insertInquiry(inquiryVO);

        return "redirect:/mem/inquiry/list";
    }
}