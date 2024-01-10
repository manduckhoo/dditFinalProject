<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%-- 배너 사진 --%>
<div class="card bg-primary-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">제품 상세</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/frcs/main">Main</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/frcs/inventory/list">재고목록</a>
                        </li>
                        <li class="breadcrumb-item" aria-current="page">제품 상세</li>
                    </ol>
                </nav>
            </div>
            <div class="col-3">
                <div class="text-center mb-n5">
                    <img src="/resources/bootstrap/src/assets/images/breadcrumb/skullCoffee.png" alt=""
                         class="img-fluid mb-n4" style="width: 70%;">
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 상품수정 모달 시작 -->
<%--<div class="modal fade" id="modifyProduct-modal" tabindex="-1" aria-labelledby="modifyProduct" style="display: none;"
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
                                    <input type="text" class="form-control" id="prdctNm" name="prdctNm"
                                           value="${productVO.prdctNm}" required>
                                    <label id="validationCheckArea"></label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-4">
                                <div class="mb-3">
                                    <label for="prdctRcvnAmt" class="control-label col-form-label">입고단가</label>
                                    <input type="number" min={0} max={1000000000000} class="form-control"
                                           id="prdctRcvnAmt" name="prdctRcvnAmt"
                                           value="${productVO.prdctRcvnAmt}" required>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                                <div class="mb-3">
                                    <label for="prdctClsfCd" class="control-label col-form-label">카테고리</label>
                                    <select class="form-select" id="prdctClsfCd" name="prdctClsfCd">

                                        <option value="select" disabled hidden>선택</option>
                                        <c:forEach var="comDetCodeInfo" items="${comDetCodeInfoVOList}">
                                            <option
                                                    <c:if test="${productVO.comDetCodeInfoVO.comDetCodeNm == comDetCodeInfo.comDetCodeNm}">selected</c:if>
                                                    value="${comDetCodeInfo.comDetCode}">${comDetCodeInfo.comDetCodeNm}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                                <div class="mb-3">
                                    <label for="prdctClsfCd" class="control-label col-form-label">거래처</label>
                                    <select class="form-select" id="acntNo" name="acntNo">
                                        <option value="" disabled hidden="">거래처선택</option>
                                        <c:forEach var="acnt" items="${acntVOList}">

                                            <option
                                                    <c:if test="${acnt.acntNo == productVO.acntNo} ">selected</c:if>
                                                    value="${acnt.acntNo}">${acnt.acntNm}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-4">
                                <div class="mb-3">
                                    <label for="hqInvenCnt" class="control-label col-form-label">본사재고수량</label>
                                    <input type="number" class="form-control" id="hqInvenCnt" name="hqInvenCnt"
                                           value="${productVO.hqInvenCnt}">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="hqInvenProperCnt" class="control-label col-form-label">본사적정수량</label>
                                    <input type="number" class="form-control" id="hqInvenProperCnt"
                                           name="hqInvenProperCnt" value="${productVO.hqInvenProperCnt}">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="prdctPrchsStrtDt" class="control-label col-form-label">구매 시작일</label>
                                    <input type="date" class="form-control" id="prdctPrchsStrtDt"
                                           name="prdctPrchsStrtDt"
                                           value="<fmt:formatDate value="${productVO.prdctPrchsStrtDt}" pattern="yyyy-MM-dd"/>">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="prdctPrchsEndDt" class="control-label col-form-label">구매 종료일</label>
                                    <input type="date" class="form-control" id="prdctPrchsEndDt" name="prdctPrchsEndDt"
                                           value="<fmt:formatDate value="${productVO.prdctPrchsEndDt}" pattern="yyyy-MM-dd"/>">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="allergensYn" class="control-label col-form-label">알레르기 유발 유무</label>
                                    <select class="form-select" id="allergensYn" name="allergensYn">
                                        <option disabled hidden>선택</option>
                                        <option <c:if test="${productVO.allergensYn == 'Y' }"> selected</c:if>>Y
                                        </option>
                                        <option <c:if test="${productVO.allergensYn == 'N' }"> selected</c:if>>N
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="prdctDscnYn" class="control-label col-form-label">단종 유무</label>
                                    <select class="form-select" id="prdctDscnYn" name="prdctDscnYn">
                                        <option disabled hidden>선택</option>
                                        <option <c:if test="${productVO.prdctDscnYn == 'Y' }"> selected</c:if>>Y
                                        </option>
                                        <option <c:if test="${productVO.prdctDscnYn == 'N' }"> selected</c:if>>N
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-3" style=" display: grid;grid-template-rows: auto auto;">
                                    <label for="prdctExpln" class="control-label col-form-label">제품설명</label>
                                    <textarea rows="15" cols="50" id="prdctExpln" name="prdctExpln"
                                              style="overflow: hidden;">${productVO.prdctExpln}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="custom-file">
                                    <input type="file" class="form-control" id="upload" name="uploadFile"
                                           value="${productVO.atchFileVOList[0].orignlFileNm}" multiple/>
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
</div>--%>
<!-- 상품수정 모달 끝 -->

