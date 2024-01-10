<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/css/memMenu.css">
<link rel="stylesheet" href="/resources/css/memNoticeList.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor2/ckeditor.js"></script>

<!-- 헤드부분 -->
<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h1 class="fw-semibold mb-8">공지사항상세</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/notice/list">공지리스트</a>
                        </li>
                        <li class="breadcrumb-item" aria-current="page">공지상세</li>
                    </ol>
                </nav>
            </div>
            <div class="col-3">
                <div class="text-center mb-n5">
                    <img src="/resources/bootstrap/src/assets/images/breadcrumb/ChatBc.png" alt="" class="img-fluid mb-n4">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 헤드부분 끝 -->

<!-- 공지사항 수정 모달 -->
<div id="update-contact" class="modal fade in" tabindex="-1"
	aria-labelledby="myModalLabel" aria-hidden="true" style="display: none">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-header d-flex align-items-center">
				<h1 class="modal-title" id="myModalLabel">공지사항 수정</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="form-horizontal form-material" id="frm"
					action="/admin/notice/update" enctype="multipart/form-data"
					method="post">
					<input type="hidden" name="atchFileNo" value="${noticeDetail.atchFileNo}"/>
					<div class="form-group row">
						<label for="ntcTitle" class="col-sm-2 col-form-label"><strong>제목</strong></label>
						<div class="col-sm-10">
							<input type="text" id="ntcTitle" name="ntcTitle" class="form-control" style="width: 300px;"
								value="${noticeDetail.ntcTitle }" required>
						</div>
						<br> <label for="ntcWrtr" class="col-sm-2 col-form-label">작성자</label>
						<div class="col-sm-10">
							<input type="text" id="ntcWrtr" name="ntcWrtr" class="form-control" value="${noticeDetail.ntcWrtr}" style="width: 300px;"
								readonly>
						</div>

						<label for="ntcConts" class="col-sm-2 col-form-label"><strong>내용</strong></label>
						<div class="col-sm-10">
							<textarea id="ntcConts" name="ntcConts" class="form-control"
								 required>${noticeDetail.ntcConts}</textarea>
						</div>

						<br> <label for="ntcWrtr" class="col-sm-2 col-form-label">파일</label>
						<div class="col-sm-10">
							<div style="margin-top: 10px;"
								class="fileupload btn btn-light-primary btn-rounded waves-light bg-primary-subtle text-primary btn-sm">
								<span><i class="ion-upload m-r-5"></i>업로드</span> <input
									type="file" class="upload" name="uploadFile" multiple/>
							</div>
						</div>
					</div>
					<sec:csrfInput />
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info waves-effect" id="btnModSave"
					data-bs-dismiss="modal">저장</button>
				<button type="button" class="btn btn-default waves-effect"
					id="btnCancel" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달끝 -->

