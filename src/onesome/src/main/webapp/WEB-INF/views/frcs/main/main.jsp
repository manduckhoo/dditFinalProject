<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .card-header-content{
        font-size: 1.3rem
    }
    .frcs-welcom-area{
        margin-bottom: 30px;
    }
    .short-cut-card{
        height: 12.5rem;
    }
    .order-list-card{
        height: 50rem;
        margin-left: 20px;
        max-height: 50rem;
    }
    .middle-card{
        height: 36rem;
        max-height: 36rem;
    }
    .inv-table-header > th{
        padding-left: 0;
        padding-right: 0;
    }
    #inv-table-area{
        overflow-y: auto
    }
    #inv-table-area::-webkit-scrollbar{
        display: none;
    }
    #order-table-area{
        overflow-y: auto
    }
    #order-table-area::-webkit-scrollbar{
        display: none;
    }
    .order-detail-row {
        cursor: pointer;
    }
</style>
<div class="row frcs-welcom-area">
    <h2 class="fw-semibold">
        <span class="text-danger">
            <c:forEach var="franchise" items="${franchiseOwnerVO.franchiseVOList}">
                <c:if test="${sessionScope.crrFrcsNo == franchise.frcsNo}">
                    ${franchise.frcsNm}
                </c:if>
            </c:forEach>
        </span>
        <span>점주님 환영합니다.</span>
    </h2>
</div>
<div class="row">
    <div class="col-sm-8">
        <div class="row">
            <div class="col-sm-3">
                <div class="card bg-primary-subtle short-cut-card">
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-center">
                            <i class="ti ti-receipt-2 fs-9 text-black"></i>
                        </div>
                        <div class="d-flex justify-content-center mt-3">
                            <h3 class="mb-0 fw-semibold fs-10 text-info">${frcsMainHeader.paycnt}</h3>
                        </div>
                        <div class="d-flex justify-content-center mt-3">
                            <span class="mb-0 fw-semibold fs-4">금일 주문 건수</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3 short-cut-card">
                <div class="card bg-danger-subtle short-cut-card">
                    <div class="card-body">
                        <a href="/frcs/salespurchase/dayss">
                            <div class="d-flex align-items-center justify-content-center">
                                <i class="ti ti-currency-won fs-9 text-black"></i>
                            </div>
                            <div class="d-flex justify-content-center mt-3">
                                <h3 class="mb-0 fw-semibold fs-9 text-info mb-1">
                                    <fmt:formatNumber value="${frcsMainHeader.paytotalamt}" type="number" maxFractionDigits="3"/>
                                </h3>
                            </div>
                            <div class="d-flex justify-content-center mt-3">
                                <span class="mb-0 fw-semibold fs-4">금일 매출</span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card bg-success-subtle short-cut-card">
                    <div class="card-body">
                        <a href="/frcs/order/list">
                            <div class="d-flex align-items-center justify-content-center">
                                <i class="ti ti-truck-loading fs-9 text-black"></i>
                            </div>
                            <div class="d-flex justify-content-center mt-3">
                                <h3 class="mb-0 fw-semibold fs-10 text-info">${frcsMainHeader.ordercnt}</h3>
                            </div>
                            <div class="d-flex justify-content-center mt-3">
                                <span class="mb-0 fw-semibold fs-4">처리중인 발주건</span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card bg-warning-subtle short-cut-card">
                    <div class="card-body">
                        <a href="/frcs/offDoc/list">
                            <div class="d-flex align-items-center justify-content-center">
                                <i class="ti ti-mailbox fs-9 text-black"></i>
                            </div>
                            <div class="d-flex justify-content-center mt-3">
                                <h3 class="mb-0 fw-semibold fs-10 text-info">${frcsMainHeader.offdoccnt}</h3>
                            </div>
                            <div class="d-flex justify-content-center mt-3">
                                <span class="mb-0 fw-semibold fs-4">미확인 공문</span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="card middle-card">
                    <div class="card-header">
                        <span class="mb-0 mt-0 fw-semibold fs-4">적정재고 현황</span>
                    </div>
                    <div class="card-body p-0" id="inv-table-area">
                        <table class="table table-hover mb-0 align-middle">
                            <thead class="text-dark fs-3 table-info">
                                <tr class="inv-table-header">
                                    <th>
                                        <h6 class="fw-semibold mb-0 text-center">제품명</h6>
                                    </th>
                                    <th>
                                        <h6 class="fw-semibold mb-0 text-center">재고량</h6>
                                    </th>
                                    <th>
                                        <h6 class="fw-semibold mb-0 text-center">부족수량</h6>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${inventoryCntList}" var="product">
                                    <tr>
                                        <td class="mb-0 text-start">${product.prdct_nm}</td>
                                        <td class="mb-0 text-center">${product.frcs_inven_cnt}</td>
                                        <td class="mb-0 text-center" style="color:red;">${product.insufficientcnt}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="card middle-card">
                    <div class="card-header">
                        <span class="mb-0 mt-0 fw-semibold fs-4">우리매장 매출 추이</span>
                    </div>
                    <div class="card-body d-flex align-items-center">
                        <canvas id="salesTrend-canvas" height="470" width="620"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-4 row">
        <div class="card p-0 order-list-card">
            <div class="card-header text-bg-primary">
                <div class="d-flex align-items-center card-header-content">
                    <i class="ti ti-receipt-2 me-3 fs-8"></i>
                    <strong>주문확인</strong>
                </div>
            </div>
            <div class="card-body p-0" id="order-table-area"></div>
        </div>
    </div>
