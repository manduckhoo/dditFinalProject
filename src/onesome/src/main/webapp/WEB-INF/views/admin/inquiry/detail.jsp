<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="/resources/css/memInquiry.css">

<style>
    * {
        color: black;
    }

    .downloadFile {
        width: 50%;
        margin-bottom: 20px;
    }
</style>
<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">1:1문의 관리</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/main">Main</a>
                        </li>
                        <li class="breadcrumb-item">게시판관리</li>
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/inquiry/list">1:1문의 관리</a>
                        </li>
                    </ol>
                </nav>
            </div>
            <div class="col-3">
                <div class="text-center mb-n5">
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-body">
        <div class="mem-inquiry-boby">
            <div class="row mem-inquiry-row">
                <div class="col-sm-2">
                    <strong class="inquiry-tit-bundle">
                        문의유형
                    </strong>
                </div>
                <div class="col-sm-4">
                    <p>${inquiryVO.comDetCodeInfoVO.comDetCodeNm}</p>
                </div>
                <c:if test="${inquiryVO.franchiseVO != null}">
                    <div class="col-sm-2">
                        <strong class="inquiry-tit-bundle">
                            대상매장
                        </strong>
                    </div>
                    <div class="col-sm-4">
                        <p>${inquiryVO.franchiseVO.frcsNm}</p>
                    </div>
                </c:if>
            </div>

            <div class="row mem-inquiry-row">
                <div class="col-sm-2">
                    <strong class="inquiry-tit-bundle">
                        작성일
                    </strong>
                </div>
                <div class="col-sm-4">
                    <p><fmt:formatDate value="${inquiryVO.inqWrtDt}" pattern="yyyy-MM-dd HH:mm"/></p>
                </div>
                <div class="col-sm-2">
                    <strong class="inquiry-tit-bundle">
                        처리상태
                    </strong>
                </div>
                <div class="col-sm-4">
                    <c:choose>
                        <c:when test="${inquiryVO.ansTitle != null}">
                            <p>답변완료</p>
                        </c:when>
                        <c:otherwise>
                            <p>답변대기중</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <hr>
            <div class="row mem-inquiry-row">
                <div class="col-sm-2">
                    <strong class="inquiry-tit-bundle">
                        문의제목
                    </strong>
                </div>
                <div class="col-sm-10 form-group">
                    <p>${inquiryVO.inqTitle}</p>
                </div>
            </div>
            <div class="row mem-inquiry-row">
                <div class="col-sm-2">
                    <strong class="inquiry-tit-bundle">
                        문의내용
                    </strong>
                </div>
                <div class="col-sm-10 form-group" style="min-height: 300px">
                    <span>${inquiryVO.inqConts}</span>
                </div>
            </div>
            <div class="row mem-inquiry-row">
                <div class="col-sm-2">
                    <strong class="inquiry-tit-bundle">
                        첨부파일
                    </strong>
                </div>
                <div class="col-sm-10 form-group">
                    <c:choose>
                        <c:when test="${fn:length(inquiryVO.atchFileVOList) > 0}">
                            <c:forEach var="fileVO" items="${inquiryVO.atchFileVOList}">
                                <div class="input-group downloadFile">
                                    <input type="text" class="form-control"
                                           value="${fileVO.orignlFileNm}" disabled>
                                    <a class="btn bg-secondary-subtle text-secondary font-medium"
                                       href="/resources/upload/inquiry/${fileVO.streFileNm}" download="${fileVO.orignlFileNm}">
                                        다운로드
                                    </a>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <p>첨부파일 없음</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <c:choose>
                <c:when test="${inquiryVO.ansTitle != null}">
                    <hr>
                    <form action="/admin/inquiry/answerRegistration" method="post">
                        <input type="hidden" name="inqNo" value="${inquiryVO.inqNo}">
                        <div class="row mem-inquiry-row">
                            <div class="col-sm-2">
                                <strong class="inquiry-tit-bundle">
                                    답변제목
                                    <i class='bx bx-health inquiry-required'></i>
                                </strong>
                            </div>
                            <div class="col-sm-10 form-group">
                                <input type="text" class="form-control" name="ansTitle" id="ansTitle"
                                       value="${inquiryVO.ansTitle}" required readonly>
                            </div>
                        </div>
                        <div class="row mem-inquiry-row">
                            <div class="col-sm-2">
                                <strong class="inquiry-tit-bundle">
                                    답변내용
                                    <i class='bx bx-health inquiry-required'></i>
                                </strong>
                            </div>
                            <div class="col-sm-10 form-group">
                                <textarea class="inquiry-textarea form-control" id="ansConts"
                                          name="ansConts" required readonly>${inquiryVO.ansConts}</textarea>
                            </div>
                        </div>
                        <div class="row inquiry-submit-area">
                            <div class="mb-3 mb-0 text-center" id="ansEditBtns">
                                <button type="button" class="btn btn-success rounded-pill px-4" id="ansEditBtn">
                                    수정
                                </button>
                                <button type="button" class="btn btn-danger rounded-pill px-4 ms-2 text-white" id="ansDelBtn"
                                    onclick="location.reload()">
                                    취소
                                </button>
                            </div>
                        </div>
                        <sec:csrfInput/>
                    </form>
                </c:when>
                <c:otherwise>
                    <hr>
                    <form action="/admin/inquiry/answerRegistration" method="post">
                        <input type="hidden" name="inqNo" value="${inquiryVO.inqNo}">
                        <div class="row mem-inquiry-row">
                            <div class="col-sm-2">
                                <strong class="inquiry-tit-bundle">
                                    답변제목
                                    <i class='bx bx-health inquiry-required'></i>
                                </strong>
                            </div>
                            <div class="col-sm-10 form-group">
                                <input type="text" class="form-control" name="ansTitle" required>
                            </div>
                        </div>
                        <div class="row mem-inquiry-row">
                            <div class="col-sm-2">
                                <strong class="inquiry-tit-bundle">
                                    답변내용
                                    <i class='bx bx-health inquiry-required'></i>
                                </strong>
                            </div>
                            <div class="col-sm-10 form-group">
                                <textarea class="inquiry-textarea form-control" name="ansConts" required></textarea>
                            </div>
                        </div>
                        <div class="row inquiry-submit-area">
                            <div class="mb-3 mb-0 text-center">
                                <button type="submit" class="btn btn-success rounded-pill px-4">
                                    답변등록
                                </button>
                                <button type="reset" class="btn btn-danger rounded-pill px-4 ms-2 text-white">
                                    취소
                                </button>
                            </div>
                        </div>
                        <sec:csrfInput/>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="inquiry-submit-area">
            <button type="button" class="inquiry-submit-btn"
                    onclick="location.href='/admin/inquiry/list'">목록
            </button>
        </div>
    </div>
</div>
<script>
    $("#ansEditBtn").on("click", ()=>{
        $("#ansEditBtns").html(`
            <button type="submit" class="btn btn-success rounded-pill px-4">
                저장
            </button>
            <button type="button" class="btn btn-danger rounded-pill px-4 ms-2 text-white" onclick="location.reload()">
                취소
            </button>
        `);

        $("#ansConts").removeAttr("readonly");
        $("#ansTitle").removeAttr("readonly");
    })
</script>