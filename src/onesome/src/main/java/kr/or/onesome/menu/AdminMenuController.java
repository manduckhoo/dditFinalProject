package kr.or.onesome.menu;

import kr.or.onesome.atchFile.service.AtchFileService;
import kr.or.onesome.comcode.service.ComDetCodeService;
import kr.or.onesome.menu.service.MenuService;
import kr.or.onesome.menu.vo.MenuVO;
import kr.or.onesome.product.vo.ProductVO;
import kr.or.onesome.util.ArticlePage;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import kr.or.onesome.vo.CtgryDetailVO;
import kr.or.onesome.vo.CtgryVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RequestMapping("/admin/menu")
@Controller
public class AdminMenuController {

    @Autowired
    MenuService menuService;

    @Autowired
    ComDetCodeService comDetCodeService;

    @PostMapping("/modify")
    public String modifyMenu(MenuVO menuVO){

        log.warn("menuVO : " + menuVO);

        menuService.modifyMenu(menuVO);

        return "redirect:/admin/menu/detail?menuNo=" + menuVO.getMenuNo();
    }

    @PostMapping("/delete")
    public String deleteMenu(MenuVO menuVO){

        log.warn("delete : " + menuVO);
        menuService.deleteMenu(menuVO);

        return "redirect:/admin/menu/list";
    }

    @GetMapping("/detail")
    public String menuDetail(@RequestParam int menuNo, Model model){

        MenuVO menuVO = menuService.adminMenuDetail(menuNo);

        log.warn("menuVO : "+menuVO);

        model.addAttribute("menuVO", menuVO);

        return "admin/menu/detail";
    }

    @PostMapping("/registration")
    public String postRegistration(MenuVO menuVO){

        log.warn("registration -> menuVO : " + menuVO);

        menuService.menuRegistration(menuVO);

        return "redirect:/admin/menu/list";
    }

    @ResponseBody
    @PostMapping("/initSelectList")
    public Map<String, Object> initSelectList(){
        Map<String, Object> data = new HashMap<>();

        //메뉴 카테고리 목록을 조회
        List<CtgryVO> ctgryList = menuService.getCtgryList();
        data.put("ctgryList", ctgryList);

        //메뉴 상세 카테고리 목록 조회
        List<CtgryDetailVO> ctgryDetailList = menuService.getCtgryDetailList();
        data.put("ctgryDetailList", ctgryDetailList);

        //제품 카테고리 목록 조회
        List<ComDetCodeInfoVO> prctList = comDetCodeService.comDetCodeListByComCode("PRCT");
        data.put("prctList", prctList);

        //제품 목록 조회
        List<ProductVO> productList = menuService.getProductList();
        data.put("productList", productList);

        return data;
    }

    @GetMapping("/registration")
    public String menuRegistration(){
        return "admin/menu/registration";
    }

    @GetMapping("/list")
    public String adminMenuList(@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
                                @RequestParam(value="keyword",required=false,defaultValue="") String keyword,
                                Model model){

        log.warn("adminMenuList keyword : " + keyword);
        //페이징 처리를 위한 맵객체 생성
        Map<String, Object> map = new HashMap<>();
        map.put("currentPage", currentPage);
        map.put("keyword", keyword);

        //메뉴 목록 조회
        List<MenuVO> menuVOList = menuService.adminMenuList(map);
        //검색된 메뉴 갯수 조회
        int total = menuService.getTotal(map);

        //페이징 처리
        ArticlePage<MenuVO> menuList
                = new ArticlePage<>(total, currentPage, 10, menuVOList);
        menuList.setUrl("/admin/menu/list");

        model.addAttribute("menuList", menuList);

        return "admin/menu/list";
    }
}
