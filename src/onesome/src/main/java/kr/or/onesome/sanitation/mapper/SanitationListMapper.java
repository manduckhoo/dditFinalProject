package kr.or.onesome.sanitation.mapper;

import kr.or.onesome.sanitation.vo.SanitationCheckManagementVO;
import kr.or.onesome.sanitation.vo.SanitationListVO;

import java.util.List;
import java.util.Map;

public interface SanitationListMapper {

    /**
     * 가맹점 자체 위생점검 결과를 등록하기 위한 매퍼
     * @param sanitationListVO 자체 위생점검 결과가 담긴 VO
     * @return 등록 성공시 1을 실패시 0을 반환
     */
    int sanitationRegistration(SanitationListVO sanitationListVO);

    /**
     * 각 가맹점의 특정 월의 위생점검 내역을 가져오기 위한 매퍼
     * @param managementVO 가맹점 번호와 본사 점검일자가 담긴 VO
     * @return 조회된 점검내역
     */
    List<SanitationListVO> getFrcsSanitationListByDate(SanitationCheckManagementVO managementVO);

    /**
     * 현재 선택된 가맹점의 자체 위생점검 목록을 조회하기 위한 매퍼
     * @return 위생점검 목록
     */
    List<SanitationListVO> getSanitationListByFrcsNo(Map<String, Object> map);

    /**
     * 페이징 처리를 위해 검색된 목록의 갯수를 확인
     * @param map 검색 키워드가 담긴 맵
     * @return 검색된 갯수를 반환
     */
    int getTotal(Map<String, Object> map);

    /**
     * 현재 선택된 가맹점의 이름을 조회하기 위한 매퍼
     * @param crrFrcsNo 세션에 저장된 가맹점 번호
     * @return 가맹점명
     */
    String getFranchiseName(int crrFrcsNo);

}
