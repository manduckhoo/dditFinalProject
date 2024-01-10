<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/bootstrap/src/assets/libs/owl.carousel/dist/assets/owl.carousel.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor2/ckeditor.js"></script>
<style>
#imgBox {
	max-height: 400px; 
	max-width: 500px; 
	margin-right: 100px;
}
img {

}
</style>
<!-- 헤드부분 -->
<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h1 class="fw-semibold mb-8">교육상세</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/edu/list">교육리스트</a>
                        </li>
                        <li class="breadcrumb-item" aria-current="page">교육상세</li>
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

<!-- 교육수정 모달 시작 -->
<div class="modal fade" id="modifyEdu-modal" tabindex="-1"
	aria-labelledby="modifyEdu" style="display: none;" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header d-flex align-items-center"
				style="padding-bottom: 0px;">
				<h3 class="modal-title">교육 수정</h3>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body px-4">
				<form action="/admin/edu/modifyEdu" method="post" id="frm" enctype="multipart/form-data">
					<input type="hidden" name="atchFileNo" value="${ojtVO.atchFileNo}"/>
					<div class="card-body border-top" id="modifyEdu">
						<div class="row">
							<div class="col-12">
								<div class="mb-3">
									<label for="ojtTitle" class="control-label col-form-label">교육명</label>
									<input type="text" class="form-control" id="ojtTitle" name="ojtTitle" value="${ojtVO.ojtTitle}" required> 
									<label id="validationCheckArea"></label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-md-6">
								<div class="mb-3">
									<label for="ojtType" class="control-label col-form-label">교육종류</label>
									<select class="form-select" id="ojtType" name=ojtType required>
										<option value="select" disabled hidden>선택</option>
										<c:forEach var="comDetCodeInfo" items="${comDetCodeInfoVOList}">
											<option <c:if test="${comDetCodeInfo.comDetCode == 'OJT01' or comDetCodeInfo.comDetCode == 'OJT02'}"></c:if> style="display: none;" value="${comDetCodeInfo.comDetCode}" >${comDetCodeInfo.comDetCodeNm}</option>
											<option <c:if test="${ojtVO.comDetCodeInfoVO.comDetCodeNm == comDetCodeInfo.comDetCodeNm}">selected</c:if> value="${comDetCodeInfo.comDetCode}">
												<c:if test="${comDetCodeInfo.comDetCode == 'OJT03' or 
													  comDetCodeInfo.comDetCode == 'OJT04' or
													  comDetCodeInfo.comDetCode == 'OJT05' or
													  comDetCodeInfo.comDetCode == 'OJT06' or
													  comDetCodeInfo.comDetCode == 'OJT07'}">
													${comDetCodeInfo.comDetCodeNm}
												</c:if>
											</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-sm-12 col-md-6">
								<div class="mb-3">
									<label for="ojtSubTitle" class="control-label col-form-label">부제목</label>
									<input type="text" class="form-control" id="ojtSubTitle" name="ojtSubTitle" value="${ojtVO.ojtSubTitle}" required/> 
								</div>
							</div>
						</div>
						<div class="row">
							<!-- 날짜 비교해서 시작일이 종료일보다 나중이면 작성안되게 validation 체크 -->
							<div class="col-sm-12 col-md-6">
								<div class="mb-3">
									<label for="ojtStrTime" class="control-label col-form-label">교육 시작일</label> 
									<input type="date" class="form-control" id="ojtStrTime" name="ojtStrTime" value="<fmt:formatDate value="${ojtVO.ojtStrTime}" pattern="yyyy-MM-dd"/>" required />
								</div>
							</div>
							<div class="col-sm-12 col-md-6">
								<div class="mb-3">
									<label for="ojtEndTime" class="control-label col-form-label">교육 종료일</label> 
									<input type="date" class="form-control" id="ojtEndTime" name="ojtEndTime" value="<fmt:formatDate value="${ojtVO.ojtEndTime}" pattern="yyyy-MM-dd"/>" required />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-md-6">
								<div class="mb-3">
									<label for="ojtPurpose" class="control-label col-form-label">교육목적</label>
									<input type="text" class="form-control" id="ojtPurpose" name="ojtPurpose" value="${ojtVO.ojtPurpose}" required/> 
								</div>
							</div>
							<div class="col-sm-12 col-md-6">
								<div class="mb-3">
									<label for="ojtLecturer" class="control-label col-form-label">강사</label>
									<input type="text" class="form-control" id="ojtLecturer" name="ojtLecturer" value="${ojtVO.ojtLecturer}" required /> 
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="mb-3">
									<label for=ojtDesc class="control-label col-form-label">교육 내용</label>
									<textarea rows="15" cols="50" id="ojtDesc" name="ojtDesc" required>${ojtVO.ojtDesc}</textarea>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="custom-file">
									<input type="file" class="form-control" id="upload"
										name="uploadFile" value="${ojtVO.atchFileVOList[0].orignlFileNm}" multiple>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn bg-warning-subtle font-medium"
							data-bs-dismiss="modal" id="btnCancel">취소</button>
						<button type="button" class="btn btn-primary" id="btnModSave">저장</button>
					</div>
					<sec:csrfInput />
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 상품등록 모달 끝 -->

