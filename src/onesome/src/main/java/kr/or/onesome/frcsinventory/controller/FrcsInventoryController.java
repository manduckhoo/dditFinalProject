package kr.or.onesome.frcsinventory.controller;

import kr.or.onesome.acnt.service.AcntService;
import kr.or.onesome.comcode.service.ComDetCodeService;
import kr.or.onesome.frcsinventory.service.FrcsInventoryService;
import kr.or.onesome.frcsinventory.vo.FrcsInventoryVO;
import kr.or.onesome.product.service.ProductService;
import kr.or.onesome.product.vo.ProductVO;
import kr.or.onesome.vo.AcntVO;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RequestMapping("/frcs/inventory")
@Controller
public class FrcsInventoryController {

    @Autowired
    FrcsInventoryService frcsInventoryService;

    @Autowired
    ProductService productService;

    @Autowired
    AcntService acntService;

    @Autowired
    ComDetCodeService comDetCodeService;

    @GetMapping("/list")
    public String inventoryList(HttpServletRequest req, Model model){

        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        List<FrcsInventoryVO> frcsInventoryVOList = this.frcsInventoryService.frcsInventoryList(crrFrcsNo);
        model.addAttribute("frcsInventoryVOList", frcsInventoryVOList);

        return "frcs/inventory/inventoryList";
    }

    @GetMapping("/detail")
    public String productDetail(HttpServletRequest req, Model model, @RequestParam int prdctNo) {

        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        ProductVO productVO = productService.productDetail(prdctNo);
        log.info("productDetail -> productVO : {}", productVO);

        Map<String, Object> frcsProductMap = new HashMap<>();
        frcsProductMap.put("prdctNo", prdctNo);
        frcsProductMap.put("crrFrcsNo", crrFrcsNo);

        FrcsInventoryVO frcsProductVO = frcsInventoryService.productDetail(frcsProductMap);
        log.info("productDetail -> frcsProductVO : {}", frcsProductVO);

        List<AcntVO> acntVOList = acntService.acntList();
        List<ComDetCodeInfoVO> comDetCodeInfoVOList = comDetCodeService.comDetCodeListByComCode("PRCT");

        log.info("detail -> comDetCodeInfoVOList : {}" , comDetCodeInfoVOList);
        log.info("detail -> acntVOList : {}" , acntVOList);

        model.addAttribute("comDetCodeInfoVOList", comDetCodeInfoVOList);
        model.addAttribute("acntVOList", acntVOList);
        model.addAttribute("productVO", productVO);
        model.addAttribute("frcsProductVO", frcsProductVO);

        return "frcs/inventory/detail";
    }

    @PostMapping("/autoOrderUpdate")
    public String autoOrderUpdate(HttpServletRequest req, FrcsInventoryVO frcsInventoryVO){
        log.info("뭐가 찍히려나...??????");

        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        frcsInventoryVO.setFrcsNo(crrFrcsNo);

        int result = this.frcsInventoryService.autoOrderUpdate(frcsInventoryVO);

        return "redirect:/frcs/inventory/list";
    }

    @GetMapping ("/inventoryUpdate")
    public String inventoryUpdate(HttpServletRequest req){
        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        int result = this.frcsInventoryService.inventoryUpdate(crrFrcsNo);

        log.info("autoOrderUpdate // result ====> " + result);

        return "redirect:/frcs/inventory/list";
    }

    @PostMapping("/modifyInventoryCnt")
    public String modifyInventoryCnt(HttpServletRequest req, FrcsInventoryVO frcsInventoryVO){

        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        frcsInventoryVO.setFrcsNo(crrFrcsNo);

        int result = this.frcsInventoryService.modifyInventoryCnt(frcsInventoryVO);
        log.info("modifyInventoryCnt // result ====> " + result);

        return "redirect:/frcs/inventory/list";
    }

}
