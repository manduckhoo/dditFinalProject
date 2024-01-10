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

    #frm {
        margin: 0;
    }

    .table-responsive {
        cursor: default;
        overflow-x: clip;
    }

    .dataTables_paginate {
        margin-top: 20px !important;
    }

    #input-area {
        padding: 0 25px 0 25px;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }

    input[type=number] {
        -moz-appearance: textfield;
    }

    table {
        cursor: default;
    }
</style>

<div class="card bg-primary-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">위생 관리</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/main">Main</a>
                        </li>
                        <li class="breadcrumb-item">매장관리</li>
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/sanitation/list">위생관리</a>
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
                <form id="frm">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="가맹점명" name="keyword" aria-label=""
                               aria-describedby="basic-addon1">
                        <button class="btn bg-info-subtle text-info font-medium" type="submit"><i
                                class='bx bx-search-alt-2'></i></button>
                    </div>
                </form>
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
                    <h6 class="fs-4 fw-semibold mb-0 text-center">번호</h6>
                </th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">가맹점명</h6>
                </th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">위생총점</h6>
                </th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">점검일자</h6>
                </th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">점검표</h6>
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${managementList.content}" var="management">
                <tr>
                    <td>
                        <div class="fs-4 mb-0 text-center">
                            <p>${management.rnum}</p>
                        </div>
                    </td>
                    <td>
                        <div class="fs-4 mb-0 text-center name-col"
                             data-checkdt="<fmt:formatDate value="${management.sntChckDt}" pattern="yyyy-MM-dd"/>"
                             data-frcsno="${management.franchiseVO.frcsNo}" data-atchFileNo="${management.atchFileNo}">
                                ${management.franchiseVO.frcsNm}
                        </div>
                    </td>
                    <td>
                        <div class="fs-4 mb-0 text-center">
                                ${management.sntChckTotalScr}
                        </div>
                    </td>
                    <td>
                        <div class="fs-4 mb-0 text-center">
                            <fmt:formatDate value="${management.sntChckDt}" dateStyle="medium"/>
                        </div>
                    </td>
                    <td>
                        <div class="fs-4 mb-0 text-center">
                            <a class="btn btn-primary"
                               href="/resources/upload/sanitation/${management.atchFileVO.streFileNm}"
                               download="${management.atchFileVO.orignlFileNm}">다운로드</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div id="list-paging-area">
            ${managementList.getPagingArea()}
        </div>
    </div>
</div>

