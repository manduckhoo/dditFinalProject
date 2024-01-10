package kr.or.onesome.atchFile.controller;

import kr.or.onesome.atchFile.service.AtchFileService;
import kr.or.onesome.vo.AtchFileVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.UnsupportedEncodingException;
import java.util.List;

@Slf4j
@Controller
public class FileController {

	@Autowired
	String uploadFolder;

	@Autowired
	AtchFileService fileService;

	// 파일 업로드 파일객체들, 사업장 기본키 데이터
	public List<AtchFileVO> uploadFile(MultipartFile[] uploadFile, String folder) {

		List<AtchFileVO> fileVOList = fileService.uploadFile(uploadFile, folder);

		return fileVOList;
	}

	// 파일 다운로드
	// 요청URI: /download?fileName=/2023/11/21/fdsaffds(UUID)_개똥이.jpg
	// 요청파라미터: /2023/11/21/fdsaffds(UUID)_개똥이.jpg
	// 요청방식: get
	// springframework.core.io 의 Resource 임!!
//	@RequestMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> downloadFile(String fileName) {
		log.info("downloadFile -> fileName : " + fileName);
		// core.io
		// 파일의 경로(.../upload) + 파일명
		// 요청: 서버 경로를 찾아들어감 (resource)
		// 응답: header영역에 첨부파일을 보냄 (spring에서 지원함)
		Resource resource = new FileSystemResource(uploadFolder + fileName);
		log.info("downloadFile -> path: " + (uploadFolder + fileName));

		String resourceName = resource.getFilename();
		log.info("resourceName: " + resourceName);

		// springframework.http
		// 헤더를 통해서 파일을 보냄
		HttpHeaders headers = new HttpHeaders();
		// 파일명이 한글일 때 한글처리
		// UTF-8 을 ISO로 한글처리
		try {
			headers.add("Content-Disposition",
					"attachment;fileName=" + new String(resourceName.getBytes("UTF-8"), "ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			log.error(e.getMessage());
		}

		// resource: 파일 / header: 파일명 등 정보 / HttpStatus.OK: 상태 200(성공)
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
}
