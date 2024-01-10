package kr.or.onesome.admin.mapper;

import java.util.List;

import kr.or.onesome.admin.vo.InOutVO;
import kr.or.onesome.frcsorder.vo.FrcsOrderVO;
import kr.or.onesome.royalty.vo.RoyaltyVO;
import kr.or.onesome.vo.AdminVO;
import kr.or.onesome.vo.FranchiseVO;

public interface AdminMapper {

    public AdminVO adminDetail(String memEmail);
    public AdminVO adminList();
	public List<FrcsOrderVO> frcsOrderWaitList(String comDetCode);
	public List<RoyaltyVO> adminNonPayRoyaltyList(String viewDate);
	public List<InOutVO> getMonthlyInOut(String viewDate);
	public List<FranchiseVO> salesList(String comDetCode);
}
