package kr.or.onesome.royalty.service.impl;

import kr.or.onesome.royalty.mapper.RoyaltyMapper;
import kr.or.onesome.royalty.service.RoyaltyService;
import kr.or.onesome.royalty.vo.RoyaltyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoyaltyServiceImpl implements RoyaltyService {

    @Autowired
    RoyaltyMapper royaltyMapper;

    @Transactional
    @Override
    public void updateAllFrcsRoyalty(String viewDate) {

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("viewDate", viewDate);

        //폐업하지 않은 가맹점 번호를 조회하여 반복 세팅
        for (Integer frcsNo : royaltyMapper.getNotClosedFrcsNo()) {
            paramMap.put("crrFrcsNo", frcsNo);
            royaltyMapper.settingRoyalty(paramMap);
        }

    }

    @Override
    public List<RoyaltyVO> adminRoyaltyList(String viewDate) {
        return royaltyMapper.adminRoyaltyList(viewDate);
    }

    @Override
    public void royaltyPayment(Map<String, Object> paramMap) {
        royaltyMapper.royaltyPayment(paramMap);
    }

    @Override
    public List<Map<String, Object>> getNpmntDetail(Map<String, Object> paramMap) {
        return royaltyMapper.getNpmntDetail(paramMap);
    }

    @Override
    public List<Map<String, Object>> getOrderDetail(Map<String, Object> paramMap) {
        return royaltyMapper.getOrderDetail(paramMap);
    }

    @Override
    public Map<String, Object> getRoyaltyDetail(Map<String, Object> paramMap) {
        return royaltyMapper.getRoyaltyDetail(paramMap);
    }

    @Transactional
    @Override
    public RoyaltyVO setAndGetRoyalty(Map<String, Object> map) {
        //청구액 세팅
        royaltyMapper.settingRoyalty(map);
        //청구액 조회 및 반환
        return royaltyMapper.getRoyaltyByFrcsAndDate(map);
    }
}
