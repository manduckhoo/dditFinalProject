package kr.or.onesome.product.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import kr.or.onesome.vo.AcntVO;
import kr.or.onesome.vo.AtchFileVO;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import lombok.Data;

@Data
public class ProductVO {
	private int prdctNo;			 // 제품번호
	private String prdctClsfCd;      // 제품분류공통코드
	private String prdctNm;          // 제품명
	private int prdctRcvnAmt;        // 입고 단가
	private String prdctExpln;       // 제품 설명
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prdctPrchsStrtDt;   // 구매 시작일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prdctPrchsEndDt;    // 구매 종료일
	private String prdctDscnYn;      // 단종 여부
	private String allergensYn;      // 알레르기 유발 유무
	private int hqInvenCnt;          // 본사재고수량
	private int hqInvenProperCnt;    // 본사적정수량
	private int acntNo;              // 거래처 번호
	private int atchFileNo;			 // 첨부파일 번호
	
	// 제품 분류 공통코드
	private ComDetCodeInfoVO comDetCodeInfoVO;
	
	// 거래처
	private AcntVO acntVO;
	
	// 첨부파일
	private List<AtchFileVO> atchFileVOList;
	
	// 업로드 파일 경로
	MultipartFile[] uploadFile;
}
