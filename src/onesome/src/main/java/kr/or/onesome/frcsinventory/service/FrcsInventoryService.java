package kr.or.onesome.frcsinventory.service;

import kr.or.onesome.frcsinventory.vo.FrcsInventoryVO;

import java.util.List;
import java.util.Map;

public interface FrcsInventoryService {

    //재고 목록 조회
    List<FrcsInventoryVO> frcsInventoryList(int crrFrcsNo);

    //제품 정보 조회
    FrcsInventoryVO productDetail(Map<String, Object> frcsProductMap);

    //새로운 제품 업데이트
    int inventoryUpdate(int crrFrcsNo);

    //자동 발주 내용 수정
    int autoOrderUpdate(FrcsInventoryVO frcsInventoryVO);

    //적정 재고수량 수정
    int modifyInventoryCnt(FrcsInventoryVO frcsInventoryVO);
}
