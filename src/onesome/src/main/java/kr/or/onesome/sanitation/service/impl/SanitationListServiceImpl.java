package kr.or.onesome.sanitation.service.impl;

import kr.or.onesome.sanitation.mapper.SanitationListMapper;
import kr.or.onesome.sanitation.service.SanitationListService;
import kr.or.onesome.sanitation.vo.SanitationCheckManagementVO;
import kr.or.onesome.sanitation.vo.SanitationListVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class SanitationListServiceImpl implements SanitationListService {

    @Autowired
    SanitationListMapper sanitationListMapper;

    @Override
    public int sanitationRegistration(SanitationListVO sanitationListVO) {
        return sanitationListMapper.sanitationRegistration(sanitationListVO);
    }

    @Override
    public List<SanitationListVO> getFrcsSanitationListByDate(SanitationCheckManagementVO map) {
        return sanitationListMapper.getFrcsSanitationListByDate(map);
    }

    @Override
    public List<SanitationListVO> getSanitationListByFrcsNo(Map<String, Object> map) {
        return sanitationListMapper.getSanitationListByFrcsNo(map);
    }

    @Override
    public int getTotal(Map<String, Object> map) {
        return sanitationListMapper.getTotal(map);
    }

    @Override
    public String getFranchiseName(int crrFrcsNo) {
        return sanitationListMapper.getFranchiseName(crrFrcsNo);
    }
}
