package kr.or.onesome.sanitation.service;

import kr.or.onesome.sanitation.vo.SanitationCheckManagementVO;
import kr.or.onesome.vo.FranchiseVO;

import java.util.List;
import java.util.Map;

public interface SanitationCheckManagementService {

    /**
     * 가맹점에서 해당 가맹점의 본사 위생점검 내역을 조회하기 위한 메서드
     * @param crrFrcsNo 현재 선택된 가맹점 번호
     * @return 조회된 위생점검 내역
     */
    List<SanitationCheckManagementVO> getSanitationCheckManagementByFrcsNo(int crrFrcsNo);

    /**
     * 위생점검을 삭제하기위한 메서드
     * @param managementVO 삭제하려는 위생점검 정보
     * @return 삭제성공시 1을 실패시 0을 반환
     */
    int sanitationDelete(SanitationCheckManagementVO managementVO);

    /**
     * 본사 위생점검 등록을 위한 메서드
     * @param managementVO 위생점검 정보가 담긴 VO
     * @return 등록 성공시 1을 실패시 0을 반환
     */
    int sanitationRegistration(SanitationCheckManagementVO managementVO);

    /**
     * 본사 위생점검 목록을 조회하기 위한 메서드
     * @return 조회된 위생점검 목록
     */
    List<SanitationCheckManagementVO> adminSanitationList(Map<String, Object> map);

    /**
     * 페이징 처리를 위해 검색된 목록의 갯수를 확인
     * @param map 검색 키워드가 담긴 맵
     * @return 검색된 갯수를 반환
     */
    int getTotal(Map<String, Object> map);

    /**
     * 위생점검을 등록하기 위해 가맹점 목록을 조회하는 메서드
     * @return 가맹점 목록
     */
    List<FranchiseVO> getFranchiseList();
}
