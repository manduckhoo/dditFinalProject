<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    #list-paging-area {
        margin-top: 20px;
        display: flex;
        justify-content: center;
    }

    #list-paging-area > div {
        display: flex;
        justify-content: center;
    }

    #up-table-group {
        margin-bottom: 20px;
    }

    #insert-btn-area {
        display: flex;
        justify-content: end;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }

    input[type=number] {
        -moz-appearance: textfield;
    }

    .radios {
        font-size: 17px;
    }
</style>

<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">${franchiseName} 위생 점검 내역</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/frcs/main">Main</a>
                        </li>
                        <li class="breadcrumb-item">매장관리</li>
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/frcs/sanitation/list">매장 위생 관리</a>
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
        <div id="up-table-group" class="row">
            <div class="col-sm-3">
                <button type="button" class="btn btn-info" id="hq-btn"
                        data-bs-toggle="modal" data-bs-target="#sanitation-hq-modal-md">본사점검내역
                </button>
            </div>
            <div class="col" id="insert-btn-area">
                <button type="button" class="btn btn-info" id="reg-btn"
                        data-bs-toggle="modal" data-bs-target="#sanitation-reg-modal-md">점검등록
                </button>
            </div>
        </div>
        <table class="table border text-nowrap customize-table mb-0 align-middle">
            <thead class="text-dark fs-4">
            <tr>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">순번</h6>
                </th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">점검일자</h6>
                </th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">좌석</h6>
                </th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">시설</h6>
                </th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">식품</h6>
                </th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">근로자</h6>
                </th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">평균점수</h6>
                </th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${fn:length(sanitationList.content) > 0}">
                <c:forEach items="${sanitationList.content}" var="sanitation">
                        <tr>
                            <td>
                                <div class="fs-4 mb-0 text-center">
                                    <p>${sanitation.rnum}</p>
                                </div>
                            </td>
                            <td>
                                <div class="fs-4 mb-0 text-center">
                                    <fmt:formatDate value="${sanitation.sntChckDt}" dateStyle="medium"/>
                                </div>
                            </td>
                            <td>
                                <div class="fs-4 mb-0 text-center">
                                    ${sanitation.sntSeatScr}
                                </div>
                            </td>
                            <td>
                                <div class="fs-4 mb-0 text-center">
                                    ${sanitation.sntSeatScr}
                                </div>
                            </td>
                            <td>
                                <div class="fs-4 mb-0 text-center">
                                    ${sanitation.sntSeatScr}
                                </div>
                            </td>
                            <td>
                                <div class="fs-4 mb-0 text-center">
                                    ${sanitation.sntSeatScr}
                                </div>
                            </td>
                            <td>
                                <div class="fs-4 mb-0 text-center">
                                    ${sanitation.avrScr}
                                </div>
                            </td>
                        </tr>
                </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="7">
                            <div class="fs-4 mb-0 text-center">
                                아직 등록된 점검 결과가 없습니다.
                            </div>
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
        <c:if test="${fn:length(sanitationList.content) > 0}">
            <div id="list-paging-area">
                ${sanitationList.getPagingArea()}
            </div>
        </c:if>
    </div>
</div>

