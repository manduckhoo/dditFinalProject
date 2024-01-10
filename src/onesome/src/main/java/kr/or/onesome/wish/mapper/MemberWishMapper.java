package kr.or.onesome.wish.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.onesome.vo.MemberMenuVO;
import kr.or.onesome.vo.MemberVO;
import kr.or.onesome.vo.MemberWishVO;

public interface MemberWishMapper {
	
	/**
	 * 위시리스트에 메뉴에 담기 전 중복확인용 메서드
	 * @param memberWishVO
	 * @return 0 또는 1
	 */
	int wishListInsertCheck(MemberWishVO memberWishVO);
	
	/**
	 * 위시리스트에 메뉴를 담는 메서드
	 * @param memberMenuVO
	 * @return
	 */
	int wishListInsert(MemberWishVO memberWishVO);

	/**
	 * 위시리스트 조회
	 * @return
	 */
	List<MemberWishVO> wishList(MemberWishVO memberWishVO);

	
	/**
	 * 위시리스트 삭제 
	 * @param memberWishVO
	 * @return
	 */
	int wishListDelete(MemberWishVO memberWishVO);

}
