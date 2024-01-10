package kr.or.onesome.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.onesome.cart.service.MemberCartService;
import kr.or.onesome.member.service.MemberService;
import kr.or.onesome.security.CustomUser;
import kr.or.onesome.util.WebMailService;
import kr.or.onesome.vo.MemberMenuVO;
import kr.or.onesome.vo.MemberVO;
import kr.or.onesome.vo.MemberWishVO;
import kr.or.onesome.wish.service.MemberWishService;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/mem")
@Slf4j
@Controller
public class MemberMainController {

    @Autowired
    MemberService memberService;
    
    @Autowired
    WebMailService webMailService;
    
    @Autowired
    MemberWishService memberWishService;

    @Autowired
    MemberCartService memberCartService;
    
    //메인화면
    @GetMapping("/main")
    public String MemMainPage() {
        return "mem/main/main";
    }

    //메뉴 => 모든 메뉴 페이지로 이동하기
    @GetMapping("/allMenu")
    public String memMenuAll() {
    	return "mem/menu/allMenu";
    }

    //메뉴 => 음료 페이지 리스트 조회
    @GetMapping("/drink")
    public String MemMenuDrinkList(Model model){
    	
    	List<MemberMenuVO> menuList = this.memberService.MemMenuDrinkList();
    	log.info("menuList : " + menuList);
    	model.addAttribute("menuList", menuList);
    	
        return "mem/menu/drink";
    }
    
  //메뉴 => 음료 상세페이지 조회
  	@GetMapping("/drinkDetail")
  	public String MemMenuDrinkDetail(MemberMenuVO memberMenuVO , Model model, Authentication auth){
  		memberMenuVO = memberService.selectMenuDetail(memberMenuVO);
  		log.info("MemMenuDrinkDetail -> memberMenuVO : " + memberMenuVO);
  		
  		
  		if (auth != null) {
  			CustomUser currUser = (CustomUser) auth.getPrincipal();
  			MemberVO memberVO = currUser.getMemberVO();
  			log.info("memberVO : " + memberVO);
  			model.addAttribute("user", currUser);
  			model.addAttribute("memberVO", memberVO);
  			MemberWishVO memberWishVO = new MemberWishVO();
  			memberWishVO.setMenuNo(memberMenuVO.getMenuNo());
  			memberWishVO.setMemNo(memberVO.getMemNo());
  			int result = memberWishService.wishListInsertCheck(memberWishVO); //이미 위시리스트에 담겨있는지 없는지 확인하고 없으면 빈하트, 있으면 색깔하트
  			model.addAttribute("result", result);
  		}

  		model.addAttribute("memberMenuVO", memberMenuVO);
  		
  		//카테고리 넘버 가져와서 ICEONLY 표시 할 예정(딸기 스무디 처럼 hot/ice 선택이 필요없는 애들)
    	List<MemberMenuVO> menuCtgList = this.memberService.selectCtgList(memberMenuVO);
    	model.addAttribute("menuCtgList", menuCtgList);
  		
  		return "mem/menu/drinkDetail";
  	}
    
    //메뉴 => 푸드 페이지 리스트 조회
    @GetMapping("/food")
    public String MemMenuFoodList(Model model){
    	
    	List<MemberMenuVO> menuList = this.memberService.MemMenuFoodList();
    	log.info("menuList : " + menuList);
    	model.addAttribute("menuList", menuList);
    	
    	return "mem/menu/food";
    }
    
    //메뉴 => 푸드 상세페이지 조회
  	@GetMapping("/foodDetail")
  	public String MemMenuFoodDetail(MemberMenuVO memberMenuVO , Model model, Authentication auth){
  		memberMenuVO = memberService.selectMenuDetail(memberMenuVO);
  		log.info("MemMenuFoodDetail -> memberMenuVO : " + memberMenuVO);
  		
  		if (auth != null) {
  			CustomUser currUser = (CustomUser) auth.getPrincipal();
  			MemberVO memberVO = currUser.getMemberVO();
  			log.info("memberVO : " + memberVO);
  			model.addAttribute("user", currUser);
  			model.addAttribute("memberVO", memberVO);
  			MemberWishVO memberWishVO = new MemberWishVO();
  			memberWishVO.setMenuNo(memberMenuVO.getMenuNo());
  			memberWishVO.setMemNo(memberVO.getMemNo());
  			int result = memberWishService.wishListInsertCheck(memberWishVO); //이미 위시리스트에 담겨있는지 없는지 확인하고 없으면 빈하트, 있으면 색깔하트
  			model.addAttribute("result", result);
  		}

  		model.addAttribute("memberMenuVO", memberMenuVO);
  		
  		return "mem/menu/foodDetail";
  	}
    
    //메뉴 => 상품 페이지 리스트 조회
    @GetMapping("/product")
    public String MemMenuProductList(Model model){
    	
    	List<MemberMenuVO> menuList = this.memberService.MemMenuProductList();
    	log.info("menuList : " + menuList);
    	model.addAttribute("menuList", menuList);
    	
    	return "mem/menu/product";
    }
    
  //메뉴 => 상품 상세페이지 조회
  	@GetMapping("/productDetail")
  	public String MemMenuProductDetail(MemberMenuVO memberMenuVO , Model model, Authentication auth){
  		memberMenuVO = memberService.selectMenuDetail(memberMenuVO);
  		log.info("MemMenuProductDetail -> memberMenuVO : " + memberMenuVO);
  		
  		
  		if (auth != null) {
  			CustomUser currUser = (CustomUser) auth.getPrincipal();
  			MemberVO memberVO = currUser.getMemberVO();
  			log.info("memberVO : " + memberVO);
  			model.addAttribute("user", currUser);
  			model.addAttribute("memberVO", memberVO);
  			MemberWishVO memberWishVO = new MemberWishVO();
  			memberWishVO.setMenuNo(memberMenuVO.getMenuNo());
  			memberWishVO.setMemNo(memberVO.getMemNo());
  			int result = memberWishService.wishListInsertCheck(memberWishVO); //이미 위시리스트에 담겨있는지 없는지 확인하고 없으면 빈하트, 있으면 색깔하트
  			model.addAttribute("result", result);
  		}

  		model.addAttribute("memberMenuVO", memberMenuVO);
  		
  		return "mem/menu/productDetail";
  	}

    //일반회원 로그인 페이지
    @GetMapping("/login")
    public String MemLogin(){
        return "mem/login/login";
    }

    //일반회원 가입 페이지
    @GetMapping("/join")
    public String MemJoin(){
    	return "mem/join/join";
    }
    
    //일반회원 가입 전 약관동의 페이지
    @GetMapping("/joinTerms")
    public String MemJoinTerms(){
        return "mem/join/joinTerms";
    }

    @PostMapping("/join")
    public String MemJoinPost(MemberVO memberVO){

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encodedPass = encoder.encode(memberVO.getMemPw());

        memberVO.setMemPw(encodedPass);
        memberService.signUpMember(memberVO);

        webMailService.sendWelcomeMail(memberVO);

        return "redirect:/mem/joinwelcome";
    }
    
  	//일반회원 가입 환영 페이지 => 이건 나중에 회원가입할때 유효성검사 다 끝내고 회원가입 버튼 눌렀을때 redirect 경로 잘먹히는지 확인되면 없애도될듯
    @GetMapping("/joinwelcome")
    public String MemJoinWelcome(){
        return "mem/join/joinWelcome";
    }

}