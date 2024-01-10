package kr.or.onesome.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class OjtVO {
	private int ojtNo;
	private int ojtSn;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date ojtStrTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date ojtEndTime;
	private String ojtType;
	private String ojtYn;
	private int ojtScore;
	private String ojtDesc;
	private String ojtTitle;
	private int atchFileNo;
	private String ojtPurpose;
	private String ojtLecturer;
	private String ojtSubTitle;
	
	// 공통코드
	private ComDetCodeInfoVO comDetCodeInfoVO;
	
	// 파일 업로드
	private MultipartFile[] uploadFile;
	
	// 쌉테치파일
	private List<AtchFileVO> atchFileVOList;
}
