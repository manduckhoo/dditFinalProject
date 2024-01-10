package kr.or.onesome.freeboard.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.onesome.vo.CommentsVO;
import kr.or.onesome.vo.FreeBoardVO;

@Mapper
public interface FreeBoardMapper {
	
	//자유게시판 리스트
	List<FreeBoardVO> freeBoardList(Map<String, Object> map);
	
	//자유게시판 디테일
	FreeBoardVO freeBoardDetail(FreeBoardVO freeBoardVO);

	//조회수
	int updateView(FreeBoardVO freeBoardVO);
	
	//자유게시판 글쓰기
	int freeBoardCreate(FreeBoardVO freeBoardVO);
	
	//자유게시판 첨부파일 다운로드??
	public Map<String, Object> selectFileInfo(Map<String, Object> map);
	
	/**
	 * 삭제
	 * @param freeBoardNo
	 * @return
	 */
	public int deleteFreeBoard(String freeBoardNo);
	
	/**
	 * 자게 수정
	 * @param freeBoardVO
	 * @return
	 */
	public int updateFreeBoard(FreeBoardVO freeBoardVO);
	
	/**
	 * 댓글 리스트 조회
	 * @param freeboardVO
	 * @return
	 */
	List<CommentsVO> commentsList(FreeBoardVO freeboardVO);
	
	/**
	 * 댓글쓰기
	 * @param commentsVO
	 * @return
	 */
	int createComments(CommentsVO commentsVO);
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
	int getCommentCount(int freeBoardNo);
}
