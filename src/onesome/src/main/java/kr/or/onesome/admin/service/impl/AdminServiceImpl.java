package kr.or.onesome.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.admin.mapper.AdminMapper;
import kr.or.onesome.admin.service.AdminService;
import kr.or.onesome.admin.vo.InOutVO;
import kr.or.onesome.frcsorder.vo.FrcsOrderVO;
import kr.or.onesome.royalty.vo.RoyaltyVO;
import kr.or.onesome.vo.FranchiseVO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public List<FrcsOrderVO> frcsOrderWaitList(String comDetCode) {
		return adminMapper.frcsOrderWaitList(comDetCode);
	}

	@Override
	public List<RoyaltyVO> adminNonPayRoyaltyList(String viewDate) {
		return adminMapper.adminNonPayRoyaltyList(viewDate);
	}

	@Override
	public List<InOutVO> getMonthlyInOut(String viewDate) {
		return adminMapper.getMonthlyInOut(viewDate);
	}

	@Override
	public List<FranchiseVO> salesList(String comDetCode) {
		return adminMapper.salesList(comDetCode);
	}

}
