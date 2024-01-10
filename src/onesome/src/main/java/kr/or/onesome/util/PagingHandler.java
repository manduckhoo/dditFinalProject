package kr.or.onesome.util;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PagingHandler {
	private int currentPage; 	// 현재 페이지
	private int pageSize; 		// 한화면에 보이는 글 개수
	private int totalCount; 	// 전체 글 개수
	private int startNo; 		// 현재 페이지 글목록의 시작번호
	private int endNo; 			// 현재 페이지 글목록의 마지막번호
	private int startPage; 		// 페이지 이동버튼의 시작 번호
	private int endPage; 		// 페이지 이동 버튼의 마지막 번호
	private int totalPage;
	private String keyword = "";
	private String searchType;
	
	public PagingHandler(int currentPage, int pageSize, int totalCount) {
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		
		// 페이지 개수
		totalPage = (totalCount - 1)/pageSize + 1;
		
		// currentPage는 현재 페이지가 잘못된 값이 전달 되었을때 -> 1보다 작은 값 또는 totalPage보다 큰 값
		this.currentPage = (currentPage < 1) ? 1 : currentPage;
		this.currentPage = (currentPage > totalPage) ? totalPage : currentPage;
		
		startNo = (this.currentPage - 1) * pageSize + 1;
		endNo = startNo + (pageSize - 1); // totalCount 이하의 값이어야함
		
		this.endNo = this.endNo > totalCount ? totalCount : this.endNo;
		
		startPage = (this.currentPage - 1) / 10*10 + 1;
		
		endPage = startPage + 9;
		
		this.endPage = this.endPage > totalPage ? totalPage : this.endPage;
	}
}
