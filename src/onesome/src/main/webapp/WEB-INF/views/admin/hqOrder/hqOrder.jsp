<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<%-- 배너 사진 --%>
<div class="card bg-success-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">발주 내역</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/main">Main</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/product/product">제품 관리</a>
                        </li>
                        <li class="breadcrumb-item text-muted" aria-current="page">발주 내역</li>
                    </ol>
                </nav>
            </div>
            <div class="col-3">
                <div class="text-center mb-n5">
                    <img src="/resources/bootstrap/src/assets/images/breadcrumb/skullCoffee.png" alt=""
                         class="img-fluid mb-n4" style="width: 70%;">
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card overflow-hidden invoice-application">
    <div class="d-flex">
        <div class="w-25 d-none d-lg-block border-end user-chat-box">
            <div class="p-3 border-bottom fs-6" style="text-align: center; font-weight: bolder;">
                발주 신청서 목록
            </div>
            <div class="app-invoice">
                <ul class="overflow-auto invoice-users simplebar-scrollable-y" style="height: /*calc(100vh - 400px)*/ 100vh;" data-simplebar="init">
                    <div class="simplebar-wrapper" style="margin: 0px;">
                        <div class="simplebar-height-auto-observer-wrapper">
                            <div class="simplebar-height-auto-observer"></div>
                        </div>
                        <div class="simplebar-mask">
                            <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                                <div class="simplebar-content-wrapper" tabindex="0" role="region"
                                     aria-label="scrollable content" style="height: 100%; overflow: hidden scroll;">
                                    <%-- 발주 신청서 목록 시작 --%>
                                    <div class="simplebar-content" style="padding: 0px;">
                                        <c:forEach var="hqOrderVO" items="${hqOrderInvoiceList}" varStatus="stat">
                                            <li>
                                                <a href="javascript:displayHqDetailOrderInvoice(${hqOrderVO.hqOrderNo})"
                                                   class="p-3 bg-hover-light-black border-bottom d-flex align-items-start invoice-user listing-user>"
                                                   id="${hqOrderVO.hqOrderNo}" data-invoice-id="${hqOrderVO.hqOrderNo}">
                                                    <div class="btn round rounded-circle d-flex align-items-center justify-content-center mx-3"
                                                         style="z-index: 99">
                                                        <c:choose>
                                                        <c:when test="${hqOrderVO.hqOrderStsCd eq 'HODST01'}">
                                                            <span class="mb-1 badge rounded-pill font-medium bg-warning-subtle text-secondary"
                                                                  style="z-index: 1;">발주 대기</span>
                                                        </c:when>
                                                        <c:when test="${hqOrderVO.hqOrderStsCd eq 'HODST02'}">
                                                            <span class="mb-1 badge rounded-pill text-bg-primary"
                                                                  style="z-index: 1;">승인</span>
                                                        </c:when>
                                                        <c:when test="${hqOrderVO.hqOrderStsCd eq 'HODST03'}">
                                                        <span class="mb-1 badge rounded-pill text-bg-secondary"
                                                              style="z-index: 1;">반려</span>
                                                        </c:when>
                                                        </c:choose>
                                                    </div>
                                                    <div class="ms-3 d-inline-block w-75">
                                                        <h5 class="my-1 invoice-customer">
                                                            No. ${hqOrderVO.hqOrderNo}</h5>
                                                            <%--<span class="fs-3 invoice-id text-truncate text-body-color d-block w-85">${hqOrderVO.hqOrderDt}</span>--%>
                                                        <p class="mb-0 fs-3 text-muted"><fmt:formatDate
                                                                value="${hqOrderVO.hqOrderDt}" dateStyle="medium"/></p>
                                                    </div>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </div>
                                    <%-- 발주 신청서 목록 끝 --%>
                                </div>
                            </div>
                        </div>
                        <div class="simplebar-placeholder" style="width: 278px; height: 459px;"></div>
                    </div>
                    <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
                        <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
                    </div>
                    <div class="simplebar-track simplebar-vertical" style="visibility: hidden;">
                        <div class="simplebar-scrollbar" style="height: 300px; display: none;"></div>
                    </div>
                </ul>
            </div>
        </div>
        <div class="w-75 w-xs-100 chat-container">
            <div class="invoice-inner-part h-100">
                <div class="invoiceing-box">
                    <div class="invoice-header d-flex align-items-center border-bottom p-3">
                        <div class="fs-6 text-uppercase">거래처 발주 신청서</div>
                    </div>

                    <%--상세 화면 보여줄 곳--%>
                    <div id="insertDisplayHqDetailOrder"></div>
                    <%--상세 화면 보여줄 곳--%>

                </div>
            </div>
        </div>
    </div>
</div>

