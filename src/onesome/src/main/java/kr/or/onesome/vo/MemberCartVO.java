package kr.or.onesome.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberCartVO extends MemberMenuVO{
	public int cartSeq;				// 카트 PK를 시퀀스로 사용(2023.12.20 KHM) menuNO을 PK로 두면 같은 메뉴에서 핫/아이스/스몰/라지로 나뉠때 같은 메뉴지만 새로 인설트해야하는데 계속 pk중복뜸
 	public int memNo;               // 회원고유번호
    public int menuNo;           	// 메뉴번호
    public int cartCnt;				// 수량
    public String menuIceYn;		// 메뉴 얼음 유무 선택 (2023.12.19 KHM)
    public String menuSize;			// 메뉴 스몰/라지 선택 (2023.12.19 KHM)
    
    //배열로 담아야하는 부분들
    public String cartSeqs[];		// 셀렉박스 체크 삭제 시 2개 이상 배열에 담아야함 (2023.12.20 KHM)
    private int cartCnts[];			// 카트 수량 배열 []
    private int menuNos[];			// 메뉴 번호 배열 []
    private int menuPrices[];		// 가격 배열 []
	private String menuSizes[];		// 메뉴 사이즈 배열 []
	private String menuIceYns[];	// 메뉴 핫/아이스 배열 []
	private int frcsInvenCnts[];	// 가맹점 재고 배열 []
	private int prdctNos[];			// 제품번호 배열 []
	
	private int frcsNo;			// 가맹점 번호 가져오려면 넣어야할듯(2023.12.27 KHM)
	
	private String stockYn;		//주문된 메뉴를 구성하는 레시피에서 상품의 재고수와 주문한 수를 따져서 주문가능여부 체킹(파라미터 : 메뉴번호, 장바구니 수량, 가맹점 번호)
	
	// private String ctgryDetailId;   // 장바구니 음료,푸드,상품 분기처리를 위한 상세 카테고리 ID 추가(2023.12.25 KHM)
	
    // 첨부파일 경로
  	private MultipartFile[] uploadFile;
  	
  	// 레시피 VO (2023.12.27 KHM)
  	private RecipeVO recipeVO;
  	
}

