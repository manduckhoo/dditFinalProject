package kr.or.onesome.vo;

import lombok.Data;

import java.util.List;

@Data
public class AdminVO {

    private int adminNo;     //어드민 PK
    private String adminEmail;  //어드민 이메일 주소
    private String adminPw;     //어드민 비밀번호
    private String adminNm;     //어드민 이름
    private String adminTel;    //어드민 전화번호
    private String enabled;     //어드민 활성여부 0, 1

    private List<AdminAuthVO> adminAuthVOList; //어드민 시큐리티 권한
}