<%--위생점검 등록 모달--%>
<div id="sanitation-hq-modal-md" class="modal fade" tabindex="-1"
     aria-labelledby="sanitation-hq-modal-md" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-md">
        <div class="modal-content">
            <div class="modal-header d-flex align-items-center">
                <h4 class="modal-title" id="sanitation-hq-header">
                    본사 위생점검 내역
                </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <table id="frcs-list" class="table border table-bordered text-nowrap">
                        <thead>
                        <tr>
                            <th class="text-center">순번</th>
                            <th class="text-center">위생총점</th>
                            <th class="text-center">점검일자</th>
                            <th class="text-center">점검표</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- start row -->
                        <c:forEach items="${managementByFrcsNo}" var="management" varStatus="stat">
                            <tr class="text-center">
                                <td style="width: 10%;">${stat.count}</td>
                                <td>${management.sntChckTotalScr}</td>
                                <td><fmt:formatDate value="${management.sntChckDt}" dateStyle="medium"/></td>
                                <td>
                                    <a class="btn btn-primary"
                                       href="/resources/upload/sanitation/${management.atchFileVO.streFileNm}"
                                       download="${management.atchFileVO.orignlFileNm}">다운로드</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <!-- end row -->
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bg-danger-subtle text-danger font-medium waves-effect text-start" data-bs-dismiss="modal">
                    닫기
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<%--위생점검 등록 모달--%>
<div id="sanitation-reg-modal-md" class="modal fade" tabindex="-1"
     aria-labelledby="sanitation-reg-modal-md" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-md">
        <div class="modal-content">
            <div class="modal-header d-flex align-items-center">
                <h4 class="modal-title" id="sanitation-reg-header">
                    위생점검 등록
                </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form action="/frcs/sanitation/registration" method="post" id="reg-frm">
                <div class="modal-body">
                    <div class="row mb-3 radios">
                        <label for="sntChckDt" class="form-label">점검일자</label>
                        <input type="date" class="form-control" id="sntChckDt" name="sntChckDt" required>
                    </div>
                    <div class="row mb-3 radios">
                        <label for="sntSeatScr" class="form-label">좌석 위생점수</label>
                        <div class="col" id="sntSeatScr">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntSeatScr" value="1">
                                <label class="form-check-label">1</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntSeatScr" value="2">
                                <label class="form-check-label">2</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntSeatScr" value="3" checked>
                                <label class="form-check-label">3</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntSeatScr" value="4">
                                <label class="form-check-label">4</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntSeatScr" value="5">
                                <label class="form-check-label">5</label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3 radios">
                        <label for="sntSeatScr" class="form-label">시설 위생점수</label>
                        <div class="col" id="sntFcltScr">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntFcltScr" value="1">
                                <label class="form-check-label">1</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntFcltScr" value="2">
                                <label class="form-check-label">2</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntFcltScr" value="3" checked>
                                <label class="form-check-label">3</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntFcltScr" value="4">
                                <label class="form-check-label">4</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntFcltScr" value="5">
                                <label class="form-check-label">5</label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3 radios">
                        <label for="sntSeatScr" class="form-label">식품 위생점수</label>
                        <div class="col" id="sntFoodScr">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntFoodScr" value="1">
                                <label class="form-check-label">1</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntFoodScr" value="2">
                                <label class="form-check-label">2</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntFoodScr" value="3" checked>
                                <label class="form-check-label">3</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntFoodScr" value="4">
                                <label class="form-check-label">4</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntFoodScr" value="5">
                                <label class="form-check-label">5</label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3 radios">
                        <label for="sntSeatScr" class="form-label">근로자 위생점수</label>
                        <div class="col" id="sntEmpScr">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntEmpScr" value="1">
                                <label class="form-check-label">1</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntEmpScr" value="2">
                                <label class="form-check-label">2</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntEmpScr" value="3" checked>
                                <label class="form-check-label">3</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntEmpScr" value="4">
                                <label class="form-check-label">4</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input warning" type="radio" name="sntEmpScr" value="5">
                                <label class="form-check-label">5</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" id="reg-modal-footer">
                    <button type="button" id="submit-btn" class="btn btn-primary">
                        등록
                    </button>
                    <button type="button" id="cancel-btn" class="btn btn-secondary">
                        취소
                    </button>
                </div>
                <sec:csrfInput/>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script src="/resources/bootstrap/src/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script>
    $(document).on("click", "#submit-btn", function () {
        Swal.fire({
            title: '등록 하시겠습니까?',
            icon: 'warning',

            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
            confirmButtonColor: '#01c0c8', // confrim 버튼 색깔 지정
            cancelButtonColor: '#ff5757', // cancel 버튼 색깔 지정
            confirmButtonText: '등록', // confirm 버튼 텍스트 지정
            cancelButtonText: '취소', // cancel 버튼 텍스트 지정

        }).then(result => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '등록완료',
                    icon: 'success',

                    showCancelButton: false,
                    confirmButtonColor: '#01c0c8', // confrim 버튼 색깔 지정
                    confirmButtonText: '확인' // confirm 버튼 텍스트 지정

                }).then(result => {
                    if (result.isConfirmed) {
                        $("#reg-frm").submit();
                    }
                })
            }
        })
    });

    $(document).on("click", "#cancel-btn", function () {
        location.reload();
    })
</script>