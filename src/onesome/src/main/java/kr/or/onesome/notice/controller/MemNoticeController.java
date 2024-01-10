package kr.or.onesome.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.onesome.atchFile.service.AtchFileService;
import kr.or.onesome.notice.mapper.NoticeMapper;
import kr.or.onesome.notice.service.NoticeService;
import kr.or.onesome.util.ArticlePage;
import kr.or.onesome.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

/*
 * 비회원이 들어와도 버튼 없게
 * 공지사항 작성 버튼 admin한테만 보이게 설정
 * 첨부파일 추가
 * 
 */

@Slf4j
@RequestMapping("/mem/notice")
@Controller
public class MemNoticeController {

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Autowired //파일 서비스
	AtchFileService fileService;
	
	
	//memNoticeList (일반회원 공지사항 불러오기) - 재람
	// /mem/notice/memList?searchType=title&keyword=개인정보
	@GetMapping("/memList")
	public String memNoticeList (@RequestParam(value="searchType",required=false) String searchType,	
			@RequestParam(value="keyword",required=false,defaultValue = "") String keyword,	
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage, Model model) {
//		List<NoticeVO> noticeList = noticeService.memNoticeList();
//		log.info("noticeList : " , noticeList);
		log.info("list->searchType : " + keyword);
		log.info("list->keyword : " + keyword);
		log.info("list->currentPage : " + currentPage);
		
		//키워드랑 페이징 처리
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("searchType",searchType);
		map.put("keyword",keyword);
		map.put("currentPage",currentPage);
		//{searchType=title,keyword=개인정보,currentPage=1}
		log.info("memNoticeList->map : " + map);
		
		List<NoticeVO> noticeVOList = this.noticeService.list(map);
		log.info("memNoticeList->noticeVOList : " + noticeVOList);
		
		//페이징 할 게시판 총 갯수
		int total = this.noticeService.getTotal(map);
		log.info("list->total : " + total);
		
		//페이징 util 메서드 
		ArticlePage<NoticeVO> data 
		= new ArticlePage<NoticeVO>(total, currentPage, 10, noticeVOList);
		
		data.setKeyword(keyword);
		data.setSearchType(searchType);
		//다음페이로 이동URL
		data.setUrl("/mem/notice/memList");
		
//		model.addAttribute("noticeList", noticeVOList); //(키 , 벨류) 나중에 키값으로 데이터 불러와!!! 꼭! ex) ${memNoticeList}
		model.addAttribute("data", data);
		
		return "mem/notice/list";
	}
	
	//memDetail (일반회원 디테일) - 재람
	@GetMapping("/memDetail")
	public String memDetail (NoticeVO noticeVO, Model model) {
		log.info("memDetail->noticeVO : " + noticeVO);
		//NoticeVO(ntcNo=72, ntcTitle=null,
		NoticeVO memNoticeVO = noticeService.memNoticeDetail(noticeVO);
		NoticeVO memNoticeVO2 = noticeService.movePage(noticeVO.getNtcNo());//이전글 다음글
			
		log.info("memDetail -> memNoticeVO : "+memNoticeVO);
		
		
		model.addAttribute("memNoticeVO", memNoticeVO);
		model.addAttribute("memNoticeVO2", memNoticeVO2);//이전글 다음글
		// 이전글다음글 조회하기
		return "mem/notice/memDetail";
	}
	
}
