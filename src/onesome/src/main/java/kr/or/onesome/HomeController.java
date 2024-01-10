package kr.or.onesome;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import kr.or.onesome.security.CustomUser;
import kr.or.onesome.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@GetMapping("/")
	public String memHome() {
		return "redirect:/mem/main";
	}

	@GetMapping("/admin")
	public String adminHome(){
		return "redirect:/admin/main";
	}
	
	
}
