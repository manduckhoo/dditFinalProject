package kr.or.onesome.frcsinventory.service.impl;

import kr.or.onesome.frcsinventory.mapper.FrcsInventoryMapper;
import kr.or.onesome.frcsinventory.service.FrcsInventoryService;
import kr.or.onesome.frcsinventory.vo.FrcsInventoryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class FrcsInventoryServiceImpl implements FrcsInventoryService {

    @Autowired
    FrcsInventoryMapper frcsInventoryMapper;

    @Override
    public List<FrcsInventoryVO> frcsInventoryList(int crrFrcsNo) {
        return this.frcsInventoryMapper.frcsInventoryList(crrFrcsNo);
    }

    @Override
    public FrcsInventoryVO productDetail(Map<String, Object> frcsProductMap) {
        return frcsInventoryMapper.productDetail(frcsProductMap);
    }

    @Override
    public int inventoryUpdate(int crrFrcsNo) {
        return frcsInventoryMapper.inventoryUpdate(crrFrcsNo);
    }

    @Override
    public int autoOrderUpdate(FrcsInventoryVO frcsInventoryVO) {
        return frcsInventoryMapper.autoOrderUpdate(frcsInventoryVO);
    }

    @Override
    public int modifyInventoryCnt(FrcsInventoryVO frcsInventoryVO) {
        return frcsInventoryMapper.modifyInventoryCnt(frcsInventoryVO);
    }


}
