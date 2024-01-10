package kr.or.onesome.frcsinventory.vo;

import kr.or.onesome.product.vo.ProductVO;
import lombok.Data;

import java.util.Date;

@Data
public class FrcsInventoryVO {

    private int frcsNo;         //가맹점 번호

    private int prdctNo;        //제품 번호

    private int frcsInvenCnt;   //재고 수량

    private int frcsInvenProperCnt; //재고 적정 수량

    private Date frcsLastInDt;  //최종 입고 일시

    private String frcsAutoOrderYn; //자동 발주 여부

    private int frcsAutoOrderCnt;   //자동 발주 수량

    ProductVO productVO;
}
