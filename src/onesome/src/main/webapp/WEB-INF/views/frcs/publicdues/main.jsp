<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    p {
        margin-bottom: 0;
    }

    td > p {
        font-size: 14pt;
    }

    #item-list-area {
        min-height: 500px;
    }

    #chart-area{
        border: 1px solid lightgrey;
    }

    .date-btns {
        border: 0 none;
        margin-left: 30px;
        margin-right: 30px;
        background-color: transparent;
    }

    #frm {
        font-size: 14pt;
        display: flex;
        justify-content: center;
    }

    table {
        cursor: default;
    }

    .under-item-table {
        margin-top: 30px;
        display: flex;
        align-items: center;
    }

    .under-btn-area {
        display: flex;
        justify-content: end;
    }

    .total-amt {
        font-size: 15pt;
    }

    .inputAmt{
        border: 0 none;
        font-size: 14pt;
    }
</style>

<div class="card bg-primary-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">공과금 등록</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/frcs/main">Main</a>
                        </li>
                        <li class="breadcrumb-item">매장관리</li>
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/frcs/publicdues/main">공과금 등록</a>
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
            <div class="col-sm-6">
                <div id="item-list-area">
                    <div>
                        <form id="frm">
                            <button class="date-btns" type="submit" name="viewDate" value="${previousMonth}">
                                <i class='bx bxs-left-arrow'></i>
                            </button>
                            <strong>${viewDate}월</strong>
                            <button class="date-btns" type="submit" name="viewDate" value="${nextMonth}"
                                    <c:if test="${nextMonth gt crrDate}">disabled</c:if>>
                                <i class='bx bxs-right-arrow'></i>
                            </button>
                        </form>
                    </div>
                    <form id="publicdues-frm" action="/frcs/publicdues/registration" method="post">
                        <input type="hidden" id="viewDate" name="duesClmYm" value="${viewDate}">
                        <table class="table table-hover border text-nowrap mb-0 align-middle" id="item-table">
                            <thead class="text-dark fs-4">
                            <tr class="table-info">
                                <th style="width: 10%"></th>
                                <th style="width: 45%">
                                    <h6 class="fs-4 fw-semibold mb-0 text-center">항목</h6>
                                </th>
                                <th style="width: 45%">
                                    <h6 class="fs-4 fw-semibold mb-0 text-center">금액(원)</h6>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                                <tr id="frcs-fee-row">
                                    <td class="fs-4 mb-0 text-center">
                                        <p>1</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-center">
                                        <p>전기세</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-end">
                                        <p>
                                            <input type="text" class="form-control inputAmt text-end" name="duesElectricAmt" placeholder="전기세" required
                                                <c:if test="${publicdues != null}">
                                                   value="<fmt:formatNumber value="${publicdues.duesElectricAmt}" type="number" maxFractionDigits="3"/>"
                                                   readonly
                                                </c:if>>
                                        </p>
                                    </td>
                                </tr>
                                <tr id="royalty-row">
                                    <td class="fs-4 mb-0 text-center">
                                        <p>2</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-center">
                                        <p>수도세</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-end">
                                        <p>
                                            <input type="text" class="form-control inputAmt text-end" name="duesWaterAmt" placeholder="수도세" required
                                                <c:if test="${publicdues != null}">
                                                    value="<fmt:formatNumber value="${publicdues.duesWaterAmt}" type="number" maxFractionDigits="3"/>"
                                                    readonly
                                                </c:if>>
                                        </p>
                                    </td>
                                </tr>
                                <tr id="order-row">
                                    <td class="fs-4 mb-0 text-center">
                                        <p>3</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-center">
                                        <p>가스비</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-end">
                                        <p>
                                            <input type="text" class="form-control inputAmt text-end" name="duesGasAmt" placeholder="가스비" required
                                                <c:if test="${publicdues != null}">
                                                    value="<fmt:formatNumber value="${publicdues.duesGasAmt}" type="number" maxFractionDigits="3"/>"
                                                    readonly
                                                </c:if>>
                                        </p>
                                    </td>
                                </tr>
                                <tr id="npmnt-row">
                                    <td class="fs-4 mb-0 text-center">
                                        <p>4</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-center">
                                        <p>월세</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-end">
                                        <p>
                                            <input type="text" class="form-control inputAmt text-end" name="duesMtrtAmt" placeholder="월세" required
                                                <c:if test="${publicdues != null}">
                                                    value="<fmt:formatNumber value="${publicdues.duesMtrtAmt}" type="number" maxFractionDigits="3"/>"
                                                    readonly
                                                </c:if>>
                                        </p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <sec:csrfInput/>
                    </form>
                    <c:choose>
                        <c:when test="${publicdues != null}">
                            <div class="row under-item-table">
                                <div class="col-sm-6 total-amt">
                                    <strong>총계 : <fmt:formatNumber value="${publicdues.duesTotalAmt}" type="number"
                                                                   maxFractionDigits="3"/> 원</strong>
                                </div>
                                <div class="col under-btn-area">
                                    <button type="button" id="mod-btn" class="btn btn-info">
                                        수정
                                    </button>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="row under-item-table">
                                <div class="col-sm-6 total-amt">
                                    <strong>총계 : 0 원</strong>
                                </div>
                                <div class="col under-btn-area">
                                    <button type="button" id="submit-btn" class="btn btn-info">
                                        등록
                                    </button>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="col-sm-6" id="chart-area">
                <div class="text-center mb-3 mt-3">
                    <strong style="font-size: 16pt">최근 1년간 공과금 내역</strong>
                </div>
                <canvas id="dues-chart"></canvas>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>

