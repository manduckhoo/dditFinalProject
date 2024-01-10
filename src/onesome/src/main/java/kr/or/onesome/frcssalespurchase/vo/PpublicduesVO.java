package kr.or.onesome.frcssalespurchase.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PpublicduesVO {

	private String duesClmYm;				//공과금 청구 년월
	private int frcsNo;						//가맹점 번호
	private int duesElectricAmt;			//전기세액
	private int duesWaterAmt;				//수도세액
	private int duesGasAmt;					//가스비액
	private int duesMtrtAmt;				//월세
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date duesPayDt;					//납부일자
	
	private String yyyymm;					//쿼리 뽑아내기용(월별구분)
	private long publicduesTotal;			//쿼리 뽑아내기용(공과금 합계)
}
