package kr.or.onesome.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeVO {
	private int ntcNo;
	private String ntcTitle;
	private String ntcConts;
	private String ntcWrtr;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date ntcWrtDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date ntcMdfcnDt;
	private int atchFileNo;
	private int rnum;
	private String recent;
	private int next; //재람 추가 - 다음글 번호
	private int last; //재람 추가 - 이전글 번호
	private String nextTitle; //재람 추가 - 다음글 제목
	private String lastTitle; //재람 추가 - 이전글 제목
	private Date nextDay; //재람 추가 - 다음글 날짜
	private Date lastDay; //재람 추가 - 다음글 날짜
	
	private MultipartFile[] uploadFile;
	
	// 공지사항 : 첨부파일 (1:N)
	private List<AtchFileVO> atchFileVOList;
}
