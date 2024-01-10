package kr.or.onesome.hqemp.service.impl;

import java.util.List;
import java.util.Map;

import kr.or.onesome.hqemp.vo.HqEmpVO;

public interface HqEmpService {

	public List<HqEmpVO> hqEmpList(Map<String, Object> map);

	public int getTotal(Map<String, Object> map);

	public HqEmpVO hqEmpDetail(int hqEmpNo);

	public int regHqEmp(HqEmpVO hqempVO);

	public int modHqEmp(HqEmpVO hqEmpVO);

	public int delHqEmp(HqEmpVO hqEmpVO);
}
