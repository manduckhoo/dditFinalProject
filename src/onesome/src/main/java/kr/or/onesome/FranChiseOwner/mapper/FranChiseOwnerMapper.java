package kr.or.onesome.FranChiseOwner.mapper;

import java.util.List;
import java.util.Map;

import kr.or.onesome.vo.FranchiseOwnerVO;

public interface FranChiseOwnerMapper {

	public int create(FranchiseOwnerVO ownerVO);

	public List<FranchiseOwnerVO> list();

	public FranchiseOwnerVO detail(String frcsOwnrNo);

	public int update(FranchiseOwnerVO franchiseOwnerVO);

	public FranchiseOwnerVO frcsOwSelectedDetail(Map<String, Object> map);

}
