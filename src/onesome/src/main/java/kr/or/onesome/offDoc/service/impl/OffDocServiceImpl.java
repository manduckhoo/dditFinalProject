package kr.or.onesome.offDoc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.offDoc.mapper.OffDocMapper;
import kr.or.onesome.offDoc.service.OffDocService;
import kr.or.onesome.security.CustomUser;
import kr.or.onesome.vo.OffDocVO;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OffDocServiceImpl implements OffDocService {
	
	@Autowired
	private OffDocMapper offDocMapper;

	//공문쓰기
	@Override
	public int offDocCreate(OffDocVO offDocVO) {
		int result = 0;
		int[] frcsNmCheck=offDocVO.getFrcsNmCheck();
		
		for(int frcsNo:frcsNmCheck) {
			offDocVO.setOffDocTo(String.valueOf(frcsNo));
			result += this.offDocMapper.offDocCreate(offDocVO);
		}
		return result;
	}
	
	/**
	 * 발송된 공문 리스트 가져오기
	 */
	@Override
	public List<OffDocVO> offDocList() {
		return offDocMapper.offDocList();
	}
	
	/**
	 * 공문 수신
	 */
	@Override
	public List<OffDocVO> getReceivedOffDocList(int crrFrcsNo) {
		return offDocMapper.ReceivedOffDocList(crrFrcsNo);
	}
	
	/**
	 * 공문 수신 디테일
	 */
	@Transactional
	@Override
	public OffDocVO offDocToDetail(int offDocNo) {

		offDocMapper.offDocStatusChange(offDocNo);

		return offDocMapper.offDocToDetail(offDocNo);
	}

	
	/**
	 * 공문(발송) 디테일
	 */
	@Override
	public OffDocVO offDocFromDetail(int offDocNo) {
		return offDocMapper.offDocFromDetail(offDocNo);
	}
	

}
