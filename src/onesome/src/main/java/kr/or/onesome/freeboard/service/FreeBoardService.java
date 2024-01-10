package kr.or.onesome.freeboard.service;

import java.util.List;
import java.util.Map;

import kr.or.onesome.vo.CommentsVO;
import kr.or.onesome.vo.FreeBoardVO;


public interface FreeBoardService {

	/**
	 * 자유게시판 리스트 
	 * @return
	 */
	List<FreeBoardVO> freeBoardList(Map<String, Object> map);
	
	/**
	 * 자유게시판 디테일
	 * @param freeBoardVO
	 * @return
	 */
	public FreeBoardVO freeBoardDetail(FreeBoardVO freeBoardVO);
	
	/**
	 * 자유게시판 글쓰기
	 * @param freeBoardVO
	 * @return
	 */
	public int freeBoardCreate(FreeBoardVO freeBoardVO);
	
	/**
	 * 자게 삭제~~!
	 * @param freeBoardNo
	 * @return
	 */
	public int deleteFreeBoard(String freeBoardNo);
	
	/**
	 * 자게 수정~~!
	 * @param freeBoardVO
	 * @return
	 */
	public int updateFreeBoard(FreeBoardVO freeBoardVO);
	
	/**
	 * 댓글 리스트 조회
	 * @param freeboardVO
	 * @return
	 */
	public List<CommentsVO> commentsList(FreeBoardVO freeboardVO);
	
	/**
	 * 댓글쓰기
	 * @param commentsVO
	 * @return
	 */
	public int createComments(CommentsVO commentsVO);
	
	/**
	 * 댓글 삭제
	 * @param commentsVO
	 * @return
	 */
	int deleteComments(CommentsVO commentsVO);

	/**
	 * 댓글 수정
	 * @param commentsVO
	 * @return
	 */
	int updateComments(CommentsVO commentsVO);
	
	/**
	 * 게시물에 달린 댓글 수 가져오기
	 * @param freeBoardNo
	 * @return
	 */
	public int getCommentCount(int freeBoardNo);


}
