package kr.or.onesome.royalty.vo;

import lombok.Data;

import java.util.Date;

@Data
public class RoyaltyVO {

    private String ryClmYm;           //가맹비 청구년월(p.k)
    private int frcsNo;               //가맹점번호 (p.k, f.k)
    private int ryTotalAmt;           //총 납부금액
    private String ryStatusYn;        //가맹비 납부 여부
    private Date ryPayDt;             //가맹비 납부 일자
    private int ryFrcsFeeAmt;         //가맹비(고정금액)
    private int ryOrderAmt;           //제품구입비
    private int ryNpmntAmt;           //미납금
    private int ryOvrintAmt;          //연체이자
    private int ryRoyaltyAmt;         //로열티(당월 매출총액의 3%)

    private String frcsNm;            //가맹점명
    private int accNpmntCnt;          //누적 미납 횟수
}
