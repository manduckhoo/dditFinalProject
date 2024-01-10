<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- 헤더 -->
<div
	class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
	<div class="card-body px-4 py-3">
		<div class="row align-items-center">
			<div class="col-9">
				<h1 class="fw-semibold mb-8">직원상세</h1>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							class="text-muted text-decoration-none" href="/admin/hqemp/list">직원리스트</a>
						</li>
						<li class="breadcrumb-item" aria-current="page">직원상세</li>
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


<!-- 수정 모달 -->
<div id="mod-contact" class="modal fade in" tabindex="-1"
	aria-labelledby="myModalLabel" aria-hidden="true"
	style="display: none;">
	<!-- /.modal-dialog -->
	<div class="modal-dialog modal-dialog modal-lg">
		<!-- /.modal-content -->
		<div class="modal-content">
			<div class="modal-header d-flex align-items-center">
				<h3 class="modal-title" id="myModalLabel">직원정보 수정</h3>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="form-horizontal form-material" id="frm">
					<div class="form-group">
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="hqEmpNm" class="control-label col-form-label">직원명</label>
								<input type="text" class="form-control" name="hqEmpNm" 
									   value="${hqEmpVO.hqEmpNm}" readonly>
							</div>
							<div class="col-md-6 mb-3">
								<label for="hqEmpBrdt" class="control-label col-form-label">생일</label>
								<input type="date" class="form-control" name="hqEmpBrdt"
									   value="<fmt:formatDate value="${hqEmpVO.hqEmpBrdt}" pattern="yyyy-MM-dd"/>" required>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="hqEmpSal" class="control-label col-form-label">급여</label>
								<input type="number" class="form-control" name="hqEmpSal"
									   value="${hqEmpVO.hqEmpSal}" required>
							</div>
							<div class="col-md-6 mb-3">
								<label for="hqEmpTel" class="control-label col-form-label">휴대폰번호</label>
								<input type="tel" class="form-control" name="hqEmpTel"
									   oninput="hypenTel(this)" maxlength="13"
									   value="${hqEmpVO.hqEmpTel}" required>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="hqEmpQuitYn" class="control-label col-form-label">퇴사여부</label>
								<select class="form-select" id="hqEmpQuitYn" name="hqEmpQuitYn">
                                    <option disabled hidden>선택</option>
                                     <option <c:if test="${hqEmpVO.hqEmpQuitYn == 'Y' }"> selected</c:if>>Y</option>
                                     <option <c:if test="${hqEmpVO.hqEmpQuitYn == 'N' }"> selected</c:if>>N</option>
                                </select>
							</div>
							<div class="col-md-6 mb-3">
								<label for="hqCd" class="control-label col-form-label">본사코드</label>
								<input type="text" class="form-control" name="hqCd" 
									   value="${hqEmpVO.hqCd}" readonly>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="hqEmpTaskCd" class="control-label col-form-label">업무</label>
								<select class="form-select" id="hqEmpTaskCd" name="hqEmpTaskCd"
									required>
									<option value="select" disabled hidden>선택</option>
									<c:forEach var="comDetCodeInfo" items="${task}">
										<option <c:if test="${hqEmpVO.comDetCodeInfoVO.comDetCodeNm == comDetCodeInfo.comDetCodeNm}">selected</c:if> 
												value="${comDetCodeInfo.comDetCodeNm}">${comDetCodeInfo.comDetCodeNm}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-6 mb-3">
								<label for="hqWkplCd" class="control-label col-form-label">근무지</label>
								<select class="form-select" id="hqWkplCd" name="hqWkplCd"
									required>
									<option value="select" disabled hidden>선택</option>
									<c:forEach var="comDetCodeInfo" items="${wkpl}">
										<option <c:if test="${hqEmpVO.comDetCodeInfoVO.comDetCodeNm == comDetCodeInfo.comDetCodeNm}">selected</c:if> 
												value="${comDetCodeInfo.comDetCodeNm}">${comDetCodeInfo.comDetCodeNm}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="hqDeptCd" class="control-label col-form-label">부서</label>
								<select class="form-select" id="hqDeptCd" name="hqDeptCd"
									required>
									<option value="select" disabled hidden>선택</option>
									<c:forEach var="comDetCodeInfo" items="${dept}">
										<option <c:if test="${hqEmpVO.comDetCodeInfoVO.comDetCodeNm == comDetCodeInfo.comDetCodeNm}">selected</c:if> 
												value="${comDetCodeInfo.comDetCodeNm}">${comDetCodeInfo.comDetCodeNm}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-6 mb-3">
								<label for="hqPstnCd" class="control-label col-form-label">직급</label>
								<select class="form-select" id="hqPstnCd" name="hqPstnCd"
									required>
									<option value="select" disabled hidden>선택</option>
									<c:forEach var="comDetCodeInfo" items="${pstn}">
										<option <c:if test="${hqEmpVO.comDetCodeInfoVO.comDetCodeNm == comDetCodeInfo.comDetCodeNm}">selected</c:if> 
												value="${comDetCodeInfo.comDetCodeNm}">${comDetCodeInfo.comDetCodeNm}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="col-12">
								<div class="mb-3"
									style="display: grid; grid-template-rows: auto auto;">
									<label for=hqEmpRemk class="control-label col-form-label">특이사항</label>
									<textarea rows="15" cols="50" id="hqEmpRemk" name="hqEmpRemk"
										style="overflow: hidden;">${hqEmpVO.hqEmpRemk}</textarea>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div style="margin-top: 10px; width: 100%; text-align: start;"
									class="fileupload btn btn-light-primary btn-rounded waves-light bg-primary-subtle text-primary btn-sm">
									<span><i class="ion-upload m-r-5"></i>업로드</span> <input
										type="file" class="upload" name="uploadFile" />
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info waves-effect"
							id="btnModHqEmp">저장</button>
						<button type="button" class="btn btn-default waves-effect"
							data-bs-dismiss="modal">취소</button>
					</div>
					<sec:csrfInput />
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<!-- 바디부분 -->
<div class="card overflow-hidden chat-application">
	<div class="d-flex w-100">
		<div class="left-part border-end w-20 flex-shrink-0 d-none d-lg-block">
			<div class="px-9 pt-4 pb-3">
				<img
					src="/resources/upload/hqEmp/${hqEmpVO.atchFileVOList[0].streFileNm}"
					alt="user4" width="230" height="230" class="rounded-circle">
				<!-- 				<div class="custom-file"> -->
				<%-- 					<input type="file" class="form-control" id="customFile" value="${productVO.atchFileVOList.orignlFileNm}"> --%>
				<!-- 				</div> -->
			</div>
			<ul class="list-group simplebar-scrollable-y" style="height: 100%"
				data-simplebar="init">
				<div class="simplebar-wrapper" style="margin: 0px;">
					<div class="simplebar-height-auto-observer-wrapper">
						<div class="simplebar-height-auto-observer"></div>
					</div>
					<div class="simplebar-mask">
						<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
							<div class="simplebar-content-wrapper" tabindex="0" role="region"
								aria-label="scrollable content"
								style="height: 100%; overflow: hidden scroll;">
								<div class="simplebar-content" style="padding: 0px;">
									<ul>
										<li class="border-bottom my-3"></li>
										<li
											class="fw-semibold text-dark text-uppercase mx-9 my-2 px-3 fs-2">거래처</li>
										<li class="list-group-item border-0 p-0 mx-9"><a
											class="d-flex align-items-center gap-2 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1"
											href="/admin/acnt"> <i class="ti ti-bookmark fs-5 text-primary"></i>거래처목록
												${productVO.acntVO.acntMngrNm}
										</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="simplebar-placeholder"
						style="width: 229px; height: 370px;"></div>
				</div>
				<div class="simplebar-track simplebar-horizontal"
					style="visibility: hidden;">
					<div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
				</div>
				<div class="simplebar-track simplebar-vertical"
					style="visibility: visible;">
					<div class="simplebar-scrollbar"
						style="height: 111px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
				</div>
			</ul>
		</div>
		<div class="d-flex w-100">

			<div class="w-100">
				<div class="chat-container h-100 w-100" id="productDetailsContainer">
					<div class="chat-box-inner-part h-100">
						<div class="chatting-box app-email-chatting-box">
							<div
								class="p-9 py-3 border-bottom chat-meta-user d-flex align-items-center justify-content-between">
								<h5 class="text-dark mb-0 fw-semibold">직원 상세</h5>
							</div>
							<div class="position-relative overflow-hidden">
								<div class="position-relative">
									<div class="chat-box p-9" style="height: calc(100vh - 428px)"
										data-simplebar="init">
										<div class="simplebar-wrapper" style="margin: -20px;">
											<div class="simplebar-height-auto-observer-wrapper">
												<div class="simplebar-height-auto-observer"></div>
											</div>
											<div class="simplebar-mask">
												<div class="simplebar-offset"
													style="right: 0px; bottom: 0px;">
													<div class="simplebar-content-wrapper" tabindex="0"
														role="region" aria-label="scrollable content"
														style="height: 100%; overflow: hidden scroll;">
														<div class="simplebar-content" style="padding: 20px;">
															<div class="chat-list chat active-chat" data-user-id="1">
																<div class="row">
																	<div class="col-3 mb-7">
																		<div>
																			<p class="mb-1 fs-2">이름</p>
																			<h6 class="fw-semibold fs-4 mb-0">${hqEmpVO.hqEmpNm}</h6>
																		</div>
																	</div>
																	<div class="col-3 mb-7">
																		<c:set var="birth" value="${hqEmpVO.hqEmpBrdt}" />
