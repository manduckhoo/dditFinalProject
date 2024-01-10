package kr.or.onesome.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CommentsVO {
	private int cmntsSn;
	private int freeBoardNo;
	private String cmntsWrtr;
	private String cmntsConts;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd", timezone = "Asia/Seoul")
	private Date cmntsWrtDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd", timezone = "Asia/Seoul")
	private Date cmntsFnlMofDt;
}
