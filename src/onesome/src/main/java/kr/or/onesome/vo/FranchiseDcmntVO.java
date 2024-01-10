package kr.or.onesome.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FranchiseDcmntVO {

	private String dcmntTypeCd;		//서류타입 공통코드
	private int frcsEmpNo;			//가맹점 직원번호
	private int frcsNo;				//가맹점 번호
	private int atchFileNo;			//첨부파일 번호(서류)
	
	//첨부파일
	private MultipartFile[] uploadFile;
	
	//첨부파일
	private List<AtchFileVO> atchFileVOList;
}
