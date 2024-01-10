package kr.or.onesome.ojt.service.Impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.onesome.ojt.mapper.OjtMapper;
import kr.or.onesome.ojt.service.OjtService;
import lombok.extern.slf4j.Slf4j;


@RequestMapping("frcs/ojt")
@Slf4j
@Service
public class OjtServiceImpl implements OjtService {

	@Autowired
	OjtMapper ojtMapper;
	
	// 점주 교육 입력
	@Override
	public int insert(Map<String,Object>map) {
		
		//ojtNo 시퀀스값 받아오기
		int ojtNo = this.ojtMapper.getOjtNo();
		log.info("ojtNo 받아옴 : " + ojtNo);
		//교육 공통 코드 값
		String ojtType = "OJT01";
		//받아온 pk값, 교육 코드 넣기
		map.put("ojtNo", ojtNo);
		map.put("ojtType",ojtType);
		
		log.info("OTJ insert map : " +map);
		
		return this.ojtMapper.insert(map);
	}

	@PostMapping("update")
	@Override
	public int update(Map<String, Object> map) {
		log.info("ojt UPdate map : " + map);
		
		if ("reset".equals(String.valueOf(map.get("reset")).trim())) {
			log.info("reset으로 왔음");
			return this.ojtMapper.reset(map);
		}else {
			return this.ojtMapper.update(map);
		}
	}

}
