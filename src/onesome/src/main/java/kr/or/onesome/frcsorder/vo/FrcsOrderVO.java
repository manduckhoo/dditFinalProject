package kr.or.onesome.frcsorder.vo;

import kr.or.onesome.product.vo.ProductVO;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class FrcsOrderVO {

    private int frcsOrderNo;        //가맹점 발주번호

    private int frcsNo;             //가맹점 코드

    private Date frcsOrderDt;       //가맹점 발주일자

    private int frcsOrderOrderAmt;  //가맹점 총 발주금액

    private String frcsOrderTypeCd; //가맹점 발주상태 공통코드

    int[] productCheckBox;        //체크된 발주 품목

    ProductVO productVO;

    List<FrcsOrderDetailVO> frcsOrderDetailVOList;

    String frcsNm;


}
