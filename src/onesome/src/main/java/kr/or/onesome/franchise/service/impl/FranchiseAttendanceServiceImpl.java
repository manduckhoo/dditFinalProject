package kr.or.onesome.franchise.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.franchise.mapper.FranchiseAttendanceMapper;
import kr.or.onesome.franchise.service.FranchiseAttendanceService;
import kr.or.onesome.vo.AttendanceManagementVO;

@Service
public class FranchiseAttendanceServiceImpl implements FranchiseAttendanceService {

	@Autowired
	FranchiseAttendanceMapper franchiseAttendanceMapper;

	//가맹점 전체 직원 근태 추가하기
	@Override
	public int addFrcsEvent(AttendanceManagementVO event) {
		return this.franchiseAttendanceMapper.addFrcsEvent(event);
	}

	//가맹점 전체 직원 근태 수정하기
	@Override
	public int updateFrcsEvent(AttendanceManagementVO event) {
		return this.franchiseAttendanceMapper.updateFrcsEvent(event);
	}

	//가맹점 전체 직원 근태 삭제하기
	@Override
	public int deleteFrcsEvent(int attndceNo) {
		return this.franchiseAttendanceMapper.deleteFrcsEvent(attndceNo);
	}

	//가맹점 전체 직원 근태 조회하기
	@Override
	public List<Map<String, Object>> getFrcsEvents() {
		return this.franchiseAttendanceMapper.getFrcsEvents();
	}

}
