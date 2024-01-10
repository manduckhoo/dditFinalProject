<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
    th, td {
        text-align: center;
    }

    .acntName {
        text-align: left !important;
        background-color: #eaeff4 !important;
        /*font-weight: bold;*/
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }

    input[type=number] {
        -moz-appearance: textfield;
    }

</style>

<%-- 배너 사진 --%>
<div class="card bg-success-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">주문 선택</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/main">Main</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/product/product">제품 관리</a>
                        </li>
                        <li class="breadcrumb-item text-muted" aria-current="page">주문 선택</li>
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

<div class="product-list">
    <div class="card">
        <div class="card-body p-3">
            <form id="submitForm">
                <div class="table-responsive border rounded">
                    <input type="hidden" id="hqOrderNoMain" value="${hqOrderVO.hqDetailOrderVOList[0].hqOrderNo}"
                           name="hqOrderNo">
                    <table class="table align-middle text-nowrap mb-0">
                        <c:forEach var="cntAcntInfo" items="${hqOrderAcntInfo.acntVO}" varStatus="stat">
                            <c:set var="acntNumber" value="${cntAcntInfo.acntNo}"/>
                            <thead>
                            <tr>
                                <td colspan="7" class=" acntName">
                                    <h4 class="mb-0">${cntAcntInfo.acntNm}</h4>

                                </td>
                            </tr>
                            <tr>
                                <th scope="col" style="width: 50px;">#</th>
                                <th scope="col">제품명</th>
                                <th scope="col">카테고리</th>
                                <th scope="col">보유수량<small class="text-muted fs-2 ms-1">(권장수량)</small></th>
                                <th scope="col">주문수량</th>
                                <th scope="col">주문금액<small class="text-muted">(원)</small></th>
                                <th style="width: 80px;"></th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:set var="hqOrderDetailFor" value="${fn:length(hqOrderVO.hqDetailOrderVOList)}"/>

                            <c:forEach var="hqDetailOrderVO" items="${hqOrderVO.hqDetailOrderVOList}" varStatus="stat">
                                <c:if test="${acntNumber eq hqDetailOrderVO.acntVO[0].acntNo}">
                                    <tr>
                                        <td>
                                            <p class="mb-0">${stat.count}</p>
                                        </td>
                                        <td>
                                            <input type="hidden" name="hqDetailOrderVOList[${stat.index}].hqOrderNo" value="${hqDetailOrderVO.hqOrderNo}">
                                            <input type="hidden" name="hqDetailOrderVOList[${stat.index}].prdctNo" value="${hqDetailOrderVO.productVO.prdctNo}">
                                            <input type="hidden" name="hqDetailOrderVOList[${stat.index}].prdctNm" value="${hqDetailOrderVO.productVO.prdctNm}">
                                            <h6 class="mb-0 fs-4" style="text-align: start;">${hqDetailOrderVO.productVO.prdctNm}</h6>
                                        </td>
                                        <td>
<%--                                        <input type="hidden" class="hqOrderComDetCode" value="${hqDetailOrderVO.productVO.comDetCodeInfoVO.comDetCode}">--%>
                                            <span class="comCodeBadgeHqOrderDetail">${hqDetailOrderVO.productVO.comDetCodeInfoVO.comDetCodeNm}</span>
                                        </td>
                                        <td>
                                            <h6 class="mb-0 fs-4 hqInventCount">
                                                <fmt:formatNumber value="${hqDetailOrderVO.productVO.hqInvenCnt}"
                                                                  pattern="#,###"/>
                                            </h6>
                                            <p class="hqInvenProperCnt mb-0 text-muted fs-2 mt-1">(<fmt:formatNumber
                                                    value="${hqDetailOrderVO.productVO.hqInvenProperCnt}"
                                                    pattern="#,###"/>)</p>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center"
                                                 style="text-align: center; justify-content: center;">
                                                <div class="btn-group mb-2" role="group" aria-label="Basic example">
                                                    <button type="button" class="btn bg-info-subtle text-info mb-2"
                                                            data-more="#sh" aria-pressed="false"
                                                            onclick="modifyHqOrderCnt(1, ${stat.count}, '${hqDetailOrderVO.productVO.comDetCodeInfoVO.comDetCode}', ${hqDetailOrderVO.productVO.prdctRcvnAmt})">
                                                        <i class="ti ti-minus fs-7 text"></i>
                                                    </button>
                                                    <button class="mb-2" style="background-color: #ebf3fe; border: none"
                                                            disabled>
                                                        <input type="hidden" class="mb-0 form-control prod-qty"
                                                               id="hqOrderCnt${stat.count}"
                                                               value="0"
                                                               name="hqDetailOrderVOList[${stat.index}].hqOrderCnt"
                                                               style="color:black; background-color: #ebf3fe; width: 100px; text-align: center;">
