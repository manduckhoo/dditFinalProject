package kr.or.onesome.hqOrder.mapper;

import kr.or.onesome.hqOrder.vo.HqDetailOrderVO;
import kr.or.onesome.hqOrder.vo.HqOrderVO;

import java.util.List;
import java.util.Map;

public interface HqOrderMapper {

    //발주 신청서 최초 작성 시작
    int insertHqOrder(HqOrderVO hqOrderVO);

    //발주 번호에 따른 주문서 작성 페이지 조회
    HqOrderVO selectHqOrder(int hqOrderNo);

    //발주 상품에 따라 거래처 정보 가져오기
    HqDetailOrderVO hqOrderAcntInfo(int hqOrderNo);

    //발주 상세에서 항목 삭제
    int deleteHqOrderDetail(HqDetailOrderVO hqDetailOrderVO);

    //발주 상세의 제품이 몇개 있는지 확인 -- 만약에 1개만 남아있고, 그마저도 삭제한다면 hqOrderNo도 같이 삭제함
    int hqOrderDetailLength(HqDetailOrderVO hqDetailOrderVO);

    //hqOrder 삭제
    int deleteHqOrder(HqDetailOrderVO hqDetailOrderVO);

    //수량 선택하는 화면에서 '취소'버튼 클릭 시 발주 자체가 취소됨 -- 자식 테이블 먼저 데이터 삭제한다.
    int cancelHqOrder(HqOrderVO hqOrderVO);

    //수량 선택하는 화면에서 '취소'버튼 클릭 시 발주 자체가 취소됨 -- 자식 테이블 삭제 후 부모 테이블의 데이터 삭제
    int cancelHqOrderMaster(HqOrderVO hqOrderVO);

    //수량 선택 후 hqDetailOrder에 수량, 주문금액 업데이트
    int updateHqDetailOrder(HqOrderVO hqOrderVO);

    //수량 선택 후 hqOrder에 최종 주문 금액, 발주 날짜 업데이트
    int updateHqOrder(HqOrderVO hqOrderVO);

    //발주 목록 조회
    List<HqOrderVO> hqOrderInvoiceList();

    //발주 목록 조회 - 목록 선택했을 때 상세보기가 노출됨
    HqOrderVO displayHqOrderInvoice(Map<String, Object> hqDetailOrderMap);

    //발주 반려 버튼 클릭 시 상태코드 업데이트
    int hqOrderFail(HqOrderVO hqOrderVO);

    //발주 승인 버튼 클릭 시 상태코드 업데이트 + 제품 보유 수량 증가
    int hqOrderComplete(HqOrderVO hqDetailOrderVO);
}
