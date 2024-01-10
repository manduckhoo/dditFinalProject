package kr.or.onesome.hqOrder.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class HqOrderVO {

    private int hqOrderNo;          //본사 발주 번호
    private Date hqOrderDt;         //발주 일시
    private int hqOrderTotalAmt;    //총 발주 금액
    private int adminNo;            //관리자 번호
    private String hqOrderStsCd;    //본사발주상태 공통코드
    
    int[] productCheckBox;   //선택된 제품

    //detailVO 만들기
    List<HqDetailOrderVO> hqDetailOrderVOList;
}
