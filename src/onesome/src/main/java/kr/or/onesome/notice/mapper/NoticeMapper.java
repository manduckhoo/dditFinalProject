package kr.or.onesome.notice.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.onesome.vo.NoticeVO;

@Mapper
public interface NoticeMapper {
	
	/**
	 * 공지사항 리스트
	 * @return
	 */
	public List<NoticeVO> noticeList(Map<String, Object> map);
	
	/**
	 * 작성된 글의 총개수
	 * @return
	 */
	public int getCount();
	
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
	 * 공지사항 불러오기(일반회원) - 재람
	 * @return
	 */
	public List<NoticeVO> memNoticeList();
	
	/**
	 * 공지사항 디테일(일반회원) - 재람
	 * @return
	 */
	public NoticeVO memNoticeDetail(NoticeVO noticeVO);

	/**
	 * 공지사항 목록(일반회원), 검색 - 재람
	 * @param map {searchType=title,keyword=개인정보,currentPage=1}
	 * @return
	 */
	public List<NoticeVO> list(Map<String, Object> map);
	
	/**
	 * 공지사항 페이지 총 갯수(페이징) - 재람
	 * @param map {searchType=title,keyword=개인정보,currentPage=1}
	 * @return
	 */
	public int getTotal(Map<String, Object> map);
	
	/**
	 * 공지사항(일반회원) 이전글 다음글 - 재람
	 * @param ntcNo
	 * @return
	 */
	public NoticeVO movePage(int ntcNo);
	
	/**
	 * 공지사항(일반회원) 첨부파일 다운로드 - 재람
	 * @param map
	 * @return
	 */
	public Map<String, Object> selectFileInfo(Map<String, Object> map);
	
	/**
	 * 공지사항 수정
	 * @param noticeVO
	 * @return
	 */
	public int updateNotice(NoticeVO noticeVO);
	
//	public NoticeVO movePage(String ntcNo);
}
