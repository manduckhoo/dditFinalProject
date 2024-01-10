package kr.or.onesome.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PaymentDetailVO extends AtchFileVO{
	private int pynmSeq;		// 주문순번
	private int pynmNo;			// 주문 번호
	private int pynmCnt;		// 수량
	private int menuNo;			// 메뉴 번호
	private String menuNm;		// 메뉴명
	private int menuPrice;		// 메뉴 판매가
    public int atchFileNo;		// 첨부파일 번호
    
    private int memNo;			// 회원 고유 번호
    private int cartSeq;		// 장바구니 카트번호
    public String cartSeqs[];	// 셀렉박스 체크 삭제 시 2개 이상 배열에 담아야함 (2023.12.20 KHM 추가)
    private int cartCnt;		// 장바구니 수량
    private String menuIceYn;	// 메뉴 얼음 유무 선택
    private String menuSize;	// 메뉴 스몰/라지 선택 
	private String streFileNm;	// 사진 원본 파일명
    
	private int frcsNo;			//일단 추가(12.28 지윤)
	private String frcsNm;		//주문내역 확인 시 지점 출력(2024.01.02 KHM)
    
    private int totalCnt;		//쿼리 뽑기용 추가(합계 - 12/29 김지윤)
    private String menu;		//쿼리 뽑기용 추가(메뉴명 - 12/29 김지윤)
    
    private String name;		//쿼리 뽑기용 추가(메뉴명 - 01/05 김지윤)
	private int totalQty;		//쿼리 뽑기용 추가(수량 - 01/05 김지윤)
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pynmDt;		//결제 일시(매출 내역 상세를 위해 추가하였음 - 2023. 12. 23 KJY 추가)
    
    
    //첨부파일 경로
  	private MultipartFile[] uploadFile;
    
}
