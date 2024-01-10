package kr.or.onesome.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FreeBoardVO {
	private int freeBoardNo; //자유 게시판 번호
	private String freeBoardTitle; //게시판 제목
	private String freeBoardConts; //게시판 내용
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date freeBoardWrtDt; //게시판 작성일시
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date freeBoardFnlMdfDt; //게시판 수정일시
	private int freeBoardWrtrNo; // 작성자 = 점주번호
	private int atchFileNo; //첨부파일번호
	private int freeBoardView; //게시판 조회수
	private String frcsOwnrNm; //프렌차이즈 점주 이름
	
	private MultipartFile[] uploadFile;
	
	//첨부파일 (1:N)
	private List<AtchFileVO> atchFileVOList;
	
}
