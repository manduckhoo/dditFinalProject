package kr.or.onesome.franchise.mapper;

import java.util.Map;

import kr.or.onesome.vo.FranchiseOwnerVO;

public interface FranchiseOwnerMapper {
    FranchiseOwnerVO frcsOwDetail(String username);

	FranchiseOwnerVO frcsOwSelectedDetail(Map<String, Object> map);
}
