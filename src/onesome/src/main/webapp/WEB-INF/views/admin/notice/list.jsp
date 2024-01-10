<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/css/noticeList.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor2/ckeditor.js"></script>
<!-- 헤드부분 -->
<div
	class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
	<div class="card-body px-4 py-3">
		<div class="row align-items-center">
			<div class="col-9">
				<h1 class="fw-semibold mb-8">공지사항</h1>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							class="text-muted text-decoration-none" href="/admin/main">Main</a>
						</li>
						<li class="breadcrumb-item" aria-current="page">공지사항</li>
					</ol>
				</nav>
			</div>
			<div class="col-3">
				<div class="text-center mb-n5">
					<img
						src="/resources/bootstrap/src/assets/images/breadcrumb/ChatBc.png"
						alt="" class="img-fluid mb-n4">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 헤드부분 끝 -->

<!-- 공지사항 추가 모달 -->
<div id="add-contact" class="modal fade in" tabindex="-1"
	aria-labelledby="myModalLabel" aria-hidden="true" style="display: none">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-header d-flex align-items-center">
				<h1 class="modal-title" id="myModalLabel">공지사항 추가</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="form-horizontal form-material" id="frm"
					action="/admin/notice/writeNtc" enctype="multipart/form-data"
					method="post">

					<div class="form-group row">
						<label for="ntcTitle" class="col-sm-2 col-form-label"><strong>제목</strong></label>
						<div class="col-sm-10">
							<input type="text" id="ntcTitle" name="ntcTitle" class="form-control"
								placeholder="제목을 입력해주세요" required>
						</div>
						<br> <label for="ntcWrtr" class="col-sm-2 col-form-label">작성자</label>
						<div class="col-sm-10">
							<input type="text" id="ntcWrtr" name="ntcWrtr" class="form-control" value="${adminNm}"
								readonly>
						</div>

						<label for="ntcConts" class="col-sm-2 col-form-label"><strong>내용</strong></label>
						<div class="col-sm-10">
							<textarea id="ntcConts" name="ntcConts" class="form-control"
								placeholder="내용을 입력해주세요" required></textarea>
						</div>

						<br> <label for="ntcWrtr" class="col-sm-2 col-form-label">파일</label>
						<div class="col-sm-10">
							<div style="margin-top: 10px;"
								class="fileupload btn btn-light-primary btn-rounded waves-light bg-primary-subtle text-primary btn-sm">
								<span><i class="ion-upload m-r-5"></i>업로드</span> <input
									type="file" class="upload" name="uploadFile" />
							</div>
						</div>
					</div>
					<sec:csrfInput />
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info waves-effect" id="btnSave"
					data-bs-dismiss="modal">작성</button>
				<button type="button" class="btn btn-default waves-effect"
					id="btnCancel" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달끝 -->

<!-- 바디부분 -->
<div class="card">
	<div class="card-body">
		<div id="up-table-group" class="row">
			<div class="col-sm-3">
				<form id="frm">
					<div class="input-group">
						<input type="text" class="form-control"
							name="keyword" aria-label="" aria-describedby="basic-addon1">
						<button class="btn bg-info-subtle text-primary font-medium" type="submit">Search</button>
					</div>
				</form>
			</div>
			<div class="col" id="insert-btn-area">
				<button type="button" class="btn btn-primary btn-rounded m-t-10 mb-2"
				data-bs-toggle="modal" data-bs-target="#add-contact">공지사항 추가</button>
			</div>
		</div>
		<table class="table border text-nowrap customize-table mb-0 align-middle">
			<thead class="text-dark fs-4">
				<tr>
					<th>
						<h6 class="fs-4 fw-semibold mb-0">번호</h6>
					</th>
					<th>
						<h6 class="fs-4 fw-semibold mb-0">제목</h6>
					</th>
					<th>
						<h6 class="fs-4 fw-semibold mb-0">작성자</h6>
					</th>
					<th>
						<h6 class="fs-4 fw-semibold mb-0">작성일자</h6>
					</th>
				</tr>
			</thead>
<%-- 			<c:choose> --%>
<%-- 			<c:when test="${fn: length(noticeVOList) gt 0 }"> --%>
			<tbody>
				<c:forEach var="notice" items="${noticeVOList.content}">
					<tr>
						<td>
							<div class="d-flex align-items-center">
								<p>${notice.ntcNo}</p>
							</div>
						</td>
						<td>
							<div class="d-flex align-items-center">
								<a href="/admin/notice/detail?ntcNo=${notice.ntcNo}">${notice.ntcTitle}</a>
							</div>
						</td>
						<td>
							<div class="d-flex align-items-center">
								${notice.ntcWrtr}
							</div>
						</td>
						<td>
							<div class="d-flex align-items-center">
								<fmt:formatDate value="${notice.ntcWrtDt}" pattern="yyyy.MM.dd" />
							</div>
						</td>
					</tr>
				</c:forEach>
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<!-- 				<tbody> -->
<!-- 					<tr> -->
<!-- 						<td colspan="5" style="text-align: center;">공지사항이 없습니다</td> -->
<!-- 					</tr> -->
<!-- 				</tbody> -->
<%-- 			</c:otherwise> --%>
<%-- 			</c:choose> --%>
			</tbody>
		</table>
		<div id="pagingArea">${noticeVOList.getPagingArea()}</div>
	</div>
</div>
<script type="text/javascript">
CKEDITOR.replace('ntcConts', {
	language : 'ko',
	filebrowserUploadUrl : '/admin/ckeditor/imgUpload',
	font_defaultLabel : '맑은 고딕/Malgun Gothic',
	fontSize_defaultLabel : '12',
	skin : 'office2013',
	width : '600'

});

$("#btnSave").on("click", function() {
	if (!confirm("작성 하시겠습니까?")) {
		return;
	}
	$("#frm").submit();
});

$("#btnCancel").on("click", function() {
	if (!confirm("작성을 취소하시겠습니까?")) {
		location.href = "/admin/notice/list";
	}
});
</script>