<%--발주 반려 버튼 클릭 후 나타나는 모달--%>
<div class="modal fade" id="hqOrderFailModal" tabindex="-1" aria-labelledby="vertical-center-modal" style="display: none;" aria-modal="true" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content modal-filled bg-light-warning" style="width: 150%;">
            <div class="modal-body p-4">
                <div class="text-center text-warning "> <%--text-success--%>
                    <i class="ti ti-alert-octagon fs-7 mb-2"></i>
                    <h4 class="my-4">발주 신청을 <strong>'반려'</strong>하시겠습니까?</h4>
                    <button type="button" class="btn bg-secondary-subtle text-secondary my-2 mx-1" data-bs-dismiss="modal">
                        취소
                    </button>
                    <button type="button" class="btn bg-primary-subtle text-primary my-2 mx-1" id="hqOrderFail">
                        확인
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<%--발주 승인 버튼 클릭 후 나타나는 모달--%>
<div class="modal fade" id="hqOrderCompleteModal" tabindex="-1" aria-labelledby="vertical-center-modal" style="display: none;" aria-modal="true" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content modal-filled bg-light-success text-success" style="width: 150%;">
            <div class="modal-body p-4">
                <div class="text-center text-primary">
                    <i class="ti ti-circle-check fs-7 mb-2"></i>
                    <h4 class="my-4">발주 신청을 <strong>'승인'</strong>하시겠습니까?</h4>
                    <button type="button" class="btn bg-secondary-subtle text-secondary my-2 mx-1" data-bs-dismiss="modal">
                        취소
                    </button>
                    <button type="button" class="btn bg-primary-subtle text-primary my-2 mx-1" id="hqOrderComplete">
                        확인
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="/resources/js/hqOrderInvoice.js"></script>

