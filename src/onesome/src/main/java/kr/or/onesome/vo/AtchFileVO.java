package kr.or.onesome.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AtchFileVO {
	private int atchFileNo;			//첨부파일 번호
	private int fileSn;				//파일 순번
	private String orignlFileNm;	//원본 파일명
	private String fileStreCours;	//저장 경로
	private String streFileNm;		//저장 파일명
	private String fileThumYn;		//썸네일 여부
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date fileUploadDt;		//최초 등록 일시
	private String fileExtsn;		//파일 확장자
	private long fileSize;			//파일 크기
}
