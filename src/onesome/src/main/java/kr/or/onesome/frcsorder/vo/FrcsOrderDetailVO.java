package kr.or.onesome.frcsorder.vo;

import kr.or.onesome.frcsinventory.vo.FrcsInventoryVO;
import kr.or.onesome.product.vo.ProductVO;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import lombok.Data;

@Data
public class FrcsOrderDetailVO {

    private int frcsOrderNo;    //가맹점 발주 번호

    private int frcsNo;         //가맹점 코드

    private int frcsOrderQy;    //가맹점 발주 수량

    private int frcsOrderCost;  //발주 가격

    private int prdctNo;        //제품 번호

    private String prdctNm;     //제품명

    FrcsInventoryVO frcsInventoryVO;

    // 제품 분류 공통코드
    ComDetCodeInfoVO comDetCodeInfoVO;

    String prdctClsfCd;  //제품 카테고리 공통코드

    String prdctRcvnAmt;  //제품 가격

}
