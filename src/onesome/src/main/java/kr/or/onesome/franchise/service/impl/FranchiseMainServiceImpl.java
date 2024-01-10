package kr.or.onesome.franchise.service.impl;

import kr.or.onesome.franchise.mapper.FranchiseMainMapper;
import kr.or.onesome.franchise.service.FranchiseMainService;
import kr.or.onesome.vo.PaymentVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class FranchiseMainServiceImpl implements FranchiseMainService {

    @Autowired
    FranchiseMainMapper franchiseMainMapper;

    @Override
    public PaymentVO getOrderDetail(Map<String, Object> paramMap) {
        return franchiseMainMapper.getPendingOrder(paramMap).get(0);
    }

    @Override
    public int changeOrderStatus(Map<String, Object> pramMap) {
        return franchiseMainMapper.changeOrderStatus(pramMap);
    }

    @Override
    public List<PaymentVO> getPendingOrder(Map<String, Object> pramMap) {
        return franchiseMainMapper.getPendingOrder(pramMap);
    }

    @Override
    public List<Map<String, Object>> getWeeklySalesTrend(int crrFrcsNo) {
        return franchiseMainMapper.getWeeklySalesTrend(crrFrcsNo);
    }

    @Override
    public List<Map<String, Object>> getInventoryCntList(int crrFrcsNo) {
        return franchiseMainMapper.getInventoryCntList(crrFrcsNo);
    }

    @Override
    public Map<String, Object> getFrcsMainHeader(int crrFrcsNo) {
        return franchiseMainMapper.getFrcsMainHeader(crrFrcsNo);
    }
}
