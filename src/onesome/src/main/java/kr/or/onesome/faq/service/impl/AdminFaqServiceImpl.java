package kr.or.onesome.faq.service.impl;

import kr.or.onesome.faq.mapper.AdminFaqMapper;
import kr.or.onesome.faq.service.AdminFaqService;
import kr.or.onesome.vo.FaqVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AdminFaqServiceImpl implements AdminFaqService {

    @Autowired
    AdminFaqMapper adminFaqMapper;

    @Override
    public List<FaqVO> faqList() {
        return this.adminFaqMapper.faqList();
    }

    @Override
    public int createFaq(FaqVO faqVO) {
        return this.adminFaqMapper.createFaq(faqVO);
    }

    @Override
    public int modifyFaq(FaqVO faqVO) {
        return this.adminFaqMapper.modifyFaq(faqVO);
    }

    @Override
    public FaqVO selectAjax(Map<String, String> faqMap) {
        return this.adminFaqMapper.selectAjax(faqMap);
    }

    @Override
    public int deleteFaq(FaqVO faqVO) {
        return this.adminFaqMapper.deleteFaq(faqVO);
    }
}
