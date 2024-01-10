package kr.or.onesome.publicdues.service;

import kr.or.onesome.publicdues.vo.PublicduesVO;

import java.util.List;
import java.util.Map;

public interface PublicduesService {

    /**
     * 최근 1년간 납부내역을 조회하기 위한 매퍼
     * @param crrFrcsNo 가맹점 번호
     * @return 납부내역
     */
    List<PublicduesVO> oneYearRegistrations(int crrFrcsNo);

    /**
     * 가맹점의 공과금을 수정하기 위한 매퍼
     * @param publicduesVO 공과금 정보가 담긴 VO
     * @return 수정 성공시 1을, 실패시 0을 반환
     */
    int publicduesUpdate(PublicduesVO publicduesVO);

    /**
     * 가맹점의 공과금을 등록하기 위한 매퍼
     * @param publicduesVO 공과금 정보가 담긴 VO
     * @return 등록 성공시 1을, 실패시 0을 반환
     */
    int publicduesRegistration(PublicduesVO publicduesVO);

    /**
     * 가맹점의 공과금을 조회하기 위한 매퍼
     * @param pramMap 가맹점 번호, 조회할 날짜가 담긴 맵
     * @return 해당월의 공과금정보
     */
    PublicduesVO getPublicdues(Map<String, Object> pramMap);
}
