package kr.or.onesome.franchise.mapper;

import kr.or.onesome.vo.FranchiseDcmntVO;

public interface FranchiseDcmntMapper {

	// 가맹점 직원 서류 등록하기
	int insertDcmnt(FranchiseDcmntVO franchiseDcmntVO);

	// 보건증 보여주기
	FranchiseDcmntVO showHealth(FranchiseDcmntVO franchiseDcmntVO);

	// 이력서 보여주기
	FranchiseDcmntVO showCareer(FranchiseDcmntVO franchiseDcmntVO);

}
