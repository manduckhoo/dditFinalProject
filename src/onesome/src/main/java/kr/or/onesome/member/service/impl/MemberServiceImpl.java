package kr.or.onesome.member.service.impl;

import kr.or.onesome.atchFile.mapper.AtchFileMapper;
import kr.or.onesome.member.mapper.MemberMapper;
import kr.or.onesome.member.service.MemberService;
import kr.or.onesome.vo.AtchFileVO;
import kr.or.onesome.vo.MemberMenuVO;
import kr.or.onesome.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	String uploadFolder;
	
    @Autowired
    MemberMapper memberMapper;
    
    @Autowired
    AtchFileMapper atchFileMapper;

    @Override
    public int duplicateMemberCheck(MemberVO memberVO) {
        return memberMapper.duplicateMemberCheck(memberVO);
    }

    @Override
    public int duplicateTelCheck(MemberVO memberVO) {
        return memberMapper.duplicateTelCheck(memberVO);
    }

    @Override
    public int signUpMember(MemberVO memberVO) {
        return memberMapper.signUpMember(memberVO);
    }

    // 일반회원 메뉴(음료) 조회하기
	@Override
	public List<MemberMenuVO> MemMenuDrinkList() {
		return memberMapper.MemMenuDrinkList();
	}
	
	// 일반회원 메뉴(푸드) 조회하기
	@Override
	public List<MemberMenuVO> MemMenuFoodList() {
		return memberMapper.MemMenuFoodList();
	}
	
	// 일반회원 메뉴(상품) 조회하기
	@Override
	public List<MemberMenuVO> MemMenuProductList() {
		return memberMapper.MemMenuProductList();
	}
	
	// 일반회원 메뉴 상세조회하기
	@Override
	public MemberMenuVO selectMenuDetail(MemberMenuVO memberMenuVO) {
		return memberMapper.selectMenuDetail(memberMenuVO);
	}

	//메뉴 카테고리 상세 ID 조회를 위한 메서드
	@Override
	public List<MemberMenuVO> selectCtgList(MemberMenuVO memberMenuVO) {
		return memberMapper.selectCtgList(memberMenuVO);
	}
}