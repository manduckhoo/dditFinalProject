package kr.or.onesome.frcsordermanage.mapper;


import kr.or.onesome.frcsorder.vo.FrcsOrderDetailVO;
import kr.or.onesome.frcsorder.vo.FrcsOrderVO;

import java.util.List;

public interface FrcsOrderManageMapper {

    //가맹점 주문 관리 목록
    List<FrcsOrderVO> frcsOrderList();

    //가맹점 주문 관리 목록에서 반려 버튼
    int frcsOrderManageCancel(FrcsOrderVO frcsOrderVO);

    //가매점 주문관리 목록에서 승인 버튼 : 상태코드 확인
    String confirmTypeCd(FrcsOrderVO frcsOrderVO);

    //가맹점 주문 관리 목록에서 승인 버튼
    int frcsOrderManageSubmit(FrcsOrderVO frcsOrderVO);

    //가맹점 주문 관리 목록에서 승인 버튼 눌렀을 때, 가맹점 재고 수량 증가
    int frcsOrderManageFrcsPrdctPlus(FrcsOrderVO frcsOrderVO);

    //가맹점 주문 관리 목록에서 승인 버튼 눌렀을 때, 본사 재고 수량 감소
    int frcsOrderManageAdminPrdctMinus(FrcsOrderVO frcsOrderVO);

}
