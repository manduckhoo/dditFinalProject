package kr.or.onesome.publicdues.service.impl;

import kr.or.onesome.publicdues.mapper.PublicduesMapper;
import kr.or.onesome.publicdues.service.PublicduesService;
import kr.or.onesome.publicdues.vo.PublicduesVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class PublicduesServiceImpl implements PublicduesService {

    @Autowired
    PublicduesMapper publicduesMapper;

    @Override
    public List<PublicduesVO> oneYearRegistrations(int crrFrcsNo) {
        return publicduesMapper.oneYearRegistrations(crrFrcsNo);
    }

    @Transactional
    @Override
    public int publicduesUpdate(PublicduesVO publicduesVO) {
        return publicduesMapper.publicduesUpdate(publicduesVO);
    }

    @Transactional
    @Override
    public int publicduesRegistration(PublicduesVO publicduesVO) {
        return publicduesMapper.publicduesRegistration(publicduesVO);
    }

    @Override
    public PublicduesVO getPublicdues(Map<String, Object> pramMap) {
        return publicduesMapper.getPublicdues(pramMap);
    }
}
