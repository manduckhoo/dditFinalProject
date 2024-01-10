package kr.or.onesome.admin.vo;

import lombok.Data;

@Data
public class InOutVO {
	
	private String month; // 달별
	
	// 본사 매입
	private String hqOrderDt;
	private int hqOrderTotalAmt;
	
	// 본사 매출
	private String ryClmYm;
	private int ryTotalAmt;
}
