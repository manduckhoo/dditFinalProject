package kr.or.onesome.faq.service.impl;

import java.util.List;

import kr.or.onesome.faq.mapper.MemberFaqMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.faq.service.MemberFaqService;
import kr.or.onesome.vo.FaqVO;

@Service
public class MemberFaqServiceImpl implements MemberFaqService {

	@Autowired
	MemberFaqMapper memberFaqMapper;

	@Override
	public List<FaqVO> faqList() {
		return this.memberFaqMapper.faqList();
	}

}
