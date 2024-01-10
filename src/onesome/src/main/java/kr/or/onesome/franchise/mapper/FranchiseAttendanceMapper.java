package kr.or.onesome.franchise.mapper;

import java.util.List;
import java.util.Map;

import kr.or.onesome.vo.AttendanceManagementVO;

public interface FranchiseAttendanceMapper {


	//가맹점 전체 직원 근태 추가하기
	int addFrcsEvent(AttendanceManagementVO event);

	//가맹점 전체 직원 근태 수정하기
	int updateFrcsEvent(AttendanceManagementVO event);

	//가맹점 전체 직원 근태 삭제하기
	int deleteFrcsEvent(int attndceNo);

	//가맹점 전체 직원 근태 조회하기
	List<Map<String, Object>> getFrcsEvents();

}