<!-- 바디부분 -->
<div class="card overflow-hidden chat-application">
    <div class="d-flex w-100">
        <div class="d-flex w-100">
            <div class="w-100">
                <div class="chatting-box app-email-chatting-box">
                    <div class="p-9 py-3 border-bottom chat-meta-user d-flex align-items-center justify-content-between">
                        <h5 class="text-dark mb-0 fw-semibold ms-3">제품 상세</h5>
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
                                                <div class="simplebar-content"
                                                     style="padding: 20px; display: flex; justify-content: space-between">
                                                    <div class="col-3 mt-3 d-flex justify-content-center">
                                                        <img src="/resources/upload/product/${productVO.atchFileVOList[0].streFileNm}"
                                                             alt="user4" width="230" height="230"
                                                             class="rounded-circle">
                                                    </div>
                                                    <div class="col-7" data-user-id="1">
                                                        <div class="mb-4 pb-1 row">
                                                            <div class="col-3 mb-7">
                                                                <p class="mb-1 fs-2">제품명</p>
                                                                <h5 class="fw-semibold fs-4 mb-0">${productVO.prdctNm}</h5>
                                                            </div>
                                                            <div class="col-2 mb-7">
                                                                <p class="mb-1 fs-2">카테고리</p>
                                                                <h6 class="fw-semibold fs-4 mb-0">${productVO.comDetCodeInfoVO.comDetCodeNm}</h6>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-3 mb-7">
                                                                <p class="mb-1 fs-2">재고 수량</p>
                                                                <h6 class="fw-semibold mb-0">
                                                                    <fmt:formatNumber maxFractionDigits="3"
                                                                                      value="${frcsProductVO.frcsInvenCnt}"/>개
                                                                </h6>
                                                            </div>
                                                            <div class="col-3 mb-7">
                                                                <p class="mb-1 fs-2">적정 수량</p>
                                                                <h6 class="fw-semibold mb-0">
                                                                    <fmt:formatNumber maxFractionDigits="3"
                                                                                      value="${frcsProductVO.frcsInvenProperCnt}"/>개
                                                                </h6>
                                                            </div>
                                                            <div class="col-3 mb-7">
                                                                <p class="mb-1 fs-2">자동 발주 여부</p>
                                                                <h6 class="fw-semibold mb-0">${frcsProductVO.frcsAutoOrderYn}</h6>
                                                            </div>
                                                            <div class="col-3 mb-7">
                                                                <p class="mb-1 fs-2">자동 발주 수량</p>
                                                                <h6 class="fw-semibold mb-0">
                                                                    <fmt:formatNumber maxFractionDigits="3"
                                                                                      value="${frcsProductVO.frcsAutoOrderCnt}"/>개
                                                                </h6>
                                                            </div>
                                                        </div>
                                                        <div class="row">
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
                                                        </div>
                                                        <div class="border-bottom pb-7 mb-7">
                                                            <p class="mb-2 fs-3">상세설명</p>
                                                            <h6 class="fw-semibold mb-0">${productVO.prdctExpln}</h6>
                                                        </div>
                                                        <%--<div class="d-flex align-items-center gap-2">
                                                            <button class="btn btn-primary fs-2"
                                                                    fdprocessedid="pk6kl8"
                                                                    type="button" id="btnUpdate"
                                                                    value="${productVO.prdctNo}">수정
                                                            </button>
                                                        </div>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="simplebar-placeholder"
                                         style="width: auto; height: 578px;"></div>
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
    $("#btnUpdate").on("click", function () {
        $("#modifyProduct-modal").modal("show");

    });
</script>