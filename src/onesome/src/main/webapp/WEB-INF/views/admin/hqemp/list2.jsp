<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
<div class="card overflow-hidden chat-application">
    <div class="d-flex w-100">
        <%-- 왼쪽 사이드바 시작 --%>
        <div class="left-part border-end w-20 flex-shrink-0 d-none d-lg-block">
            <div class="px-9 pt-4 pb-3">
                <button class="btn btn-primary fw-semibold py-8 w-100 addAcntModal">
                    <i class="ti ti-plus" style="margin-right: 5px;"></i> 신규 거래처 등록
                </button>
            </div>
            <ul class="list-group" style="height: calc(100vh - 400px)"
                data-simplebar="init">
                <div class="simplebar-wrapper" style="margin: 0px;">
                    <div class="simplebar-height-auto-observer-wrapper">
                        <div class="simplebar-height-auto-observer"></div>
                    </div>
                    <div class="simplebar-mask">
                        <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                            <div class="simplebar-content-wrapper" tabindex="0" role="region"
                                 aria-label="scrollable content"
                                 style="height: 100%; overflow: hidden;">
                                <div class="simplebar-content" style="padding: 0px;">
                                    <li class="list-group-item border-0 p-0 mx-9">
                                        <a class="d-flex align-items-center gap-2 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1"
                                           href="javascript:allAcntFc()">
                                            <i class="ti ti-inbox fs-5"></i>All Categories
                                        </a>
                                    </li>
                                    <li class="border-bottom my-3"></li>
                                    <li class="fw-semibold text-dark text-uppercase mx-9 my-2 px-3 fs-2">
                                        CATEGORIES
                                    </li>
                                    <li class="list-group-item border-0 p-0 mx-9">
                                        <a class="d-flex align-items-center gap-2 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1"
                                           href="javascript:firstFc()">
                                            <i class="ti ti-bookmark fs-5 text-primary"></i>식품
                                        </a>
                                    </li>
                                    <li class="list-group-item border-0 p-0 mx-9">
                                        <a class="d-flex align-items-center gap-2 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1"
                                           href="javascript:secondFc()">
                                            <i class="ti ti-bookmark fs-5 text-danger"></i>상품(MD)
                                        </a>
                                    </li>
                                    <li class="list-group-item border-0 p-0 mx-9">
                                        <a class="d-flex align-items-center gap-2 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1"
                                           href="javascript:thirdFc()">
                                            <i class="ti ti-bookmark fs-5 text-secondary"></i>소모품
                                        </a>
                                    </li>
                                    <li class="list-group-item border-0 p-0 mx-9">
                                        <a class="d-flex align-items-center gap-2 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1"
                                           href="javascript:fourthFc()">
                                            <i class="ti ti-bookmark fs-5 text-success"></i>식기
                                        </a>
                                    </li>
                                    <li class="list-group-item border-0 p-0 mx-9">
                                        <a class="d-flex align-items-center gap-2 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1"
                                           href="javascript:fifthFc()">
                                            <i class="ti ti-bookmark fs-5 text-warning"></i>인테리어
                                        </a>
                                    </li>
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
                     style="visibility: hidden;">
                    <div class="simplebar-scrollbar"
                         style="height: 0px; display: none;"></div>
                </div>
            </ul>
        </div>
        <%-- 왼쪽 사이드바 끝 --%>

        <div class="d-flex w-100">
            <%-- 가운데 목록 시작 --%>
            <div class="min-width-340">
                <div class="border-end user-chat-box h-100">
                    <%-- 검색창 시작 --%>
                    <div class="px-4 pt-9 pb-6 d-none d-lg-block">
                        <div class="position-relative">
                            <input type="text" class="form-control search-chat py-2 ps-5"
                                   id="text-srh" placeholder="Search">
                            <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
                        </div>
                    </div>
                    <%-- 검색창 끝 --%>

                    <div class="app-chat">
                        <ul class="chat-users simplebar-scrollable-y"
                            style="height: calc(100vh - 400px)" data-simplebar="init">
                            <div class="simplebar-wrapper" style="margin: 0px;">
                                <div class="simplebar-height-auto-observer-wrapper">
                                    <div class="simplebar-height-auto-observer"></div>
                                </div>
                                <div class="simplebar-mask">
                                    <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                                        <div class="simplebar-content-wrapper" tabindex="0"
                                             role="region" aria-label="scrollable content"
                                             style="height: 100%; overflow: hidden scroll;">

                                            <%-- 검색한 거래처 목록 시작 --%>
                                            <div class="simplebar-content" id="searchAcnt"
                                                 style="padding: 0px; display: none;">
                                            </div>
                                            <%-- 검색한 거래처 목록 끝 --%>

                                            <%-- 전체 거래처 목록 시작 --%>
                                            <div class="simplebar-content" id="allAcnt" style="padding: 0px;">
                                                <c:forEach var="acntVO" items="${acntVOList}"
                                                           varStatus="stat">
                                                    <li><a href="javascript:void(0);"
                                                           class="px-4 py-3 bg-hover-light-black d-flex align-items-center chat-user acntDetail"
                                                           id="${acntVO.acntNo}">
                                                        <div class="ms-6 d-inline-block w-75">
                                                                <%-- 거래처명 --%>
                                                            <h6 class="mb-1 fw-semibold chat-title"
                                                                data-username="${acntVO.acntNm}">${acntVO.acntNm}
                                                            </h6>
                                                                <%-- 거래처 담당자 메일 --%>
                                                            <span class="fs-2 text-body-color d-block">${acntVO.acntEmail}</span>
                                                        </div>
                                                    </a></li>
                                                </c:forEach>
                                            </div>
                                            <%-- 전체 거래처 목록 끝 --%>

                                            <%-- 식품 거래처 목록 시작 --%>
                                            <div class="simplebar-content" id="firstAcnt"
                                                 style="padding: 0px; display: none;">
                                                <c:forEach var="acntVO" items="${acntVOList}"
                                                           varStatus="stat">
                                                    <c:if test="${acntVO.acntClsfCd=='BRCT01'}">
                                                        <li>
                                                            <a href="javascript:void(0);"
                                                               class="px-4 py-3 bg-hover-light-black d-flex align-items-center chat-user acntDetail"
                                                               id="${acntVO.acntNo}">
                                                                <div class="ms-6 d-inline-block w-75">
                                                                        <%-- 거래처명 --%>
                                                                    <h6 class="mb-1 fw-semibold chat-title"
                                                                        data-username="${acntVO.acntNm}">
                                                                            ${acntVO.acntNm}
                                                                    </h6>
                                                                        <%-- 거래처 담당자 메일 --%>
                                                                    <span class="fs-2 text-body-color d-block">${acntVO.acntEmail}</span>
                                                                </div>
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <%-- 식품 거래처 목록 끝 --%>

                                            <%-- 상품 거래처 목록 시작 --%>
                                            <div class="simplebar-content" id="secondAcnt"
                                                 style="padding: 0px; display: none;">
                                                <c:forEach var="acntVO" items="${acntVOList}"
                                                           varStatus="stat">
                                                    <c:if test="${acntVO.acntClsfCd=='BRCT04'}">
                                                        <li>
                                                            <a href="javascript:void(0);"
                                                               class="px-4 py-3 bg-hover-light-black d-flex align-items-center chat-user acntDetail"
                                                               id="${acntVO.acntNo}">
                                                                <div class="ms-6 d-inline-block w-75">
                                                                        <%-- 거래처명 --%>
                                                                    <h6 class="mb-1 fw-semibold chat-title"
                                                                        data-username="${acntVO.acntNm}">
                                                                            ${acntVO.acntNm}
                                                                    </h6>
                                                                        <%-- 거래처 담당자 메일 --%>
                                                                    <span class="fs-2 text-body-color d-block">${acntVO.acntEmail}</span>
                                                                </div>
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <%-- 상품 거래처 목록 끝 --%>

                                            <%-- 소모품 거래처 목록 시작 --%>
                                            <div class="simplebar-content" id="thirdAcnt"
                                                 style="padding: 0px; display: none;">
                                                <c:forEach var="acntVO" items="${acntVOList}"
                                                           varStatus="stat">
                                                    <c:if test="${acntVO.acntClsfCd=='BRCT02'}">
                                                        <li>
                                                            <a href="javascript:void(0);"
                                                               class="px-4 py-3 bg-hover-light-black d-flex align-items-center chat-user acntDetail"
                                                               id="${acntVO.acntNo}">
                                                                <div class="ms-6 d-inline-block w-75">
                                                                        <%-- 거래처명 --%>
                                                                    <h6 class="mb-1 fw-semibold chat-title"
                                                                        data-username="${acntVO.acntNm}">
                                                                            ${acntVO.acntNm}
                                                                    </h6>
                                                                        <%-- 거래처 담당자 메일 --%>
                                                                    <span class="fs-2 text-body-color d-block">${acntVO.acntEmail}</span>
                                                                </div>
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <%-- 소모품 거래처 목록 끝 --%>

                                            <%-- 식기 거래처 목록 시작 --%>
                                            <div class="simplebar-content" id="fourthAcnt"
                                                 style="padding: 0px; display: none;">
                                                <c:forEach var="acntVO" items="${acntVOList}"
                                                           varStatus="stat">
                                                    <c:if test="${acntVO.acntClsfCd=='BRCT03'}">
                                                        <li>
                                                            <a href="javascript:void(0);"
                                                               class="px-4 py-3 bg-hover-light-black d-flex align-items-center chat-user acntDetail"
                                                               id="${acntVO.acntNo}">
                                                                <div class="ms-6 d-inline-block w-75">
                                                                        <%-- 거래처명 --%>
                                                                    <h6 class="mb-1 fw-semibold chat-title"
                                                                        data-username="${acntVO.acntNm}">
                                                                            ${acntVO.acntNm}
                                                                    </h6>
                                                                        <%-- 거래처 담당자 메일 --%>
                                                                    <span class="fs-2 text-body-color d-block">${acntVO.acntEmail}</span>
                                                                </div>
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <%-- 식기 거래처 목록 끝 --%>

                                            <%-- 인테리어 거래처 목록 시작 --%>
                                            <div class="simplebar-content" id="fifthAcnt"
                                                 style="padding: 0px; display: none;">
                                                <c:forEach var="acntVO" items="${acntVOList}"
                                                           varStatus="stat">
                                                    <c:if test="${acntVO.acntClsfCd=='BRCT05'}">
                                                        <li>
                                                            <a href="javascript:void(0);"
                                                               class="px-4 py-3 bg-hover-light-black d-flex align-items-center chat-user acntDetail"
                                                               id="${acntVO.acntNo}">
                                                                <div class="ms-6 d-inline-block w-75">
                                                                        <%-- 거래처명 --%>
                                                                    <h6 class="mb-1 fw-semibold chat-title"
                                                                        data-username="${acntVO.acntNm}">
                                                                            ${acntVO.acntNm}
                                                                    </h6>
                                                                        <%-- 거래처 담당자 메일 --%>
                                                                    <span class="fs-2 text-body-color d-block">${acntVO.acntEmail}</span>
                                                                </div>
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <%-- 인테리어 거래처 목록 끝 --%>
                                        </div>
                                    </div>
                                </div>
                                <div class="simplebar-placeholder"
                                     style="width: 339px; height: 720px;"></div>
                            </div>
                            <div class="simplebar-track simplebar-horizontal"
                                 style="visibility: hidden;">
                                <div class="simplebar-scrollbar"
                                     style="width: 0px; display: none;"></div>
                            </div>
                            <div class="simplebar-track simplebar-vertical"
                                 style="visibility: visible;">
                                <div class="simplebar-scrollbar"
                                     style="height: 614px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
                            </div>
                        </ul>
                    </div>
                </div>
            </div>
            <%-- 가운데 목록 끝 --%>

            <%-- 오른쪽 디테일 시작 --%>
            <div class="w-100">
                <div class="chat-container h-100 w-100">
                    <div class="chat-box-inner-part h-100">
                        <div class="chatting-box app-email-chatting-box">
                            <div
                                    class="p-9 py-3 border-bottom chat-meta-user d-flex align-items-center justify-content-between">
                                <h5 class="text-dark mb-0 fw-semibold">거래처 정보</h5>
                                <ul class="list-unstyled mb-0 d-flex align-items-center">
                                    <li class="d-lg-none d-block"><a
                                            class="text-dark back-btn px-2 fs-5 bg-hover-primary nav-icon-hover position-relative z-index-5"
                                            href="javascript:void(0)"> <i class="ti ti-arrow-left"></i>
                                    </a></li>
                                    <li class="position-relative" data-bs-toggle="tooltip"
                                        data-bs-placement="top" data-bs-title="Edit"><a
                                            class="d-block text-dark px-2 fs-5 bg-hover-primary nav-icon-hover position-relative z-index-5"
                                            href="javascript:void(0)"> <i class="ti ti-pencil"></i>
                                    </a></li>
                                    <li class="position-relative" data-bs-toggle="tooltip"
                                        data-bs-placement="top" data-bs-title="Delete"><a
                                            class="text-dark px-2 fs-5 bg-hover-primary nav-icon-hover position-relative z-index-5"
                                            href="javascript:void(0)"> <i class="ti ti-trash"></i>
                                    </a></li>
                                </ul>
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
                                                            <%-- 거래처 디테일 시작 --%>
                                                            <div class="chat-list chat active-chat my-2 px-3"
                                                                 id="insertDetail">
                                                                <%-- jquery로 디테일 화면 넣어줌 --%>
                                                            </div>
                                                            <%-- 거래처 디테일 끝 --%>

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
            <%-- 오른쪽 디테일 끝 --%>
        </div>
    </div>
