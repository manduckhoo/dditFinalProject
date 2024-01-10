<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
    p {
        margin-bottom: 0;
    }
    table {
        font-size: 13pt;
    }
    .date-btns {
        border: 0 none;
        margin-left: 30px;
        margin-right: 30px;
        background-color: transparent;
    }
    #frm {
        font-size: 15pt;
        display: flex;
        justify-content: center;
    }
    .table-responsive {
        cursor: default;
        overflow-x: clip;
    }
    .dataTables_paginate{
        margin-top: 20px !important;
    }
</style>

<div class="card bg-primary-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">가맹비 관리</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/main">Main</a>
                        </li>
                        <li class="breadcrumb-item">매장관리</li>
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/royalty/list">가맹비 관리</a>
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
        <div class="row">
            <div>
                <form id="frm">
                    <button class="date-btns" type="submit" name="viewDate" value="${previousMonth}">
                        <i class='bx bxs-left-arrow'></i>
                    </button>
                    <strong>${viewDate}월 가맹점 청구내역</strong>
                    <button class="date-btns" type="submit" name="viewDate" value="${nextMonth}"
                            <c:if test="${nextMonth gt crrDate}">disabled</c:if>>
                        <i class='bx bxs-right-arrow'></i>
                    </button>
                </form>
            </div>
        </div>
        <div class="table-responsive">
            <table id="adminInquiryList" class="table border table-bordered text-nowrap">
                <thead>
                <tr>
                    <th class="fs-4 mb-0 text-center" width="5%">순번</th>
                    <th class="fs-4 mb-0 text-center">가맹점명</th>
                    <th class="fs-4 mb-0 text-center">당월 청구액</th>
                    <th class="fs-4 mb-0 text-center" width="10%">납부여부</th>
                    <th class="fs-4 mb-0 text-center" width="10%">납부일자</th>
                    <th class="fs-4 mb-0 text-center">미납금</th>
                    <th class="fs-4 mb-0 text-center" width="5%">누적 미납 횟수</th>
                </tr>
                </thead>
                <tbody>
                <!-- start row -->
                <c:choose>
                    <c:when test="${fn:length(royaltyVOList) > 0}">
                        <c:forEach items="${royaltyVOList}" var="royaltyVO" varStatus="stat">
                            <tr>
                                <td class="text-center">
                                    <p>${stat.count}</p>
                                </td>
                                <td class="text-start">
                                    <p>${royaltyVO.frcsNm}</p>
                                </td>
                                <td class="text-end">
                                    <p>
                                        <fmt:formatNumber value="${royaltyVO.ryTotalAmt}"
                                                          type="number" maxFractionDigits="3"/> 원
                                    </p>
                                </td>
                                <td class="text-center">
                                    <c:choose>
                                        <c:when test="${royaltyVO.ryStatusYn == 'Y'}">
                                            <p style="color: green">납부</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p style="color: red">미납</p>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-center">
                                    <p>
                                        <c:choose>
                                            <c:when test="${royaltyVO.ryPayDt != null}">
                                                <fmt:formatDate value="${royaltyVO.ryPayDt}" dateStyle="medium"/>
                                            </c:when>
                                            <c:otherwise>
                                                -
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </td>
                                <td class="text-end">
                                    <p>
                                        <fmt:formatNumber value="${royaltyVO.ryNpmntAmt}"
                                                         type="number" maxFractionDigits="3"/> 원
                                    </p>
                                </td>
                                <td class="text-center">
                                    <p>${royaltyVO.accNpmntCnt}</p>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
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
        order: [],
        "searching": false
    });
</script>