</div>

<%--주문 상세 모달--%>
<div id="order-det-modal-lg" class="modal fade" tabindex="-1"
     aria-labelledby="sanitation-det-modal-lg" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header d-flex align-items-center">
                <h4 class="modal-title" id="order-det-header">
                    주문상세
                </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <div class="row mb-3">
                        <div class="col-sm-2">
                            <h5 class="fw-semibold mb-0 text-end">주문일시 : </h5>
                        </div>
                        <div class="col-sm-4 p-0">
                            <h5 class="fw-semibold mb-0 text-start" id="md-orderDt"></h5>
                        </div>
                        <div class="col-sm-2">
                            <h5 class="fw-semibold mb-0 text-end">총 주문금액 : </h5>
                        </div>
                        <div class="col-sm-3">
                            <h5 class="fw-semibold mb-0 text-start" id="md-total"></h5>
                        </div>
                    </div>
                </div>
                <hr>
                <div>
                    <table class="table table-hover mb-0 align-middle">
                        <thead class="text-dark fs-4">
                        <tr>
                            <th>
                                <h5 class="fw-semibold mb-0 text-center">메뉴명</h5>
                            </th>
                            <th>
                                <h5 class="fw-semibold mb-0 text-center">Hot/Ice</h5>
                            </th>
                            <th>
                                <h5 class="fw-semibold mb-0 text-center">사이즈</h5>
                            </th>
                            <th>
                                <h5 class="fw-semibold mb-0 text-center">주문수량</h5>
                            </th>
                        </tr>
                        </thead>
                        <tbody id="order-det-tbody"></tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer" id="det-modal-footer">

            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>

