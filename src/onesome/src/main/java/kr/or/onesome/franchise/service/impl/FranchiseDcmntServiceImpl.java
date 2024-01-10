package kr.or.onesome.franchise.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.onesome.atchFile.mapper.AtchFileMapper;
import kr.or.onesome.franchise.mapper.FranchiseDcmntMapper;
import kr.or.onesome.franchise.mapper.FranchiseEmployeeMapper;
import kr.or.onesome.franchise.service.FranchiseDcmntService;
import kr.or.onesome.vo.AtchFileVO;
import kr.or.onesome.vo.FranchiseDcmntVO;
import lombok.extern.slf4j.Slf4j;

//여기서 파일 업로드를 불러가야해?
@Slf4j
@Service
public class FranchiseDcmntServiceImpl implements FranchiseDcmntService {

	@Autowired
	FranchiseDcmntMapper franchiseDcmntMapper;

	// 첨부파일
	@Autowired
	AtchFileMapper atchFileMapper;

	@Autowired
	FranchiseEmployeeMapper franchiseEmployeeMapper;

	// 직원 서류 등록하기
	@Override
	public int insertDcmnt(FranchiseDcmntVO franchiseDcmntVO) {

		// 1) 서류 첨부파일 등록
		MultipartFile[] uploadFile = franchiseDcmntVO.getUploadFile();

		List<AtchFileVO> fileVOList = uploadFile(uploadFile, franchiseDcmntVO.getFrcsEmpNo());
		log.info("fileVOList===>()" + fileVOList);

		franchiseDcmntVO.setAtchFileNo(fileVOList.get(0).getAtchFileNo()); // 첨부파일 번호 시퀀스 각 들어가는거 어테치파일 넣줘 --- 순번이 복합키
		// return this.franchiseDcmntMapper.insertDcmnt(franchiseDcmntVO);

		int result = this.franchiseDcmntMapper.insertDcmnt(franchiseDcmntVO);

		return result;
	}

	// 파일처리 메소드
	public List<AtchFileVO> uploadFile(MultipartFile[] uploadFile, int frcsEmpNo) {

		List<AtchFileVO> fileVOList = new ArrayList<AtchFileVO>();

		// 파일 업로드 될 경로
		String uploadFolder = "E:\\finalProj\\finalProj\\src\\onesome\\src\\main\\webapp\\resources\\upload\\frcsEmpDcmnt";
		String uploadFileName = "";
		log.info("uploadFile -> uploadFolder : " + uploadFolder);

		int result = 0;

		// 연월일 폴더 만들기 시작/////////////////////
		// , : \\
		// ...\\upload\\2023\\10\\31
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("uploadPath : " + uploadPath);

		// 만약 연/월/일 해당 폴더가 없으면 생성
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// 연월일 폴더 만들기 끝/////////////////////

		// AthchFileNo 생성
		int atchFileNo = atchFileMapper.getAtchFileNo();

		// uploadFile : MultipartFile[] uploadFile
		// uploadFile[0] : MultipartFile 1개
		if (uploadFile[0].getOriginalFilename().length() > 0) {
			// ATCH_FILE_DETAIL 테이블의 데이터를 삭제
			this.franchiseEmployeeMapper.delAtch(frcsEmpNo);

			// 파일객체 배열로부터 파일을 하나씩 꺼내
			for (MultipartFile multipartFile : uploadFile) {
				log.info("=======================");
				log.info("파일명 : " + multipartFile.getOriginalFilename());
				log.info("크기 : " + multipartFile.getSize());
				log.info("MIME타입 : " + multipartFile.getContentType());

				// 파일명
				uploadFileName = multipartFile.getOriginalFilename();

				// 같은날 같은 이미지를 업로드 시 파일 중복 방지 시작//////////////
				// java.util.UUID => 랜덤값 생성
				UUID uuid = UUID.randomUUID(); // 임의의 값을 생성
				// 원래의 파일 이름과 구분하기 위해서 _를 붙임
				uploadFileName = uuid.toString() + "_" + uploadFileName;
				// 같은날 같은 이미지를 업로드 시 파일 중복 방지 끝//////////////

				// File 객체 설계(복사할 대상 경로, 파일명)
				// uploadPath : 연월일 처리된 경로
				// uploadFileName : uuid 처리된 파일명
				File saveFile = new File(uploadPath, uploadFileName);

				try {
					// 파일복사가 일어남
					// 파일객체.transferTo(설계)
					multipartFile.transferTo(saveFile);

					// ATCH_FILE_DETAIL 테이블에 insert
					// ATCH_FILE_ID, FILE_SN, FILE_STRE_COURS, STRE_FILE_NM
					// , ORIGNL_FILE_NM, FILE_EXTSN, FILE_CN, FILE_SIZE
					AtchFileVO atchFileVO = new AtchFileVO();
					FranchiseDcmntVO franchiseDcmntVO = new FranchiseDcmntVO();

					atchFileVO.setAtchFileNo(atchFileNo); //P.K
					atchFileVO.setFileSn(0); //P.K
					atchFileVO.setFileStreCours(uploadPath + "\\" + uploadFileName);
					
					atchFileVO.setStreFileNm(getFolder().replaceAll("\\\\", "/") + "/" + uploadFileName);
					atchFileVO.setOrignlFileNm(multipartFile.getOriginalFilename());
					atchFileVO.setFileExtsn(uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1));
					
					//파일 크기
					atchFileVO.setFileSize(multipartFile.getSize());
					
					log.info("atchFileVO : " + atchFileVO);
					
					//쿼리 실행
					result += this.atchFileMapper.insertAtchFile(atchFileVO);
					
					fileVOList.add(atchFileVO);
				} catch (IllegalStateException | IOException e) {
					log.error(e.getMessage());
				}
			}//end for
		}//end if
		return fileVOList;
	}
	//연/월/일 폴더 생성
	private String getFolder() {
		//2023-10-31형식(format) 지정
		//간단 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//날짜 객체 생성(java.util패키지)
		Date date = new Date();
		//2023-10-31
		String str = sdf.format(date);
		//윈도의 경로는 역슬러시 두개 2023\\10\\31
		return str.replace("-", File.separator);
	}

	//보건증 보여주기
	@Override
	public FranchiseDcmntVO showHealth(FranchiseDcmntVO franchiseDcmntVO) {
		return this.franchiseDcmntMapper.showHealth(franchiseDcmntVO);
	}

	//이력서 보여주기
	@Override
	public FranchiseDcmntVO showCareer(FranchiseDcmntVO franchiseDcmntVO) {
		return this.franchiseDcmntMapper.showCareer(franchiseDcmntVO);
	}
	
}
