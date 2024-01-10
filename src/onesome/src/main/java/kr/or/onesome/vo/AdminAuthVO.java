package kr.or.onesome.vo;

import lombok.Data;

@Data
public class AdminAuthVO {

    private int adminNo;     //어드민 테이블의 PK
    private String adminAuthCd; //어드민 권한 코드

}
