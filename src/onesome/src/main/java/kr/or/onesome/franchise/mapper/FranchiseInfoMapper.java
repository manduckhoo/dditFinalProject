package kr.or.onesome.franchise.mapper;

import java.util.List;
import java.util.Map;

import kr.or.onesome.vo.ComDetCodeInfoVO;
import kr.or.onesome.vo.FranchiseOwnerVO;
import kr.or.onesome.vo.FranchiseVO;

public interface FranchiseInfoMapper {


	public List<ComDetCodeInfoVO> RegionList(String comCode);

	public FranchiseOwnerVO selectFrcOwnerVO(FranchiseOwnerVO franchiseOwnerVO);

	public int create(FranchiseVO franchiseVO);

	public List<FranchiseVO> list();

	public List<FranchiseOwnerVO> openList(String comDetCode);
	
	//가맹점 정보 조회
	public FranchiseVO info(FranchiseVO franchiseVO);
	//가맹점 정보 조회(오픈 준비)
	public FranchiseVO detail(FranchiseVO franchiseVO);
	//가맹점 fullcalendar 입력
	public int addOtj(Map<String, Object> map);
	//점주 교육 일정 입력
	public int addEvent(Map<String, Object> map);
	//교육 신규 입력 후 교육pk번호 점주에게 업데이트
	public int updateOjtNo(Map<String, Object> map);
	//가맹점 상세 정보 입력(update)
	public int update(FranchiseVO franchiseVO);
	// 가맹점 운영상태 코드 조회
	public List<ComDetCodeInfoVO> frscStsCd(String comCode);
	//가맹점 상세페이지 수정
	public int detailUpdate(FranchiseVO franchiseVO);
	//가맹점 점주 수정
	public int updateFrscOw(FranchiseVO franchiseVO);
	//매출분석페이지 점주 리스트
	public List<FranchiseVO> salesList(String comDetCode);
	//매출분석페이지 금년의 각월별 매출 
	public List<Map<String, Object>> sales(Map<String, Object> data);
	//매출분석페이지의 가맹점 상세정보
	public Map<String, Object> detailOne(Map<String, Object> data);
	//매출분석페이지의 월평균 매출 및 총매출
	public List<Map<String, Object>> totalsales(Map<String, Object> data);
	//인건비
	public Map<String, Object> Laborcost(Map<String, Object> data);
	//가맹비 등 각족 비용
	public List<Map<String, Object>> cost(Map<String, Object> data);
	//가맹비 조회 쿼리 다합침
	public List<Map<String, Object>> totalData(Map<String, Object> data);

}
