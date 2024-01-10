<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<link rel="stylesheet" href="/resources/css/memMenu.css">
<link rel="stylesheet" href="/resources/css/memNoticeList.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css" />
<style>
.pagination {
    /* --bs-pagination-color: #999999; */
    --bs-pagination-color: #000;
	--bs-pagination-border-color: transparent;
	--bs-pagination-disabled-bg: transparent;
    --bs-pagination-disabled-border-color: transparent;
   	--bs-pagination-disabled-color: #d6d6d6;
   	
   	/* 현재 선택된 페이지 배경색, 보더 */	
    --bs-pagination-active-bg: #000000;
    --bs-pagination-active-border-color: #000000;
    /* 마우스 올렸을때 */
    --bs-pagination-hover-color: #d50037;
    --bs-pagination-hover-bg: transparent;
    --bs-pagination-hover-border-color: transparent;
    /* 눌릴때 */
    --bs-pagination-focus-color: #d50037;
    --bs-pagination-focus-bg: transparent;
    
    --bs-pagination-focus-box-shadow: none;
}

.page-link:hover {
    text-decoration: underline;
}

/* 페이지 네이션 - Previous 버튼 */
.page-item:first-child .page-link {
    border-top-left-radius: 0px;
    border-bottom-left-radius: 0px;
    margin-right: 32px;
}
.page-item:first-child .page-link:hover {
	color:#000;
}


/* 페이지 네이션 - Next 버튼 */
.page-item:last-child .page-link {
    border-top-right-radius: 0px;
    border-bottom-right-radius: 0px;
    margin-left: 32px;
}
.page-item:last-child .page-link:hover {
	color:#000;
}

/* 페이지 네이션 - 현재 페이지 볼드 */
.page-link.active, .active > .page-link {
    font-weight: bold;
	text-decoration: none;
}
</style>
<div class="container breadcrumb" style="margin-top:70px; margin-left:392px;">
       	<nav class="breadcrumb" aria-label="breadcrumb">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
					<li class="breadcrumb-item"><a href="/mem/faq"><b>고객센터</b></b></a></li>
					<li class="breadcrumb-item" aria-current="page"
						style="color: #d50037"><b>공지사항</b></li>
				</ol>
			</nav>
		</nav>
    </div>
<section>
	<h2 class="sub-tit-name" style="margin-top:-50px; margin-bottom:10px;">공지사항</h2>
	<div class="noticeContainer">
		<fieldset>
			<div class="search">
			<!-- 기본 : method="get" action="현재URL" -->
			<form id="frm">
				<div class="search-board-wrap">
					<span class="search-board-select select"> 
						<select name="searchType" id="searchType" title="검색 범위">
							<option value="title" selected="">제목</option>
							<option value="content">내용</option>
						</select>
					</span>
					<span class="search-board-input input">
						<input type="text" name="keyword" id="keyword" placeholder="검색어 입력" title="검색어 입력" value="${param.searchTxt}" />
						<button type="submit" class="button-search">
							<i class="ti ti-search"></i>
						</button>
					</span>
				</div>
			</form>
			</div>
		</fieldset>
		<div class="notice-list">
				<c:forEach var="noticeVO" items="${data.content}" varStatus="stat">
					<a class="is-notice" href="/mem/notice/memDetail?ntcNo=${noticeVO.ntcNo}">
						<c:choose>
						    <c:when test="${noticeVO.recent=='Y'}">
						    	<div class="point-dot">
						        <i class="ti ti-point-filled"></i>
						        </div>
						    </c:when>
						    <c:otherwise>
						        <div class="list-num">${noticeVO.ntcNo}</div>
						    </c:otherwise>
						</c:choose>
						<div class="list-title">
							${noticeVO.ntcTitle}
							<i class="ti ti-arrow-right"></i>
						</div>
						<div class="list-date"><fmt:formatDate value="${noticeVO.ntcWrtDt}" pattern="yyyy-MM-dd" /></div>
					</a>
				</c:forEach>
		</div>
		${data.getPagingArea()}
	</div>
	</div>
</section>
