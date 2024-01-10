package kr.or.onesome.ojt.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.onesome.vo.OjtVO;

@Mapper
public interface OjtMapper {

	public int insert(Map<String, Object> map);

	public int getOjtNo();

	public int update(Map<String, Object> map);
	
	//값 초기화
	public int reset(Map<String, Object> map);
	
	
}
