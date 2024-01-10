package kr.or.onesome.inquirer.service;

import java.util.List;

import kr.or.onesome.vo.FranchiseOwnerVO;
import kr.or.onesome.vo.InquirerVO;

public interface InquirerService {

	public int createPost(InquirerVO inquirerVO);

	public List<InquirerVO> list();

	public int updatePost(InquirerVO inquirerVO);

	public int deletePost(InquirerVO inquirerVO);

	public InquirerVO detail(String inqrNo);

	public int update(InquirerVO inquirerVO);

	public int status(InquirerVO inquirerVO);

	public List<FranchiseOwnerVO> waitList();

}
