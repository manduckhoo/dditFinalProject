package kr.or.onesome.cart.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.cart.mapper.MemberCartMapper;
import kr.or.onesome.cart.service.MemberCartService;
import kr.or.onesome.vo.FranchiseVO;
import kr.or.onesome.vo.MemberCartVO;
import kr.or.onesome.vo.MemberMenuVO;
import kr.or.onesome.vo.MemberVO;
import kr.or.onesome.vo.PaymentDetailVO;
import kr.or.onesome.vo.PaymentMethodVO;

/** 일반회원이 장바구니를 이용하기 위한 서비스 클래스
 * @author  김형민
 * @since   2023.12.09
 * @version 1.0
 * @see
 * 
 * <pre>
 * << 개정이력(Modification Information) >>
 *  수정일		   수정자	  		수정 내용
 *  ----------	 ----------- 	--------------------------------
 *  2023.12.09       김형민            		최초 생성
 * </pre>
 */

@Service
public class MemberCartServiceImpl implements MemberCartService{

	@Autowired
	MemberCartMapper memberCartMapper;

	/** 현재 장바구니에 "음료" 메뉴가 있는지 없는지 찾기 */
	@Override
	public int findCartMenu(MemberMenuVO memberMenuVO) {
		return this.memberCartMapper.findCartMenu(memberMenuVO);
	}

	/** 현재 장바구니에 "푸드, 상품" 메뉴가 있는지 없는지 찾기 */
	@Override
	public int findCartMenu2(MemberMenuVO memberMenuVO) {
		return this.memberCartMapper.findCartMenu2(memberMenuVO);
	}
	
	/** 장바구니에 "음료" 메뉴 추가하기 */
	@Override
	public void cartInsert(MemberCartVO memberCartVO) {
		this.memberCartMapper.cartInsert(memberCartVO);
	}
	/** 장바구니에 "푸드, 상품" 메뉴 추가하기*/
	@Override
	public void cartInsert2(MemberCartVO memberCartVO) {
		this.memberCartMapper.cartInsert2(memberCartVO);
	}

	/** 장바구니 "음료" 수량 변경 */
	@Override
	public void cartUpdate(MemberCartVO memberCartVO) {
		this.memberCartMapper.cartUpdate(memberCartVO);
	}

	/** 장바구니 "푸드, 상품" 수량 변경 */
	@Override
	public void cartUpdate2(MemberCartVO memberCartVO) {
		this.memberCartMapper.cartUpdate2(memberCartVO);
	}
	
	/** 장바구니 내역 조회 */
	@Override
	public List<MemberCartVO> cartList(MemberCartVO memberCartVO) {
		return this.memberCartMapper.cartList(memberCartVO);
	}

	/** 장바구니 내역 조회 2(오프 캔버스) */
	@Override
    public List<Map<String,Object>> cartList2(MemberVO memberVO) {
       return memberCartMapper.cartList2(memberVO);
    }

	/** 장바구니 내역 삭제 */
	@Override
	public int cartListDelete(MemberCartVO memberCartVO) {
		return memberCartMapper.cartListDelete(memberCartVO);
	}

	/** 가맹점 정보 가져오기 */
	@Override
	public List<FranchiseVO> franchiseVOList(FranchiseVO franchiseVO) {
		return memberCartMapper.franchiseVOList(franchiseVO);
	}

	/** 결제수단 ID 가져오기 */
	@Override
	public List<PaymentMethodVO> selectPayId() {
		return memberCartMapper.selectPayId();
	}

}
