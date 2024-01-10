package kr.or.onesome.franchise.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.onesome.atchFile.mapper.AtchFileMapper;
import kr.or.onesome.franchise.mapper.FranchiseEmployeeMapper;
import kr.or.onesome.franchise.service.FranchiseEmployeeService;
import kr.or.onesome.vo.AtchFileVO;
import kr.or.onesome.vo.AttendanceManagementVO;
import kr.or.onesome.vo.ComCodeInfoVO;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import kr.or.onesome.vo.FranchiseEmployeeVO;
import kr.or.onesome.vo.FranchiseVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@Service
public class FranchiseEmployeeServiceImpl implements FranchiseEmployeeService {

	// 업로드 경로?

	// 첨부파일
	@Autowired
	AtchFileMapper atchFileMapper;

	@Autowired
	FranchiseEmployeeMapper franchiseEmployeeMapper;

	//직원 목록
	@Override
	public List<FranchiseEmployeeVO> list(Map<String, Integer> map) {
		return this.franchiseEmployeeMapper.list(map);
	}

	//직원 상세
	@Override
	public FranchiseEmployeeVO detail(FranchiseEmployeeVO franchiseEmployeeVO) {
		return this.franchiseEmployeeMapper.detail(franchiseEmployeeVO);
	}

	// 직원 등록
	@Override
	public int createPost(FranchiseEmployeeVO franchiseEmployeeVO) {
		// 1) 직원 첨부파일 insert
		MultipartFile[] uploadFile = franchiseEmployeeVO.getUploadFile();
		log.info("@@@@@@@@@@@@@@@@@@TLQKF@@@@@@@@@@@@@@@@@@@@@@@");
		List<AtchFileVO> fileVOList =  uploadFile(uploadFile, franchiseEmployeeVO.getFrcsEmpNo());
		log.info("fileVOList===>()" + fileVOList);
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		//지금 이게 franchiseEmployeeVO에 AtchFileNo를 넣는건데 그걸 atchFileVO에서 AtchFileNo 이걸 가져온다는거잖어 ===> 근데도 0이 들어가 
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		franchiseEmployeeVO.setAtchFileNo(fileVOList.get(0).getAtchFileNo()); //첨부파일 번호 시퀀스 각 들어가는거 어테치파일 넣줘 --- 순번이 복합키

		int result = this.franchiseEmployeeMapper.createPost(franchiseEmployeeVO);
		
		return result;

		// return this.franchiseEmployeeMapper.createPost(franchiseEmployeeVO);
	}

	// 가맹점 가져오기
	@Override
	public List<FranchiseVO> getFranchise() {
		return this.franchiseEmployeeMapper.getFranchise();
	}

	// 근무상태 정보 가져오기
	@Override
	public List<ComDetCodeInfoVO> getCWST() {
		return this.franchiseEmployeeMapper.getCWST();
	}
	
	// 근무 타입 정보 가져오기
	@Override
	public List<ComDetCodeInfoVO> getWKTP() {
		return this.franchiseEmployeeMapper.getWKTP();
	}
	
	
	// 가맹점 직원 정보 수정
	@Override
	public int update(FranchiseEmployeeVO franchiseEmployeeVO) {
		return this.franchiseEmployeeMapper.update(franchiseEmployeeVO);
	}
	
	//가맹점 직원 정보 삭제
	@Override
	public int delete(FranchiseEmployeeVO franchiseEmployeeVO) {
		return this.franchiseEmployeeMapper.delete(franchiseEmployeeVO);
	}

