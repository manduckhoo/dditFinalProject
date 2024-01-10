package kr.or.onesome.publicdues.vo;

import lombok.Data;

import java.util.Date;

@Data
public class PublicduesVO {

    private String duesClmYm;        //공과금 청구 년월 (p.k)
    private int frcsNo;              //가맹점 번호 (p.k, f.k)
    private int duesElectricAmt;     //전기세
    private int duesWaterAmt;        //수도세
    private int duesGasAmt;          //가스비
    private int duesMtrtAmt;         //월세
    private Date duesPayDt;          //납부일시
    private int duesTotalAmt;        //총 납부 금액
}
