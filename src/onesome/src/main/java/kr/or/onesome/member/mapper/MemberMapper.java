package kr.or.onesome.member.mapper;

import java.util.List;
import java.util.Map;

import kr.or.onesome.vo.MemberMenuVO;
import kr.or.onesome.vo.MemberVO;

public interface MemberMapper {

    MemberVO memDetail(String username);

    int duplicateMemberCheck(MemberVO memberVO);

    int duplicateTelCheck(MemberVO memberVO);

    int signUpMember(MemberVO memberVO);


	/**
	 * 일반 회원 메뉴 (음료) 조회
	 * @return
	 */
	public List<MemberMenuVO> MemMenuDrinkList();
	
	/**
	 * 일반 회원 메뉴 (푸드) 조회
	 * @return
	 */
	public List<MemberMenuVO> MemMenuFoodList();
	
	/**
	 * 일반 회원 메뉴 (상품) 조회
	 * @return
	 */
	public List<MemberMenuVO> MemMenuProductList();
	
	/**
	 * 일반 회원 메뉴 (음료) 상세조회
	 * @param memberMenuVO
	 * @return
	 */
	MemberMenuVO selectMenuDetail(MemberMenuVO memberMenuVO);

	/**
	 * 메뉴 카테고리 상세 ID 조회를 위한 메서드
	 * @param memberMenuVO 
	 * @return
	 */
	List<MemberMenuVO> selectCtgList(MemberMenuVO memberMenuVO);
}
