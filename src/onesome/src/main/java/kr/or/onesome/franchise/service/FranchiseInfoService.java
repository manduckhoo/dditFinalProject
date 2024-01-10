package kr.or.onesome.franchise.service;

import java.util.List;
import java.util.Map;

import kr.or.onesome.vo.ComDetCodeInfoVO;
import kr.or.onesome.vo.FranchiseOwnerVO;
import kr.or.onesome.vo.FranchiseVO;

public interface FranchiseInfoService {

	public List<ComDetCodeInfoVO> RegionList(String comCode);

	
	public FranchiseOwnerVO selectFrcOwnerVO(FranchiseOwnerVO franchiseOwnerVO);

	//가맹점 생성 
	public int create(FranchiseVO franchiseVO);

	// 모든 가맹점 리스트
	public List<FranchiseVO> list();

	// 가맹점 오픈준비 리스트
	public List<FranchiseOwnerVO> openList(String comDetCode);

	//가맹점 상세정보
	public FranchiseVO detail(FranchiseVO franchise);

	//가맹점 정보 관리
	public FranchiseVO info(FranchiseVO franchiseVO);

	//오픈 준비 일정 추가 
	public int addEvent(Map<String, Object> map);

	//가맹점 상세 정보 입력 update
	public int update(FranchiseVO franchiseVO);

	//가맹점의 운영상태 공통코드
	public List<ComDetCodeInfoVO> frscStsCd(String comCode);

	//가맹점 상세페이지 수정 
	public int detailUpdate(FranchiseVO franchiseVO);
	
	//매출분석페이지 점주 리스트
	public List<FranchiseVO> salesList(String comDetCode);

	//매출 분석의 월매출 받기
	public List<Map<String, Object>> sales(Map<String, Object> data);

	//매출 분석의 가맹점의 상세페이지
	public Map<String, Object> detailOne(Map<String, Object> data);

	//매출 분석의 총매출, 월평균 매출
	public List<Map<String, Object>> totalsales(Map<String, Object> data);

	//인건비 구하기
	public Map<String, Object> Laborcost(Map<String, Object> data);

	//각종 비용 구하기
	public List<Map<String, Object>> cost(Map<String, Object> data);

	//쿼리 다합침
	public List<Map<String, Object>> totalData(Map<String, Object> data);

}