<%--                                                    <input type="number" value="1" class="form-control mb-0" id="displayHqOrderCnt${stat.count}" style="text-align: center; width: 60px;" readonly>--%>
                                                        <div class="form-control mb-0"
                                                             id="displayHqOrderCnt${stat.count}">0
                                                        </div>
                                                    </button>
                                                    <button type="button" class="btn bg-info-subtle text-info mb-2"
                                                            data-more="#sh" aria-pressed="false"
                                                            onclick="modifyHqOrderCnt(0, ${stat.count}, '${hqDetailOrderVO.productVO.comDetCodeInfoVO.comDetCode}', ${hqDetailOrderVO.productVO.prdctRcvnAmt}, this)">
                                                        <i class="ti ti-plus fs-7 text-active"></i>
                                                    </button>
                                                </div>

                                            </div>
                                        </td>
                                        <td>
<%--                                        <h6 class="mb-0 fs-4">--%>
<%--                                            <fmt:formatNumber value="${hqDetailOrderVO.hqOrderCostAmt}" pattern="#,###"/>--%>
<%--                                        </h6>--%>
                                            <input type="hidden" class="mb-0 form-control amt"
                                                   id="hqOrderCostAmt${stat.count}"
                                                   name="hqDetailOrderVOList[${stat.index}].hqOrderCostAmt"
                                                   value="${hqDetailOrderVO.hqOrderCostAmt}" readonly>
                                            <h6 class="fs-4 displayAmt" id="displayHqOrderCostAmt${stat.count}">0</h6>
                                            <%--<h6 class="fs-4" id="displayHqOrderCostAmt${stat.count}"><fmt:formatNumber
                                                    value="${hqDetailOrderVO.hqOrderCostAmt}" pattern="#,###"/></h6>--%>
<%--                                        <input type="number" value="10000" class="fs-4 form-control mb-0" id="displayHqOrderCostAmt2${stat.count}" style="text-align: center; border: none;" />--%>
<%--                                        <input type="number" value="${hqDetailOrderVO.hqOrderCostAmt}" oninput="this.value = this.value.replace(/\d(?=(?:\d{3})+$)/g, '$&,')">--%>
<%--                                        <fmt:formatNumber value="${hqDetailOrderVO.hqOrderCostAmt}" pattern="#,###"/>--%>
                                        </td>
                                        <td>
                                            <button class="btn fs-6 deleteHqOrderDetail"
                                                    value="${hqDetailOrderVO.productVO.prdctNo}"
                                                    data-bs-toggle="tooltip" data-bs-placement="top"
                                                    data-bs-title="Delete">
                                                <i class="ti ti-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>

                            </tbody>
                        </c:forEach>
                    </table>
                </div>
                <input type="hidden" value="" name="hqOrderTotalAmt" id="hqOrderTotalAmt">
                <sec:csrfInput/>
            </form>
            <div class="d-flex flex-row-reverse">
                <p class="fs-6 m-3">총 주문 금액 : <strong id="displayTotalPrice" class="fs-6 m-3">-</strong> 원</p>
            </div>
            <div class="d-flex flex-row-reverse">
                <button type="button" class="btn waves-effect waves-light btn-info m-3 fs-4" style="width: 100px" id="updateHqDetailOrderBtn" disabled>다음<i
                        class="ti ti-chevrons-right ms-2 fs-4"></i></button>
                <button type="button" id="deleteHqOrderBtn"
                        class="btn waves-effect waves-light bg-warning-subtle text-warning m-3 fs-4"
                        style="width: 100px">취소<i class="ti ti-xbox-x ms-2 fs-4"></i></button>
            </div>
        </div>
    </div>
