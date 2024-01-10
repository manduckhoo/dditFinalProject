package kr.or.onesome.frcsorder.service;

import kr.or.onesome.frcsorder.vo.FrcsOrderDetailVO;
import kr.or.onesome.frcsorder.vo.FrcsOrderVO;
import kr.or.onesome.vo.FranchiseVO;

import java.util.List;
import java.util.Map;

public interface FrcsOrderService {

    //가맹점 발주 신청 시작
    int frcsOrder(FrcsOrderVO frcsOrderVO);

    //가맹점 발주 수량 선택 화면
    FrcsOrderVO frcsOrderDetailList(int frcsOrderNo);

    //발주 수량 선택 화면에서 상품 한개 삭제
    int deleteproduct(FrcsOrderDetailVO frcsOrderDetailVO);

    //발주 수량 선택 화면 - 취소 버튼
    int cancelFrcsOrder(FrcsOrderVO frcsOrderVO);

    //발주 신청서 목록 조회
    List<FrcsOrderVO> frcsOrderList(int crrFrcsNo);

    //발주 신청
    int updateFrcsDetailOrder(FrcsOrderVO frcsOrderVO);

    //발주 신청서 목록 보여주기
    FrcsOrderVO displayFrcsOrderInvoice(Map<String, Object> frcsOrderMap);

    //가맹점 정보 가져오기
    FranchiseVO franchiseInfo(Map<String, Object> frcsOrderMap);
}