<%--상세보기 모달--%>
<div id="sanitation-det-modal-lg" class="modal fade" tabindex="-1"
     aria-labelledby="sanitation-det-modal-lg" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header d-flex align-items-center">
                <h4 class="modal-title" id="sanitation-det-header">
                    가맹점 위생점검 내역
                </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <table id="sanitation-list" class="table border table-bordered text-nowrap">
                        <thead>
                        <tr>
                            <th class="text-center">순번</th>
                            <th class="text-center">점검일자</th>
                            <th class="text-center">좌석</th>
                            <th class="text-center">시설</th>
                            <th class="text-center">식품</th>
                            <th class="text-center">근로자</th>
                            <th class="text-center">평균점수</th>
                        </tr>
                        </thead>
                        <tbody id="sanitation-list-body">
                        <tr>
                            <td colspan="7" class="text-center">아직 등록된 점검내역이 없습니다.</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer" id="det-modal-footer">
                <form id="del-frm" method="post" action="/admin/sanitation/delete">
                    <input type="hidden" name="frcsNo" id="del-frcsNo">
                    <input type="hidden" name="sntChckDt" id="del-sntChckDt">
                    <input type="hidden" name="atchFileNo" id="del-atchFileNo">
                    <button type="button" id="del-btn" class="btn btn-danger">
                        삭제
                    </button>
                    <sec:csrfInput/>
                </form>
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
            <form action="/admin/sanitation/registration" method="post" enctype="multipart/form-data" id="reg-frm">
                <div class="modal-body">
                    <div id="frcs-list-area">
                        <div class="table-responsive">
                            <table id="frcs-list" class="table border table-bordered text-nowrap">
                                <thead>
                                <tr>
                                    <th class="text-center"></th>
                                    <th class="text-center">순번</th>
                                    <th class="text-center">가맹점명</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- start row -->
                                <c:forEach items="${franchiseList}" var="franchise" varStatus="stat">
                                    <tr class="text-center">
                                        <td style="width: 10%;">
                                            <input class="form-check-input frcsNo-check" type="checkbox"
                                                   name="frcsNo" value="${franchise.frcsNo}">
                                        </td>
                                        <td>${stat.count}</td>
                                        <td>${franchise.frcsNm}</td>
                                    </tr>
                                </c:forEach>
                                <!-- end row -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="input-area" style="display: none">
                        <div class="row">
                            <label for="sntChckDt" class="form-label">점검일자</label>
                            <input type="date" class="form-control" id="sntChckDt" name="sntChckDt" required>
                        </div>
                        <div class="row">
                            <label for="sntChckTotalScr" class="form-label">위생총점</label>
                            <input type="number" class="form-control" id="sntChckTotalScr" name="sntChckTotalScr"
                                   required>
                        </div>
                        <div class="row">
                            <label for="uploadFile" class="form-label">점검표</label>
                            <input type="file" class="form-control" id="uploadFile" name="uploadFile" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" id="reg-modal-footer">
                    <button type="button" id="next-btn" class="btn btn-info">
                        다음
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
    const token = $("meta[name='_csrf']").attr("content");
    const header = $("meta[name='_csrf_header']").attr("content");

    //삭제버튼 클릭
    $("#del-btn").on("click", function () {
        Swal.fire({
            title: '삭제 하시겠습니까?',
            text: '되돌릴 수 없습니다.',
            icon: 'warning',

            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
            confirmButtonColor: '#01c0c8', // confrim 버튼 색깔 지정
            cancelButtonColor: '#ff5757', // cancel 버튼 색깔 지정
            confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
            cancelButtonText: '취소', // cancel 버튼 텍스트 지정

        }).then(result => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '삭제완료',
                    icon: 'success',

                    showCancelButton: false,
                    confirmButtonColor: '#01c0c8', // confrim 버튼 색깔 지정
                    confirmButtonText: '확인' // confirm 버튼 텍스트 지정

                }).then(result => {
                    if (result.isConfirmed) {
                        $("#del-frm").submit();
                    }
                })
            }
        })
    })

    $(".name-col").on("click", function () {
        let frcsNo = $(this).data("frcsno");
        let sntChckDt = $(this).data("checkdt");
        let atchFileNo = $(this).data("atchfileno");

        $("#del-frcsNo").val(frcsNo);
        $("#del-sntChckDt").val(sntChckDt);
        $("#del-atchFileNo").val(atchFileNo);

        let frcsNm = $(this).text().replaceAll(" ", "");

        let data = {"frcsNo": frcsNo, "sntChckDt": sntChckDt}

        $.ajax({
            url: "/admin/sanitation/detail",
            type: "post",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            }
        }).done((rst) => {

            $("#sanitation-det-header").html(`\${frcsNm}<br> 기간내 위생점검 내역`);

            let str = "";

            if (rst.length > 0) {
                $.each(rst, function (idx, sanitation) {
                    str += `
                        <tr>
                            <td class="text-center">\${idx+1}</td>
                            <td class="text-center">\${sanitation.sntChckDt}</td>
                            <td class="text-center">\${sanitation.sntSeatScr}</td>
                            <td class="text-center">\${sanitation.sntFcltScr}</td>
                            <td class="text-center">\${sanitation.sntFoodScr}</td>
                            <td class="text-center">\${sanitation.sntEmpScr}</td>
                            <td class="text-center">\${sanitation.avrScr}</td>
                        </tr>
                `
                });
            }else {
                str =
                    `<tr>
                        <td colspan="7" class="text-center">아직 등록된 점검내역이 없습니다.</td>
                    </tr>`
            }
            $("#sanitation-list-body").html(str);
            $("#sanitation-det-modal-lg").modal("show");
        })

    })

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

    //다음버튼 클릭
    $("#next-btn").on("click", function () {

        if ($(".frcsNo-check").is(":checked")) {
            $("#frcs-list-area").css("display", "none");
            $("#input-area").css("display", "block");

            $("#reg-modal-footer").html(`
            <button type="button" id="submit-btn" class="btn btn-primary">
                등록
            </button>
            <button type="button" id="cancel-btn" class="btn btn-secondary">
                취소
            </button>
            `)
        } else {
            alert("가맹점을 선택해 주세요.");
        }
    })

    $("#frcs-list").DataTable({
        bLengthChange: false,
        info: false,
        order: []
    });

    //가맹점 선택 체크박스가 하나만 선택 되도록 처리
    $(document).on('click', ".frcsNo-check", function () {
        if (this.checked) {
            const checkboxes = $(".frcsNo-check");
            for (let i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = false;
            }
            this.checked = true;
        } else {
            this.checked = false;
        }
    });
</script>