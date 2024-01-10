package kr.or.onesome.vo;

import lombok.Data;

@Data
public class AcntVO {

    private int acntNo;             //거래처 번호
    private String acntNm;          //거래처명
    private String acntTel;         //연락처
    private String acntZip;         //우편번호
    private String acntAddr;        //기본주소
    private String acntDtlAddr;     //상세주소
    private String acntMngrPstn;    //담당자 직급
    private String acntMngrNm;      //담당자 이름
    private String acntEmail;       //이메일
    private String acntClsfCd;      //거래처분류코드

    private ComDetCodeInfoVO comDetCodeInfoVO;
}
