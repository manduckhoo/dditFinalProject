<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
    .table-responsive {
        cursor: default;
        overflow-x: clip;
    }
    .dataTables_paginate{
        margin-top: 20px !important;
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
                        <li class="breadcrumb-item" aria-current="page">게시판관리</li>
                        <li class="breadcrumb-item" aria-current="page">1:1문의 관리</li>
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
        <div class="table-responsive">
            <table id="adminInquiryList" class="table border table-bordered text-nowrap">
                <thead>
                <tr>
                    <th class="text-center">번호</th>
                    <th class="text-center">제목</th>
                    <th class="text-center">구분</th>
                    <th class="text-center">작성일자</th>
                    <th class="text-center">작성자</th>
                    <th class="text-center">처리상태</th>
                </tr>
                </thead>
                <tbody>
                <!-- start row -->
                <c:choose>
                    <c:when test="${fn:length(inquiryVOList) > 0}">
                        <c:forEach items="${inquiryVOList}" var="inquiryVO" varStatus="stat">
                            <tr onclick="location.href='/admin/inquiry/detail?inqNo=${inquiryVO.inqNo}'">
                                <td>${inquiryVO.inqNo}</td>
                                <td>${inquiryVO.inqTitle}</td>
                                <td>${inquiryVO.comDetCodeInfoVO.comDetCodeNm}</td>
                                <td><fmt:formatDate value="${inquiryVO.inqWrtDt}" pattern="yyyy. MM. dd HH:mm"/></td>
                                <td>${inquiryVO.memberVO.memNm}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${inquiryVO.ansTitle != null}">
                                            답변완료
                                        </c:when>
                                        <c:otherwise>
                                            답변대기중
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="6">
                                <p>문의내역이 없습니다.</p>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                <!-- end row -->
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="/resources/bootstrap/src/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script>
    $("#adminInquiryList").DataTable({
        bLengthChange: false,
        info: false,
        order: []
    });
</script>