</div>


<script>

    id = "hqOrderCnt${stat.count}"
    cnt = document.getElementById("hqOrderCnt1").value;
    console.log("cnt = ", cnt)

    let totalPrice = 0;
    <%--let sizeVO = ${hqDetailOrderVO}.length;--%>
    console.log("토탈값이다 이말이여! ");

    //발주 목록 중 상품 삭제
    $(document).on("click", ".deleteHqOrderDetail", function () {
        let data = {
            "prdctNo": $(this).val()
            , "hqOrderNo": $("#hqOrderNoMain").val()
        }
        console.log(data)

        $.ajax({
            url: "/admin/deleteHqOrderDetail",
            type: "post",
            dataType: "json",
            data: JSON.stringify(data),
            contentType: "application/json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (result) {
                console.log(result)

                if (result.result === "okay") {
                    // $(".cartDelete").remove();
                    var Toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false, //true면 ok버튼이 뜸
                        timer: 1000, //1초 동안 표시됨
                        timerProgressBar: true
                        // true하면 타임게이지 나옴
                    });
                    Toast.fire({
                        icon: 'success', //출력할 아이콘 종류(success, warning, error, info, quesition)
                        title: '선택된 항목을 삭제합니다.' //출력할 메세지 내용
                    });
                    setTimeout(function () {
                        location.href = "/admin/hqOrderDetail?hqOrderNo=" + $("#hqOrderNoMain").val();
                    }, 1000); //1초 이후 자동 새로고침

                } else if (result.result === "otherPage") {
                    var Toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false, //true면 ok버튼이 뜸
                        timer: 1000, //1초 동안 표시됨
                        timerProgressBar: true
                        // true하면 타임게이지 나옴
                    });
                    Toast.fire({
                        icon: 'success', //출력할 아이콘 종류(success, warning, error, info, quesition)
                        title: '발주 신청을 취소합니다.' //출력할 메세지 내용
                    });
                    setTimeout(function () {
                        location.href = "/admin/hqOrderDetail?hqOrderNo=" + $("#hqOrderNoMain").val();
                    }, 1000); //1초 이후 자동 새로고침

                    location.href = "/admin/product/product";
                }
            },
            error: function (err) {
                var Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false, //true면 ok버튼이 뜸
                    timer: 1000, //1.5초 떠있다는것 같음
                    timerProgressBar: true
                    // true하면 타임게이지 나옴
                });
                Toast.fire({
                    icon: 'error', //출력할 아이콘 종류(success, warning, error, info, quesition)
                    title: '에러가 발생하였습니다 .' //출력할 메세지 내용
                });
            }
        })

    });

    //보유한 재고량이 권장 보유량보다 적으면 빨간 글씨로 알림
    console.log(${hqOrderDetailFor});
    const hqOrderDetailFor = ${hqOrderDetailFor};

    for (let i = 0; i < hqOrderDetailFor; i++) {
        let hqInventCount = document.getElementsByClassName("hqInventCount")[i].innerText;
        let hqWishInventCount = document.getElementsByClassName("hqInvenProperCnt")[i].innerText;

//innerText로 가져온 문자열에서 ',' 빼고(replace) 숫자형으로 변환
        let numericHqInventCount = parseInt(hqInventCount.replace(/[^\d]/g, ''));
        let numericHqWishInventCount = parseInt(hqWishInventCount.replace(/[^\d]/g, ''));

        console.log(hqInventCount);
        console.log(hqWishInventCount);
//아래는 숫자형
        console.log(numericHqInventCount);
        console.log(numericHqWishInventCount);

        if (numericHqInventCount < numericHqWishInventCount) {
            document.getElementsByClassName("hqInventCount")[i].style.color = "red";
        }
    }

    //수량 변경
    function modifyHqOrderCnt(i, stat, comDetCode, prdctRcvnAmt, crrThis) {

        let qtyArr = $(".prod-qty");

        let inputHqOrderCnt = document.getElementById("hqOrderCnt" + stat);
        let firstCnt = parseInt(inputHqOrderCnt.value);

        let inputHqOrderPrice = document.getElementById("hqOrderCostAmt" + stat);
        let firstPrice = parseInt(inputHqOrderPrice.value);
        // let showPrice = parseInt(inputHqOrderPrice.value);

        console.log("플마? ", i);
        console.log("순번 ; ", stat);
        console.log("카테고리 ; ", comDetCode);
        console.log("개당 가격 ; ", prdctRcvnAmt);

        if (i == 0) { //더하기
            // firstCnt = firstCnt + 1;
            // firstPrice = firstCnt * prdctRcvnAmt;
            // updateInputValue()

            switch (comDetCode) {
                case 'PRCT01':  //원두류
                    firstCnt = firstCnt + 300;
                    firstPrice = firstCnt * prdctRcvnAmt;
                    updateInputValue()
                    break;
                case 'PRCT02':  //제과류
                    firstCnt = firstCnt + 6;
                    firstPrice = firstCnt * prdctRcvnAmt;
                    updateInputValue()
                    break;
                case 'PRCT03':  //식기류
                    firstCnt = firstCnt + 3;
                    firstPrice = firstCnt * prdctRcvnAmt;
                    updateInputValue()
                    break;
                case 'PRCT04':  //시럽
                    firstCnt = firstCnt + 200;
                    firstPrice = firstCnt * prdctRcvnAmt;
                    updateInputValue()
                    break;
                case 'PRCT05':  //소모품
                    firstCnt = firstCnt + 120;
                    firstPrice = firstCnt * prdctRcvnAmt;
                    updateInputValue()
                    break;
                case 'PRCT06':  //상품(MD)
                    firstCnt = firstCnt + 5;
                    firstPrice = firstCnt * prdctRcvnAmt;
                    updateInputValue()
                    break;
                case 'PRCT07':  //유제품
                    firstCnt = firstCnt + 7;
                    firstPrice = firstCnt * prdctRcvnAmt;
                    updateInputValue()
                    break;
                case 'PRCT08':  //음료류
                    firstCnt = firstCnt + 6;
                    firstPrice = firstCnt * prdctRcvnAmt;
                    updateInputValue()
                    break;
                case 'PRCT09':  //청과류
                    firstCnt = firstCnt + 20;
                    firstPrice = firstCnt * prdctRcvnAmt;
                    updateInputValue()
                    break;
                default :
                    firstCnt = firstCnt + 1;
                    firstPrice = firstCnt * prdctRcvnAmt;
                    updateInputValue()

            }

        } else {  //빼기
            if (firstCnt > 1) {

                switch (comDetCode) {
                    case 'PRCT01':  //원두류
                        firstCnt = firstCnt - 300;
                        firstPrice = firstPrice - prdctRcvnAmt * 300;
                        updateInputValue()
                        break;
                    case 'PRCT02':  //제과류
                        firstCnt = firstCnt - 6;
                        firstPrice = firstPrice - prdctRcvnAmt * 6;
                        updateInputValue()
                        break;
                    case 'PRCT03':  //식기류
                        firstCnt = firstCnt - 3;
                        firstPrice = firstPrice - prdctRcvnAmt * 3;
                        updateInputValue()
                        break;
                    case 'PRCT04':  //시럽
                        firstCnt = firstCnt - 200;
                        firstPrice = firstPrice - prdctRcvnAmt * 200;
                        updateInputValue()
                        break;
                    case 'PRCT05':  //소모품
                        firstCnt = firstCnt - 120;
                        firstPrice = firstPrice - prdctRcvnAmt * 120;
                        updateInputValue()
                        break;
                    case 'PRCT06':  //상품(MD)
                        firstCnt = firstCnt - 5;
                        firstPrice = firstPrice - prdctRcvnAmt * 5;
                        updateInputValue()
                        break;
                    case 'PRCT07':  //유제품
                        firstCnt = firstCnt - 7;
                        firstPrice = firstPrice - prdctRcvnAmt * 7;
                        updateInputValue()
                        break;
                    case 'PRCT08':  //음료류
                        firstCnt = firstCnt - 6;
                        firstPrice = firstPrice - prdctRcvnAmt * 6;
                        updateInputValue()
                        break;
                    case 'PRCT09':  //청과류
                        firstCnt = firstCnt - 20;
                        firstPrice = firstPrice - prdctRcvnAmt * 20;
                        updateInputValue()
                        break;
                    default :
                        firstCnt = firstCnt - 1;
                        firstPrice = firstPrice - prdctRcvnAmt;
                        updateInputValue()
                }

            }
        }

        console.log("갯수 : ", firstCnt);
        console.log("주문 가격 : ", firstPrice);

        function updateInputValue() {
            inputHqOrderCnt.value = firstCnt;
            inputHqOrderPrice.value = firstPrice;
            // document.getElementById("displayHqOrderCnt"+stat).value = firstCnt;
            document.getElementById("displayHqOrderCnt" + stat).innerText = firstCnt;
            document.getElementById("displayHqOrderCostAmt" + stat).innerText = firstPrice.toLocaleString('ko-KR');
        }

        console.log("========================")
        console.log("cnt = ", cnt)

        //총 주문 금액 계산하고 노출
        let amts = $(".amt");
        let ttalAmt = 0;
        console.log("qtyArr = ", qtyArr)
        $.each(qtyArr, function (idx, qty) {
            if ($(qty).val() !== "0") {
                console.log("amt.val = " + parseInt($(amts[idx]).val()))
                ttalAmt += parseInt($(amts[idx]).val());
            }
        })
        console.log("ttalAmt : " + ttalAmt)
        document.getElementById("displayTotalPrice").innerText = ttalAmt.toLocaleString('ko-KR');
        document.getElementById("hqOrderTotalAmt").value = parseInt(ttalAmt);


        //발주하는 품목의 수량이 0인게 하나라도 있으면 다음 버튼이 활성화되지 않음
        let hqInventCount = document.getElementsByClassName("displayAmt");
        console.log("현재 몇개?", hqInventCount);
        var notZero = Array.from(hqInventCount).every(function (input){
            return parseInt(input.innerText) > 0;
        });
        if (notZero) {
            console.log("Success");

            document.getElementById("updateHqDetailOrderBtn").removeAttribute("disabled");
        }

    }


    //발주 취소 버튼
    const cancelBtn = document.getElementById("deleteHqOrderBtn");
    cancelBtn.addEventListener('click', function () {
        if (confirm("발주 신청을 취소하시겠습니까?")) {
            //확인 버튼 눌렀을 때
            const form = document.getElementById("submitForm");
            // form.action = "/admin/cancelHqOrder";
            form.setAttribute('action', "/admin/cancelHqOrder");
            form.setAttribute('method', "post");
            form.submit();

            alert("발주 신청을 취소합니다.")
        }
    })

    //TODO 발주 신청 누를 때, 발주 수량이 0이면 submit 불가능하게 검증과정 추가하기
    //발주 신청 버튼
    const updateBtn = document.getElementById("updateHqDetailOrderBtn");
    updateBtn.addEventListener('click', function () {
        if (confirm("발주 신청을 계속 진행하시겠습니까?")) {
            //확인 버튼 눌렀을 때
            const form = document.getElementById("submitForm");
            form.setAttribute('action', "/admin/updateHqDetailOrder");
            form.setAttribute('method', "post");
            form.submit();
        }
    })


</script>

