package kr.or.onesome.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.onesome.vo.NoticeVO;

public interface NoticeService {
	
	/**
	 * 공지사항 리스트
	 * @param map 
	 * @return
	 */
	public List<NoticeVO> noticeList(Map<String, Object> map);
	
	/**
	 * 공지사항 작성
	 * @param noticeVO
	 * @return
	 */
	public int writeNotice(NoticeVO noticeVO);

	/**
	 * 공지사항 상세
	 * @param ntcNo
	 * @return
	 */
	public NoticeVO noticeDetail(int ntcNo);
	
	
	/**
	 * 공지사항 삭제
	 * @param noticeVO
	 * @return
	 */
	public int deleteNotice(NoticeVO noticeVO);
	
	/**
	 * 공지사항 수정
	 * @param noticeVO
	 * @return
	 */
	public int updateNotice(NoticeVO noticeVO);
	
	/**
	 * 공지사항 불러오기(일반 회원) - 재람
	 * @return
	 */
	public List<NoticeVO> memNoticeList();
	
	/**
	 * 공지사항 디테일(일반 회원) - 재람
	 * @return
	 */
	public NoticeVO memNoticeDetail(NoticeVO noticeVO);
	
	/**
	 * 공지사항 검색(일반회원) - 재람
	 * @param map
	 * @return
	 */
	public List<NoticeVO> list(Map<String, Object> map);

	/**
	 * 공지사항 페이징 총 갯수(일반회원) - 재람
	 * @param map
	 * @return
	 */
	public int getTotal(Map<String, Object> map);
	
	/**
	 * 공지사항 디테일 이전글 다음글(일반회원) - 재람
	 * @param ntcNo
	 * @return
	 */
	public NoticeVO movePage(int ntcNo);
	

	
	
//	public NoticeVO movePage(String ntcNo);
}
