package kr.or.onesome.freeboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.onesome.atchFile.service.AtchFileService;
import kr.or.onesome.freeboard.mapper.FreeBoardMapper;
import kr.or.onesome.freeboard.service.FreeBoardService;
import kr.or.onesome.security.CustomUser;
import kr.or.onesome.vo.CommentsVO;
import kr.or.onesome.vo.FranchiseOwnerVO;
import kr.or.onesome.vo.FreeBoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/frcs/freeboard") // 게시판 리스트
@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService freeBoardService;

	@Autowired
	private FreeBoardMapper freeBoardMapper;

	@Autowired // 파일 서비스
	AtchFileService fileService;

	@GetMapping("/list")
	public String freeBoardList(Model model, Authentication auth) {

		Map<String, Object> map = new HashMap<String, Object>();

		CustomUser loginUser = (CustomUser) auth.getPrincipal();
		FranchiseOwnerVO ownerVO = loginUser.getOwnerVO();

		List<FreeBoardVO> freeBoardVOList = freeBoardService.freeBoardList(map);

		log.info("프리보드VO : " + freeBoardVOList);

		model.addAttribute("frcsOwnerNm", ownerVO.getFrcsOwnrNm());
		model.addAttribute("freeBoardVOList", freeBoardVOList);

		return "frcs/freeboard/list";
	}

	@GetMapping("/detail") // 게시판 디테일
	public String freeBoardDetail(FreeBoardVO freeBoardVO, Model model, Authentication auth) {

		FreeBoardVO freeBoardVODetail = freeBoardService.freeBoardDetail(freeBoardVO);
		CustomUser loginUser = (CustomUser) auth.getPrincipal();
		String frcsOwnerNm = loginUser.getOwnerVO().getFrcsOwnrNm();
		
		int frcsOwnerNo = loginUser.getOwnerVO().getFrcsOwnrNo();
		log.info("점주 번호 : " + frcsOwnerNo);
		log.info("freeBoardVODetail :" + freeBoardVODetail);

		log.info("frcsOwnerNm: {}", frcsOwnerNm);

		model.addAttribute("frcsOwnerNm", frcsOwnerNm);
		model.addAttribute("freeBoardVODetail", freeBoardVODetail);
		model.addAttribute("LoginNo", frcsOwnerNo);
		
		return "frcs/freeboard/detail";
	}

	@PostMapping("/create") // 게시판 글쓰기
	public String freeBoardCreate(FreeBoardVO freeBoardVO, Model model, Authentication auth) {
		/*
		 * FreeBoardVO(freeBoardNo=0, freeBoardTitle=ㄴㄴㄴ, freeBoardConts=<p>ㄴㄴㄴ</p> ,
		 * freeBoardWrtDt=null, freeBoardFnlMdfDt=null, freeBoardWrtrNo=0, atchFileNo=0,
		 * freeBoardView=0, uploadFile=[org.springfra...
		 */
		log.info("freeBoardCreate -> freeBoardVO: {}", freeBoardVO);
		int freeBoardCreate;
		if (auth != null) {
			CustomUser user = (CustomUser) auth.getPrincipal();
			freeBoardVO.setFreeBoardWrtrNo(user.getOwnerVO().getFrcsOwnrNo());

			log.info("freeBoardCreate->freeBoardVO set wrtNO : ", freeBoardVO);
			freeBoardCreate = freeBoardService.freeBoardCreate(freeBoardVO);

		} else {
			return "redirect:/admin/login";
		}

		// 글쓰기완료후 성공/실패부분
		if (freeBoardCreate > 0) {
			// 글쓰기 성공
			return "redirect:/frcs/freeboard/list";
		} else {
			// 글쓰기 실패
			model.addAttribute("message", "글쓰기에 실패했습니다.");
			return "error";
		}
	}

	// 수정
	@PostMapping("/update")
	public String freeBoardUpdate(FreeBoardVO freeBoardVO, Model model, Authentication auth) {
		/*
		 * FreeBoardVO(freeBoardNo=115, freeBoardTitle=제발2, freeBoardConts=<p>ㅠㅠ22</p>,
		 * freeBoardWrtDt=null , freeBoardFnlMdfDt=null, freeBoardWrtrNo=0,
		 * atchFileNo=0, freeBoardView=0, frcsOwnrNm=null ,
		 * uploadFile=[org.springframework.web.multipart.support.St..],
		 * atchFileVOList=null)
		 */
		log.info("프리보드 브이오 : " + freeBoardVO);

		// if문 밖에서도 쓸 수있게 선언해주기
		int freeBoardUpdate = 0;
		// 로그인을 정보가 있을때?? if문 실행
		if (auth != null) {
			// auth 안에있는 로그인 정보를 user에 담아주기
			CustomUser user = (CustomUser) auth.getPrincipal();
			// user에 담아온 유저 로그인 정보를 freeBoardVO에 담아주기
			freeBoardVO.setFreeBoardWrtrNo(user.getOwnerVO().getFrcsOwnrNo());

			log.info("freeBoardUpdate->freeBoardVO set wrtNO : ", freeBoardVO);
			// freeBoardService에 있는updateFreeBoard를 freeBoardVO타입으로 freeBoardCreat에 담기
			freeBoardUpdate = freeBoardService.updateFreeBoard(freeBoardVO);

		} else {// 그 밖에(로그인 안됐을때) 로그인페이지로 보내즘
			return "redirect:/admin/login";
		}

		// 글쓰기완료후 성공/실패부분
		if (freeBoardUpdate > 0) {
			// 글쓰기 성공
			return "redirect:/frcs/freeboard/detail?freeBoardNo=" + freeBoardVO.getFreeBoardNo();
		} else {
			// 글쓰기 실패
			model.addAttribute("message", "글쓰기에 실패했습니다.");
			return "error";
		}
	}

	// 삭제
	@PostMapping("/delete")
	public String deleteFreeBoard(@RequestParam String freeBoardNo, Model model) {

		log.info("delete : " + freeBoardNo);
		int result = freeBoardService.deleteFreeBoard(freeBoardNo);
		log.info("삭제~~~! : ", result);

		if (result < 0) {
			return "redirect:/frcs/freeboard/detail";
		} else {
			return "redirect:/frcs/freeboard/list";
		}
	}

	// 댓글 조회
	@ResponseBody // 에이젝스로다가 연결할라면 이거 필요함 @ResponseBody=> 주소값으로 리턴해주는게 아니라 데이터 자체로다가 리턴해줌,
					// @RequestBody =>프리보드 브이오를 받아서 거기있는 게시판번호를 가져온다..!
	@PostMapping("/commentsList")
	private List<CommentsVO> commentsVOList(@RequestBody FreeBoardVO freeboardVO) {

		List<CommentsVO> commentsVOList = freeBoardService.commentsList(freeboardVO);
		log.info("댓글!!!: {}", commentsVOList);
		
		return commentsVOList;
	}

	// 댓글 등록
	@ResponseBody // 에이젝스로다가 연결할라면 이거 필요함 @ResponseBody=> 주소값으로 리턴해주는게 아니라 데이터 자체로다가 리턴해줌,
					// @RequestBody =>프리보드 브이오를 받아서 거기있는 게시판번호를 가져온다..!
	@PostMapping("/createComments")
	private int createComments(@RequestBody CommentsVO commentsVO) {

		log.info("되니?" + commentsVO);
		int creaateCommentsVO = freeBoardService.createComments(commentsVO);

		return creaateCommentsVO;
	}

	// 댓글 삭제
	@ResponseBody
	@PostMapping("/deleteComments")
	public int deleteComments(@RequestBody CommentsVO commentsVO, Authentication auth) {

		int deleteCommentsVO = freeBoardService.deleteComments(commentsVO);
		
		return deleteCommentsVO;
	}
	
	// 댓글 수정
	@ResponseBody
	@PostMapping("/updateComments")
	public int updateComments(@RequestBody CommentsVO commentsVO ) {
		
		log.info("댓글 수정 data : " + commentsVO);
		
		int updateCommentsVO = freeBoardService.updateComments(commentsVO);
		
		return updateCommentsVO;
	}
	
	//게시물에 달린 댓글 수 가져오기
	@ResponseBody
	@PostMapping("/commentCount")
	public int getCommentCount(@RequestBody FreeBoardVO freeBoardVO) {
		int freeBoardNo = freeBoardVO.getFreeBoardNo();
		log.info("getCommentCount -> : freeBoardNo" +freeBoardNo );
		return freeBoardService.getCommentCount(freeBoardNo);
	}
}