<script>
    $(function () {

        const token = $("meta[name='_csrf']").attr("content");
        const header = $("meta[name='_csrf_header']").attr("content");

        //차트 생성
        $.ajax({
            url: "/frcs/publicdues/getDuesChartData",
            dataType: "json"
        }).done(rst => {
            console.log(rst)

            let months = [];
            let amts = [];

            $.each(rst, function (idx, data) {
                months.unshift(data.duesClmYm);
                amts.unshift(data.duesTotalAmt);
            });

            let duesChartArea = $("#dues-chart");
            let duesChart = new Chart(duesChartArea, {
                type: "bar",
                data: {
                    labels: months,
                    datasets: [
                        {
                            label: ["# 단위(원)"],
                            data: amts,
                            backgroundColor: 'rgba(252,159,37,0.80)'
                        },
                    ]
                },
                options: {
                    plugins: {
                        legend: false
                    },
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: '날짜',
                                font: {
                                    size: 16,
                                    weight: 'bold',
                                    lineHeight: 1.2,
                                }
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: '금액(원)',
                                font: {
                                    size: 16,
                                    weight: 'bold',
                                    lineHeight: 1.2,
                                }
                            }
                        }
                    }
                }
            })
        })

        //저장 버튼 클릭시
        $(document).on("click", "#save-btn", () => {
            Swal.fire({
                title: '공과금 수정',
                text: `\${veiwDate}월의 공과금을 수정 하시겠습니까?`,
                icon: 'warning',

                showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
                confirmButtonColor: '#01c0c8', // confrim 버튼 색깔 지정
                cancelButtonColor: '#ff5757', // cancel 버튼 색깔 지정
                confirmButtonText: '확인', // confirm 버튼 텍스트 지정
                cancelButtonText: '취소', // cancel 버튼 텍스트 지정

            }).then(result => {
                let publicduesFrm = $("#publicdues-frm");

                $.each($(".inputAmt"), function (idx, inputAmt) {
                    console.log(inputAmt.value)
                    inputAmt.value = Number(inputAmt.value.replaceAll(',', ''));
                    console.log(inputAmt.value)
                });

                publicduesFrm.attr("action", "/frcs/publicdues/update");

                publicduesFrm.submit();
            });
        })

        //수정 버튼 클릭시
        $("#mod-btn").on("click", () => {
            $(".under-btn-area").html(`
            <button type="button" id="save-btn" class="btn btn-info me-2">
                저장
            </button>
            <button type="button" onclick="location.reload()" class="btn btn-danger">
                취소
            </button>
       `);

            $(".inputAmt").removeAttr("readonly");
        });

        //등록 버튼 클릭시
        $("#submit-btn").on("click", () => {
            Swal.fire({
                title: '공과금 등록',
                text: `\${veiwDate}월의 공과금을 등록 하시겠습니까?`,
                icon: 'warning',

                showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
                confirmButtonColor: '#01c0c8', // confrim 버튼 색깔 지정
                cancelButtonColor: '#ff5757', // cancel 버튼 색깔 지정
                confirmButtonText: '확인', // confirm 버튼 텍스트 지정
                cancelButtonText: '취소', // cancel 버튼 텍스트 지정

            }).then(result => {
                if (result.isConfirmed) {

                    let allInput = true;

                    $("#publicdues-frm").find(":input[required]").each(function () {
                        if ($(this).val() === "") {
                            allInput = false;
                            $(this).css("border", "2px solid red");
                        } else {
                            $(this).css("border", "");
                            allInput = true;
                        }
                    });
                    if (allInput) {
                        Swal.fire({
                            title: '등록완료',
                            icon: 'success',

                            showCancelButton: false,
                            confirmButtonColor: '#01c0c8', // confrim 버튼 색깔 지정
                            confirmButtonText: '확인' // confirm 버튼 텍스트 지정

                        }).then(result => {
                            if (result.isConfirmed) {
                                $.each($(".inputAmt"), function (idx, inputAmt) {
                                    console.log(inputAmt.value)
                                    inputAmt.value = Number(inputAmt.value.replaceAll(',', ''));
                                    console.log(inputAmt.value)
                                });
                                $("#publicdues-frm").submit();
                            }
                        })
                    }
                }
            })
        })

        //금액입력 키업 이벤트
        $(".inputAmt").on("keyup", function () {
            let value = $(this).val();

            let total = 0;
            $.each($(".inputAmt"), function (idx, inputAmt) {
                total += Number(inputAmt.value.replaceAll(',', ''));
            });

            $(".total-amt").html(`<strong>총계 : \${total.toLocaleString('ko-KR')} 원</strong>`);

            value = Number(value.replaceAll(',', ''));
            if (isNaN(value)) {         //NaN인지 판별
                $(this).val(0);
            } else {                   //NaN이 아닌 경우
                const formatValue = value.toLocaleString('ko-KR');
                $(this).val(formatValue);
            }

        })
    })
</script>
