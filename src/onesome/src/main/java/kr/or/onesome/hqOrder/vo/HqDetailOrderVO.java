package kr.or.onesome.hqOrder.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import kr.or.onesome.product.vo.ProductVO;
import kr.or.onesome.vo.AcntVO;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.List;

@Data
public class HqDetailOrderVO {

    private int hqOrderNo;      //본사 발주 번호
    private int hqOrderCnt;     //발주 수량
    private int hqOrderCostAmt; //발주 가격
    private int prdctNo;        //제품번호
    private String prdctNm;     //제품명

    //제품 정보 가져오기
    ProductVO productVO;

    //발주시 거래처 갯수 파악
    List<AcntVO> acntVO;

    //발주 상태 코드
    String hqOrderStsCd;
    //발주 날짜
    @JsonFormat(pattern = "yyyy. MM. dd")
    String hqOrderDt;
    //발주 총 금액
    String hqOrderTotalAmt;

}
