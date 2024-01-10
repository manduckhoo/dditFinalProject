package kr.or.onesome.hqempedu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.onesome.atchFile.mapper.AtchFileMapper;
import kr.or.onesome.atchFile.service.AtchFileService;
import kr.or.onesome.hqempedu.mapper.HqEmpEduMapper;
import kr.or.onesome.hqempedu.service.HqEmpEduService;
import kr.or.onesome.vo.AtchFileVO;
import kr.or.onesome.vo.OjtVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class HqEmpEduServiceImpl implements HqEmpEduService {

	@Autowired
	private HqEmpEduMapper hqEmpEduMapper;

	@Autowired
	private AtchFileService atchFileService;

	@Autowired
	private AtchFileMapper atchFileMapper;

	@Override
	public List<OjtVO> eduList() {
		return hqEmpEduMapper.eduList();
	}

	@Override
	public OjtVO eduDetail(int ojtNo) {
		return hqEmpEduMapper.eduDetail(ojtNo);
	}

	@Override
	public int addEdu(OjtVO ojtVO) {
		// 파일 업로드
		List<AtchFileVO> fileVOList = atchFileService.uploadFile(ojtVO.getUploadFile(), "hqEmpEdu");

		log.info("List<AtchFileVO> fileVOList : {}", fileVOList.get(0).getAtchFileNo());
		if (fileVOList.size() != 0) {
			ojtVO.setAtchFileNo(fileVOList.get(0).getAtchFileNo());
		}

		return hqEmpEduMapper.addEdu(ojtVO);
	}

	@Override
	public int delEdu(OjtVO ojtVO) {
		atchFileMapper.deleteFile(ojtVO.getAtchFileNo());

		return hqEmpEduMapper.delEdu(ojtVO);
	}

	@Override
	public int updateEdu(OjtVO ojtVO) {
		for(MultipartFile multipartFile : ojtVO.getUploadFile()) {
			if(!multipartFile.getOriginalFilename().equals("")) {
				// 파일 업로드
				List<AtchFileVO> fileVOList = atchFileService.updateUploadFile(ojtVO.getUploadFile(), "hqEmpEdu");
				
				// 파일 삭제
				atchFileService.deleteFile(ojtVO.getAtchFileNo(), "hqEmpEdu");

				log.info("List<AtchFileVO> fileVOList : {}", fileVOList.get(0).getAtchFileNo());
				
				ojtVO.setAtchFileNo(fileVOList.get(0).getAtchFileNo());
			}
		}

		return hqEmpEduMapper.updateEdu(ojtVO);
	}

}