</div>


<%-- 거래처 추가 모달 시작 --%>
<div class="modal fade" id="addAcnt-modal" tabindex="-1" aria-labelledby="addAcnt" style="display: none;"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header d-flex align-items-center" style="padding-bottom: 0px;">
                <h4 class="modal-title">
                    신규 거래처 등록
                </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body px-4">
                <form action="/admin/acnt/createAcnt" method="post">
                    <div class="card-body border-top" id="addAcnt">
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-3">
                                    <label for="acntNm" class="control-label col-form-label">거래처명</label>
                                    <input type="text" class="form-control" id="acntNm" name="acntNm" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-8">
                                <div class="mb-3">
                                    <label for="acntTel" class="control-label col-form-label">연락처</label>
                                    <input type="text" class="form-control" id="acntTel" name="acntTel"
                                           oninput="autoHyphen(this)" required>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                                <div class="mb-3">
                                    <label for="acntClsfCd" class="control-label col-form-label">카테고리</label>
                                    <select class="form-select" id="acntClsfCd" name="acntClsfCd">
                                        <option value="1" selected disabled hidden>선택</option>
                                        <option value="BRCT01" id="BRCT01">식품</option>
                                        <option value="BRCT04" id="BRCT04">상품(MD)</option>
                                        <option value="BRCT02" id="BRCT02">소모품</option>
                                        <option value="BRCT03" id="BRCT03">식기</option>
                                        <option value="BRCT05" id="BRCT05">인테리어</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-8">
                                <div class="mb-2">
                                    <label for="acntZip" class="control-label col-form-label">우편번호</label>
                                    <div class="input-group flex-nowrap">
                                        <input type="text" class="form-control" id="acntZip" name="acntZip" readonly
                                               required>
                                        <button class="btn bg-info-subtle text-info font-medium" type="button"
                                                onclick="openDaumPostcodeAcnt()">
                                            우편번호 찾기
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-2">
                                <label for="acntAddr" class="control-label col-form-label">기본주소</label>
                                <input type="text" class="form-control" id="acntAddr" name="acntAddr" required readonly>
                            </div>
                            <div class="mb-3">
                                <label for="acntDtlAddr" class="control-label col-form-label">상세주소</label>
                                <input type="text" class="form-control" id="acntDtlAddr" name="acntDtlAddr">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="acntMngrNm" class="control-label col-form-label">담당자</label>
                                    <input type="text" class="form-control" id="acntMngrNm" name="acntMngrNm">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="acntMngrPstn" class="control-label col-form-label">담당자 직급</label>
                                    <input type="text" class="form-control" id="acntMngrPstn" name="acntMngrPstn">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-3">
                                    <label for="acntEmail" class="control-label col-form-label">E-MAIL</label>
                                    <input type="text" class="form-control" id="acntEmail" name="acntEmail"
                                           placeholder="abc@example.com">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn bg-warning-subtle font-medium" data-bs-dismiss="modal">
                            취소
                        </button>
                        <button type="submit" class="btn btn-primary">
                            등록
                        </button>
                    </div>
                    <sec:csrfInput/>
                </form>
            </div>
        </div>
    </div>