<!-- 																		현재년도 -->
<%-- 																	<c:set var="now" value="<%=new java.util.Date()%>" /> --%>
<!-- 																		<div> -->
<!-- 																			<p class="mb-1 fs-2">나이</p> -->
<%-- 																			<h6 class="fw-semibold fs-4 mb-0">${hqEmpVO.hqEmpNm}</h6> --%>
<!-- 																		</div> -->
<!-- 																	</div> -->
																	</div>
																	<div class="row">
																		<div class="col-3 mb-7">
																			<p class="mb-1 fs-2">생일</p>
																			<h6 class="fw-semibold mb-0">
																				<fmt:formatDate value="${hqEmpVO.hqEmpBrdt}"
																					dateStyle="medium" />
																			</h6>
																		</div>
																		<div class="col-3 mb-7">
																			<p class="mb-1 fs-2">핸드폰번호</p>
																			<h6 class="fw-semibold mb-0">
																				${hqEmpVO.hqEmpTel}</h6>
																		</div>
																		<div class="col-3 mb-7">
																			<p class="mb-1 fs-2">업무</p>
																			<h6 class="fw-semibold mb-0">
																				${hqEmpVO.hqEmpTaskCd}</h6>
																		</div>
																		<div class="col-3 mb-7">
																			<p class="mb-1 fs-2">부서</p>
																			<h6 class="fw-semibold mb-0">
																				${hqEmpVO.hqDeptCd}</h6>
																		</div>
																		<div class="col-3 mb-7">
																			<p class="mb-1 fs-2">근무지</p>
																			<h6 class="fw-semibold mb-0">
																				${hqEmpVO.hqWkplCd}</h6>
																		</div>
																		<div class="col-3 mb-7">
																			<p class="mb-1 fs-2">급여</p>
																			<h6 class="fw-semibold mb-0">
																				<fmt:formatNumber maxFractionDigits="3"
																					value="${hqEmpVO.hqEmpSal}" />
																				원
																			</h6>
																		</div>
																		<div class="col-6 mb-7">
																			<p class="mb-1 fs-2">직급</p>
																			<h6 class="fw-semibold mb-0">
																				${hqEmpVO.hqPstnCd}</h6>
																		</div>
																		<div class="col-3 mb-7">
																			<p class="mb-1 fs-2">퇴사여부</p>
																			<h6 class="fw-semibold mb-0">
																				<c:choose>
																					<c:when test="${hqEmpVO.hqEmpQuitYn == 'Y'}">
																						<td style="display: table-cell;"><span style="color: red;">퇴사</span></td>
																					</c:when>
																					<c:otherwise>
																						<td style="display: table-cell;">-</td>
																					</c:otherwise>
																				</c:choose>
																			</h6>
																		</div>
																		<div class="col-6 mb-7">
																			<p class="mb-1 fs-2">본사코드</p>
																			<h6 class="fw-semibold mb-0">
																				${hqEmpVO.hqCd}</h6>
																		</div>
																	</div>
																	<div class="border-bottom pb-7 mb-7">
																		<p class="mb-2 fs-3">특이사항</p>
																		<h6 class="fw-semibold mb-0">${hqEmpVO.hqEmpRemk}</h6>
																	</div>
																	<div class="d-flex align-items-center gap-2">
																		<button class="btn btn-primary fs-2"
																			fdprocessedid="pk6kl8" type="button" id="btnUpdate"
																			data-bs-toggle="modal" data-bs-target="#mod-contact">수정</button>
																		
																		<c:choose>
																		<c:when test="${hqEmpVO.hqEmpQuitYn == 'Y'}">
																		<button class="btn btn-danger fs-2"
																			fdprocessedid="83zpb" type="button" id="btnDelete">
																			삭제</button>
																		</c:when>
																		<c:otherwise>
																			
																		</c:otherwise>
																		</c:choose>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="simplebar-placeholder"
													style="width: auto; height: 578px;"></div>
											</div>
											<div class="simplebar-track simplebar-horizontal"
												style="visibility: hidden;">
												<div class="simplebar-scrollbar"
													style="width: 0px; display: none;"></div>
											</div>
											<div class="simplebar-track simplebar-vertical"
												style="visibility: visible;">
												<div class="simplebar-scrollbar"
													style="height: 128px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
