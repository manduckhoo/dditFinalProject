package kr.or.onesome.payment.service;

import java.util.List;
import java.util.Map;

import kr.or.onesome.vo.FranchiseVO;
import kr.or.onesome.vo.MemberCartVO;
import kr.or.onesome.vo.PaymentDetailVO;
import kr.or.onesome.vo.PaymentVO;
import kr.or.onesome.vo.RecipeVO;

public interface MemberOrderService {

	/** 주문된 메뉴를 구성하는 레시피에서 상품의 재고수와 주문한 수를 따져서 주문가능여부 체킹  */
	List<MemberCartVO> cartStockCheck(MemberCartVO memberCartVO);

	/** 결제 API 완료 시 주문 테이블에 insert하기 */
	int orderInsert(PaymentVO paymentVO);
	
    /** 결제 API 완료 시 주문 테이블에서 => 주문 상세테이블로 insert하기 */
	int orderDetailInsert(Map<String ,Object> map);
	
	/** 주문상세내역들 가져오기 */
	List<PaymentDetailVO> orderDetailList(int pynmNo);
	
	/** 주문상세내역에 가맹점 번호 가져오기 */
	FranchiseVO orderFrcsDetail(int orderFrcsNo);

	/** 주문상세내역에 주문 번호 가져오기 */
	PaymentVO orderDetail(int pynmNo);

	/** 마이페이지에서 내가 주문한 내역 확인하기 */
	List<PaymentDetailVO> myOrderList(PaymentDetailVO paymentDetailVO);

	/** 주문 상세로 가기전에 가맹점 재고 떨구기 */
	void frcsInventoryUpdate(int pynmNo);

	/** 주문한 메뉴들만 장바구니에서 삭제하기 */
	void cartOrderListDelete(PaymentDetailVO paymentDetailVO);

	/** 주문내역 취소 */
	int orderListCancel(PaymentDetailVO paymentDetailVO);

}
