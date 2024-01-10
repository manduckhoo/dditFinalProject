package kr.or.onesome.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class FranchiseVO {

	private int frcsNo;								// 가맹점 번호
	private String frcsNm;							// 가맹점 명 
	private String frcsStsCd;						// 운영 상태
	@DateTimeFormat(pattern="yyyy-MM-dd")			
	private Date frcsRgstDt;						// 가맹점 등록 일자 
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date frcsEndDt;							// 가맹점 만료 일자
	private String frcsPostNo;						// 우편 번호
	private String frcsAddr;						// 기본 주소
	private String frcsDtlAddr;						// 상세 주소
	private String frcsBsnsStrtTm;					// 영업 시작 시간
	private String frcsBsnsEndTm;					// 영업 종료 시간
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")			
	private Date frcsCtrtCnclsDt;					// 계약 체결 일자
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date frcsExptCmplDt;					// 예상 완공일
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date frcsFnlInspDt;						// 최종 점검 일자
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date frcsOpngDt;						// 개점 일자
	private int frcsCpctPsn;						// 가맹점 수용 인원
	private int frcsOwnrNo;							// 가맹점주 고유 번호
	private String frcsRegionCd;					// 가맹점 지역 분류 공통 코드
	private String frcsTel;							// 가맹점 전화번호
	private int rnum;								// DB rownum 
	
	private FranchiseOwnerVO franchiseOwnerVO;		// 가맹점주 정보
	private List<PaymentVO> paymentVOList;			// 판매정보
	
	private int rank; // 가맹점 매출 순위를 위함
	private int totalAmtSum; // 가맹점 토탈금액 합계
}
