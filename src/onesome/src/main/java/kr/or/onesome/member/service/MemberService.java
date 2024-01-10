package kr.or.onesome.member.service;

import java.util.List;
import java.util.Map;

import kr.or.onesome.vo.MemberMenuVO;
import kr.or.onesome.vo.MemberVO;

public interface MemberService {

    /**
     * 회원 가입시 중복회원 체크를 위한 메서드
     */
    public int duplicateMemberCheck(MemberVO memberVO);

    /**
     * 회원 가입시 중복전화번호 여부 체크를 위한 메서드
     */
    public int duplicateTelCheck(MemberVO memberVO);

    /**
     * 회원을 등록하기 위한 메서드
     */
    public int signUpMember(MemberVO memberVO);

    /**
     * 메뉴(음료) 조회를 위한 메서드
     * @return
     */
	public List<MemberMenuVO> MemMenuDrinkList();
	
	/**
	 * 메뉴(푸드) 조회를 위한 메서드
	 * @return
	 */
	public List<MemberMenuVO> MemMenuFoodList();
	
	/**
	 * 메뉴(상품) 조회를 위한 메서드
	 * @return
	 */
	public List<MemberMenuVO> MemMenuProductList();
	
	/**
	 * 메뉴 상세 조회를 위한 메서드
	 * @param menuVO
	 * @return
	 */
	MemberMenuVO selectMenuDetail(MemberMenuVO memberMenuVO);

	/**
	 * 메뉴 카테고리 상세 ID 조회를 위한 메서드
	 * @param memberMenuVO 
	 * @return
	 */
	public List<MemberMenuVO> selectCtgList(MemberMenuVO memberMenuVO);

}
