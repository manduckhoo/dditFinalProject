package kr.or.onesome.frcsinventory.mapper;

import kr.or.onesome.frcsinventory.vo.FrcsInventoryVO;
import kr.or.onesome.product.vo.ProductVO;

import java.util.List;
import java.util.Map;

public interface FrcsInventoryMapper {

    //재고 목록 조회
    List<FrcsInventoryVO> frcsInventoryList(int crrFrcsNo);

    //제품 정보 조회 시작
    FrcsInventoryVO productDetail(Map<String, Object> frcsProductMap);

    //새로운 제품 업데이트
   int inventoryUpdate(int crrFrcsNo);

    int autoOrderUpdate(FrcsInventoryVO frcsInventoryVO);

    //적정 재고 수량 수정
    int modifyInventoryCnt(FrcsInventoryVO frcsInventoryVO);
}
