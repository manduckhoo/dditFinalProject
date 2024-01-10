package kr.or.onesome.vo;

import lombok.Data;

@Data
public class FranchiseOwnerAuthVO {

    private int frcsOwnrNo;     //가맹점주 PK
    private String frcsAuthCd;  //가맹점주 시큐리티 권한
}
