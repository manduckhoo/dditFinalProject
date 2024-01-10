package kr.or.onesome.franchise.service;

import kr.or.onesome.vo.FranchiseDcmntVO;

public interface FranchiseDcmntService {

	//직원 서류 등록하기
	int insertDcmnt(FranchiseDcmntVO franchiseDcmntVO);

	//보건증 보여주기
	FranchiseDcmntVO showHealth(FranchiseDcmntVO franchiseDcmntVO);

	//이력서 보여주기
	FranchiseDcmntVO showCareer(FranchiseDcmntVO franchiseDcmntVO);

}
