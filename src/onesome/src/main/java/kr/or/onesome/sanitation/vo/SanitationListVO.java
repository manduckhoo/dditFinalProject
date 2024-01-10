package kr.or.onesome.sanitation.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class SanitationListVO {

    private int frcsNo;
    @JsonFormat(pattern = "yyyy. MM. dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date sntChckDt;
    private int sntSeatScr;
    private int sntFcltScr;
    private int sntFoodScr;
    private int sntEmpScr;

    private int rnum;
    private double avrScr;
    private String frcsNm;
}
