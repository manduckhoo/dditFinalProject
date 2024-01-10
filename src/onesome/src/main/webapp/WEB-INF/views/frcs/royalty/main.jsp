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

    #item-det-list-area {
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

    #pay-btn-area {
        display: flex;
        justify-content: end;
    }

    .total-amt {
        font-size: 15pt;
    }
</style>

<div class="card bg-primary-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">본사 청구액 납부</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/frcs/main">Main</a>
                        </li>
                        <li class="breadcrumb-item">매장관리</li>
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/frcs/royalty/main">본사 청구액 납부</a>
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
                            <strong>${viewDate}월 청구서</strong>
                            <button class="date-btns" type="submit" name="viewDate" value="${nextMonth}"
                                    <c:if test="${nextMonth gt crrDate}">disabled</c:if>>
                                <i class='bx bxs-right-arrow'></i>
                            </button>
                        </form>
                    </div>
                    <table class="table table-hover border text-nowrap mb-0 align-middle" id="item-table">
                        <thead class="text-dark fs-4">
                        <tr class="table-info">
                            <th style="width: 10%"></th>
                            <th>
                                <h6 class="fs-4 fw-semibold mb-0 text-center">항목</h6>
                            </th>
                            <th>
                                <h6 class="fs-4 fw-semibold mb-0 text-center">금액(원)</h6>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${royalty != null}">
                                <tr id="frcs-fee-row">
                                    <td class="fs-4 mb-0 text-center">
                                        <p>1</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-center">
                                        <p>가맹비</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-end">
                                        <p id="ryFrcsFeeAmt" data-fee="${royalty.ryFrcsFeeAmt}">
                                            <fmt:formatNumber value="${royalty.ryFrcsFeeAmt}" type="number"
                                                              maxFractionDigits="3"/> 원
                                        </p>
                                    </td>
                                </tr>
                                <tr id="royalty-row">
                                    <td class="fs-4 mb-0 text-center">
                                        <p>2</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-center">
                                        <p>로열티</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-end">
                                        <p>
                                            <fmt:formatNumber value="${royalty.ryRoyaltyAmt}" type="number"
                                                              maxFractionDigits="3"/> 원
                                        </p>
                                    </td>
                                </tr>
                                <tr id="order-row">
                                    <td class="fs-4 mb-0 text-center">
                                        <p>3</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-center">
                                        <p>제품구입비</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-end">
                                        <p>
                                            <fmt:formatNumber value="${royalty.ryOrderAmt}" type="number"
                                                              maxFractionDigits="3"/> 원
                                        </p>
                                    </td>
                                </tr>
                                <tr id="npmnt-row">
                                    <td class="fs-4 mb-0 text-center">
                                        <p>4</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-center">
                                        <p>미납금</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-end">
                                        <p>
                                            <fmt:formatNumber value="${royalty.ryNpmntAmt}" type="number"
                                                              maxFractionDigits="3"/> 원
                                        </p>
                                    </td>
                                </tr>
                                <tr id="ovrint-row">
                                    <td class="fs-4 mb-0 text-center">
                                        <p>5</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-center">
                                        <p>연체이자</p>
                                    </td>
                                    <td class="fs-4 mb-0 text-end">
                                        <p>
                                            <fmt:formatNumber value="${royalty.ryOvrintAmt}" type="number"
                                                              maxFractionDigits="3"/> 원
                                        </p>
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="3" class="text-center"><p>해당월 청구서가 존재하지 않습니다.</p></td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                    <c:if test="${royalty != null}">
                    <div class="row under-item-table">
                        <div class="col-sm-6 total-amt">
                            <strong>총계 : <fmt:formatNumber value="${royalty.ryTotalAmt}" type="number"
                                                           maxFractionDigits="3"/> 원</strong>
                        </div>
                        <div class="col" id="pay-btn-area">
                            <form id="payment-frm" action="/frcs/royalty/royaltyPayment" method="post">
                                <input type="hidden" name="viewDate" id="viewDate" value="${royalty.ryClmYm}">
                                <c:choose>
                                    <c:when test="${royalty.ryStatusYn == 'N'}">
                                        <button type="button" id="pay-btn" class="btn btn-warning">
                                            <i class='bx bx-won'></i>
                                            납부
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="button" id="pay-btn" class="btn btn-warning" disabled>
                                            <i class='bx bx-calendar'></i>
                                            <fmt:formatDate value="${royalty.ryPayDt}" dateStyle="medium"/>에 납부된 건입니다.
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                                <sec:csrfInput/>
                            </form>
                        </div>
                    </div>
                    </c:if>
                </div>
            </div>
            <div class="col-sm-6" id="item-det-list-area">
                <div class="fs-4 mt-3 mb-4 text-start">
                    <strong>상세내역</strong>
                </div>
                <div id="det-info-area">
                    <strong>항목 클릭시 상세보기가 가능합니다.</strong>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const token = $("meta[name='_csrf']").attr("content");
    const header = $("meta[name='_csrf_header']").attr("content");

    const veiwDate = $("#viewDate").val();  //현재 보고있는 청구서의 날짜

    const thisPageDateJson = {"viewDate": veiwDate};

    const detTbody = $("#det-info-area");
    const ryFrcsFeeAmt = $("#ryFrcsFeeAmt").data("fee");

    //납부 버튼 클릭시
    $("#pay-btn").on("click", () => {

        let inputDate = new Date(veiwDate);
        let crrDate = new Date(); //현재날짜
        let paymentDueDate = new Date(inputDate.getFullYear(), inputDate.getMonth() + 1, 1)//납부 가능 날짜(청구월의 익월 1일부터)

        if (crrDate >= paymentDueDate) { // 납부 가능 날짜 이후면 납부처리 진행
            Swal.fire({
                title: '청구액 납부',
                text: `\${veiwDate}월 까지의 청구액을 납부하시겠습니까?`,
                icon: 'warning',

                showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
                confirmButtonColor: '#01c0c8', // confrim 버튼 색깔 지정
                cancelButtonColor: '#ff5757', // cancel 버튼 색깔 지정
                confirmButtonText: '확인', // confirm 버튼 텍스트 지정
                cancelButtonText: '취소', // cancel 버튼 텍스트 지정

            }).then(result => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: '납부완료',
                        icon: 'success',

                        showCancelButton: false,
                        confirmButtonColor: '#01c0c8', // confrim 버튼 색깔 지정
                        confirmButtonText: '확인' // confirm 버튼 텍스트 지정

                    }).then(result => {
                        if (result.isConfirmed) {
                            $("#payment-frm").submit();
                        }
                    })
                }
            })
        } else {
            paymentDueDate = paymentDueDate.toLocaleDateString("ko-KR", {
                year: 'numeric',
                month: '2-digit',
                day: '2-digit'
            });

            Swal.fire({
                title: '납부 가능기간 아님',
                text: `\${paymentDueDate} 부터 납부 가능합니다.`,
                icon: 'error',

                showCancelButton: false,
                confirmButtonColor: '#01c0c8', // confrim 버튼 색깔 지정
                confirmButtonText: '확인' // confirm 버튼 텍스트 지정

            })
        }

    })

    //연체이자 항목 클릭시
    $("#ovrint-row").on("click", () => {
        $.ajax({
            url: "/frcs/royalty/npmntDetail",
            type: "post",
            data: JSON.stringify(thisPageDateJson),
            dataType: "json",
            contentType: "application/json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            }
        }).done(rst => {
            let th_str = `<th><h6 class="fs-4 fw-semibold mb-0 text-center">청구월</h6></th>
                          <th><h6 class="fs-4 fw-semibold mb-0 text-center">연체이자(원)</h6></th>
                          <th><h6 class="fs-4 fw-semibold mb-0 text-center">납부여부</h6></th>`;

            let tbody_str = "";
            let total_amt = 0;
            if (rst[0] != null) {
                $.each(rst, function (idx, data) {
                    total_amt += Math.ceil(data.total * 0.01);
                    let status = "미납";
                    if (data.status === "Y") status = "납부완료";
                    tbody_str += `<tr>
                                    <td class="fs-4 mb-0 text-center"><p>\${data.ym}</p></td>
                                    <td class="fs-4 mb-0 text-end"><p>\${Math.ceil(data.total * 0.01).toLocaleString('ko-KR')} 원</p></td>
                                    <td class="fs-4 mb-0 text-center"><p>\${status}</p></td>
                                  </tr>`;
                });
            } else {
                tbody_str = `<tr class="text-center"><td colspan="3"><p>미납 내역이 없습니다.</p></td></tr>`
            }
            let total_str = `<div class="total-amt under-item-table justify-content-end">
                                <strong> 총계 : \${total_amt.toLocaleString('ko-KR')} 원</strong>
                             </div>`;
            let table_str = table_str_maker(th_str, tbody_str) + total_str;
            detTbody.html(table_str);
        })
    });

    //미납금 항목 클릭시
    $("#npmnt-row").on("click", () => {
        $.ajax({
            url: "/frcs/royalty/npmntDetail",
            type: "post",
            data: JSON.stringify(thisPageDateJson),
            dataType: "json",
            contentType: "application/json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            }
        }).done(rst => {
            let th_str = `<th><h6 class="fs-4 fw-semibold mb-0 text-center">청구월</h6></th>
                          <th><h6 class="fs-4 fw-semibold mb-0 text-center">미납 금액(원)</h6></th>
                          <th><h6 class="fs-4 fw-semibold mb-0 text-center">납부여부</h6></th>`;

            let tbody_str = "";
            let total_amt = 0;
            if (rst[0] != null) {
                $.each(rst, function (idx, data) {
                    total_amt += data.total;
                    let status = "미납";
                    if (data.status === "Y") status = "납부완료";
                    tbody_str += `<tr>
                                    <td class="fs-4 mb-0 text-center"><p>\${data.ym}</p></td>
                                    <td class="fs-4 mb-0 text-end"><p>\${data.total.toLocaleString('ko-KR')} 원</p></td>
                                    <td class="fs-4 mb-0 text-center"><p>\${status}</p></td>
                                  </tr>`;
                });
            } else {
                tbody_str = `<tr class="text-center"><td colspan="3"><p>미납 내역이 없습니다.</p></td></tr>`
            }
            let total_str = `<div class="total-amt under-item-table justify-content-end">
                                <strong> 총계 : \${total_amt.toLocaleString('ko-KR')} 원</strong>
                             </div>`;
            let table_str = table_str_maker(th_str, tbody_str) + total_str;
            detTbody.html(table_str);
        })
    });

    //제품구입비 항목 클릭시
    $("#order-row").on("click", () => {
        $.ajax({
            url: "/frcs/royalty/orderDetail",
            type: "post",
            data: JSON.stringify(thisPageDateJson),
            dataType: "json",
            contentType: "application/json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            }
        }).done(rst => {
            let th_str = `<th><h6 class="fs-4 fw-semibold mb-0 text-center">제품명</h6></th>
                          <th><h6 class="fs-4 fw-semibold mb-0 text-center">매입 수량</h6></th>
                          <th><h6 class="fs-4 fw-semibold mb-0 text-center">매입 금액(원)</h6></th>`;

            let tbody_str = "";
            let total_amt = 0;
            if (rst[0] != null) {
                $.each(rst, function (idx, product) {
                    total_amt += product.price;
                    tbody_str += `<tr>
                                    <td class="fs-4 mb-0 text-center"><p>\${product.name}</p></td>
                                    <td class="fs-4 mb-0 text-center"><p>\${product.qty}</p></td>
                                    <td class="fs-4 mb-0 text-end"><p>\${product.price.toLocaleString('ko-KR')} 원</p></td>
                                  </tr>`;
                });
            } else {
                tbody_str = `<tr class="text-center"><td colspan="3"><p>매입 내역이 없습니다.</p></td></tr>`
            }
            let total_str = `<div class="total-amt under-item-table justify-content-end">
                                <strong> 총계 : \${total_amt.toLocaleString('ko-KR')} 원</strong>
                             </div>`;
            let table_str = table_str_maker(th_str, tbody_str) + total_str;
            detTbody.html(table_str);
        })
    });

    //가맹비 항목 클릭시
    $("#frcs-fee-row").on("click", () => {
        let th_str = `<th><h6 class="fs-4 fw-semibold mb-0 text-center">항목</h6></th>
                      <th><h6 class="fs-4 fw-semibold mb-0 text-center">금액(원)</h6></th>`;
        let tbody_str = `<tr>
                            <td class="fs-4 mb-0 text-center"><p>가맹비</p></td>
                            <td class="fs-4 mb-0 text-end"><p>\${ryFrcsFeeAmt.toLocaleString('ko-KR')} 원</p></td>
                         </tr>`;
        let table_str = table_str_maker(th_str, tbody_str);
        detTbody.html(table_str);
    });

    //로열티 항목 클릭시
    $("#royalty-row").on("click", () => {

        $.ajax({
            url: "/frcs/royalty/royaltyDetail",
            type: "post",
            data: JSON.stringify(thisPageDateJson),
            dataType: "json",
            contentType: "application/json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            }
        }).done(rst => {
            let th_str = `<th><h6 class="fs-4 fw-semibold mb-0 text-center">항목</h6></th>
                      <th><h6 class="fs-4 fw-semibold mb-0 text-center">금액(원)</h6></th>`;
            let tbody_str = `<tr>
                                <td class="fs-4 mb-0 text-center"><p>매출액</p></td>
                                <td class="fs-4 mb-0 text-end"><p>\${rst.pynmtotal.toLocaleString('ko-KR')} 원</p></td>
                             </tr>
                             <tr>
                                <td class="fs-4 mb-0 text-center"><p>로열티(매출액의 3%)</p></td>
                                <td class="fs-4 mb-0 text-end"><p>\${rst.royalty.toLocaleString('ko-KR')} 원</p></td>
                             </tr>`;
            let table_str = table_str_maker(th_str, tbody_str);
            detTbody.html(table_str);
        });
    });

    //상세내역 테이블 코드를 만드는 함수
    function table_str_maker(th_str, tbody_str) {
        return `
            <table class="table border text-nowrap customize-table mb-0 align-middle" id="item-det-table">
                <thead class="text-dark fs-4">
                <tr class="table-info">
                    \${th_str}
                </tr>
                </thead>
                <tbody id="det-tbody">
                    \${tbody_str}
                </tbody>
            </table>
        `;
    }
</script>
