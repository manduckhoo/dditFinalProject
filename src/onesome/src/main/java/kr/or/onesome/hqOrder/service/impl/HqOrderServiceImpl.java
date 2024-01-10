package kr.or.onesome.hqOrder.service.impl;

import kr.or.onesome.hqOrder.mapper.HqOrderMapper;
import kr.or.onesome.hqOrder.service.HqOrderService;
import kr.or.onesome.hqOrder.vo.HqDetailOrderVO;
import kr.or.onesome.hqOrder.vo.HqOrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class HqOrderServiceImpl implements HqOrderService {

    @Autowired
    HqOrderMapper hqOrderMapper;

    @Override
    public int insertHqOrder(HqOrderVO hqOrderVO) {

        return this.hqOrderMapper.insertHqOrder(hqOrderVO);
    }

    @Override
    public HqOrderVO selectHqOrder(int hqOrderNo) {
        return hqOrderMapper.selectHqOrder(hqOrderNo);
    }

    @Override
    public HqDetailOrderVO hqOrderAcntInfo(int hqOrderNo) {
        return hqOrderMapper.hqOrderAcntInfo(hqOrderNo);
    }

    @Override
    public int deleteHqOrderDetail(HqDetailOrderVO hqDetailOrderVO) {

        int cnt = 0;

        if (this.hqOrderMapper.hqOrderDetailLength(hqDetailOrderVO) == 1) {
            cnt += this.hqOrderMapper.deleteHqOrderDetail(hqDetailOrderVO);
            cnt += this.hqOrderMapper.deleteHqOrder(hqDetailOrderVO);
        } else {
            cnt += hqOrderMapper.deleteHqOrderDetail(hqDetailOrderVO);
        }
        return cnt;
    }

    @Override
    public int cancelHqOrder(HqOrderVO hqOrderVO) {
        int cnt = 0;

        cnt += hqOrderMapper.cancelHqOrder(hqOrderVO);
        cnt += hqOrderMapper.cancelHqOrderMaster(hqOrderVO);

        return cnt;
    }

    @Override
    public int updateHqDetailOrder(HqOrderVO hqOrderVO) {

        int cnt=0;

        cnt += hqOrderMapper.updateHqDetailOrder(hqOrderVO);
        cnt += hqOrderMapper.updateHqOrder(hqOrderVO);

        return cnt;
    }

    @Override
    public List<HqOrderVO> hqOrderInvoiceList() {
        return hqOrderMapper.hqOrderInvoiceList();
    }

    @Override
    public HqOrderVO displayHqOrderInvoice(Map<String, Object> hqDetailOrderMap) {
        return hqOrderMapper.displayHqOrderInvoice(hqDetailOrderMap);
    }

    @Override
    public int hqOrderFail(HqOrderVO hqOrderVO) {
        return hqOrderMapper.hqOrderFail(hqOrderVO);
    }

    @Override
    public int hqOrderComplete(HqOrderVO hqOrderVO) {
        return hqOrderMapper.hqOrderComplete(hqOrderVO);
    }

}
