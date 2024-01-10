package kr.or.onesome.vo;

import java.util.Date;

import lombok.Data;

@Data
public class RefundVO {
	private int pynmNo;		// 주문번호
	private Date rctDt;		// 접수일자
	private String refSts;	// 환불여부
}
