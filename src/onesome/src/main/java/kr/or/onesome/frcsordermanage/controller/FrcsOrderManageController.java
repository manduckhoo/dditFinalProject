package kr.or.onesome.frcsordermanage.controller;

import kr.or.onesome.frcsorder.service.FrcsOrderService;
import kr.or.onesome.frcsorder.vo.FrcsOrderDetailVO;
import kr.or.onesome.frcsorder.vo.FrcsOrderVO;
import kr.or.onesome.frcsordermanage.service.FrcsOrderManageService;
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
@RequestMapping("/admin")
@Controller
public class FrcsOrderManageController {

    @Autowired
    FrcsOrderManageService frcsOrderManageService;

    @Autowired
    FrcsOrderService frcsOrderService;

    @GetMapping("/frcsOrder")
    public String frcsOrderManageList(Model model){

        List<FrcsOrderVO> frcsOrderVOList = this.frcsOrderManageService.frcsOrderList();

        model.addAttribute("frcsOrderVOList", frcsOrderVOList);

        return "admin/frcsOrderManage/frcsOrderManage";
    }

    @ResponseBody
    @PostMapping("/displayFrcsOrderManage")
    public Map<String, Object> displayFrcsOrderManage(@RequestBody Map<String, Object> frcsOrderManageMap){

        Map<String, Object> result = new HashMap<>();

        FrcsOrderVO frcsOrderVO = this.frcsOrderService.displayFrcsOrderInvoice(frcsOrderManageMap);
        FranchiseVO franchiseVO = this.frcsOrderService.franchiseInfo(frcsOrderManageMap);

        result.put("frcsOrderVO", frcsOrderVO);
        result.put("franchiseVO", franchiseVO);

        return result;
    }

    @PostMapping("/frcsOrderManageCancel")
    public String frcsOrderManageCancel(FrcsOrderVO frcsOrderVO){

        int result = this.frcsOrderManageService.frcsOrderManageCancel(frcsOrderVO);

        return "redirect:/admin/frcsOrder";
    }


    @PostMapping("/frcsOrderManageSubmit")
    public String frcsOrderManageSubmit(FrcsOrderVO frcsOrderVO){

        int result = this.frcsOrderManageService.frcsOrderManageSubmit(frcsOrderVO);

        log.info("다중 승인 막아야해 --> 999가 나오면 막힌거고 아니면 안막힌거야 : " + result);

        return "redirect:/admin/frcsOrder?result=" + result;
    }



}
