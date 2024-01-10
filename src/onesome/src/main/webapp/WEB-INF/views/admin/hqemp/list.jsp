<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/bootstrap/src/assets/libs/footable-v3/compiled/footable.bootstrap.min.css">

<style>
	table {
		text-align: center;
	}
</style>
<!-- 헤드부분 -->
<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h1 class="fw-semibold mb-8">직원관리</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/main">Main</a>
                        </li>
                        <li class="breadcrumb-item" aria-current="page">직원관리</li>
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
<div class="card">
	<div class="card-body">
		<!-- 모달버튼 -->
		<div id="up-table-group" class="row">
			<div class="col-sm-3">
				<form>
					<div class="input-group">
						<input type="text" class="form-control"
							name="keyword" aria-label="" aria-describedby="basic-addon1">
						<button class="btn bg-info-subtle text-primary font-medium" type="submit">Search</button>
					</div>
				</form>
			</div>			
			
			<div class="col" id="insert-btn-area" style="text-align: right !important;">
				<button type="button" class="btn btn-primary btn-rounded m-t-10 mb-2"
				data-bs-toggle="modal" data-bs-target="#add-contact">직원등록</button>
			</div>
		</div>
		
		<!-- Add Contact 모달 -->
		<div id="add-contact" class="modal fade in" tabindex="-1"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<!-- /.modal-dialog -->
			<div class="modal-dialog modal-dialog modal-lg">
				<!-- /.modal-content -->
				<div class="modal-content">
					<div class="modal-header d-flex align-items-center">
						<h3 class="modal-title" id="myModalLabel">직원등록</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form class="form-horizontal form-material" id="frm">
						<div class="form-group">
							<input type="hidden" value="${HQCD}"/>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="hqEmpNm" class="control-label col-form-label">직원명</label>
									<input type="text" class="form-control" name="hqEmpNm" placeholder="직원명을 입력해주세요" required>
								</div>
								<div class="col-md-6 mb-3">
									<label for="hqEmpBrdt" class="control-label col-form-label">생일</label>
									<input type="date" class="form-control" name="hqEmpBrdt" placeholder="생일" required>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="hqEmpSal" class="control-label col-form-label">급여</label>
									<input type="number" class="form-control" name="hqEmpSal" placeholder="급여를 입력해주세요" required>
								</div>
								<div class="col-md-6 mb-3">
									<label for="hqEmpTel" class="control-label col-form-label">휴대폰번호</label>
									<input type="tel" class="form-control" name="hqEmpTel" placeholder="휴대폰번호를 입력해주세요" 
										   oninput="hypenTel(this)" maxlength="13" required>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="hqEmpTaskCd" class="control-label col-form-label">업무</label>
									<select class="form-select" id="hqEmpTaskCd" name="hqEmpTaskCd" required>
										<option value="select" selected disabled hidden>선택</option>
										<c:forEach var="comDetCodeInfo" items="${task}">
											<option value="${comDetCodeInfo.comDetCodeNm}">${comDetCodeInfo.comDetCodeNm}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-6 mb-3">
									<label for="hqWkplCd" class="control-label col-form-label">근무지</label>
									<select class="form-select" id="hqWkplCd" name="hqWkplCd" required>
										<option value="select" selected disabled hidden>선택</option>
										<c:forEach var="comDetCodeInfo" items="${wkpl}">
											<option value="${comDetCodeInfo.comDetCodeNm}">${comDetCodeInfo.comDetCodeNm}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="hqDeptCd" class="control-label col-form-label">부서</label>
									<select class="form-select" id="hqDeptCd" name="hqDeptCd" required>
										<option value="select" selected disabled hidden>선택</option>
										<c:forEach var="comDetCodeInfo" items="${dept}">
											<option value="${comDetCodeInfo.comDetCodeNm}">${comDetCodeInfo.comDetCodeNm}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-6 mb-3">
									<label for="hqPstnCd" class="control-label col-form-label">직급</label>
									<select class="form-select" id="hqPstnCd" name="hqPstnCd" required>
										<option value="select" selected disabled hidden>선택</option>
										<c:forEach var="comDetCodeInfo" items="${pstn}">
											<option value="${comDetCodeInfo.comDetCodeNm}">${comDetCodeInfo.comDetCodeNm}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="row">
	                            <div class="col-12">
	                                <div class="mb-3" style=" display: grid;grid-template-rows: auto auto;">
	                                    <label for=hqEmpRemk class="control-label col-form-label">특이사항</label>
	                                    <textarea class="form-control" rows="15" cols="50" id="hqEmpRemk" name="hqEmpRemk" style="overflow: hidden;"></textarea>
	                                </div>
	                            </div>
                        	</div>
							<div class="row">
								<div class="col-12">
									<div style="margin-top: 10px;width: 100%; text-align: start;"
										class="fileupload btn btn-light-primary btn-rounded waves-light bg-primary-subtle text-primary btn-sm">
										<span><i class="ion-upload m-r-5"></i>업로드</span> <input
											type="file" class="upload" name="uploadFile" />
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-info waves-effect" id="btnAddHqEmp" >등록</button>
							<button type="button" class="btn btn-default waves-effect"
								data-bs-dismiss="modal">취소</button>
						</div>
						<sec:csrfInput/>
						</form>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<div class="table-responsive">
			<table id="demo-foo-addrow"
				class="table table-bordered m-t-30 table-hover contact-list footable footable-5 footable-paging footable-paging-center breakpoint-lg"
				data-paging="true" data-paging-size="7" style="">
				<thead>
					<tr class="footable-header">
						<th class="footable-first-visible" style="display: table-cell;">번호</th>
						<th style="display: table-cell;">직원명</th>
						<th style="display: table-cell;">담당업무</th>
						<th style="display: table-cell;">근무지</th>
						<th style="display: table-cell;">직급</th>
						<th style="display: table-cell;">퇴사여부</th>
						<th class="footable-last-visible" style="display: table-cell;">부서</th>
					</tr>
				</thead>
				<c:choose>
				<c:when test="${not empty hqEmpVOList}">
				<c:forEach var="hqEmpVO" items="${hqEmpVOList.content}">
				<tbody>
					<tr>
						<td class="footable-first-visible" style="display: table-cell;">${hqEmpVO.hqEmpNo}</td>
						<td style="display: table-cell;"><a href="/admin/hqemp/detail?hqEmpNo=${hqEmpVO.hqEmpNo}"
							class="link"><img src="/resources/upload/hqEmp/${hqEmpVO.atchFileVOList[0].streFileNm}"
								alt="user" width="30" height="30" class="rounded-circle"> ${hqEmpVO.hqEmpNm}</a></td>
						<td style="display: table-cell;">
							<c:if test="${hqEmpVO.hqEmpTaskCd eq '인사업무' }">
								<span class="badge text-bg-danger">${hqEmpVO.hqEmpTaskCd}</span>
							</c:if>
							<c:if test="${hqEmpVO.hqEmpTaskCd eq '개발업무' }">
								<span class="badge text-bg-success">${hqEmpVO.hqEmpTaskCd}</span>
							</c:if>
							<c:if test="${hqEmpVO.hqEmpTaskCd eq '회계업무' }">
								<span class="badge text-bg-primary">${hqEmpVO.hqEmpTaskCd}</span>
							</c:if>
							<c:if test="${hqEmpVO.hqEmpTaskCd eq '영업업무' }">
								<span class="badge text-bg-warning">${hqEmpVO.hqEmpTaskCd}</span>
							</c:if>
						</td>
						<td style="display: table-cell;">${hqEmpVO.hqWkplCd}</td>
						<td style="display: table-cell;">${hqEmpVO.hqPstnCd}</td>
						<c:choose>
						<c:when test="${hqEmpVO.hqEmpQuitYn == 'Y'}">
							<td style="display: table-cell;"><span class="mb-1 badge font-medium bg-danger-subtle text-danger">퇴사</span></td>
						</c:when>
						<c:otherwise>
							<td style="display: table-cell;">-</td>
						</c:otherwise>
						</c:choose>
						<td class="footable-last-visible" style="display: table-cell;">${hqEmpVO.hqDeptCd}</td>
					</tr>
				</tbody>
				</c:forEach>
				</c:when>
				<c:otherwise>
				<tbody>
					<tr>
						<td colspan="7" style="align-content: center;">결과가 없습니다</td>
					</tr>
				</tbody>
				</c:otherwise>
				</c:choose>
				<tfoot>
				</tfoot>
			</table>
			<!-- 페이징 -->
			<div id="pagingArea">${hqEmpVOList.getPagingArea()}</div>
		</div>
	</div>
</div>
<!-- 바디부분 끝 -->

<script type="text/javascript">
/* 전화번호 validation */
const hypenTel = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}

$("#btnAddHqEmp").on("click", function () {
	let form = $("#frm")[0];
	console.log("form", form);
	
	let formData = new FormData(form);
	console.log("formData: ", formData);
	$.ajax({
		url:"/admin/hqemp/regist",
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
					title : '직원이 등록되었습니다.' //출력할 메세지 내용
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
	
})
</script>

<script src="/resources/bootstrap/src/assets/libs/moment-js/build/moment.min.js"></script>
<!-- <script src="/resources/bootstrap/src/assets/js/tables/footable-init.js"></script> -->
<script src="/resources/bootstrap/src/assets/libs/footable-v3/compiled/footable.min.js"></script>