package kr.or.onesome.hqOrder.service;

import kr.or.onesome.hqOrder.vo.HqDetailOrderVO;
import kr.or.onesome.hqOrder.vo.HqOrderVO;

import java.util.List;
import java.util.Map;

public interface HqOrderService {

    int insertHqOrder(HqOrderVO hqOrderVO);

    HqOrderVO selectHqOrder(int hqOrderNo);

    HqDetailOrderVO hqOrderAcntInfo(int hqOrderNo);

    int deleteHqOrderDetail(HqDetailOrderVO hqDetailOrderVO);

    int cancelHqOrder(HqOrderVO hqOrderVO);

    int updateHqDetailOrder(HqOrderVO hqOrderVO);

    List<HqOrderVO> hqOrderInvoiceList();

    HqOrderVO displayHqOrderInvoice(Map<String, Object> hqDetailOrderMap);

    int hqOrderFail(HqOrderVO hqOrderVO);

    int hqOrderComplete(HqOrderVO hqDetailOrderVO);
}
