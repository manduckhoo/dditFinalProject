package kr.or.onesome.payment.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.payment.mapper.MemberOrderMapper;
import kr.or.onesome.payment.service.MemberOrderService;
import kr.or.onesome.vo.FranchiseVO;
import kr.or.onesome.vo.MemberCartVO;
import kr.or.onesome.vo.PaymentDetailVO;
import kr.or.onesome.vo.PaymentMethodVO;
import kr.or.onesome.vo.PaymentVO;
import kr.or.onesome.vo.RecipeVO;

@Service
public class MemberOrderServiceImpl implements MemberOrderService{

	@Autowired
	MemberOrderMapper memberOrderMapper;

	
	/** 주문된 메뉴를 구성하는 레시피에서 상품의 재고수와 주문한 수를 따져서 주문가능여부 체킹  */
	@Override
	public List<MemberCartVO> cartStockCheck(MemberCartVO memberCartVO){
		return this.memberOrderMapper.cartStockCheck(memberCartVO);
	}

	/** 결제 API 완료 시 주문 테이블에 insert하기 */
	@Override
	public int orderInsert(PaymentVO paymentVO) {
		return this.memberOrderMapper.orderInsert(paymentVO);
	}
	
    /** 결제 API 완료 시 주문 테이블에서 => 주문 상세테이블로 insert하기 */
	@Override
	public int orderDetailInsert(Map<String, Object> map) {
		return this.memberOrderMapper.orderDetailInsert(map);
	}

	/** 주문상세내역들 가져오기 */
	@Override
	public List<PaymentDetailVO> orderDetailList(int pynmNo) {
		return memberOrderMapper.orderDetailList(pynmNo);
	}
	/** 주문상세내역에 가맹점 번호 가져오기 */
	@Override
	public FranchiseVO orderFrcsDetail(int orderFrcsNo) {
		return memberOrderMapper.orderFrcsDetail(orderFrcsNo);
	}
	
	/** 주문상세내역에 주문 번호 가져오기 */
	@Override
	public PaymentVO orderDetail(int pynmNo) {
		return memberOrderMapper.orderDetail(pynmNo);
	}
	
	/** 마이페이지에서 내가 주문한 내역 확인하기 */
	@Override
	public List<PaymentDetailVO> myOrderList(PaymentDetailVO paymentDetailVO) {
		return memberOrderMapper.myOrderList(paymentDetailVO);
	}

	/** 주문 상세로 가기전에 가맹점 재고 떨구기 */
	@Override
	public void frcsInventoryUpdate(int pynmNo) {
		memberOrderMapper.frcsInventoryUpdate(pynmNo);
	}

	/** 주문한 메뉴들만 장바구니에서 삭제하기 */
	@Override
	public void cartOrderListDelete(PaymentDetailVO paymentDetailVO) {
		memberOrderMapper.cartOrderListDelete(paymentDetailVO);
	}

	/** 주문내역 취소 */
	@Override
	public int orderListCancel(PaymentDetailVO paymentDetailVO) {
		return memberOrderMapper.orderListCancel(paymentDetailVO);
	}

}
