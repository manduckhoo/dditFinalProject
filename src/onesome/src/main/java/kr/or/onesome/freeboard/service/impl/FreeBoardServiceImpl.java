package kr.or.onesome.freeboard.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.onesome.atchFile.service.AtchFileService;
import kr.or.onesome.freeboard.mapper.FreeBoardMapper;
import kr.or.onesome.freeboard.service.FreeBoardService;
import kr.or.onesome.vo.AtchFileVO;
import kr.or.onesome.vo.CommentsVO;
import kr.or.onesome.vo.FreeBoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired
	private FreeBoardMapper freeBoardMapper;

	@Autowired
	private AtchFileService fileController;
	
	@Autowired
	private AtchFileService atchFileService;
	
	//자유게시판 리스트 출력
	@Override
	public List<FreeBoardVO> freeBoardList(Map<String, Object> map) {
		return freeBoardMapper.freeBoardList(map);
	}

	// 자유게시판 디테일
	@Override
	public FreeBoardVO freeBoardDetail(FreeBoardVO freeBoardVO) {
		int cnt = freeBoardMapper.updateView(freeBoardVO);
		return freeBoardMapper.freeBoardDetail(freeBoardVO);
	}
	
	// 자유게시판 글쓰기
	@Override
	public int freeBoardCreate(FreeBoardVO freeBoardVO) {
		
		/*
		FreeBoardVO(freeBoardNo=0, freeBoardTitle=ㄴㄴㄴ, freeBoardConts=<p>ㄴㄴㄴ</p>
		, freeBoardWrtDt=null, freeBoardFnlMdfDt=null, freeBoardWrtrNo=0, atchFileNo=0, freeBoardView=0, uploadFile=[org.springfra...
		 */
		
		MultipartFile[] uploadFile = freeBoardVO.getUploadFile();
		
		log.info("freeBoardCreate->uploadFile[0].getOriginalFilename() : " + uploadFile[0].getOriginalFilename());
		
		if (uploadFile[0].getOriginalFilename().length() > 0) {
			//1) 파일 업로드
			List<AtchFileVO> fileVOList = fileController.uploadFile(uploadFile, "freeBoard");
			log.info("List<AtchFileVO> fileVOList : {}", fileVOList);
			
			if (fileVOList.get(0).getAtchFileNo() > 0) {
				freeBoardVO.setAtchFileNo(fileVOList.get(0).getAtchFileNo());
			}
		}
		int result = freeBoardMapper.freeBoardCreate(freeBoardVO);
		
		return result;
	}
	
	
	// 자게 삭제~~
	@Override
	public int deleteFreeBoard(String freeBoardNo) {
		
		return freeBoardMapper.deleteFreeBoard(freeBoardNo);
	}
	
	
	//w자게 수정~!
	@Override
	public int updateFreeBoard(FreeBoardVO freeBoardVO) {
		/*
		 FreeBoardVO(freeBoardNo=115, freeBoardTitle=제발2, freeBoardConts=<p>ㅠㅠ22</p>, freeBoardWrtDt=null
		 , freeBoardFnlMdfDt=null, freeBoardWrtrNo=425367078, atchFileNo=0, freeBoardView=0, frcsOwnrNm=null
		 , uploadFile=[org.springframework..
		 */
		log.info("수정 할 자유게시판 VO :" + freeBoardVO);
		
		MultipartFile[] uploadFile = freeBoardVO.getUploadFile();
		log.info("uploadfile : " + uploadFile);
		log.info("freeBoardCreate->uploadFile[0].getOriginalFilename().length() : " + uploadFile[0].getOriginalFilename().length());
		
		if (uploadFile[0].getOriginalFilename().length()>0) {
			log.info("if문 안으로 들어왔음");
			//1) 파일 업로드
			List<AtchFileVO> fileVOList = fileController.uploadFile(uploadFile, "freeBoard");
			log.info("List<AtchFileVO> fileVOList : {}", fileVOList);
			
			atchFileService.deleteFile(freeBoardVO.getAtchFileNo(), "freeBoard");
			if (fileVOList.get(0).getAtchFileNo() > 0) {
				freeBoardVO.setAtchFileNo(fileVOList.get(0).getAtchFileNo());
			}
		}
		
//		for(MultipartFile multipartFile : freeBoardVO.getUploadFile()) {
//			log.info("multipartFile : " + multipartFile.getOriginalFilename());
//			if(!multipartFile.getOriginalFilename().equals("")) {
//				List<AtchFileVO> fileVOList = atchFileService.uploadFile(freeBoardVO.getUploadFile(), "freeBoard");
//				log.info("파일 업로드 실행됨");
//				atchFileService.deleteFile(freeBoardVO.getAtchFileNo(), "freeBoard");
//				log.info("파일 삭제됨");
//				freeBoardVO.setAtchFileNo(fileVOList.get(0).getAtchFileNo());
//				log.info("첨부파일 번호 세팅함");
//			}
//		}
		
		return freeBoardMapper.updateFreeBoard(freeBoardVO);
	}
	
	// 댓글 리스트 조회
	@Override
	public List<CommentsVO> commentsList(FreeBoardVO freeboardVO) {
		return freeBoardMapper.commentsList(freeboardVO);
	}

	// 댓글쓰기
	public int createComments(CommentsVO commentsVO) {
		return freeBoardMapper.createComments(commentsVO);
	}
	
	// 댓글삭제
	@Override
	public int deleteComments(CommentsVO commentsVO) {
		return freeBoardMapper.deleteComments(commentsVO);
	}
	
	// 댓글 수정
	@Override
	public int updateComments(CommentsVO commentsVO) {
		return freeBoardMapper.updateComments(commentsVO);
	}
	
	// 게시물에 달린 댓글 수 가져오기
	@Override
	public int getCommentCount(int freeBoardNo) {
	    return freeBoardMapper.getCommentCount(freeBoardNo);
	}
	
}
