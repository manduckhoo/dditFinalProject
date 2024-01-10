package kr.or.onesome.cart.mapper;

import java.util.List;
import java.util.Map;

import kr.or.onesome.vo.FranchiseVO;
import kr.or.onesome.vo.MemberCartVO;
import kr.or.onesome.vo.MemberMenuVO;
import kr.or.onesome.vo.MemberVO;
import kr.or.onesome.vo.PaymentDetailVO;
import kr.or.onesome.vo.PaymentMethodVO;

public interface MemberCartMapper {

	/** 현재 장바구니에 "음료" 메뉴가 있는지 없는지 찾기 */
	int findCartMenu(MemberMenuVO memberMenuVO);

	/** 현재 장바구니에 "푸드, 상품" 메뉴가 있는지 없는지 찾기 */
	int findCartMenu2(MemberMenuVO memberMenuVO);
	
	/** 장바구니에 "음료" 메뉴 추가하기 */
	void cartInsert(MemberCartVO memberCartVO);

	/** 장바구니에 "푸드, 상품" 메뉴 추가하기*/
	void cartInsert2(MemberCartVO memberCartVO);
	
	/** 장바구니 "음료" 수량 변경 */
	void cartUpdate(MemberCartVO memberCartVO);

	/** 장바구니 "푸드, 상품" 수량 변경 */
	void cartUpdate2(MemberCartVO memberCartVO);

	/** 장바구니 내역 조회  */
	List<MemberCartVO> cartList(MemberCartVO memberCartVO);

	/** 장바구니 내역 조회 2(오프 캔버스) */
    public List<Map<String,Object>> cartList2(MemberVO memberVO);

    /** 장바구니 내역 삭제 */
	int cartListDelete(MemberCartVO memberCartVO);

	/** 가맹점 정보 가져오기 */
	List<FranchiseVO> franchiseVOList(FranchiseVO franchiseVO);

	/** 결제수단 ID 가져오기 */
	List<PaymentMethodVO> selectPayId();

}
