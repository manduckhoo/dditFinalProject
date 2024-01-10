package kr.or.onesome.frcsorder.service.impl;

import kr.or.onesome.frcsorder.mapper.FrcsOrderMapper;
import kr.or.onesome.frcsorder.service.FrcsOrderService;
import kr.or.onesome.frcsorder.vo.FrcsOrderDetailVO;
import kr.or.onesome.frcsorder.vo.FrcsOrderVO;
import kr.or.onesome.vo.FranchiseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class FrcsOrderServiceImpl implements FrcsOrderService {

    @Autowired
    FrcsOrderMapper frcsOrderMapper;

    @Override
    public int frcsOrder(FrcsOrderVO frcsOrderVO) {
        return this.frcsOrderMapper.frcsOrder(frcsOrderVO);
    }

    @Override
    public FrcsOrderVO frcsOrderDetailList(int frcsOrderNo) {
        return this.frcsOrderMapper.frcsOrderDetailList(frcsOrderNo);
    }

    @Override
    public int deleteproduct(FrcsOrderDetailVO frcsOrderDetailVO) {

        int cnt = 0;

        if (this.frcsOrderMapper.frcsOrderDetailLength(frcsOrderDetailVO) == 1){
            cnt += this.frcsOrderMapper.deleteproduct(frcsOrderDetailVO);
            cnt += this.frcsOrderMapper.deleteFrcsOrder(frcsOrderDetailVO);
        } else {
            cnt += this.frcsOrderMapper.deleteproduct(frcsOrderDetailVO);
        }

        return cnt;

    }

    @Override
    public int cancelFrcsOrder(FrcsOrderVO frcsOrderVO) {

        int cnt = 0;

        cnt += frcsOrderMapper.cancelFrcsOrder(frcsOrderVO);
        cnt += frcsOrderMapper.cancelFrcsOrderMaster(frcsOrderVO);

        return cnt;
    }

    @Override
    public List<FrcsOrderVO> frcsOrderList(int crrFrcsNo) {
        return frcsOrderMapper.frcsOrderList(crrFrcsNo);
    }

    @Override
    public int updateFrcsDetailOrder(FrcsOrderVO frcsOrderVO) {

        int cnt=0;

        cnt += frcsOrderMapper.updateFrcsDetailOrder(frcsOrderVO);
        cnt += frcsOrderMapper.updateFrcsOrder(frcsOrderVO);

        return cnt;
    }

    @Override
    public FrcsOrderVO displayFrcsOrderInvoice(Map<String, Object> frcsOrderMap) {
        return frcsOrderMapper.displayFrcsOrderInvoice(frcsOrderMap);
    }

    @Override
    public FranchiseVO franchiseInfo(Map<String, Object> frcsOrderMap) {
        return frcsOrderMapper.franchiseInfo(frcsOrderMap);
    }

}
