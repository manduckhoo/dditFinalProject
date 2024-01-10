package kr.or.onesome.hqemp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.onesome.atchFile.service.AtchFileService;
import kr.or.onesome.hqemp.mapper.HqEmpMapper;
import kr.or.onesome.hqemp.vo.HqEmpVO;
import kr.or.onesome.vo.AtchFileVO;

@Service
public class HqEmpServiceImpl implements HqEmpService{
	@Autowired
	private HqEmpMapper hqEmpMapper;
	
	@Autowired
	private AtchFileService atchFileService;
	
	@Override
	public List<HqEmpVO> hqEmpList(Map<String, Object> map) {
		return hqEmpMapper.hqEmpList(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return hqEmpMapper.getTotal(map);
	}

	@Override
	public HqEmpVO hqEmpDetail(int hqEmpNo) {
		return hqEmpMapper.hqEmpDetail(hqEmpNo);
	}

	@Override
	public int regHqEmp(HqEmpVO hqempVO) {
		List<AtchFileVO> atchFileVOList = atchFileService.uploadFile(hqempVO.getUploadFile(), "hqEmp");
			hqempVO.setAtchFileNo(atchFileVOList.get(0).getAtchFileNo());
		
		return hqEmpMapper.regHqEmp(hqempVO);
	}

	@Override
	public int modHqEmp(HqEmpVO hqEmpVO) {
		for(MultipartFile multipartFile : hqEmpVO.getUploadFile()) {
			if(!multipartFile.getOriginalFilename().equals("")) {
				List<AtchFileVO> atchFileVOList = atchFileService.uploadFile(hqEmpVO.getUploadFile(), "hqEmp");
				
				atchFileService.deleteFile(hqEmpVO.getAtchFileNo(), "hqEmp");
				
				hqEmpVO.setAtchFileNo(atchFileVOList.get(0).getAtchFileNo());
			}
		}
		return hqEmpMapper.modHqEmp(hqEmpVO);
	}

	@Override
	public int delHqEmp(HqEmpVO hqEmpVO) {
		
		atchFileService.deleteFile(hqEmpVO.getAtchFileNo(), "hqEmp");
		
		return hqEmpMapper.delHqEmp(hqEmpVO);
	}
}
