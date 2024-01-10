package kr.or.onesome.FranChiseOwner.service;

import java.util.List;
import java.util.Map;

import kr.or.onesome.vo.FranchiseOwnerVO;

public interface FranChiseOwnerService {

	public int create(FranchiseOwnerVO franchiseOwnerVO);

	public List<FranchiseOwnerVO> list();

	public FranchiseOwnerVO detail(String frcsOwnrNo);

	public int update(FranchiseOwnerVO franchiseOwnerVO);

	public FranchiseOwnerVO frcsOwSelectedDetail(Map<String, Object> map);

}
