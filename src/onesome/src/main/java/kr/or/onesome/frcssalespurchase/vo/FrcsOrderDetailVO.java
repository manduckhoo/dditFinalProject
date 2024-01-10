package kr.or.onesome.frcssalespurchase.vo;

import java.util.List;

import lombok.Data;

@Data
public class FrcsOrderDetailVO {

	private int frcsOrderNo;		//가맹점 발주번호
	private int frcsNo;				//가맹점 코드
	private int frcsOrderQy;		//가맹점 발주 수량
	private int prdctNo;			//제품번호
	
	//private int frcsOrderCost;		//발주당시의 가격(변동성 고려)
	//private String prdctNm;			//제품명
	//private String prdctExpln;		//제품설명
	
	//발주VO - 발주VOList
	private List<FrcsOrderVO> frcsOrderVOList;
	
	//제품VO - 제품VOList
	private PproductVO productVO;
}