<script>
    function displayHqDetailOrderInvoice(hqOrderNo) {
        console.log("hqOrderNo : ", hqOrderNo);

        let data = {"hqOrderNo": parseInt(hqOrderNo)}
        console.log(data)

        $.ajax({
            url: "/admin/displayHqOrderInvoice",
            type: "post",
            dataType: "json",
            data: JSON.stringify(data),
            contentType: "application/json;charset=utf-8",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (result) {
                console.log("완료??")
                console.log("result : " + result.hqOrderAcntInfo.acntVO)

                $("#insertDisplayHqDetailOrder *").remove();

                const token = $("meta[name='_csrf']").attr("content");

                let str = `<div>
                           <form id="submitForm">
                                <input type="hidden" name="hqOrderNo" value="\${result.hqOrderVO.hqOrderNo}">
                                <input type="hidden" name="_csrf" value="\${token}">
                            </form>`;

                let hqOrderTotalAmt = result.hqOrderAcntInfo.hqOrderTotalAmt;
                // hqOrderTotalAmt = hqOrderTotalAmt.toLocaleString()
                // console.log("hqOrderTotalAmt : ", hqOrderTotalAmt)

                let hqOrderDt = new Date(result.hqOrderAcntInfo.hqOrderDt);
                const year = hqOrderDt.toLocaleDateString('en-US', {
                    year: 'numeric',
                });
                const month = hqOrderDt.toLocaleDateString('en-US', {
                    month: '2-digit',
                });
                const day = hqOrderDt.toLocaleDateString('en-US', {
                    day: '2-digit',
                });

                hqOrderDt = `\${year}. \${month}. \${day}`;

                console.log(hqOrderDt)

                result.hqOrderAcntInfo.acntVO.forEach(function (acntVO) {
                    let hqOrderAmt = 0;
                    str += `<div class="p-4" id="custom-invoice">
                                <div class="invoice-123 printableArea" style="display: block;">
                                    <div class="row pt-3">
                                        <div class="col-md-12">
                                            <div class="">
                                            <address>
                                                <h6>&nbsp;From,</h6>
                                                <h6 class="fw-bold">ONESOMEPLACE</h6>
                                                <p class="ms-1">종찬오빠 집 주소
                                                    <br>아는 사람 계실까요?
                                                    <br>우편번호도 필요해여 - 00000
                                                </p>
                                            </address>
                                            </div>
                                            <div class="text-end">
                                            <address>
                                                <h6>To,</h6>
                                                <h6 class="fw-bold invoice-customer">
                                                    \${acntVO.acntNm}
                                                </h6>
                                                <p class="ms-4">
                                                    \${acntVO.acntAddr}, <br>\${acntVO.acntDtlAddr},&nbsp;\${acntVO.acntZip}
                                                </p>
                                                <p class="ms-4">
                                                    \${acntVO.acntMngrPstn},&nbsp;\${acntVO.acntMngrNm} <br>\${acntVO.acntTel}
                                                </p>
                                                <p class="mt-4 mb-1">
                                                    <span>발주 날짜 :</span>
                                                    <i class="ti ti-calendar"></i>
                                                    \${hqOrderDt}
                                                    </p>
                                            </address>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="table-responsive mt-5" style="clear: both">
                                            <table class="table table-hover">
                                                <thead>
                                                    <!-- start row -->
                                                    <tr>
                                                        <th class="text-center">#</th>
                                                        <th class="text-center">제품명</th>
                                                        <th class="text-center">카테고리</th>
                                                        <th class="text-center">주문 수량</th>
                                                        <th class="text-center">개당 가격</th>
                                                        <th class="text-center">주문 가격</th>
                                                    </tr>
                                                    <!-- end row -->
                                                </thead>
                                                <tbody>`;

                    result.hqOrderVO.hqDetailOrderVOList.forEach(function (hqDetailOrderVO, index) {
                        if (hqDetailOrderVO.acntVO[0].acntNo === acntVO.acntNo) {
                            str += `<!-- start row -->
                                                    <tr>
                                                         <td class="text-center">\${index+1}</td>
                                                        <td class="text-center">\${hqDetailOrderVO.prdctNm}</td>
                                                        <td class="text-center">\${hqDetailOrderVO.productVO.comDetCodeInfoVO.comDetCodeNm}</td>
                                                        <td class="text-end">\${hqDetailOrderVO.hqOrderCnt}</td>
                                                        <td class="text-end replaceComma">\${hqDetailOrderVO.productVO.prdctRcvnAmt}</td>
                                                        <td class="text-end replaceComma">\${hqDetailOrderVO.hqOrderCostAmt}</td>
                                                     </tr>
                                                    <!-- end row -->`;
                            hqOrderAmt += hqDetailOrderVO.hqOrderCostAmt;
                        }
                    });
                    console.log("소계로 쓸 수 있을까? ", hqOrderAmt)
                    str += `</tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="pull-right mt-1 text-end">
                                            <p class="fs-4 hqOrderAmt">소계 : <span class="replaceComma">\${hqOrderAmt}</span> </p>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="text-end">
                                            <button class="btn mb-1 waves-effect waves-light btn-light print-page" type="button">
                                                <span><i class="ti ti-printer fs-5 me-1"></i>
                                                    PDF 출력</span>
                                            </button>
                                        </div>
                                        <hr class="my-3 fw-bolder ">
                                    </div>
                    </div></div></div>`;
                });
                str += `<div class="col-md-12 p-4">
                                        <div class="pull-right mt-4 text-end">
                                            <hr>
                                            <h3><b>Total :</b> <span class="replaceComma">\${hqOrderTotalAmt}</span></h3>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr>

                                        <div class="text-end">
                                            <button class="btn my-2 mx-1 waves-effect waves-light btn-light print-all-page" type="button">
                                                <span><i class="ti ti-printer fs-5 me-1"></i>
                                                    PDF 전체 출력</span>
                                            </button>
                                        </div>`
                                if(result.hqOrderAcntInfo.hqOrderStsCd === 'HODST01'){
                                    str+=`<div class="text-end mt-2">
                                            <button class="btn btn-secondary mx-1" type="submit" data-bs-toggle="modal" data-bs-target="#hqOrderFailModal">
                                                <span><i class="ti ti-circle-x fs-5 me-1"></i>
                                                    반려</span>
                                            </button>
                                            <button class="btn btn-primary btn-default mx-1" type="button" data-bs-toggle="modal" data-bs-target="#hqOrderCompleteModal">
                                                <span><i class="ti ti-circle-check fs-5 me-1" ></i>
                                                    승인</span>
                                            </button>
                                        </div>
                                    </div> </div>`;
                                }


                $('#insertDisplayHqDetailOrder').html(str);

                const cnt = document.querySelectorAll(".replaceComma").length;
                console.log("cnt===", cnt)

                for (let i=0; i<cnt; i++){
                    let nonComma = document.querySelectorAll(".replaceComma").item(i).innerText;
                    console.log("nonComma======= : ", nonComma);
                    let comma = nonComma.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
                    console.log("comma========", comma)

                    document.querySelectorAll(".replaceComma").item(i).innerText = comma;

                }


            }
        });

    }

    //발주 반려 버튼
    const hqOrderFailBtn = document.getElementById("hqOrderFail");
    hqOrderFailBtn.addEventListener('click', function () {
            //버튼 눌렀을 때
            // const form = document.getElementById("submitForm");
            // form.setAttribute('action', "/admin/updateHqDetailOrder");
            // form.setAttribute('method', "post");
            // form.submit();
        console.log("눌렀다!!!!")

        const form = document.getElementById("submitForm");
        // console.log("form",form);
        form.setAttribute('action', "/admin/hqOrderFail");
        form.setAttribute('method', "post");
        form.submit();
    })

    //발주 승인 버튼
    const hqOrderCompleteBtn = document.getElementById("hqOrderComplete");
    hqOrderCompleteBtn.addEventListener('click', function () {
        //버튼 눌렀을 때
        // const form = document.getElementById("submitForm");
        // form.setAttribute('action', "/admin/updateHqDetailOrder");
        // form.setAttribute('method', "post");
        // form.submit();
        console.log("눌렀다!!!!")

        const form = document.getElementById("submitForm");
        // console.log("form",form);
        form.setAttribute('action', "/admin/hqOrderComplete");
        form.setAttribute('method', "post");
        form.submit();
    })
</script>