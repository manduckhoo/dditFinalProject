package kr.or.onesome.wish.service;

import java.util.List;

import kr.or.onesome.vo.MemberMenuVO;
import kr.or.onesome.vo.MemberWishVO;

public interface MemberWishService {
	public int wishListInsertCheck(MemberWishVO memberWishVO);
	
	/**
	 * 위시리스트에 메뉴를 담는 메서드
	 * @param memberMenuVO
	 * @return
	 */
	public int wishListInsert(MemberWishVO memberWishVO);
	
	/**
	 * 위시리스트 조회
	 * @return
	 */
	public List<MemberWishVO> wishList(MemberWishVO memberWishVO);

	
	/**
	 * 위시리스트 삭제
	 * @param menuNo
	 * @return
	 */
	public int wishListDelete(MemberWishVO memberWishVO);

}