<!-- 바디부분 -->
<div class="card shadow-none border">
	<div class="card-body p-4">
		<!-- 시큐리티 넣을곳,,,, 관리자만 볼수 있게  -->
		<ul class="list-unstyled mb-0 d-flex align-items-center">
			<li class="position-relative" data-bs-toggle="tooltip"
				data-bs-placement="top" data-bs-title="Edit" style="margin-left: auto;"><a
				class="d-block text-dark px-2 fs-5 bg-hover-primary nav-icon-hover position-relative z-index-5"
				onclick="btnEduModify()"> <i class="ti ti-pencil"></i>
			</a></li>
			<li class="position-relative" data-bs-toggle="tooltip"
				data-bs-placement="top" data-bs-title="Delete"><a
				class="text-dark px-2 fs-5 bg-hover-primary nav-icon-hover position-relative z-index-5"
				onclick="btnEduDel()"> <i class="ti ti-trash"></i>
			</a></li>
		</ul>
		<div class="row">
			<div class="col-lg-6" id="imgBox">
				<img width="500vh;" height="400vh;"
					src="/resources/upload/hqEmpEdu/${ojtVO.atchFileVOList[0].streFileNm}"
					alt="user4">
			</div>
			<div class="col-lg-6">
				<div class="shop-content">
					<h4 class="fw-semibold">${ojtVO.ojtTitle}</h4>
					<p class="mb-3">${ojtVO.comDetCodeInfoVO.comDetCodeNm}</p>
					<div class="d-flex align-items-center gap-8 pb-4 border-bottom"></div>
					<div class="d-flex align-items-center gap-8 py-7">
						<h6 class="mb-0 fs-4 fw-semibold">목적:</h6>
							<p class="mb-0 fs-3 ojtPurpose">${ojtVO.ojtPurpose}<p>
					</div>
					
					<div class="d-flex align-items-center gap-8 py-7 border-bottom">
						<h6 class="mb-0 fs-4 fw-semibold">강사:</h6>
							<p class="mb-0 fs-3">${ojtVO.ojtLecturer}
					</div>
					
					<div class="d-flex align-items-center gap-8 py-7 border-bottom">
						<h6 class="mb-0 fs-4 fw-semibold">교육시작일:</h6>
						<fmt:formatDate value="${ojtVO.ojtStrTime}" pattern="yyyy.MM.dd" dateStyle="medium"/>
						 
						 
						<h6 class="mb-0 fs-4 fw-semibold">교육종료일:</h6>
						<c:choose>
							<c:when test="${not empty ojtVO.ojtEndTime}">
								<fmt:formatDate value="${ojtVO.ojtEndTime}" pattern="yyyy.MM.dd" dateStyle="medium"/>
							</c:when>
							<c:otherwise>
								<p class="mb-0 fs-3">진행중
							</c:otherwise>
						</c:choose>
					</div>
					
					<div class="d-sm-flex align-items-center gap-3 pt-8 mb-7">
