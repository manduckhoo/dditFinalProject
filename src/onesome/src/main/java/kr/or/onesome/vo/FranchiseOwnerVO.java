package kr.or.onesome.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

@Data
public class FranchiseOwnerVO {

    private int frcsOwnrNo;          //가맹점주 PK
    private String frcsOwnrEmail;    //가맹점주 메일주소
    private String frcsOwnrPw;       //가맹점주 비밀번호
    private String frcsOwnrNm;       //가맹점주 이름
    private String frcsOwnrBrdt;     //가맹점주 생일
    private String frcsOwnrTel;      //가맹점주 연락처
    private String frcsOwnrZip;      //가맹점주 우편번호
    private String frcsOwnrAddr;     //가맹점주 주소
    private String frcsOwnrDtlAddr;  //가맹점주 상세주소
    private String frcsOwnrJoinDt;     //가맹점주 가입일
    private String enabled;          //가맹점주 활성여부 0, 1

    
    private List<FranchiseOwnerAuthVO> franchiseOwnerAuthVOList; //가맹점주 권한
    
    private List<FranchiseVO> franchiseVOList; 					//가맹점 
    
    private FranchiseVO franchiseVO;							//가맹점 
    
    private List<OjtVO> frcsOwnerOjtList;							//가맹점주 교육 
}
