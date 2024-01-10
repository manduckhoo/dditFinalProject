package kr.or.onesome.FranChiseOwner.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.onesome.FranChiseOwner.mapper.FranChiseOwnerMapper;
import kr.or.onesome.FranChiseOwner.service.FranChiseOwnerService;
import kr.or.onesome.franchise.mapper.FranchiseOwnerMapper;
import kr.or.onesome.util.WebMailService;
import kr.or.onesome.vo.FranchiseOwnerVO;

@Service
public class FranChiseOwnerServiceImpl implements FranChiseOwnerService {

	@Autowired
	FranChiseOwnerMapper franChiseOwnerMapper;
	
	@Autowired
	FranchiseOwnerMapper mapper;
	
	@Autowired
	WebMailService webMailService;
	
	
	@Override
	public int create(FranchiseOwnerVO franchiseOwnerVO) {
		
		//임시비밀번호 메일 발송
		String email = franchiseOwnerVO.getFrcsOwnrEmail();
		String pw = webMailService.createAccount(email);
		
		//암호 복호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	    String encodedPass = encoder.encode(pw);
	    
	    //
	    franchiseOwnerVO.setFrcsOwnrPw(encodedPass);
		//
		
		return this.franChiseOwnerMapper.create(franchiseOwnerVO);
	}


	@Override
	public List<FranchiseOwnerVO> list() {
		return this.franChiseOwnerMapper.list();
	}


	@Override
	public FranchiseOwnerVO detail(String frcsOwnrNo) {
		return this.franChiseOwnerMapper.detail(frcsOwnrNo);
		
	}


	@Override
	public int update(FranchiseOwnerVO franchiseOwnerVO) {
		return this.franChiseOwnerMapper.update(franchiseOwnerVO);
	}


	@Override
	public FranchiseOwnerVO frcsOwSelectedDetail(Map<String, Object> map) {
		return this.mapper.frcsOwSelectedDetail(map);
	}



}