</div>
<%-- 거래처 추가 모달 끝 --%>


<%-- 거래처 정보 수정 모달 시작 --%>
<div class="modal fade" id="modifyAcnt-modal" tabindex="-1" aria-labelledby="modifyAcnt" style="display: none;"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header d-flex align-items-center" style="padding-bottom: 0px;">
                <h4 class="modal-title">
                    거래처 정보 수정
                </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body px-4">
                <form action="/admin/acnt/modifyAcnt" method="post">
                    <div class="card-body border-top" id="modifyAcnt">
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-3">
                                    <input type="hidden" id="modifyAcntNo" name="acntNo">
                                    <label for="acntNm" class="control-label col-form-label">거래처명</label>
                                    <input type="text" class="form-control" id="modifyAcntNm" name="acntNm" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-8">
                                <div class="mb-3">
                                    <label for="acntTel" class="control-label col-form-label">연락처</label>
                                    <input type="text" class="form-control" id="modifyAcntTel" name="acntTel"
                                           oninput="autoHyphen(this)" required>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                                <div class="mb-3">
                                    <label for="acntClsfCd" class="control-label col-form-label">카테고리</label>
                                    <select class="form-select" id="modifyAcntClsfCd" name="acntClsfCd">
                                        <option value="1" selected disabled hidden>== 선택 ==</option>
                                        <option value="BRCT01">식품</option>
                                        <option value="BRCT04">상품(MD)</option>
                                        <option value="BRCT02">소모품</option>
                                        <option value="BRCT03">식기</option>
                                        <option value="BRCT05">인테리어</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-8">
                                <div class="mb-2">
                                    <label for="acntZip" class="control-label col-form-label">우편번호</label>
                                    <div class="input-group flex-nowrap">
                                        <input type="text" class="form-control" id="modifyAcntZip" name="acntZip"
                                               readonly
                                               required>
                                        <button class="btn bg-info-subtle text-info font-medium" type="button"
                                                onclick="openDaumPostcodeAcnt()">
                                            우편번호 찾기
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-2">
                                <label for="acntAddr" class="control-label col-form-label">기본주소</label>
                                <input type="text" class="form-control" id="modifyAcntAddr" name="acntAddr" required
                                       readonly>
                            </div>
                            <div class="mb-3">
                                <label for="acntDtlAddr" class="control-label col-form-label">상세주소</label>
                                <input type="text" class="form-control" id="modifyAcntDtlAddr" name="acntDtlAddr">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="acntMngrNm" class="control-label col-form-label">담당자</label>
                                    <input type="text" class="form-control" id="modifyAcntMngrNm" name="acntMngrNm">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="acntMngrPstn" class="control-label col-form-label">담당자 직급</label>
                                    <input type="text" class="form-control" id="modifyAcntMngrPstn" name="acntMngrPstn">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-3">
                                    <label for="acntEmail" class="control-label col-form-label">E-MAIL</label>
                                    <input type="text" class="form-control" id="modifyAcntEmail" name="acntEmail"
                                           placeholder="abc@example.com">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn bg-warning-subtle font-medium" data-bs-dismiss="modal">
                            취소
                        </button>
                        <button type="submit" class="btn btn-primary">
                            등록
                        </button>
                    </div>
                    <sec:csrfInput/>
                </form>
            </div>
        </div>
    </div>
</div>
<%-- 거래처 정보 수정 모달 끝 --%>