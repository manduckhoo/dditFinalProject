package kr.or.onesome.inquirer.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.inquirer.mapper.InquirerMapper;
import kr.or.onesome.inquirer.service.InquirerService;
import kr.or.onesome.vo.FranchiseOwnerVO;
import kr.or.onesome.vo.InquirerVO;

@Service
public class InquirerServiceImpl implements InquirerService {

	@Autowired
	InquirerMapper inquirerMapper;
	
	@Override
	public int createPost(InquirerVO inquirerVO) {
		return this.inquirerMapper.createPost(inquirerVO);
	}

	@Override
	public List<InquirerVO> list() {
		return this.inquirerMapper.list();
	}

	@Override
	public int updatePost(InquirerVO inquirerVO) {
		return this.inquirerMapper.updatePost(inquirerVO);
	}

	@Override
	public int deletePost(InquirerVO inquirerVO) {
		return this.inquirerMapper.deletePost(inquirerVO);
	}

	@Override
	public InquirerVO detail(String inqrNo) {
		return this.inquirerMapper.detail(inqrNo);
	}

	@Override
	public int update(InquirerVO inquirerVO) {
		return this.inquirerMapper.update(inquirerVO);
	}

	@Override
	public int status(InquirerVO inquirerVO) {
		return this.inquirerMapper.status(inquirerVO);
	}

	@Override
	public List<FranchiseOwnerVO> waitList() {
		return this.inquirerMapper.waitList();
	}

}
