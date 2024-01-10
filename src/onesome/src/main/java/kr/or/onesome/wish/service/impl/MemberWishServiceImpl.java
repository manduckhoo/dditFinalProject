package kr.or.onesome.wish.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.vo.MemberMenuVO;
import kr.or.onesome.vo.MemberVO;
import kr.or.onesome.vo.MemberWishVO;
import kr.or.onesome.wish.mapper.MemberWishMapper;
import kr.or.onesome.wish.service.MemberWishService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberWishServiceImpl implements MemberWishService{

	@Autowired
	MemberWishMapper memberWishMapper;
	
	// 위시리스트에 메뉴를 담는 메서드
	@Override
	public int wishListInsert(MemberWishVO memberWishVO) {
		//MemberWishVO(memNo=3, menuNo=3,...
		log.info("wishListInsert->memberWishVO : " + memberWishVO);
		//result : 0(중복없음) / 1(중복)
		//인설트 하기전에 체크 먼저 할거임
		int result = wishListInsertCheck(memberWishVO); //result가 1로 이미 담겨있으면 위시리스트 꽉찬하트, 0으로 없으면 빈화트 표시하는 부분
		log.info("wishListInsertCheck : " + result);
		
		if(result<1) {//위시리스트에 없으므로 추가 실행
			return memberWishMapper.wishListInsert(memberWishVO);
		}else {//이미 위시리스트에 존재
			return 0;
		}
	}

	// 위시리스트 조회
	@Override
	public List<MemberWishVO> wishList(MemberWishVO memberWishVO) {
		return memberWishMapper.wishList(memberWishVO);
	}

	// 위시리스트 중복 확인 메서드
	@Override
	public int wishListInsertCheck(MemberWishVO memberWishVO) {
		return memberWishMapper.wishListInsertCheck(memberWishVO);
	}

	// 위시리스트 삭제
	@Override
	public int wishListDelete(MemberWishVO memberWishVO) {
		return memberWishMapper.wishListDelete(memberWishVO);
	}

}
