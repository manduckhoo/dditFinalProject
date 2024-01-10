<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 헤더 -->
<div
	class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
	<div class="card-body px-4 py-3">
		<div class="row align-items-center">
			<div class="col-9">
				<h1 class="fw-semibold mb-8">제품상세</h1>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							class="text-muted text-decoration-none" href="/admin/product/product">제품리스트</a>
						</li>
						<li class="breadcrumb-item" aria-current="page">제품상세</li>
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


<!-- 상품수정 모달 시작 -->
<div class="modal fade" id="modifyProduct-modal" tabindex="-1" aria-labelledby="modifyProduct" style="display: none;"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header d-flex align-items-center" style="padding-bottom: 0px;">
                <h3 class="modal-title">
                    제품 수정
                </h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body px-4">
                <form action="/admin/product/modifyProd" method="post" id="frm" enctype="multipart/form-data">
                	<input type="hidden" name="prdctNo" value="${productVO.prdctNo}">
                	<input type="hidden" name="atchFileNo" value="${productVO.atchFileNo}"/>
                    <div class="card-body border-top" id="modifyProduct">
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-3">
                                    <label for="prdctNm" class="control-label col-form-label">제품명</label>
                                    <input type="text" class="form-control" id="prdctNm" name="prdctNm" value="${productVO.prdctNm}" required>
                                    <label id="validationCheckArea"></label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-4">
                                <div class="mb-3">
                                    <label for="prdctRcvnAmt" class="control-label col-form-label">입고단가</label>
                                    <input type="number" min={0} max={1000000000000} class="form-control" id="prdctRcvnAmt" name="prdctRcvnAmt"
                                           value="${productVO.prdctRcvnAmt}" required>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                                <div class="mb-3">
                                    <label for="prdctClsfCd" class="control-label col-form-label">카테고리</label>
                                    <select class="form-select" id="prdctClsfCd" name="prdctClsfCd">
                                    	
                                        <option value="select" disabled hidden>선택</option>
                                        <c:forEach var="comDetCodeInfo" items="${comDetCodeInfoVOList}">
                                        	<option <c:if test="${productVO.comDetCodeInfoVO.comDetCodeNm == comDetCodeInfo.comDetCodeNm}">selected</c:if> value="${comDetCodeInfo.comDetCode}">${comDetCodeInfo.comDetCodeNm}</option>
                                        </c:forEach>
<!--                                         <option value="PRCT01" id="PRCT01">원두류</option> -->
<!--                                         <option value="PRCT02" id="PRCT02">제과류</option> -->
<!--                                         <option value="PRCT03" id="PRCT03">식기류</option> -->
<!--                                         <option value="PRCT04" id="PRCT04">시럽</option> -->
<!--                                         <option value="PRCT05" id="PRCT05">소모품</option> -->
<!--                                         <option value="PRCT06" id="PRCT06">상품</option> -->
<!--                                         <option value="PRCT07" id="PRCT07">유제품</option> -->
<!--                                         <option value="PRCT08" id="PRCT08">음료류</option> -->
<!--                                         <option value="PRCT09" id="PRCT09">청과류</option> -->
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                            	<div class="mb-3">
	                            	<label for="prdctClsfCd" class="control-label col-form-label">거래처</label>
				                    <select class="form-select" id="acntNo" name="acntNo">
				                        <option value="" disabled hidden="">거래처선택</option>
				                        <c:forEach var="acnt" items="${acntVOList}">
				                        	
				                            <option <c:if test="${acnt.acntNo == productVO.acntNo} ">selected</c:if> value="${acnt.acntNo}">${acnt.acntNm}</option>
				                        </c:forEach>
				                    </select>
			                    </div>
	                		</div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-4">
                                <div class="mb-3">
                                    <label for="hqInvenCnt" class="control-label col-form-label">본사재고수량</label>
                                    <input type="number" class="form-control" id="hqInvenCnt" name="hqInvenCnt" value="${productVO.hqInvenCnt}">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="hqInvenProperCnt" class="control-label col-form-label">본사적정수량</label>
                                    <input type="number" class="form-control" id="hqInvenProperCnt" name="hqInvenProperCnt" value="${productVO.hqInvenProperCnt}">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="prdctPrchsStrtDt" class="control-label col-form-label">구매 시작일</label>
                                    <input type="date" class="form-control" id="prdctPrchsStrtDt" name="prdctPrchsStrtDt" value="<fmt:formatDate value="${productVO.prdctPrchsStrtDt}" pattern="yyyy-MM-dd"/>">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="prdctPrchsEndDt" class="control-label col-form-label">구매 종료일</label>
                                    <input type="date" class="form-control" id="prdctPrchsEndDt" name="prdctPrchsEndDt" value="<fmt:formatDate value="${productVO.prdctPrchsEndDt}" pattern="yyyy-MM-dd"/>">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="allergensYn" class="control-label col-form-label">알레르기 유발 유무</label>
                                    <select class="form-select" id="allergensYn" name="allergensYn">
                                        <option disabled hidden>선택</option>
	                                        <option <c:if test="${productVO.allergensYn == 'Y' }"> selected</c:if>>Y</option>
	                                        <option <c:if test="${productVO.allergensYn == 'N' }"> selected</c:if>>N</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                 <div class="mb-3">
                                    <label for="prdctDscnYn" class="control-label col-form-label">단종 유무</label>
                                    <select class="form-select" id="prdctDscnYn" name="prdctDscnYn">
                                        <option disabled hidden>선택</option>
                                        <option <c:if test="${productVO.prdctDscnYn == 'Y' }"> selected</c:if>>Y</option>
                                        <option <c:if test="${productVO.prdctDscnYn == 'N' }"> selected</c:if>>N</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-3" style=" display: grid;grid-template-rows: auto auto;">
                                    <label for="prdctExpln" class="control-label col-form-label">제품설명</label>
                                    <textarea rows="15" cols="50" id="prdctExpln" name="prdctExpln" style="overflow: hidden;">${productVO.prdctExpln}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="custom-file">
									<input type="file" class="form-control" id="upload" name="uploadFile" value="${productVO.atchFileVOList[0].orignlFileNm}" multiple />
								</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn bg-warning-subtle font-medium" data-bs-dismiss="modal">
                            취소
                        </button>
                        <button type="submit" class="btn btn-primary">
                            저장
                        </button>
                    </div>
                    <sec:csrfInput/>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 상품수정 모달 끝 -->

