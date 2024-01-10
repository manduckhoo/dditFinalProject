package kr.or.onesome.franchise.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.franchise.mapper.FranchiseInfoMapper;
import kr.or.onesome.franchise.service.FranchiseInfoService;
import kr.or.onesome.ojt.service.OjtService;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import kr.or.onesome.vo.FranchiseOwnerVO;
import kr.or.onesome.vo.FranchiseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FranchiseInfoServiceImpl implements FranchiseInfoService {

	@Autowired
	OjtService OjtService;
	
	@Autowired
	FranchiseInfoMapper franchiseInfoMapper;
	
	//가맹점 지역 분류 공통 코드 
	@Override
	public List<ComDetCodeInfoVO> RegionList(String comCode) {
		return this.franchiseInfoMapper.RegionList(comCode);
	}

	
	@Override
	public FranchiseOwnerVO selectFrcOwnerVO(FranchiseOwnerVO franchiseOwnerVO) {
		return this.franchiseInfoMapper.selectFrcOwnerVO(franchiseOwnerVO);
	}

	@Override
	public int create(FranchiseVO franchiseVO) {
		return this.franchiseInfoMapper.create(franchiseVO);
	}

	@Override
	public List<FranchiseVO> list() {
		return this.franchiseInfoMapper.list();
	}

	@Override
	public List<FranchiseOwnerVO> openList(String comDetCode) {
		return this.franchiseInfoMapper.openList(comDetCode);
	}

	@Override
	public FranchiseVO detail(FranchiseVO franchise) {
		return this.franchiseInfoMapper.detail(franchise);
	}

	//가맹점 정보 조회
	@Override
	public FranchiseVO info(FranchiseVO franchiseVO) {
		return this.franchiseInfoMapper.info(franchiseVO);
	}

	// 풀캘린더 입력 및 수정(교육 일정 제외)
	@Override
	public int addEvent(Map<String, Object> map) {
		
		log.info("fullcalendar 입력 service단 " + map.get("type"));
		if("교육 일정".equals(map.get("type"))) {
			int cnt = this.OjtService.insert(map);
			return this.franchiseInfoMapper.updateOjtNo(map);
			
		}else {
			return this.franchiseInfoMapper.addEvent(map);
		}
	}
	
	// 풀캘린더 수정
	@Override
	public int update(FranchiseVO franchiseVO) {
		return this.franchiseInfoMapper.update(franchiseVO);
	}

	//가맹점 상세페이지 운영상태 공통코드
	@Override
	public List<ComDetCodeInfoVO> frscStsCd(String comCode) {
		return this.franchiseInfoMapper.frscStsCd(comCode);
	}

	//가맹점 상세페이지 수정
	@Override
	public int detailUpdate(FranchiseVO franchiseVO) {
		int cnt = this.franchiseInfoMapper.updateFrscOw(franchiseVO);
		cnt +=this.franchiseInfoMapper.detailUpdate(franchiseVO);
		return cnt;
	}

	//매출분석페이지 점주 리스트
	@Override
	public List<FranchiseVO> salesList(String comDetCode) {
		return this.franchiseInfoMapper.salesList(comDetCode);
	}

	//매출분석페이지 금년의 각월별 매출 
	@Override
	public List<Map<String, Object>> sales(Map<String, Object> data) {
		return this.franchiseInfoMapper.sales(data);
	}

	//매출분석페이지 
	@Override
	public Map<String, Object> detailOne(Map<String, Object> data) {
		return this.franchiseInfoMapper.detailOne(data);
	}


	@Override
	public List<Map<String, Object>> totalsales(Map<String, Object> data) {
		return this.franchiseInfoMapper.totalsales(data);
	}


	@Override
	public Map<String, Object> Laborcost(Map<String, Object> data) {
		return this.franchiseInfoMapper.Laborcost(data);
	}


	@Override
	public List<Map<String, Object>> cost(Map<String, Object> data) {
		return this.franchiseInfoMapper.cost(data);
	}


	@Override
	public List<Map<String, Object>> totalData(Map<String, Object> data) {
		return this.franchiseInfoMapper.totalData(data);
	}	
	

}
