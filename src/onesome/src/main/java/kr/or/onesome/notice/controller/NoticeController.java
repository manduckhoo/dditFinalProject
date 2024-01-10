package kr.or.onesome.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.onesome.admin.mapper.AdminMapper;
import kr.or.onesome.notice.mapper.NoticeMapper;
import kr.or.onesome.notice.service.NoticeService;
import kr.or.onesome.security.CustomUser;
import kr.or.onesome.util.ArticlePage;
import kr.or.onesome.util.PagingHandler;
import kr.or.onesome.vo.AdminVO;
import kr.or.onesome.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

/*
 * 비회원이 들어와도 버튼 없게
 * 공지사항 작성 버튼 admin한테만 보이게 설정
 * 첨부파일 추가
 * 
 */

@Slf4j
@RequestMapping("/admin/notice")
@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private AdminMapper adminMapper;

	@Autowired
	private NoticeMapper noticeMapper;

	@PostMapping("/writeNtc")
	public String writeNotice(Model model, NoticeVO noticeVO) {

		log.info("noticeVO!!!!!!!!!: " + noticeVO);

		int writeNotice = noticeService.writeNotice(noticeVO);

		log.info("writeNotice!!!!!!!!!!!!!!!: " + writeNotice);

		return "redirect:/admin/notice/list";
	}

	@GetMapping("/list")
	public String noticeList(Model model, Authentication authentication,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "keyword", required = false) String keyword) {

		// 현재 로그인된 회원의 정보를 가져옴
		if (authentication != null) {
			CustomUser currUser = (CustomUser) authentication.getPrincipal();
			AdminVO adminVO = currUser.getAdminVO();
			log.info("adminVO: {}" + adminVO);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("currentPage", currentPage);
			map.put("keyword", keyword);
			
			List<NoticeVO> noticeList = noticeService.noticeList(map);
			log.info("noticeList: {}", noticeList);
			
			int total = noticeService.getTotal(map);
			
			ArticlePage<NoticeVO> noticeVOList = new ArticlePage<NoticeVO>(total, currentPage, 5, noticeList);
			
			noticeVOList.setUrl("/admin/notice/list");
			
			model.addAttribute("adminNm", adminVO.getAdminNm());
			model.addAttribute("noticeVOList", noticeVOList);

			return "admin/notice/list";
		} else {
			return "redirect:/admin/login";
		}
	}

	@GetMapping("/detail")
	public String noticeDetail(Model model, @RequestParam int ntcNo, Authentication auth) {
		if(auth != null) {
			CustomUser currUser = (CustomUser) auth.getPrincipal();
			AdminVO adminVO = currUser.getAdminVO();
		
			NoticeVO noticeDetail = noticeService.noticeDetail(ntcNo);
			NoticeVO movePage = noticeService.movePage(ntcNo);//이전글 다음글
				
			log.info("noticeDetail -> noticeVO : "+noticeDetail);
			log.info("noticeDetail -> noticeVO2: "+movePage);
			
			model.addAttribute("adminNm", adminVO.getAdminNm());
			model.addAttribute("noticeDetail", noticeDetail);
			model.addAttribute("movePage", movePage);//이전글 다음글
			return "admin/notice/detail";
		} else {
			return "admin/login";
		}
		
	}
	@ResponseBody
	@PostMapping("/update")
	public int updateNotice(NoticeVO noticeVO, Model model) {
		int result = noticeService.updateNotice(noticeVO);
		log.info("updateNotice -> result: {}" , result);
		
		return result;
	}

	// 삭제
	@ResponseBody
	@PostMapping("/delete")
	public int deleteNotice(@RequestBody NoticeVO noticeVO, Model model) {
		log.info("noticeVO: {}", noticeVO);
		int result = noticeService.deleteNotice(noticeVO);
		log.info("공지사항 삭제 count: ", result);

		return result;
	}
}