	// 파일처리 메소드
	public List<AtchFileVO> uploadFile(MultipartFile[] uploadFile, int frcsEmpNo) {
		
		List<AtchFileVO> fileVOList = new ArrayList<AtchFileVO>();

		// 파일이 업로드 될 경로
		String uploadFolder = "E:\\finalProj\\finalProj\\src\\onesome\\src\\main\\webapp\\resources\\upload\\frcsEmp";
		String uploadFileName = "";
		log.info("uploadFile->uploadFolder : " + uploadFolder);

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

		//추가했다@@@
		//AtchFileNo 생성
		int atchFileNo = atchFileMapper.getAtchFileNo();
		
		// uploadFile : MultipartFile[] uploadFile
		// uploadFile[0] : MultipartFile 1개
		if (uploadFile[0].getOriginalFilename().length() > 0) {
			// ATCH_FILE_DETAIL 테이블의 데이터를 삭제
			this.franchiseEmployeeMapper.delAtch(frcsEmpNo);

			// 파일객체배열로부터 파일을 하나씩 꺼내보자
			for (MultipartFile multipartFile : uploadFile) {
				log.info("-------------------");
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
					// 파일 복사가 일어남
					// 파일객체.transferTo(설계)
					multipartFile.transferTo(saveFile);

					// 썸네일
					// 이미지인지 체킹
					if (checkImagetype(saveFile)) {// 이미지라면..
						// 설계
						FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
						// 섬네일 생성
						Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
						thumbnail.close();
					}

					// ATCH_FILE_DETAIL 테이블에 insert
					// ATCH_FILE_ID, FILE_SN, FILE_STRE_COURS, STRE_FILE_NM
					// , ORIGNL_FILE_NM, FILE_EXTSN, FILE_CN, FILE_SIZE
					AtchFileVO atchFileVO = new AtchFileVO();
					FranchiseEmployeeVO franchiseEmployeeVO = new FranchiseEmployeeVO();
					//@@추가했당@@@
					//atchFileVO.setAtchFileNo(frcsEmpNo); // P.K
					atchFileVO.setAtchFileNo(atchFileNo); // P.K
					atchFileVO.setFileSn(0); // P.K
					atchFileVO.setFileStreCours(uploadPath + "\\" + uploadFileName);
					// 2023\\10\\31\\safdlkdsfj_개똥이2.jpg
					// getFolder() : 2023\\10\\31
					// uploadFileName : safdlkdsfj_개똥이2.jpg
					// 2023/10/31/safdlkdsfj_개똥이2.jpg
					atchFileVO.setStreFileNm(getFolder().replaceAll("\\\\", "/") + "/" + uploadFileName);
					atchFileVO.setOrignlFileNm(multipartFile.getOriginalFilename());
					atchFileVO.setFileExtsn(uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1));
					//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
					//지금 이게 franchiseEmployeeVO에 AtchFileNo를 넣는건데 그걸 atchFileVO에서 AtchFileNo 이걸 가져온다는거잖어 ===> 근데도 0이 들어가 
					//franchiseEmployeeVO.setAtchFileNo(atchFileVO.getAtchFileNo()); //첨부파일 번호 시퀀스 각 들어가는거 어테치파일 넣줘 --- 순번이 복합키
					//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
					
					//파일 크기
					atchFileVO.setFileSize(multipartFile.getSize());

					log.info("atchFileVO : " + atchFileVO);

					// 쿼리 실행
					result += this.atchFileMapper.insertAtchFile(atchFileVO);
					
					fileVOList.add(atchFileVO);
				} catch (IllegalStateException | IOException e) {
					log.error(e.getMessage());
				}
			} // end for
		} // end if

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
	
	//용량이 큰 파일을 섬네일 처리를 하지 않으면
	//모바일과 같은 환경에서 많은 데이터를 소비해야 하므로
	//이미지의 경우 특별한 경우가 아니면 섬네일을 제작해야 함.
	//섬네일은 이미지만 가능함.
	//이미지 파일의 판단
	private boolean checkImagetype(File file) {
		/* Multipurpose Internet Mail Extensions
		 .jpeg / .jpg(JPEG 이미지)의 MIME 타입 : image/jpeg
		 */
		//MIME 타입을 통해 이미지 여부 확인
		//file.toPath() : 파일 객체를 path객체로 변환
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			log.info("contentType : " + contentType);		
			
			return contentType.startsWith("image");
		} catch (IOException e) {
			log.error(e.getMessage());
		}
		return false;
	}

	//가맹점 직원 근무일정 -- 추가하기
	@Override
	public int addEvent(AttendanceManagementVO event) {
		return this.franchiseEmployeeMapper.addEvent(event);
	}

	//가맹점 직원 근무일정 -- 변경하기
	@Override
	public int updateEvent(AttendanceManagementVO event) {
		return this.franchiseEmployeeMapper.updateEvent(event);
	}

	@Override
	public int deleteEvent(int attndceNo) {
		return this.franchiseEmployeeMapper.deleteEvent(attndceNo);
	}

	//가맹점 직원 근무일정 -- 불러오기
	@Override
	public List<Map<String, Object>> getEvents(AttendanceManagementVO attendanceManagementVO) {
		return this.franchiseEmployeeMapper.getEvents(attendanceManagementVO);
	}
}
