package kr.or.onesome.offDoc.service;

import java.util.List;

import kr.or.onesome.vo.OffDocVO;

public interface OffDocService {

	/**
	 * 공문 쓰기
	 * @param offDocVO
	 * @return
	 */
	public int offDocCreate(OffDocVO offDocVO);
	
	/**
	 * 발송된 공문 리스트 가져오기
	 * @return
	 */
	public List<OffDocVO> offDocList();
	
	/**
	 * 공문 수신
	 * @param crrFrcsNo
	 * @return
	 */
	public List<OffDocVO> getReceivedOffDocList(int crrFrcsNo);
	
	/**
	 * 공문 수신 디테일
	 * @param offDocNo
	 * @return
	 */
	public OffDocVO offDocToDetail(int offDocNo);
	
	/**
	 * 공문(발송) 디테일
	 * @param offDocNo
	 * @return
	 */
	public OffDocVO offDocFromDetail(int offDocNo);



}
