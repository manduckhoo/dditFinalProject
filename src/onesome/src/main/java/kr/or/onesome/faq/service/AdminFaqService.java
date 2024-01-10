package kr.or.onesome.faq.service;

import kr.or.onesome.vo.FaqVO;

import java.util.List;
import java.util.Map;

public interface AdminFaqService {

    //FAQ 조회
    List<FaqVO> faqList();

    //FAQ 생성
    int createFaq(FaqVO faqVO);

    int modifyFaq(FaqVO faqVO);

    FaqVO selectAjax(Map<String, String> faqMap);

    int deleteFaq(FaqVO faqVO);
}
