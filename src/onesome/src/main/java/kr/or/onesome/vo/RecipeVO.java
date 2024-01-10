package kr.or.onesome.vo;

import lombok.Data;

@Data
public class RecipeVO {

    private int menuNo;         //메뉴 번호(p.k, f.k)
    private int prdctNo;        //제품 번호(p.k, f.k)
    private int recQy;          //수량
    private String prdctClsfCd; //제품 카테고리 코드
    
	private int pynmNo;			// 주문 번호(2024.01.01 KHM) 재고 떨구려면 주문번호 필요한듯 아 안되네..

}
