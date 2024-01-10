package kr.or.onesome.hqOrder.controller;

import kr.or.onesome.hqOrder.service.HqOrderService;
import kr.or.onesome.hqOrder.vo.HqDetailOrderVO;
import kr.or.onesome.hqOrder.vo.HqOrderVO;
import lombok.extern.slf4j.Slf4j;
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
public class HqOrderController {

    @Autowired
    HqOrderService hqOrderService;

    @PostMapping("/hqOrderDetail")
    public String hqOrderShow(Model model, HqOrderVO hqOrderVO) {

        for (int i=0; i<hqOrderVO.getProductCheckBox().length; i++) {
            log.info("productCheckBox[" +i+"] : " + hqOrderVO.getProductCheckBox()[i] );
        }

        int result = this.hqOrderService.insertHqOrder(hqOrderVO);

        log.info("Insert -> result : " + hqOrderVO);

        return "redirect:/admin/hqOrderDetail?hqOrderNo="+hqOrderVO.getHqOrderNo();
    }

    @GetMapping("/hqOrderDetail")
    public String hqOrderDetailList(Model model, @RequestParam(name = "hqOrderNo") int hqOrderNo){

        HqOrderVO hqOrderVO = this.hqOrderService.selectHqOrder(hqOrderNo);

        HqDetailOrderVO hqOrderAcntInfo = this.hqOrderService.hqOrderAcntInfo(hqOrderNo);

        log.info("hqOrderAcntInfo : " + hqOrderAcntInfo);

        model.addAttribute("hqOrderAcntInfo", hqOrderAcntInfo);



        if (hqOrderVO.getHqOrderStsCd().equals("HODST01")) {
            model.addAttribute("hqOrderVO", hqOrderVO);

            log.info("hqOrderVO : " + hqOrderVO);

            return "admin/hqOrder/hqOrderDetail";

        } else {
            /*TODO 접근할수 없는 페이지라고 띄우거나 alert 띄워서 막기*/
            return "redirect:/admin/main";
        }
    }

    @ResponseBody
    @PostMapping("/deleteHqOrderDetail")
    public Map<String, String> deleteHqOrderDetail(Model model, @RequestBody HqDetailOrderVO hqDetailOrderVO) {
        log.info("hqDetailOrderVO : " + hqDetailOrderVO);

        Map<String, String> result = new HashMap<>();

        int cnt = this.hqOrderService.deleteHqOrderDetail(hqDetailOrderVO);

        if(cnt==1) {
            result.put("result", "okay");
        } else if (cnt>=2){
            result.put("result", "otherPage");
        } else {
            result.put("result", "fail");
        }

        log.info("deleteHqOrderDetail -> result : " + cnt);

        return result;
    }

    @PostMapping("/cancelHqOrder")
    public String cancelHqOrder(Model model, HqOrderVO hqOrderVO){
        log.info("hqOrderVO : " +hqOrderVO);

        int result = this.hqOrderService.cancelHqOrder(hqOrderVO);
        log.info("result : " + result);

        return "redirect:/admin/product/product";
    }

    @PostMapping("/updateHqDetailOrder")
    public String updateHqDetailOrder(Model model, HqOrderVO hqOrderVO){
//        log.info("제출해버려~~~~~");
        log.info("hqOrderVO===========" +hqOrderVO);

        for(int i=0; i<hqOrderVO.getHqDetailOrderVOList().size(); i++){
            log.info("hqDetailOrder["+i+"] : " + hqOrderVO.getHqDetailOrderVOList().get(i));

        }

        int result = this.hqOrderService.updateHqDetailOrder(hqOrderVO);
        log.info("result========== : " + result);


        return "redirect:/admin/hqOrder";
    }

    //발주 목록 조회
    @GetMapping("/hqOrder")
    public String hqOrderShow(Model model) {

        List<HqOrderVO> hqOrderInvoiceList = this.hqOrderService.hqOrderInvoiceList();

        model.addAttribute("hqOrderInvoiceList", hqOrderInvoiceList);

        log.info("hqOrderInvoiceList -> " + hqOrderInvoiceList);

        return "admin/hqOrder/hqOrder";
    }

    //발주 목록에서 상세 보기 Ajax
    @ResponseBody
    @PostMapping("/displayHqOrderInvoice")
    public Map<String, Object> displayHqOrderInvoice(@RequestBody Map<String, Object> hqDetailOrderMap) {
        log.info("hqDetailOrderMap : " + hqDetailOrderMap);

        Map<String, Object> result = new HashMap<>();

        HqOrderVO hqOrderVO = this.hqOrderService.displayHqOrderInvoice(hqDetailOrderMap);
        HqDetailOrderVO hqOrderAcntInfo = this.hqOrderService.hqOrderAcntInfo((int) hqDetailOrderMap.get("hqOrderNo"));

        result.put("hqOrderVO", hqOrderVO);
        result.put("hqOrderAcntInfo", hqOrderAcntInfo);

        log.info("hqDetailOrderMap -> result : " + result);

        return result;

    }

    @PostMapping("/hqOrderFail")
    public String hqOrderFail(HqOrderVO hqOrderVO){
        log.info("hqOrderVO : " + hqOrderVO);

        int result = this.hqOrderService.hqOrderFail(hqOrderVO);
        log.info("hqOrderFail -> result : " + result);

        return "redirect:/admin/hqOrder";
    }

    @PostMapping("/hqOrderComplete")
    public String hqOrderComplete(HqDetailOrderVO hqDetailOrderVO) {
        log.info("hqDetailOrderVO : " + hqDetailOrderVO);

        HqOrderVO hqOrderVO = hqOrderService.selectHqOrder(hqDetailOrderVO.getHqOrderNo());

        int result = this.hqOrderService.hqOrderComplete(hqOrderVO);
        log.info("hqDetailOrderVO -> result : " + result);

        return "redirect:/admin/hqOrder";
    }

}
