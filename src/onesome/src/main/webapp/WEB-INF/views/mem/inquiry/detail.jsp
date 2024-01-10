<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/memInquiry.css">
<div class="col-md-8 m-auto">
    <h2 class="mem-inquiry-tit">1:1 문의</h2>
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
        <c:if test="${inquiryVO.ansTitle != null}">
        <hr>
        <div class="row mem-inquiry-row">
            <div class="col-sm-2">
                <strong class="inquiry-tit-bundle">
                    답변제목
                </strong>
            </div>
            <div class="col-sm-10 form-group">
                <p>${inquiryVO.ansTitle}</p>
            </div>
        </div>

        <div class="row mem-inquiry-row">
            <div class="col-sm-2">
                <strong class="inquiry-tit-bundle">
                    답변내용
                </strong>
            </div>
            <div class="col-sm-10 form-group" style="min-height: 300px">
                <span>${inquiryVO.ansConts}</span>
            </div>
        </div>
    </c:if>
    </div>
    <div class="inquiry-submit-area">
        <button type="button" class="inquiry-submit-btn"
                onclick="location.href='/mem/inquiry/list'">목록</button>
    </div>
</div>