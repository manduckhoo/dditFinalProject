package kr.or.onesome.royalty.service;

import kr.or.onesome.royalty.vo.RoyaltyVO;

import java.util.List;
import java.util.Map;

public interface RoyaltyService {

    /**
     * 해당월의 모든 가맹점의 청구액을 세팅하기 위한 메서드
     * @param viewDate 청구월
     */
    void updateAllFrcsRoyalty(String viewDate);

    /**
     * 어드민 페이지에서 모든 가맹점의 로열티를 확인하기 위한 메서드
     * @param viewDate 청구월
     * @return 조회된 로열티 리스트
     */
    List<RoyaltyVO> adminRoyaltyList(String viewDate);

    /**
     * 해당월까지의 청구액을 납부처리하기 위한 메서드
     * @param paramMap 가맹점 번호, 청구월이 담긴 맵
     */
    void royaltyPayment(Map<String, Object> paramMap);

    /**
     * 해당월의 미납금 상세내역을 조회하기 위한 메서드
     * @param paramMap 가맹점 번호, 청구월이 담긴 맵
     * @return 청구월, 미납금액, 납부여부, 납부일이 담긴 맵의 리스트
     */
    List<Map<String, Object>> getNpmntDetail(Map<String, Object> paramMap);

    /**
     * 해당월의 제품구입비 상세내역을 조회하기 위한 메서드
     * @param paramMap 가맹점 번호, 청구월이 담긴 맵
     * @return 제품명, 수량, 가격이 담긴 맵의 리스트
     */
    List<Map<String, Object>> getOrderDetail(Map<String, Object> paramMap);

    /**
     * 해당월의 매출액, 로열티를 조회하기 위한 메서드
     * @param paramMap 가맹점 번호, 청구월이 담긴 맵
     * @return 매출액과 로열티가 담긴 맵
     */
    Map<String, Object> getRoyaltyDetail(Map<String, Object> paramMap);

    /**
     * 가맹점의 해당월 청구액을 세팅하고 조회하기 위한 메서드
     * @param map 가맹점 번호, 청구월이 담긴 맵
     * @return 조회된 청구액
     */
    RoyaltyVO setAndGetRoyalty(Map<String, Object> map);
}
