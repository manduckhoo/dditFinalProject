package kr.or.onesome.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PaymentVO extends AtchFileVO{
	private int pynmNo; 		// 주문번호
	private int memNo;			// 회원 고유번호
	private int frcsNo;			// 가맹점 번호
	private String pynmMthdId;  // 결제수단 ID
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pynmDt;		// 결제 일시(Default : SYSDATE)
	private long pynmTotalAmt;	// 주문 총 금액
	private String setupMenuYn;	// 메뉴 준비완료 여부(Default : N)

	private String yyyymmdd;	//쿼리 뽑아내기 용(일별 구분, 1/4 - 지윤 추가)
	private String yyyymm; 		//쿼리 뽑아내기 용(월별 구분, 12/28 - 지윤 추가)
	private long paymentTotal; 	//쿼리 뽑아내기 용(매출액 합계, 12/28 - 지윤 추가)

	private int totalCnt;		//쿼리 뽑기용 추가(합계 - 12/29 김지윤)
    private String menu;		//쿼리 뽑기용 추가(메뉴명 - 12/29 김지윤)
    
	private String name;		//쿼리 뽑기용 추가(메뉴명 - 01/05 김지윤)
	private int totalQty;		//쿼리 뽑기용 추가(수량 - 01/05 김지윤)
	
	// 배열로 담아야하는 부분들
	private int pynmNos[]; 			// 제품번호 배열 []
	private int cartCnts[];			// 카트 수량 배열 []
	private int menuNos[];			// 메뉴 번호 배열 []
	private String menuNms[];		// 메뉴 명 배열 []
	private int menuPrices[];		// 메뉴 가격 배열 []
	private String menuSizes[];		// 메뉴 사이즈 배열 []
	private String menuIceYns[];	// 메뉴 핫/아이스 배열 []
	private int frcsInvenCnts[];	// 가맹점 재고 배열 []
	private int prdctNos[];			// 제품번호 배열 []
	private int atchFileNos[];		// 파일번호 배열 []

    //첨부파일 경로
  	private MultipartFile[] uploadFile;
  	
  	//주문 : 주문상세 
  	private PaymentDetailVO paymentDetailVO;
  	
  	//주문 : 결제 수단
  	private PaymentMethodVO paymentMethodVO;
  	
  	//주문 : 환불
  	private RefundVO refundVO;
  	
  	//주문 : 메뉴
  	private MemberMenuVO memberMenuVO;
  	
  	//주문 : 가맹점
  	private FranchiseVO franchiseVO;
  	
  	//주문 : 가맹점 리스트
  	List<FranchiseVO> franchiseVOList;

  	//주문 : 장바구니
  	private MemberCartVO memberCartVO;
  	
  	//상세
  	private List<PaymentDetailVO> paymentDetailVOList;
  	
  	private List<MemberVO> memberVOList;
  	
}