<!-- 바디부분 -->
<div class="card overflow-hidden chat-application">
	<div class="d-flex w-100">
		<div class="left-part border-end w-20 flex-shrink-0 d-none d-lg-block">
			<div class="px-9 pt-4 pb-3">
				<img
					src="/resources/upload/product/${productVO.atchFileVOList[0].streFileNm}"
					alt="user4" width="230" height="230"
					class="rounded-circle">
<!-- 				<div class="custom-file"> -->
<%-- 					<input type="file" class="form-control" id="customFile" value="${productVO.atchFileVOList.orignlFileNm}"> --%>
<!-- 				</div> -->
			</div>
			<ul class="list-group simplebar-scrollable-y"
				style="height: 100%" data-simplebar="init">
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
											href="/admin/acnt"> 
											<i class="ti ti-bookmark fs-5 text-primary"></i>담당자: ${productVO.acntVO.acntMngrNm}
										</a></li>
										<li class="list-group-item border-0 p-0 mx-9"><a
											class="d-flex align-items-center gap-2 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1"
											href="/admin/acnt"> <i
												class="ti ti-bookmark fs-5 text-warning"></i>이메일: ${productVO.acntVO.acntEmail}
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
								<h5 class="text-dark mb-0 fw-semibold">제품  상세</h5>
