package kr.or.onesome.frcsorder.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import kr.or.onesome.frcsinventory.vo.FrcsInventoryVO;
import kr.or.onesome.frcsorder.service.FrcsOrderService;
import kr.or.onesome.frcsorder.vo.FrcsOrderDetailVO;
import kr.or.onesome.frcsorder.vo.FrcsOrderVO;
import kr.or.onesome.hqOrder.vo.HqDetailOrderVO;
import kr.or.onesome.hqOrder.vo.HqOrderVO;
import kr.or.onesome.vo.FranchiseVO;
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
@RequestMapping("/frcs/order")
@Controller
public class FrcsOrderController {

    @Autowired
    FrcsOrderService frcsOrderService;

    @PostMapping("/detail")
    public String frcsOrder(HttpServletRequest req, FrcsOrderVO frcsOrderVO){

//        log.info("찍히나 보자~~~");
//        for(int i=0; i<frcsOrderVO.getProductCheckBox().length; i++) {
//            log.info("getProductCheckBox[" +i+ "] : " + frcsOrderVO.getProductCheckBox()[i]);
//        }

        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        frcsOrderVO.setFrcsNo(crrFrcsNo);

        int result = this.frcsOrderService.frcsOrder(frcsOrderVO);
        log.info("Insert -> result : " + result);

        return "redirect:/frcs/order/detail?frcsOrderNo="+frcsOrderVO.getFrcsOrderNo();
    }


    @GetMapping("/detail")
    public String frcsOrderDetailList(@RequestParam(name = "frcsOrderNo") int frcsOrderNo, Model model){

        FrcsOrderVO frcsOrderVO = this.frcsOrderService.frcsOrderDetailList(frcsOrderNo);
        log.info("frcsOrderVO -> " + frcsOrderVO);

        if(frcsOrderVO.getFrcsOrderTypeCd().equals("FODST01") && frcsOrderVO.getFrcsOrderOrderAmt() == 0) {

            model.addAttribute("frcsOrderVO", frcsOrderVO);

            return "frcs/order/orderDetail";

        } else {
            //TODO 접근할수 없는 페이지라고 띄우거나 alert 띄워서 막기
            return "redirect:/frcs/order/list";
        }
    }

    @ResponseBody
    @PostMapping("/deleteProduct")
    public Map<String, String> deleteProduct(HttpServletRequest req, @RequestBody FrcsOrderDetailVO frcsOrderDetailVO){

        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
        frcsOrderDetailVO.setFrcsNo(crrFrcsNo);

        Map<String, String> result = new HashMap<>();

        int cnt = this.frcsOrderService.deleteproduct(frcsOrderDetailVO);
        log.info("cnt === > "+ cnt);

        if(cnt==1) {
            result.put("result", "okay");
        } else if (cnt>=2){
            result.put("result", "otherPage");
        } else {
            result.put("result", "fail");
        }

        return result;
    }

    @PostMapping("/cancelFrcsOrder")
    public String cancelFrcsOrder(HttpServletRequest req, FrcsOrderVO frcsOrderVO){

        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
        frcsOrderVO.setFrcsNo(crrFrcsNo);

        int result = this.frcsOrderService.cancelFrcsOrder(frcsOrderVO);

        return "redirect:/frcs/inventory/list";
    }

    @ResponseBody
    @PostMapping("/updateFrcsDetailOrder")
    public int updateFrcsDetailOrder(HttpServletRequest req, FrcsOrderVO frcsOrderVO){

        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
        frcsOrderVO.setFrcsNo(crrFrcsNo);

//        for(int i=0; i<frcsOrderVO.getFrcsOrderDetailVOList().size(); i++){
//            log.info("frcsDetailOrder[" + i +"] : " + frcsOrderVO.getFrcsOrderDetailVOList().get(i));
//        }

        int result = this.frcsOrderService.updateFrcsDetailOrder(frcsOrderVO);

        return result;
    }

    //발주 목록
    @GetMapping("/list")
    public String inventoryList(HttpServletRequest req, Model model){

        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");

        List<FrcsOrderVO> frcsOrderVOList = this.frcsOrderService.frcsOrderList(crrFrcsNo);

        model.addAttribute("frcsOrderVOList", frcsOrderVOList);

        return "frcs/order/orderList";
    }

    //발주 목록 영수증 화면
    @ResponseBody
    @PostMapping("/displayFrcsOrderInvoice")
    public Map<String, Object> displayFrcsOrderInvoice(@RequestBody Map<String, Object> frcsOrderMap){

        Map<String, Object> result = new HashMap<>();

        FrcsOrderVO frcsOrderVO = this.frcsOrderService.displayFrcsOrderInvoice(frcsOrderMap);
        FranchiseVO franchiseVO = this.frcsOrderService.franchiseInfo(frcsOrderMap);

        result.put("frcsOrderVO", frcsOrderVO);
        result.put("franchiseVO", franchiseVO);

        return result;
    }

    @PostMapping("/frcsOrderCancel")
    public String frcsOrderCancel(HttpServletRequest req, FrcsOrderVO frcsOrderVO){
        //현재 선택된 가맹점 번호를 세션에서 꺼냄
        HttpSession session = req.getSession();
        int crrFrcsNo = (int) session.getAttribute("crrFrcsNo");
        frcsOrderVO.setFrcsNo(crrFrcsNo);

        int result = this.frcsOrderService.cancelFrcsOrder(frcsOrderVO);

        return "redirect:/frcs/order/list";
    }

}