<script>
    $(function () {
        const token = $("meta[name='_csrf']").attr("content");
        const header = $("meta[name='_csrf_header']").attr("content");

        //페이지 로딩시 주문정보 함수 호출
        getPendingOrder();

        //주문내용 클릭시 주문 상세 내용을 ajax로 조회
        $(document).on("click", ".order-detail-row", function () {
            let pynmNo = $(this).closest("tr").find(".order-btn").data("pynmNo");

            $.ajax({
                url: "/frcs/main/getOrderDetail",
                dataType: "json",
                type: "post",
                contentType: "application/json",
                data: JSON.stringify({"pynmNo": pynmNo}),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                }
            }).done(rst => {
                console.log(new Date(rst.pynmDt).toLocaleString());
                $("#order-det-header").html(`주문번호 : ` + rst.pynmNo);
                $("#md-orderDt").html(new Date(rst.pynmDt).toLocaleString());
                $("#md-total").html(rst.pynmTotalAmt.toLocaleString("KR-ko")+`원`);

                let str = "";
                $.each(rst.paymentDetailVOList, function (idx, data) {
                    str += `<tr><td class="mb-0 text-start">\${data.menuNm}</td>`;

                    if (data.menuIceYn !== null){
                        if (data.menuIceYn === 0){
                            str += `<td class="mb-0 text-center" style="color: red">HOT</td>`;
                        }else {
                            str += `<td class="mb-0 text-center" style="color: blue">ICE</td>`;
                        }
                    }else {
                        str += `<td class="mb-0 text-center">-</td>`;
                    }

                    if (data.menuSize !== null){
                        if (data.menuSize === 'S'){
                            str += `<td class="mb-0 text-center">Small</td>`;
                        }else {
                            str += `<td class="mb-0 text-center">Large</td>`;
                        }
                    }else {
                        str += `<td class="mb-0 text-center">-</td>`;
                    }

                    str += `<td class="mb-0 text-center">\${data.pynmCnt}</td></tr>`;
                });

                $("#order-det-tbody").html(str);
                $("#order-det-modal-lg").modal("show");
            })
        })

        //주문상태 버튼 클릭시 메뉴 준비 상태를 Y로 변경하는 ajax이벤트
        $(document).on("click", ".order-btn", function () {
            let pynmNo = $(this).data("pynmNo")

            Swal.fire({
                title: '주문상태변경',
                text: `주문번호 [\${pynmNo}]의 준비상태를 변경하시겠습니까?`,
                icon: 'question',

                showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
                confirmButtonColor: '#01c0c8', // confrim 버튼 색깔 지정
                cancelButtonColor: '#ff5757', // cancel 버튼 색깔 지정
                confirmButtonText: '확인', // confirm 버튼 텍스트 지정
                cancelButtonText: '취소', // cancel 버튼 텍스트 지정

            }).then(result => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: "/frcs/main/changeOrderStatus",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json",
                        data: JSON.stringify({"pynmNo": pynmNo}),
                        beforeSend: function (xhr) {
                            xhr.setRequestHeader(header, token);
                        }
                    }).done(rst => {
                        Swal.fire({
                            title: '변경완료',
                            text: `주문번호 [\${pynmNo}]의 준비상태를 변경하였습니다.`,
                            icon: 'success',

                            showCancelButton: false, // cancel버튼 보이기. 기본은 원래 없음
                            confirmButtonColor: '#01c0c8', // confrim 버튼 색깔 지정
                            confirmButtonText: '확인', // confirm 버튼 텍스트 지정
                        });
                        getPendingOrder();
                    }).fail(xhr => {
                        console.log(xhr)
                    })
                }
            });
        })

        //대기중인 주문정보를 ajax로 요청하고 주문확인 테이블을 만드는 함수
        function getPendingOrder() {
            $.ajax({
                url: "/frcs/main/getPendingOrder",
                dataType: "json"
            }).done(rst => {
                console.log(rst)
                let str = `<table class="table table-hover mb-0 align-middle">
                               <thead class="text-dark fs-3 table-info">
                               <tr>
                                   <th>
                                       <h6 class="fw-semibold mb-0 text-center">주문내용</h6>
                                   </th>
                                   <th>
                                       <h6 class="fw-semibold mb-0 text-center">주문금액</h6>
                                   </th>
                                   <th>
                                       <h6 class="fw-semibold mb-0 text-center">총 주문수량</h6>
                                   </th>
                                   <th>
                                       <h6 class="fw-semibold mb-0 text-center">주문상태</h6>
                                   </th>
                               </tr>
                               </thead>
                               <tbody id="order-tbody">`;

                $.each(rst, function (idx, order) {
                    let cnt = 0;
                    let menuNm = order.paymentDetailVOList[0].menuNm;

                    $.each(order.paymentDetailVOList, function (idx, data) {
                        cnt += data.pynmCnt;
                    })

                    if (menuNm.length > 9){
                        str += `<tr>
                                <td class="mb-0 text-start order-detail-row">\${menuNm.slice(0, 9) + '...'}`;
                    }else {
                        str += `<tr>
                                <td class="mb-0 text-start order-detail-row">\${menuNm}`
                    }

                    if (order.paymentDetailVOList.length > 1){
                        str += `  + \${order.paymentDetailVOList.length-1}`
                    }

                    str +=    `</td>
                                <td class="mb-0 text-end">\${order.pynmTotalAmt.toLocaleString("KR-ko")} 원</td>
                                <td class="mb-0 text-center">\${cnt}</td>
                                <td><button type="button" class="btn btn-danger order-btn" data-pynm-No="\${order.pynmNo}">대기</button></td>
                            </tr>`
                });

                str += `</tbody></table>`;

                $("#order-table-area").html(str);
            })
        }


        //가맹점 매출 추이를 ajax로 요청후 차트 생성
        $.ajax({
            url: "/frcs/main/getWeeklySalesTrend",
            dataType: "json"
        }).done(rst => {

            let days = [];
            let amts = [];

            $.each(rst, function (idx, data) {
                days.unshift(data.pynm_dt);
                amts.unshift(data.pynm_total_amt);
            });

            let salesTrendCanvas = $("#salesTrend-canvas");

            new Chart(salesTrendCanvas, {
                data: {
                    labels: days,
                    datasets: [
                        {
                            label: ["매출액"],
                            data: amts,
                            type: "line",
                        },
                        {
                            label: ["매출액"],
                            data: amts,
                            type: "bar",
                        }
                    ]
                },
                options: {
                    responsive: false,
                    plugins: {
                        legend: {
                            display: false
                        },
                        title: {
                            display: true,
                            text: '최근 7일간 매출액',
                            font: {
                                size: 16,
                                weight: 'bold',
                                lineHeight: 1.2,
                                family: 'MS Sans Serif'
                            }
                        }
                    },
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: '날짜',
                                font: {
                                    size: 15,
                                    weight: 'bold',
                                    lineHeight: 1.2,
                                    family: 'MS Sans Serif'
                                }
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: '금액',
                                font: {
                                    size: 15,
                                    weight: 'bold',
                                    lineHeight: 1.2,
                                    family: 'MS Sans Serif'
                                }
                            }
                        }
                    }
                }
            })
        });

    })
</script>