<%-- 						<sec:authorize access="isAuthenticated()"> --%>
<!-- 							<a href="javascript:void(0)" class="btn d-block btn-primary px-5 py-8 mb-2 mb-sm-0">교육신청</a> -->
<%-- 						</sec:authorize> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 바디부분 끝 -->

<!-- description -->
<div class="card shadow-none border">
	<div class="card-body p-4">
		<ul class="nav nav-pills user-profile-tab border-bottom"
			id="pills-tab" role="tablist">
			<li class="nav-item" role="presentation">
				<button
					class="nav-link position-relative rounded-0 active d-flex align-items-center justify-content-center bg-transparent fs-3 py-6"
					id="pills-description-tab" data-bs-toggle="pill"
					data-bs-target="#pills-description" type="button" role="tab"
					aria-controls="pills-description" aria-selected="true">
					Description</button>
			</li>
<!-- 			<li class="nav-item" role="presentation"> -->
<!-- 				<button -->
<!-- 					class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-6" -->
<!-- 					id="pills-reviews-tab" data-bs-toggle="pill" -->
<!-- 					data-bs-target="#pills-reviews" type="button" role="tab" -->
<!-- 					aria-controls="pills-reviews" aria-selected="false" tabindex="-1"> -->
<!-- 					Reviews</button> -->
<!-- 			</li> -->
		</ul>
		<div class="tab-content pt-4" id="pills-tabContent">
			<div class="tab-pane fade show active" id="pills-description"
				role="tabpanel" aria-labelledby="pills-description-tab" tabindex="0">
				<h5 class="fs-5 fw-semibold mb-7">${ojtVO.ojtTitle}</h5>
				<p class="mb-7">${ojtVO.ojtDesc}</p>
			</div>
		</div>
		<div class="tab-pane fade" id="pills-reviews" role="tabpanel" aria-labelledby="pills-reviews-tab" tabindex="0">리뷰들어갈곳</div>
	</div>
</div>
<!-- description 끝 -->


<script type="text/javascript">
CKEDITOR.replace('ojtDesc', {
	language: 'ko',
	filebrowserUploadUrl: '/admin/ckeditor/imgUpload',
	font_defaultLabel: '맑은 고딕/Malgun Gothic',
	fontSize_defaultLabel: '12',
	skin: 'office2013',
    width:'452'
       
});

function btnEduDel() {
	let data = {
		"ojtNo":${ojtVO.ojtNo},
		"atchFileNo":${ojtVO.atchFileNo}
	}
	console.log(data);
	
	$.ajax({
		url:"/admin/edu/delEdu?ojtNo=" + data.ojtNo,
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		type:"post",
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
					title : '교육이 삭제 되었습니다.' //출력할 메세지 내용
				});
				setTimeout(function() {
					location.href="/admin/edu/list";
				}, 800); //0.8초 이후 자동 새로고침
        	}
        }
	});
}

/* 수정버튼클릭시 모달 open */
function btnEduModify() {
	console.log("안들어오냐??")
	$("#modifyEdu-modal").modal("show");
}

/* 수정모달 저장 */
$("#btnModSave").on("click", function() {
	let form = $("#frm")[0];
	let formData = new FormData(form);
	
	formData.append("ojtNo", "${ojtVO.ojtNo}"); // form에 데이터 추가할 때 append쓰면됨
	
	$.ajax({
		url:"/admin/edu/updateEdu",
		data:formData,
		type:"post",
		enctype:"multipart/form-data",
		processData:false,
		contentType:false,
		beforeSend:function(xhr){
        	xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        },
        success:function(result) {
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
					title : '교육이 수정되었습니다.' //출력할 메세지 내용
				});
				
				setTimeout(function() {
					location.reload();
				}, 800);
        	}
        },
        error:function(err) {
        	console.error(err);
        }
	});
});
</script>

<script src="/resources/bootstrap/src/assets/js/apps/productDetail.js"></script>
<script src="/resources/bootstrap/src/assets/libs/owl.carousel/dist/owl.carousel.min.js"></script>