<div class="card shadow-none border" style="background-color: #fff">
<section>
   <h2 class="sub-tit-name">공지사항</h2>
   <div class="title-wrap">
      <h3 class="title-h3">${noticeDetail.ntcTitle}</h3>
      <div class="btnUpDel" style="padding-left: 88%;">
		<button class="btn mb-1 waves-effect waves-light bg-primary-subtle text-primary" type="button" id="btnUpdate" data-bs-toggle="modal" data-bs-target="#update-contact">수정</button>
		<button class="btn mb-1 waves-effect waves-light bg-danger-subtle text-danger" type="button" id="btnDelete">삭제</button>
	  </div>
      <div class="list-date">
         <fmt:formatDate value="${noticeDetail.ntcWrtDt}" pattern="yyyy-MM-dd" />
      </div>
   </div>
   <div class="noticeDetailContainer">
      <div class="notice-con">${noticeDetail.ntcConts}</div>
   </div>
   
   <!-- 첨부파일이 존재 할 떄 첨부파일 다운로드 제목? 뜸 -->
      <div class="notice-FileDl">
         <c:if test="${fn:length(noticeDetail.atchFileVOList) > 0}">
            <div class="btn-FileDl">첨부파일 다운로드</div>
         </c:if>
         <!--  memNoticeVO.atchFileVOList : List<AtchFileVO> -->
         <c:forEach var="atchFileVO" items="${noticeDetail.atchFileVOList}"
            varStatus="stat">
            <a href="/resources/upload/notice/${atchFileVO.streFileNm}" download="${atchFileVO.orignlFileNm}">
               ${atchFileVO.orignlFileNm} </a>
         </c:forEach>
      </div>
   
   <div class="btn-Nlist">
      <a href="/admin/notice/list">목록으로</a>
   </div>
   
   <!-- 여기부터 이전글 다음글 리스트 부분 -->
   <div class="list-nav">
      <!-- 이전글 -->   
      <c:choose >
         <c:when test="${movePage.next != 9999}">
            <div class="nav-prev">
            <button type="button" class="btn-prev" onclick="href='/admin/notice/detail?ntcNo=${movePage.next}'">
               이전글
            </button>
            <a href="/admin/notice/detail?ntcNo=${movePage.next}">
               <div class="list-title">${movePage.nextTitle}</div> 
               <div class="list-date"><fmt:formatDate value="${movePage.nextDay}" pattern="yyyy-MM-dd" dateStyle="medium" /></div>
            </a>
            </div>
         </c:when>
         <c:when test="${movePage.next == 9999}">
            <div class="nav-prev">
               <button type="button" class="btn-prev" onclick="href='/admin/notice/detail?ntcNo=${movePage.next}'">
                  이전글
               </button>
               <button type="button" class="btn-none-list" disabled>이전글이 없습니다</button>
            </div>
         </c:when>
      </c:choose>
      
      <!-- 다음글 -->
      <c:choose>
         <c:when test="${movePage.last != 9999}">
            <div class="nav-next">
            <button type="button" class="btn-next" onclick="href='/admin/notice/detail?ntcNo==${movePage.last}'">
               다음글
            </button>
            <a href="/admin/notice/detail?ntcNo=${movePage.last}"> 
               <div class="list-title">${movePage.lastTitle}</div>
               <div class="next-date"><fmt:formatDate value="${movePage.lastDay}" pattern="yyyy-MM-dd" /></div>
            </a>
            </div>
         </c:when>
         <c:when test="${movePage.last == 9999}">
            <div class="nav-next">
               <button type="button" class="btn-prev" onclick="href='/admin/notice/detail?ntcNo=${movePage.next}'">
                  이전글
               </button>
               <button type="button" class="btn-none-list" disabled>다음글이 없습니다</button>
            </div>
         </c:when>
      </c:choose>
   </div>
</section>
</div>
<script>
window.onload = function() {
	let currUser = "${adminNm}"; // 현재 로그인한 사용자 이름
	let ntcWrtr = "${noticeDetail.ntcWrtr}"; // 작성자 이름
	
	let divUpDel = $(".btnUpDel");
	if(currUser == ntcWrtr) {
		divUpDel[0].style.display = "block";
	} else {
		divUpDel[0].style.display = "none";
	}
}
CKEDITOR.replace('ntcConts', {
	language: 'ko',
	filebrowserUploadUrl: '/admin/ckeditor/imgUpload',
	font_defaultLabel: '맑은 고딕/Malgun Gothic',
	fontSize_defaultLabel: '12',
	skin: 'office2013',
    width:'600'
       
});

// 수정
$("#btnModSave").on("click", function () {
	// atchFileNo도 같이 controller로 보내줘야함
	console.log("여기 들어오냐 저장버튼")
	let frm = $("#frm")[0];
	console.log(frm);
	let formData = new FormData(frm);
	formData.append("ntcNo", "${noticeDetail.ntcNo}")
	
	if(!confirm("수정하시겠습니까?")) {
		return;
	}
	
	$.ajax({
		url:"/admin/notice/update",
		data:formData,
		type:"post",
		enctype:"multipart/form-data",
		processData:false,
		contentType:false,
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success: function(result) {
			console.log("res: >>>>> ", result);
			if(result > 0) {
        		var Toast = Swal.mixin({
					toast : true,
					position : 'top-end',
					showConfirmButton : false, //true면 ok버튼이 뜸
					timer : 1000, // 1초 동안 표시됨
					timerProgressBar : true
				// true하면 타임게이지 나옴
				});
				Toast.fire({
					icon : 'success', //출력할 아이콘 종류(success, warning, error, info, quesition)
					title : '공지사항이 수정되었습니다.' //출력할 메세지 내용
				});
				
				setTimeout(function() {
					location.reload();
				}, 800);
        	}
		},
		error: function(err) {
			console.error("error: ", err);
		}
	});
});

// 삭제
$("#btnDelete").on("click", function () {
	let data = {
		"ntcNo":${noticeDetail.ntcNo},
		"atchFileNo":${noticeDetail.atchFileNo}
	}
	console.log(data);
	
	if(!confirm("삭제하시겠습니까?")) {
		return;
	}
	
	$.ajax({
		url:"/admin/notice/delete?ntcNo=" + data.ntcNo,
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		type:"post",
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success: function(res) {
			console.log("res: " , res);
			alert("삭제 완료");
			location.href="/admin/notice/list";
		},
		error: function(err) {
			console.error("error: ", err);
		}
	});
});

</script>








