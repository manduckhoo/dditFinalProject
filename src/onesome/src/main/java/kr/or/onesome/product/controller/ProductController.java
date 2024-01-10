package kr.or.onesome.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.onesome.acnt.service.AcntService;
import kr.or.onesome.comcode.service.ComDetCodeService;
import kr.or.onesome.product.service.ProductService;
import kr.or.onesome.product.vo.ProductVO;
import kr.or.onesome.util.ArticlePage;
import kr.or.onesome.vo.AcntVO;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/admin/product")
@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private AcntService acntService;

	@Autowired
	private ComDetCodeService comDetCodeService;

	@GetMapping("/product")
	public String productList(Model model, Authentication auth,
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", currentPage);
		map.put("keyword", keyword);
		
		List<ProductVO> productVOList = productService.productList();
		List<AcntVO> acntVOList = acntService.acntList();

		log.info("productList -> acntVOList : {}", acntVOList);
		
		int total = productService.getTotal(map);
		
		ArticlePage<ProductVO> articlePage = new ArticlePage<ProductVO>(total, currentPage, 5, productVOList);
		articlePage.setUrl("/admin/product/product");
		
//		model.addAttribute("articlePage", articlePage);
		model.addAttribute("productVOList", productVOList);
		model.addAttribute("acntVOList", acntVOList);
		return "admin/product/product";
	}

	@GetMapping("/detail")
	public String productDetail(Model model, @RequestParam int prdctNo) {

		ProductVO productVO = productService.productDetail(prdctNo);
		log.info("productDetail -> productVO : {}", productVO);
		List<AcntVO> acntVOList = acntService.acntList();

		List<ComDetCodeInfoVO> comDetCodeInfoVOList = comDetCodeService.comDetCodeListByComCode("PRCT");
		
		log.info("detail -> comDetCodeInfoVOList : {}", comDetCodeInfoVOList);
		log.info("detail -> acntVOList : {}", acntVOList);

		model.addAttribute("comDetCodeInfoVOList", comDetCodeInfoVOList);
		model.addAttribute("acntVOList", acntVOList);
		model.addAttribute("productVO", productVO);
		return "admin/product/detail";
	}

	@ResponseBody
	@PostMapping("/addProd")
	public String addProduct(@ModelAttribute ProductVO productVO, Model model) {
		log.info("addProduct -> productVO : {}", productVO);

		int result = productService.addProduct(productVO);
		
		log.info("addProduct-> result: {}", result);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
		
	}

//    @GetMapping("/modifyProd")
//    public String modifyProd(int prdctNo, Model model) {
//    	log.info("modifyProd -> prdctNo: {}", prdctNo);
//    	
//    	ProductVO prodVO = productService.productDetail(prdctNo);
//    	List<AcntVO> acntVOList = acntService.acntList();
//    	List<ComDetCodeInfoVO> comDetCodeInfoVOList = comDetCodeService.comDetCodeListByComCode("PRCT");
//    	
//    	model.addAttribute("comDetCodeInfoVOList", comDetCodeInfoVOList);
//		model.addAttribute("acntVOList", acntVOList);
//    	model.addAttribute("prodVO", prodVO);
//    	return "admin/product/detail";
//    }
	
	@PostMapping("/modifyProd")
	public String modifyProduct(ProductVO productVO, Model model) {

		log.info("modifyProduct -> productVO: {}", productVO);

		int result = productService.modifyProduct(productVO);

		log.info("modifyProduct -> result: {}", result);
		return "redirect:/admin/product/detail?prdctNo=" + productVO.getPrdctNo();
	}
	
	@ResponseBody
	@PostMapping("/delProd")
	public String delProduct(@RequestBody ProductVO productVO) {
		log.info("delProduct, productVO -> {}", productVO);
		
		int result = productService.delProduct(productVO);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	@PostMapping("/getPrdctNm")
	@ResponseBody
	public int getPrdctNm(Model model, @RequestBody String prdctNm) {
		log.info("getPrdctNm -> prdctNm {}: ", prdctNm);

		int result = productService.getPrdctNm(prdctNm);
		log.info("getPrdctNm -> result: {}", result);
		return result;
	}
}
