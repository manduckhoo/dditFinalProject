package kr.or.onesome.comcode.service.impl;

import kr.or.onesome.comcode.mapper.ComDetCodeMapper;
import kr.or.onesome.comcode.service.ComDetCodeService;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ComDetCodeServiceImpl implements ComDetCodeService {

    @Autowired
    ComDetCodeMapper comDetCodeMapper;

    @Override
    public List<ComDetCodeInfoVO> comDetCodeListByComCode(String comCode) {
        return comDetCodeMapper.comDetCodeListByComCode(comCode);
    }
}
