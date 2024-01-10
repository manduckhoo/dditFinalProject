package kr.or.onesome.offDoc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.onesome.vo.OffDocVO;

@Mapper
public interface OffDocMapper {
	/**
	 * 공문 작성
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
	 * @return
	 */
	public List<OffDocVO> ReceivedOffDocList(int crrFrcsNo);
	
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


	/**
	 * 공문 수신 디테일 확인 후 상태 변화
	 * @param offDocNo
	 * @return
	 */
    int offDocStatusChange(int offDocNo);
}
