package kr.or.onesome.frcsorder.mapper;

import kr.or.onesome.frcsorder.vo.FrcsOrderDetailVO;
import kr.or.onesome.frcsorder.vo.FrcsOrderVO;
import kr.or.onesome.vo.FranchiseVO;

import java.util.List;
import java.util.Map;

public interface FrcsOrderMapper {

    int frcsOrder(FrcsOrderVO frcsOrderVO);

    FrcsOrderVO frcsOrderDetailList(int frcsOrderNo);

    int deleteproduct(FrcsOrderDetailVO frcsOrderDetailVO);

    int frcsOrderDetailLength(FrcsOrderDetailVO frcsOrderDetailVO);

    int deleteFrcsOrder(FrcsOrderDetailVO frcsOrderDetailVO);

    int cancelFrcsOrder(FrcsOrderVO frcsOrderVO);

    int cancelFrcsOrderMaster(FrcsOrderVO frcsOrderVO);

    List<FrcsOrderVO> frcsOrderList(int crrFrcsNo);

    int updateFrcsDetailOrder(FrcsOrderVO frcsOrderVO);

    int updateFrcsOrder(FrcsOrderVO frcsOrderVO);

    FrcsOrderVO displayFrcsOrderInvoice(Map<String, Object> frcsOrderMap);

    FranchiseVO franchiseInfo(Map<String, Object> frcsOrderMap);
}
