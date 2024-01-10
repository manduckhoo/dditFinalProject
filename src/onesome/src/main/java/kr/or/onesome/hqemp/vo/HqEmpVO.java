package kr.or.onesome.hqemp.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import kr.or.onesome.vo.AtchFileVO;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import lombok.Data;

@Data
public class HqEmpVO {
	private int hqEmpNo;
	private String hqCd;
	private String hqEmpNm;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date hqEmpBrdt;
	private int hqEmpSal;
	private String hqEmpTel;
	private String hqEmpTaskCd;
	private String hqWkplCd;
	private String hqPstnCd;
	private String hqDeptCd;
	private String hqEmpRemk; // 비고, 특이사항, 기타사항,,,
	private String hqEmpQuitYn;
	private int atchFileNo;
	
	private ComDetCodeInfoVO comDetCodeInfoVO;
	
	private MultipartFile[] uploadFile;
	
	private List<AtchFileVO> atchFileVOList;
}

