package kr.or.onesome.faq.mapper;

import kr.or.onesome.vo.FaqVO;

import java.util.List;
import java.util.Map;

public interface AdminFaqMapper {
    public List<FaqVO> faqList();

    int createFaq(FaqVO faqVO);

    int modifyFaq(FaqVO faqVO);

    FaqVO selectAjax(Map<String, String> faqMap);

    int deleteFaq(FaqVO faqVO);
}
