package kr.or.onesome.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FranchiseEmployeeVO {

	private int frcsEmpNo;			// 가맹점 직원 정보
	private int frcsNo;				// 가맹점 번호
	private String frcsEmpNm;		// 가맹점 직원명
	private String frcsEmpBrdt;		// 직원 생년월일
	private String frcsEmpTel;		// 직원 연락처
	private int frcsEmpSal;			// 직원 급여
	private String frcsEmpWkstCd;	// 현재 근무 여부  --> 공통코드
	private String frcsEmpTypeCd;	// 근무타입 공통코드 --> 공통코드
	private String frcsEmpStrTime;	// 직원 근무 시작 시간
	private String frcsEmpEndTime;	// 직원 근무 종료 시간
	private int atchFileNo;			// 첨부파일 번호
	
	//가맹점 가져오기
	private List<FranchiseVO> franchiseVOList;
	
	//공통 코드 정보 가져오기
	private List<ComCodeInfoVO> comCodeInfoVOList;
	
	//공통 상세 코드 정보 가져오기
	private List<ComDetCodeInfoVO> comDetCodeInfoVOList;
	
	//공통 상세 코드 정보 가져오기
	private List<ComDetCodeInfoVO> comDetCodeInfoVOList2;
	
	//첨부파일
	private MultipartFile[] uploadFile;
	
	//첨부파일
	private List<AtchFileVO> atchFileVOList;
	
	//근태?를 가져오라?
	private List<AttendanceManagementVO> attendanceManagementVOList;
	//그리고 insert를 join으로 때린다?
	
	
	//xml에서 타입으로 엮어서 collection으로 가져오기
	
}
