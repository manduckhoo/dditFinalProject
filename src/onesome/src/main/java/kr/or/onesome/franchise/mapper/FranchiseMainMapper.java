package kr.or.onesome.franchise.mapper;

import kr.or.onesome.vo.PaymentVO;

import java.util.List;
import java.util.Map;

public interface FranchiseMainMapper {

    /**
     * 대기중인 메뉴를 준비완료 상태로 변경하기 위한 매퍼
     * @param pramMap 현재 가맹점 번호와 주문번호가 담긴 맵
     * @return 변경 성공시 1을 실패시 0을 반환
     */
    int changeOrderStatus(Map<String, Object> pramMap);

    /**
     * 대기중인 주문 목록을 조회하기 위한 매퍼
     * @param pramMap 현재 가맹점 번호가 담긴 맵
     * @return 대기중인 주문 목록
     */
    List<PaymentVO> getPendingOrder(Map<String, Object> pramMap);

    /**
     * 가맹점의 일주일간 매출액 정보를 가져오기 위한 매퍼
     * @param crrFrcsNo 현재 가맹점 번호
     * @return 일주일간의 매출 정보
     */
    List<Map<String, Object>> getWeeklySalesTrend(int crrFrcsNo);

    /**
     * 가맹점의 재고중 적정 재고량보다 부족한 제품들을 조회하기 위한 매퍼
     * @param crrFrcsNo 현재 가맹점 번호
     * @return 조회된 제품목록
     */
    List<Map<String, Object>> getInventoryCntList(int crrFrcsNo);

    /**
     * 가맹점 메인페이지의 주문건수, 매출, 처리중 발주건, 미확인 공문을
     * 조회하기 위한 매퍼
     * @param crrFrcsNo 현재 가맹점 번호
     * @return 주문건수, 매출, 처리중 발주건, 미확인 공문이 담긴 맵
     */
    Map<String, Object> getFrcsMainHeader(int crrFrcsNo);
}
