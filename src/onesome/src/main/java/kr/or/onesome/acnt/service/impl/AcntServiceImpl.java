package kr.or.onesome.acnt.service.impl;

import kr.or.onesome.acnt.mapper.AcntMapper;
import kr.or.onesome.acnt.service.AcntService;
import kr.or.onesome.vo.AcntVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AcntServiceImpl implements AcntService {

    @Autowired
    AcntMapper acntMapper;
    @Override
    public List<AcntVO> acntList() {
        return this.acntMapper.acntList();
    }

    @Override
    public AcntVO selectAjax(Map<String, String> acntMap) {
        return this.acntMapper.selectAjax(acntMap);
    }

    @Override
    public int createAcnt(AcntVO acntVO) {
        return this.acntMapper.createAcnt(acntVO);
    }

    @Override
    public int deleteAcnt(AcntVO acntVO) {
        return this.acntMapper.deleteAcnt(acntVO);
    }

    @Override
    public int modifyAcnt(AcntVO acntVO) {
        return this.acntMapper.modifyAcnt(acntVO);
    }

    @Override
    public List<AcntVO> searchAjax(Map<String, String> acntMap) {
        return this.acntMapper.searchAjax(acntMap);
    }
}
