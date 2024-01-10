<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/bootstrap/src/assets/libs/prismjs/themes/prism-okaidia.min.css">

<!-- 헤드부분 -->
<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h1 class="fw-semibold mb-8">직원교육관리</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/main">홈</a>
                        </li>
                        <li class="breadcrumb-item" aria-current="page">직원교육</li>
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

<!-- 바디부분 -->
<div class="row">
	<div class="d-flex justify-content-end">
		<sec:authorize access="isAuthenticated()">
			<button type="button" id="btnAdd"
				class="btn btn-primary btn-rounded mb-1 addEduModal"
				data-bs-toggle="modal">
				<i class="ti ti-plus" style="margin-right: 5px;"></i> 교육 등록
			</button>
		</sec:authorize>
	</div>
	<c:forEach var="ojtVO" items="${ojtList}">
		<div class="col-lg-4 col-md-6"
			onclick="location.href='/admin/edu/detail?ojtNo=${ojtVO.ojtNo}'"
			style="cursor: pointer;">
			<div class="card">
				<img class="card-img-top img-responsive" style="width:100%; height:100vh; max-height: 300px;"
					src="/resources/upload/hqEmpEdu/${ojtVO.atchFileVOList[0].streFileNm}"
					alt="Card image cap">
				<div class="card-body">
					<h4 class="card-title">
						<b>${ojtVO.ojtTitle }</b>
					</h4>
					<p class="card-text">${ojtVO.ojtSubTitle}</p>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<!-- 바디부분 끝 -->

<!-- 상품등록 모달 시작 -->
<div class="modal fade" id="addEdu-modal" tabindex="-1"
	aria-labelledby="addProduct" style="display: none;" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header d-flex align-items-center"
				style="padding-bottom: 0px;">
				<h3 class="modal-title">교육 등록</h3>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body px-4">
				<form action="/admin/edu/addEdu" method="post" id="frm" enctype="multipart/form-data">
					<div class="card-body border-top" id="addEdu">
						<div class="row">
							<div class="col-12">
								<div class="mb-3">
									<label for="ojtTitle" class="control-label col-form-label">교육명</label>
									<input type="text" class="form-control" id="ojtTitle" name="ojtTitle" required> 
									<label id="validationCheckArea"></label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-md-6">
								<div class="mb-3">
									<label for="ojtType" class="control-label col-form-label">교육종류</label>
									<select class="form-select" id="ojtType" name="ojtType" required>
										<option value="select" selected disabled hidden>선택</option>
										<c:forEach var="comDetCodeInfo" items="${comDetCodeInfoVOList}">
											<!-- 본사직원 교육만 뽑아오기 위해 -->
											<c:if test="${comDetCodeInfo.comDetCode == 'OJT03' or 
														  comDetCodeInfo.comDetCode == 'OJT04' or
														  comDetCodeInfo.comDetCode == 'OJT05' or
														  comDetCodeInfo.comDetCode == 'OJT06' or
														  comDetCodeInfo.comDetCode == 'OJT07'}">
												<option value="${comDetCodeInfo.comDetCode}">${comDetCodeInfo.comDetCodeNm}</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-sm-12 col-md-6">
								<div class="mb-3">
									<label for="ojtSubTitle" class="control-label col-form-label">부제목</label>
									<input type="text" class="form-control" id="ojtSubTitle" name="ojtSubTitle" required/> 
								</div>
							</div>
						</div>
						<div class="row">
							<!-- 날짜 비교해서 시작일이 종료일보다 나중이면 작성안되게 validation 체크 -->
							<div class="col-sm-12 col-md-6">
								<div class="mb-3">
									<label for="ojtStrTime" class="control-label col-form-label">교육 시작일</label> 
									<input type="date" class="form-control" id="ojtStrTime" name="ojtStrTime" required />
								</div>
							</div>
							<div class="col-sm-12 col-md-6">
								<div class="mb-3">
									<label for="ojtEndTime" class="control-label col-form-label">교육 종료일</label> 
									<input type="date" class="form-control" id="ojtEndTime" name="ojtEndTime">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-md-6">
								<div class="mb-3">
									<label for="ojtPurpose" class="control-label col-form-label">교육목적</label>
									<input type="text" class="form-control" id="ojtPurpose" name="ojtPurpose" required/> 
								</div>
							</div>
							<div class="col-sm-12 col-md-6">
								<div class="mb-3">
									<label for="ojtLecturer" class="control-label col-form-label">강사</label>
									<input type="text" class="form-control" id="ojtLecturer" name="ojtLecturer" required /> 
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="mb-3">
									<label for="ojtDesc" class="control-label col-form-label">교육 내용</label>
									<textarea rows="15" cols="50" id="ojtDesc" name="ojtDesc" required></textarea>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="custom-file">
									<input type="file" class="form-control" id="upload"
										name="uploadFile" multiple>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn bg-warning-subtle font-medium"
							data-bs-dismiss="modal" id="btnCancel">취소</button>
						<button type="button" class="btn btn-primary" id="btnAddForm">등록</button>
					</div>
					<sec:csrfInput />
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 상품등록 모달 끝 -->

<script src="/resources/bootstrap/src/assets/libs/prismjs/prism.js"></script>
<script src="/resources/bootstrap/src/assets/js/widget/ui-card-init.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor2/ckeditor.js"></script>
<script type="text/javascript">
CKEDITOR.replace('ojtDesc', {
	language: 'ko',
	filebrowserUploadUrl: '/admin/ckeditor/imgUpload',
	font_defaultLabel: '맑은 고딕/Malgun Gothic',
	fontSize_defaultLabel: '12',
	skin: 'office2013',
    width:'452'
       
});

$(".addEduModal").on("click", function() {
	
	// input 값 지우기
	$("#addEdu").find('input[type=text]').each(function () {
        $(this).val('');
    });
    $("#addEdu").find('input[type=number]').each(function () {
        $(this).val('');
    });
    $("#addEdu").find('textarea[name=ojtDesc]').each(function () {
        $(this).val('');
    });
    $("#addEdu").find('input[type=date]').each(function () {
        $(this).val('');
    });
    $("#frm").find('select[class=form-select]').each(function () {
        $(this).val('');
    });
	 $("#addEdu-modal").modal("show");
});

$("#btnAddForm").on("click", function() {
	let form = $("#frm")[0];
	console.log("form", form);
	
	let formData = new FormData(form);
	
	$.ajax({
		url:"/admin/edu/addEdu",
		data:formData,
		type:"post",
		enctype:"multipart/form-data",
		processData:false, // 필수: FormData를 쿼리 문자열로 변환하지 않음
		contentType:false, // 필수: Content-Type 헤더를 설정하지 않음
		beforeSend:function(xhr){
        	xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        },
		success:function(result) {
			console.log(result);
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
					title : '교육이 등록되었습니다.' //출력할 메세지 내용
				});
				setTimeout(function() {
					location.reload();
				}, 800); //0.8초 이후 자동 새로고침
			}
		},
		error:function(err) {
			console.error(err)
		}
	})
	
});







</script>