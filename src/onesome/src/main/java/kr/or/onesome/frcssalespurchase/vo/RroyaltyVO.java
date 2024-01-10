package kr.or.onesome.frcssalespurchase.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class RroyaltyVO {

	private String ryClmYm;					//가맹비 청구년월
	private int frcsNo;						//가맹비 번호
	private int ryTotalAmt;					//총 납부금액
	private String ryStatusYn;				//가맹비 납부여부 Y/N
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date ryPayDt;					//가맹비 납부일자
	private int ryFrcsFeeAmt;				//가맹비
	private int ryOrderAmt;					//제품구입비
	private int ryNpmntAmt;					//미납금액
	private int ryOvrintAmt;				//연체이자
	private int ryRoyaltyAmt;				//로열티
	
	private String yyyymm;					//쿼리 뽑아내기용(월별구분)
	private long royalty_total;				//쿼리 뽑아내기용(로얄티 합계)
	
}
