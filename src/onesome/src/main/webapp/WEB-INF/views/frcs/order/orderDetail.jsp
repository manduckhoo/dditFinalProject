<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
    th{
        text-align: center;
    }
</style>

<%-- 배너 사진 --%>
<div class="card bg-primary-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">발주 수량 선택</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/frcs/main">Main</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="#">재고 관리</a>
                        </li>
                        <li class="breadcrumb-item text-muted" aria-current="page">발주 수량 선택</li>
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
                <div class="table-responsive border rounded mx-auto" style="width: 95%">
                    <input type="hidden" id="frcsOrderNoMain"
                           value="${frcsOrderVO.frcsOrderDetailVOList[0].frcsOrderNo}"
                           name="frcsOrderNo">
                    <table class="table align-middle text-nowrap mb-0" >

                        <c:set var="frcsOrderDetailFor" value="${fn:length(frcsOrderVO.frcsOrderDetailVOList)}"/>
                        <thead>
                        <tr>
                            <th scope="col" style="width: 100px; line-height: 35px;">#</th>
                            <th scope="col" style="line-height: 35px;">제품명</th>
                            <th scope="col" style="line-height: 35px;">카테고리</th>
                            <th scope="col">보유수량<br><small class="text-muted fs-2 ms-1">(권장수량)</small></th>
                            <th scope="col" style="line-height: 35px;">주문수량</th>
                            <th scope="col" style="line-height: 35px;">주문금액<small class="text-muted">(원)</small></th>
                            <th style="width: 80px;"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="frcsOrderDetailVO" items="${frcsOrderVO.frcsOrderDetailVOList}" varStatus="stat">
                        <tr>
                            <td>
                                <p class="mb-0 text-center">${stat.count}</p>
                            </td>
                            <td>
                                <input type="hidden" name="frcsOrderDetailVOList[${stat.index}].frcsOrderNo"
                                       value="${frcsOrderDetailVO.frcsOrderNo}">
                                <input type="hidden" name="frcsOrderDetailVOList[${stat.index}].frcsNo"
                                       value="${frcsOrderDetailVO.frcsNo}">
                                <input type="hidden" name="frcsOrderDetailVOList[${stat.index}].prdctNo"
                                       value="${frcsOrderDetailVO.prdctNo}">
                                <input type="hidden" name="frcsOrderDetailVOList[${stat.index}].prdctNm"
                                       value="${frcsOrderDetailVO.prdctNm}">
                                <h6 class="mb-0 fs-4"
                                    style="text-align: start;">${frcsOrderDetailVO.prdctNm}</h6>
                            </td>
                                    <c:choose>
                                        <c:when test="${frcsOrderDetailVO.prdctClsfCd eq 'PRCT01'}">
                                            <td class="text-center"><span class="mb-1 badge rounded-pill comCodeBadgeFrcsOrderDetail" style="background-color: #8d9bc8">원두류</span></td>
                                        </c:when>
                                        <c:when test="${frcsOrderDetailVO.prdctClsfCd eq 'PRCT02'}">
                                            <td class="text-center"><span class="mb-1 badge rounded-pill" style="background-color: #eda69f">제과류</span></td>
                                        </c:when>
                                        <c:when test="${frcsOrderDetailVO.prdctClsfCd eq 'PRCT03'}">
                                            <td class="text-center"><span class="mb-1 badge rounded-pill " style="background-color: #d7d958">식기류</span></td>
                                        </c:when>
                                        <c:when test="${frcsOrderDetailVO.prdctClsfCd eq 'PRCT04'}">
                                            <td class="text-center"><span class="mb-1 badge rounded-pill" style="background-color: #e09ebe">시럽</span></td>
                                        </c:when>
                                        <c:when test="${frcsOrderDetailVO.prdctClsfCd eq 'PRCT05'}">
                                            <td class="text-center"><span class="mb-1 badge rounded-pill" style="background-color: #eebd99">소모품</span></td>
                                        </c:when>
                                        <c:when test="${frcsOrderDetailVO.prdctClsfCd eq 'PRCT06'}">
                                            <td class="text-center"><span class="mb-1 badge rounded-pill" style="background-color: #ab978f">상품</span></td>
                                        </c:when>
                                        <c:when test="${frcsOrderDetailVO.prdctClsfCd eq 'PRCT07'}">
                                            <td class="text-center"><span class="mb-1 badge rounded-pill" style="background-color: #54b5e2">유제품</span></td>
                                        </c:when>
                                        <c:when test="${frcsOrderDetailVO.prdctClsfCd eq 'PRCT08'}">
                                            <td class="text-center"><span class="mb-1 badge rounded-pill" style="background-color: #70b96d">음료류</span></td>
                                        </c:when>
                                        <c:when test="${frcsOrderDetailVO.prdctClsfCd eq 'PRCT09'}">
                                            <td class="text-center"><span class="mb-1 badge rounded-pill" style="background-color: #db7c0b">청과류</span></td>
                                        </c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>

                            <td class="text-center">
                                <h6 class="mb-0 fs-4 frcsInvenCnt">
                                    <fmt:formatNumber value="${frcsOrderDetailVO.frcsInventoryVO.frcsInvenCnt}"
                                                      pattern="#,###"/>
                                </h6>
                                <p class="frcsInvenProperCnt mb-0 text-muted fs-2 mt-1">
                                    (<fmt:formatNumber value="${frcsOrderDetailVO.frcsInventoryVO.frcsInvenProperCnt}" pattern="#,###"/>)
                                </p>
                            </td>
                            <td>
                                <div class="d-flex align-items-center"
                                     style="text-align: center; justify-content: center;">
                                    <div class="btn-group mb-2" role="group" aria-label="Basic example">
                                        <button type="button" class="btn bg-info-subtle text-info mb-2"
                                                data-more="#sh" aria-pressed="false"
                                                onclick="modifyFrcsOrderCnt(1, ${stat.count}, '${frcsOrderDetailVO.prdctClsfCd}', ${frcsOrderDetailVO.prdctRcvnAmt})">
                                            <i class="ti ti-minus fs-7 text"></i>
                                        </button>

                                        <c:choose>
                                            <c:when test="${frcsOrderDetailVO.frcsInventoryVO.frcsAutoOrderYn eq 'Y'}">
                                                <button class="mb-2" style="background-color: #ebf3fe; border: none"
                                                        disabled>
                                                    <input type="hidden" class="mb-0 form-control prod-qty"
                                                           id="frcsOrderCnt${stat.count}"
                                                           value="${frcsOrderDetailVO.frcsInventoryVO.frcsAutoOrderCnt}"
                                                           name="frcsOrderDetailVOList[${stat.index}].frcsOrderQy"
                                                           style="color:black; background-color: #ebf3fe; width: 100px; text-align: center;">
                                                    <div class="form-control mb-0"
                                                         id="displayFrcsOrderCnt${stat.count}"><fmt:formatNumber value="${frcsOrderDetailVO.frcsInventoryVO.frcsAutoOrderCnt}" pattern="#,###" />
                                                    </div>
                                                </button>
                                            </c:when>

                                            <c:otherwise>
                                                <button class="mb-2" style="background-color: #ebf3fe; border: none"
                                                        disabled>
                                                    <input type="hidden" class="mb-0 form-control prod-qty"
                                                           id="frcsOrderCnt${stat.count}"
                                                           value="0"
                                                           name="frcsOrderDetailVOList[${stat.index}].frcsOrderQy"
                                                           style="color:black; background-color: #ebf3fe; width: 100px; text-align: center;">
                                                    <div class="form-control mb-0"
                                                         id="displayFrcsOrderCnt${stat.count}">0
                                                    </div>
                                                </button>
                                            </c:otherwise>
                                        </c:choose>

                                        <button type="button" class="btn bg-info-subtle text-info mb-2"
                                                data-more="#sh" aria-pressed="false"
                                                onclick="modifyFrcsOrderCnt(0, ${stat.count}, '${frcsOrderDetailVO.prdctClsfCd}', ${frcsOrderDetailVO.prdctRcvnAmt}, this)">
                                            <i class="ti ti-plus fs-7 text-active"></i>
                                        </button>
                                    </div>

                                </div>
                            </td>
                            <td class="text-end">
                                <c:choose>
                                    <c:when test="${frcsOrderDetailVO.frcsInventoryVO.frcsAutoOrderYn eq 'Y'}">
                                        <input type="hidden" class="mb-0 form-control amt"
                                               id="frcsOrderCostAmt${stat.count}"
                                               name="frcsOrderDetailVOList[${stat.index}].frcsOrderCost"
                                               value="${frcsOrderDetailVO.prdctRcvnAmt  * frcsOrderDetailVO.frcsInventoryVO.frcsAutoOrderCnt }" readonly>
                                        <h6 class="fs-4 px-4" id="displayFrcsOrderCostAmt${stat.count}">
                                            <fmt:formatNumber value="${frcsOrderDetailVO.prdctRcvnAmt  * frcsOrderDetailVO.frcsInventoryVO.frcsAutoOrderCnt }" pattern="#,###" />
                                        </h6>
                                    </c:when>

                                    <c:otherwise>
                                        <input type="hidden" class="mb-0 form-control amt"
                                               id="frcsOrderCostAmt${stat.count}"
                                               name="frcsOrderDetailVOList[${stat.index}].frcsOrderCost"
                                               value="${frcsOrderDetailVO.frcsOrderCost}" readonly>
                                        <h6 class="fs-4 px-4 displayAmt" id="displayFrcsOrderCostAmt${stat.count}">0</h6>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <button type="button" class="btn fs-6 deleteFrcsOrderDetail"
                                        value="${frcsOrderDetailVO.prdctNo}"
                                        data-bs-toggle="tooltip" data-bs-placement="right"
                                        data-bs-title="Delete">
                                    <i class="ti ti-trash"></i>
                                </button>
                            </td>
                        </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
                <input type="hidden" value="" name="frcsOrderOrderAmt" id="frcsOrderCost">
                <sec:csrfInput/>
            </form>
            <div class="d-flex flex-row-reverse">
                <p class="fs-6 m-3">총 주문 금액 : <strong id="displayTotalPrice" class="fs-6 m-3">-</strong> 원</p>
            </div>

            <div class="d-flex flex-row-reverse">
                <button type="button" class="btn waves-effect waves-light btn-primary m-3 fs-4" style="width: 100px"
                        id="updateFrcsDetailOrderBtn" disabled>다음<i
                        class="ti ti-chevrons-right ms-2 fs-4"></i></button>
                <button type="button" id="deleteFrcsOrderBtn"
                        class="btn waves-effect waves-light btn-secondary m-3 fs-4"
                        style="width: 100px">취소<i class="ti ti-xbox-x ms-2 fs-4"></i></button>
            </div>
        </div>
    </div>
