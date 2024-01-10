package kr.or.onesome.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class MemberVO {

    private int memNo;           //일반유저 PK
    private String memId;        //일반유저 ID
    private String memPw;        //일반유저 비밀번호
    private String memNick;      //일반유저 닉네임
    private String memNm;        //일반유저 이름
    private String memTel;       //일반유저 전화번호
    private String memMail;      //일반유저 메일주소
    private String memZip;       //일반유저 우편번호
    private String memAddr;      //일반유저 주소
    private String memAddr2;     //일반유저 상세주소
    private Date memJoinDt;      //일반유저 가입일
    private String memBirth;     //일반유저 생일
    private String enabled;      //일반유저 활성여부 X, Y
    private String mbsCd;        //일반유저 등급 코드
    private int memMileage;      //일반유저 마일리지

    private List<MemberAuthVO> memberAuthVOList; //일반유저 시큐리티 권한

}
