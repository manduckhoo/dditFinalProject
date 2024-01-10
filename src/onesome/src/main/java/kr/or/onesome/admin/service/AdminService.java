package kr.or.onesome.admin.service;

import java.util.List;

import kr.or.onesome.admin.vo.InOutVO;
import kr.or.onesome.frcsorder.vo.FrcsOrderVO;
import kr.or.onesome.royalty.vo.RoyaltyVO;
import kr.or.onesome.vo.FranchiseVO;

public interface AdminService {

	public List<FrcsOrderVO> frcsOrderWaitList(String comDetCode);

	public List<RoyaltyVO> adminNonPayRoyaltyList(String viewDate);

	public List<InOutVO> getMonthlyInOut(String viewDate);

	public List<FranchiseVO> salesList(String comDetCode);

}
