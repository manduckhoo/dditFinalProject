package kr.or.onesome.sanitation.service.impl;

import kr.or.onesome.atchFile.service.AtchFileService;
import kr.or.onesome.sanitation.mapper.SanitationCheckManagementMapper;
import kr.or.onesome.sanitation.service.SanitationCheckManagementService;
import kr.or.onesome.sanitation.vo.SanitationCheckManagementVO;
import kr.or.onesome.vo.AtchFileVO;
import kr.or.onesome.vo.FranchiseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class SanitationCheckManagementServiceImpl implements SanitationCheckManagementService {

    @Autowired
    SanitationCheckManagementMapper sanitationCheckManagementMapper;

    @Autowired
    AtchFileService atchFileService;


    @Override
    public List<SanitationCheckManagementVO> getSanitationCheckManagementByFrcsNo(int crrFrcsNo) {
        return sanitationCheckManagementMapper.getSanitationCheckManagementByFrcsNo(crrFrcsNo);
    }

    @Transactional
    @Override
    public int sanitationDelete(SanitationCheckManagementVO managementVO) {

        //첨부파일 삭제
        atchFileService.deleteFile(managementVO.getAtchFileNo(), "sanitation");

        return sanitationCheckManagementMapper.sanitationDelete(managementVO);
    }

    @Transactional
    @Override
    public int sanitationRegistration(SanitationCheckManagementVO managementVO) {

        //점검표 파일을 저장하고 파일번호를 managementVO에 세팅
        List<AtchFileVO> fileVOList
                = atchFileService.updateUploadFile(managementVO.getUploadFile(), "sanitation");

        managementVO.setAtchFileNo(fileVOList.get(0).getAtchFileNo());

        return sanitationCheckManagementMapper.sanitationRegistration(managementVO);
    }

    @Override
    public List<SanitationCheckManagementVO> adminSanitationList(Map<String, Object> map) {
        return sanitationCheckManagementMapper.adminSanitationList(map);
    }

    @Override
    public int getTotal(Map<String, Object> map) {
        return sanitationCheckManagementMapper.getTotal(map);
    }

    @Override
    public List<FranchiseVO> getFranchiseList() {
        return sanitationCheckManagementMapper.getFranchiseList();
    }
}
