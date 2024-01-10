package kr.or.onesome.hqempedu.service;

import java.util.List;

import kr.or.onesome.vo.OjtVO;

public interface HqEmpEduService {

	/**
	 * 교육 리스트
	 * @return
	 */
	public List<OjtVO> eduList();
	
	/**
	 * 교육 디테일
	 * @param ojtNo
	 * @return
	 */
	public OjtVO eduDetail(int ojtNo);

	/**
	 * 교육 등록
	 * @param ojtVO
	 * @return
	 */
	public int addEdu(OjtVO ojtVO);
	
	/**
	 * 교육 삭제
	 * @param ojtVO
	 * @return
	 */
	public int delEdu(OjtVO ojtVO);
	
	/**
	 * 교육 수정
	 * @param ojtVO
	 * @return
	 */
	public int updateEdu(OjtVO ojtVO);

}
