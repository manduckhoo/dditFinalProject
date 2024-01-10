package kr.or.onesome.vo;

import lombok.Data;

@Data
public class MemberAuthVO {

    private int memNo;        //일반회원 테이블 PK
    private String memAuthCd; //일반회원 권한 코드
}