</div>


<script>

    let totalPrice = 0;
    <%--let sizeVO = ${hqDetailOrderVO}.length;--%>
    console.log("토탈값이다 이말이여! ");

    //보유한 재고량이 권장 보유량보다 적으면 빨간 글씨로 알림
    console.log(${frcsOrderDetailFor});
    const frcsOrderDetailFor = ${frcsOrderDetailFor};

    for (let i = 0; i < frcsOrderDetailFor; i++) {
        let frcsInventCount = document.getElementsByClassName("frcsInvenCnt")[i].innerText;
        let frcsWishInventCount = document.getElementsByClassName("frcsInvenProperCnt")[i].innerText;

        //innerText로 가져온 문자열에서 ',' 빼고(replace) 숫자형으로 변환
        let numericFrcsInventCount = parseInt(frcsInventCount.replace(/[^\d]/g, ''));
        let numericFrcsWishInventCount = parseInt(frcsWishInventCount.replace(/[^\d]/g, ''));

        console.log(frcsInventCount);
        console.log(frcsWishInventCount);
        //아래는 숫자형
        console.log(numericFrcsInventCount);
        console.log(numericFrcsWishInventCount);

        if (numericFrcsInventCount < numericFrcsWishInventCount) {
            document.getElementsByClassName("frcsInvenCnt")[i].style.color = "red";
        }
    }

    //발주 목록 중 상품 삭제
    $(document).on("click", ".deleteFrcsOrderDetail", function () {
        let data = {
            "prdctNo": $(this).val()
            , "frcsOrderNo": $("#frcsOrderNoMain").val()
        }
        console.log(data)

        $.ajax({
            url: "/frcs/order/deleteProduct",
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
                        location.href = "/frcs/order/detail?frcsOrderNo=" + $("#frcsOrderNoMain").val();
                    }, 1000); //1초 이후 자동 새로고침

                } else if (result.result === "otherPage") {
                    var Toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false, //true면 ok버튼이 뜸
                        timer: 1500, //1초 동안 표시됨
                        timerProgressBar: true
                        // true하면 타임게이지 나옴
                    });
                    Toast.fire({
                        icon: 'success', //출력할 아이콘 종류(success, warning, error, info, quesition)
                        title: '발주 신청을 취소합니다.' //출력할 메세지 내용
                    });
                    setTimeout(function () {
                        location.href = "/frcs/inventory/list";
                    }, 1500); //1초 이후 자동 새로고침

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

    //발주 취소 버튼
    const cancelBtn = document.getElementById("deleteFrcsOrderBtn");
    cancelBtn.addEventListener('click', function () {
        Swal.fire({
            title: 'CANCEL',
            text: `발주 신청을 취소하시겠습니까?`,
            icon: 'question',

            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
            confirmButtonColor: '#763ebd', // confrim 버튼 색깔 지정
            cancelButtonColor: '#95cfd5', // cancel 버튼 색깔 지정
            confirmButtonText: '확인', // confirm 버튼 텍스트 지정
            cancelButtonText: '취소', // cancel 버튼 텍스트 지정

        }).then(result => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '발주 취소 완료',
                    icon: 'success',

                    showCancelButton: false,
                    confirmButtonColor: '#763ebd', // confrim 버튼 색깔 지정
                    confirmButtonText: '확인' // confirm 버튼 텍스트 지정

                }).then(result => {
                    if (result.isConfirmed) {
                        // location.href = "/frcs/inventory/inventoryUpdate";

                        //확인 버튼 눌렀을 때
                        const form = document.getElementById("submitForm");
                        // form.action = "/admin/cancelHqOrder";
                        form.setAttribute('action', "/frcs/order/cancelFrcsOrder");
                        form.setAttribute('method', "post");
                        form.submit();
                    }
                })
            }
        })
    })

    //수량 변경
    function modifyFrcsOrderCnt(i, stat, comDetCode, prdctRcvnAmt) {
        let qtyArr = $(".prod-qty");

        // console.log("플마? ", i);
        // console.log("순번 ; ", stat);
        // console.log("카테고리 ; ", comDetCode);
        // console.log("개당 가격 ; ", prdctRcvnAmt);

        let inputFrcsOrderCnt = document.getElementById("frcsOrderCnt" + stat);
        let firstCnt = parseInt(inputFrcsOrderCnt.value);
        // console.log("inputFrcsOrderCnt = ", inputFrcsOrderCnt);
        // console.log("firstCnt = ", firstCnt);

        let inputFrcsOrderPrice = document.getElementById("frcsOrderCostAmt" + stat);
        let firstPrice = parseInt(inputFrcsOrderPrice.value);
        // console.log("inputFrcsOrderPrice = ", inputFrcsOrderPrice);
        // console.log("firstPrice = ", firstPrice);

        let frcsOrderCostAmt = document.getElementById("frcsOrderCostAmt" + stat);

        if (i == 0) {

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
            inputFrcsOrderCnt.value = firstCnt;
            inputFrcsOrderPrice.value = firstPrice;
            // document.getElementById("displayHqOrderCnt"+stat).value = firstCnt;
            document.getElementById("displayFrcsOrderCnt" + stat).innerText = firstCnt;
            document.getElementById("displayFrcsOrderCostAmt" + stat).innerText = firstPrice.toLocaleString('ko-KR');
        }

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
        document.getElementById("frcsOrderCost").value = Number(ttalAmt);


        //발주하는 품목의 수량이 0인게 하나라도 있으면 다음 버튼이 활성화되지 않음
        let frcsInventCount = document.getElementsByClassName("displayAmt");
        console.log("현재 몇개?", frcsInventCount);
        var notZero = Array.from(frcsInventCount).every(function (input){
            return parseInt(input.innerText) > 0;
        });
        if (notZero) {
            console.log("Success");

            document.getElementById("updateFrcsDetailOrderBtn").removeAttribute("disabled");
        }





    }

    //발주 신청 버튼
    const updateBtn = document.getElementById("updateFrcsDetailOrderBtn");
    updateBtn.addEventListener('click', function () {

        Swal.fire({
            title: '발주 신청',
            text: '신청하시겠습니까?',
            icon: 'info',

            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
            confirmButtonColor: '#763ebd', // confrim 버튼 색깔 지정
            cancelButtonColor: '#95cfd5', // cancel 버튼 색깔 지정
            confirmButtonText: '확인', // confirm 버튼 텍스트 지정
            cancelButtonText: '취소', // cancel 버튼 텍스트 지정

        }).then(result => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '신청 완료',
                    icon: 'success',

                    showCancelButton: false,
                    confirmButtonColor: '#763ebd', // confrim 버튼 색깔 지정
                    confirmButtonText: '다음' // confirm 버튼 텍스트 지정

                }).then(result => {
                    if (result.isConfirmed) {

                        let formData = $("#submitForm").serialize();

                        console.log(formData)

                        $.ajax({
                            url: "/frcs/order/updateFrcsDetailOrder",
                            type: "post",
                            dataType: "json",
                            data: formData,
                            beforeSend: function (xhr) {
                                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                            },
                            success: function(result){
                                location.href = "/frcs/order/list";
                            }
                        })

                    }
                })
            }
        })
    })

</script>