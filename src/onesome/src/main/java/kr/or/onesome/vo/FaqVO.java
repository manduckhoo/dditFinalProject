package kr.or.onesome.vo;

import lombok.Data;

@Data
public class FaqVO {

    private int faqNo;          //FAQ 번호
    private String faqTypeCd;   //FAQ 분류 공통 코드
    private String faqTitle;    //제목
    private String faqConts;    //내용
}