/* 전화번호 벨리데이션 */
const hypenTel = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}

$("#btnModHqEmp").on("click", function() {
	let form = $("#frm")[0];
	let formData = new FormData(form);
	
	formData.append("hqEmpNo", "${hqEmpVO.hqEmpNo}");
	formData.append("atchFileNo", "${hqEmpVO.atchFileNo}");
	
	$.ajax({
		url:"/admin/hqemp/modify",
		data:formData,
		type:"post",
		enctype:"multipart/form-data",
		processData:false,
		contentType:false,
		beforeSend:function(xhr) {
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
					title : '직원정보가 수정되었습니다.' //출력할 메세지 내용
				});
				
				setTimeout(function() {
					location.reload();
				}, 800);
        	}
		},
		error:function(err) {
			console.log(err);
		}
	});
	
});

$("#btnDelete").on("click", function() {
	let data = {
		"hqEmpNo":"${hqEmpVO.hqEmpNo}",
		"atchFileNo":"${hqEmpVO.atchFileNo}"
	};
	
	
	$.ajax({
		url:"/admin/hqemp/delete?hqEmpNo=" + data.hqEmpNo,
		data:JSON.stringify(data),
		contentType:"application/json;charset=utf-8",
		type:"post",
		beforeSend:function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success:function(result) {
			console.log(result);
			if(result == "success") {
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
					title : '퇴직직원이 삭제되었습니다.' //출력할 메세지 내용
				});
				setTimeout(function() {
					location.href="/admin/hqemp/list";
				}, 800); //0.8초 이후 자동 새로고침
        	}
		},
		error:function(err) {
			console.log(err);
		}
		
	});
})
</script>