<!-- 								<ul class="list-unstyled mb-0 d-flex align-items-center"> -->
<!-- 									<li class="d-lg-none d-block"><a -->
<!-- 										class="text-dark back-btn px-2 fs-5 bg-hover-primary nav-icon-hover position-relative z-index-5" -->
<!-- 										href="javascript:void(0)"> <i class="ti ti-arrow-left"></i> -->
<!-- 									</a></li> -->
<!-- 									<li class="position-relative" data-bs-toggle="tooltip" -->
<!-- 										data-bs-placement="top" data-bs-title="Edit"><a -->
<!-- 										class="d-block text-dark px-2 fs-5 bg-hover-primary nav-icon-hover position-relative z-index-5" -->
<!-- 										href="javascript:void(0)"> <i class="ti ti-pencil"></i> -->
<!-- 									</a></li> -->
<!-- 									<li class="position-relative" data-bs-toggle="tooltip" -->
<!-- 										data-bs-placement="top" data-bs-title="Delete"><a -->
<!-- 										class="text-dark px-2 fs-5 bg-hover-primary nav-icon-hover position-relative z-index-5" -->
<!-- 										href="javascript:void(0)"> <i class="ti ti-trash"></i> -->
<!-- 									</a></li> -->
<!-- 								</ul> -->
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
																<div
																	class="hstack align-items-start mb-7 pb-1 align-items-center justify-content-between">
																	<div class="d-flex align-items-center gap-3">
																		<div>
																			<p class="mb-1 fs-2">제품명</p>
																			<h6 class="fw-semibold fs-4 mb-0">${productVO.prdctNm}</h6>
																		</div>
																		<div style="margin-left: 127px">
																			<p class="mb-1 fs-2">거래처</p>
																			<h6 class="fw-semibold fs-4 mb-0">${productVO.acntVO.acntNm}</h6>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-3 mb-7">
																		<p class="mb-1 fs-2">제품코드</p>
																		<h6 class="fw-semibold mb-0">${productVO.prdctClsfCd}</h6>
																	</div>
																	<div class="col-3 mb-7">
																		<p class="mb-1 fs-2">입고단가</p>
																		<h6 class="fw-semibold mb-0">
																			<fmt:formatNumber maxFractionDigits="3" value="${productVO.prdctRcvnAmt}" />원 
																		</h6>
																	</div>
																	<div class="col-3 mb-7">
																		<p class="mb-1 fs-2">구매 시작일</p>
																		<h6 class="fw-semibold mb-0">
																			<fmt:formatDate value="${productVO.prdctPrchsStrtDt}" />
																		</h6>
																	</div>
																	<div class="col-3 mb-7">
																		<p class="mb-1 fs-2">구매 종료일</p>
																		<h6 class="fw-semibold mb-0">
																			<c:choose>
															                    <c:when test="${productVO.prdctPrchsEndDt != null}">
															                        <fmt:formatDate value="${productVO.prdctPrchsEndDt}" />
															                    </c:when>
															                    <c:otherwise>
															                        <p>구매 진행중</p>
															                    </c:otherwise>
															                </c:choose>
																		</h6>
																	</div>
																	<div class="col-3 mb-7">
																		<p class="mb-1 fs-2">단종여부</p>
																		<h6 class="fw-semibold mb-0">
																		<c:choose>
																		<c:when test="${productVO.prdctDscnYn == 'Y'}">
																			<div style="color: red;">단종</div>
																		</c:when>
																		<c:otherwise>
																			<div>-</div>
																		</c:otherwise>
																		</c:choose>
																		</h6>
																	</div>
																	<div class="col-3 mb-7">
																		<p class="mb-1 fs-2">알레르기 유발 유무</p>
																		<h6 class="fw-semibold mb-0">
																			${productVO.allergensYn}
																		</h6>
																	</div>
																	<div class="col-6 mb-7">
																	</div>
																	<div class="col-3 mb-7">
																		<p class="mb-1 fs-2">본사재고수량</p>
																		<h6 class="fw-semibold mb-0">
																			<fmt:formatNumber maxFractionDigits="3" value="${productVO.hqInvenCnt}" />개
																		</h6>
																	</div>
																	<div class="col-6 mb-7">
																		<p class="mb-1 fs-2">본사적정수량</p>
																		<h6 class="fw-semibold mb-0">
																			<fmt:formatNumber maxFractionDigits="3" value="${productVO.hqInvenProperCnt}" />개
																		</h6>
																	</div>
																</div>
																<div class="border-bottom pb-7 mb-7">
																	<p class="mb-2 fs-3">상세설명</p>
																	<h6 class="fw-semibold mb-0">${productVO.prdctExpln}</h6>
																</div>
																<div class="d-flex align-items-center gap-2">
																	<button class="btn btn-primary fs-2"
																		fdprocessedid="pk6kl8" type="button" id="btnUpdate"
																		value="${productVO.prdctNo}">수정</button>
																		
																	<c:if test="${productVO.prdctDscnYn == 'Y'}">
																		<button class="btn btn-danger fs-2" fdprocessedid="83zpb" type="button" id="btnDelete">삭제</button>
																	</c:if>
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
<script type="text/javascript">
$("#btnUpdate").on("click", function() {
	$("#modifyProduct-modal").modal("show");
// 	let prctNo = $(this).val();
// 	console.log("prctNo!!!!!!", prctNo);
	
// 	$.ajax({
// 		url:"/admin/product/modifyProd?prdctNo=" + prctNo,
// 		dataType:"json",
// 		type:"GET",
// 		data:{
// 			id:prctNo
// 		},
// 		success:function(result) {
// 			console.log("result: ", result);
// 		}
	
// 	});
});

$("#btnDelete").on("click", function() {
	let prdctNo = "${productVO.prdctNo}";
	let atchFileNo = "${productVO.atchFileNo}";
	
	let data = {
		"prdctNo":prdctNo,
		"atchFileNo":atchFileNo
	}
	
	$.ajax({
		url:"/admin/product/delProd",
		data:JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		dataType:"json",
		type:"post",
		beforeSend:function(xhr){
        	xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        },
		success:function(result){
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
					title : '상품 삭제가 완료되었습니다.' //출력할 메세지 내용
				});
				setTimeout(function() {
					location.href="/admin/product/product";
				}, 800); //0.8초 이후 자동 새로고침
        	}
		},
		error:function(err) {
			console.log(err);
		}
		
	});
});

</script>










