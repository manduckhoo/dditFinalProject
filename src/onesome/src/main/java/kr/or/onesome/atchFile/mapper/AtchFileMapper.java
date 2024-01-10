package kr.or.onesome.atchFile.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.onesome.vo.AtchFileVO;

@Mapper
public interface AtchFileMapper {
	
	/**
	 * 파일 업로드
	 * @param athAtchFileVO
	 * @return
	 */
	public int insertAtchFile(AtchFileVO athAtchFileVO);
	
	/**
	 * 첨부파일 상세조회
	 * @param atchFileNo
	 * @return
	 */
	public AtchFileVO getAttachDetail(int atchFileNo);

	/**
	 * 파일업로드시 atchFileNo를 공통적으로 적용하기 위해
	 * db입력전 먼저 p.k를 가져오기 위한 메서드
	 * @return 생성된 AtchFileNo
	 */
	public int getAtchFileNo();
	
	/**
	 * 기존파일 정보 가져오기 위한 메서드
	 * @param atchFileNo
	 * @return
	 */
	public List<AtchFileVO> getFilesByAtchFileNo(int atchFileNo);
	
	/**
	 * 기존 파일정보 삭제
	 * @param fileSn
	 * @param atchFileNo
	 */
	public void deleteFile(int atchFileNo);

	/**
	 * 입력받은 파일번호에 해당하는<br> 모든 파일정보를 삭제하기 위한 매퍼
	 * @param atchFileNo 파일번호
	 * @return 삭제된 파일정보의 수
	 */
	int removeFile(int atchFileNo);
}
