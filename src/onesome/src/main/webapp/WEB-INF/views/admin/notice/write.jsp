<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap.min.js"></script>

<div class="container" style="margin-bottom: 50px;">
	<h1><strong>공지사항 작성</strong></h1>
</div>
<br>
<div class="container">
	<form id="frm" action="/admin/notice/writeNtc" enctype="multipart/form-data" method="post">
		<!-- 작성날짜 sysdate -->
		<!-- 작성자: 관리자만 -->
<!-- 		<input type="hidden" id="ntcNo" name="ntcNo"> -->
		<div class="form-group row">
			<label for="ntcTitle" class="col-sm-2 col-form-label"><strong>제목</strong></label>
			<div class="col-sm-10">
				<input type="text" id="ntcTitle" name="ntcTitle" placeholder="제목을 입력해주세요" required>
			</div>
			<br>
			<label for="ntcWrtr" class="col-sm-2 col-form-label">작성자</label>
			<div class="col-sm-10">
				<input type="text" id="ntcWrtr" name="ntcWrtr" value="${id}" readonly>
			</div>
			
			<label for="ntcConts" class="col-sm-2 col-form-label"><strong>내용</strong></label>
			<div class="col-sm-10">
				<textarea id="ntcConts" name="ntcConts" class="form-control" placeholder="내용을 입력해주세요" required></textarea>
			</div>
			<label for="uploadFile" class="col-sm-2 col-form-label"></label>
			<div class="col-sm-10">
				<input type="file" name="uploadFile">
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-auto mr-auto"></div>
			<div class="col-auto">
				<button type="button" id="btnSave" class="btn btn-primary">작성</button>
				<button type="button" id="btnCancel" class="btn btn-light">취소</button>
			</div>
		</div>
		<sec:csrfInput />
	</form>
</div>


<script type="text/javascript">
CKEDITOR.replace('ntcConts', {
	language: 'ko',
	filebrowserUploadUrl: '/admin/ckeditor/imgUpload',
	font_defaultLabel: '맑은 고딕/Malgun Gothic',
	fontSize_defaultLabel: '12',
	skin: 'office2013',
    width:'600'
       
});

$("#btnSave").on("click", function() {
	if(!confirm("작성 하시겠습니까?")) {
		return;
	}
	
	let ntcTitle = $("#ntcTitle").val();
	
	
	if(ntcTitle == null) {
		alert("제목을 입력해주세요");
		return;
	}
	$("#frm").submit();
});

$("#btnCancel").on("click", function() {
	if(!confirm("작성을 취소하시겠습니까?")) {
		location.href="/admin/notice/list";
	}
});
</script>	
