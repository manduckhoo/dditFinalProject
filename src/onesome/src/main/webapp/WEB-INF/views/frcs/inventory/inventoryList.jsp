<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet"
      href="/resources/bootstrap/src/assets/libs/datatables.net-bs5/css/dataTables.bootstrap5.min.css">

<%-- 배너 사진 --%>
<div class="card bg-primary-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">재고 목록</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/frcs/main">Main</a>
                        </li>
                        <li class="breadcrumb-item text-muted" aria-current="page">재고 목록</li>
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

<%--${frcsInventoryVOList[0].productVO}--%>

<div class="datatables">
    <div class="row">
        <div class="col-12">
            <!-- --------------------- dataTable 시작 ---------------- -->
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <div id="zero_config_wrapper" class="dataTables_wrapper">
                            <form action="/frcs/order/detail" method="post">
                                <div class="d-flex justify-content-end mx-auto">
                                    <button type="submit" id="frcsOrderBtn"
                                            class="btn mb-1 waves-effect waves-light bg-primary-subtle text-primary mx-3">
                                        <i class="ti ti-box-seam" style="margin-right: 5px;"></i> 발주 신청
                                    </button>

                                    <button type="button" class="btn btn-primary btn-rounded mb-1" id="frcsInventoryUpdateBtn">
                                        <i class="ti ti-refresh" style="margin-right: 5px;"></i> 제품 업데이트
                                    </button>
                                </div>

                                <table id="zero_config"
                                       class="table border table-bordered display text-nowrap dataTable"
                                       aria-describedby="zero_config_info">
                                    <thead>
                                    <!-- start row -->
                                    <tr>
                                        <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1"
                                            style="text-align: center; width: 10%;"
                                            colspan="1" aria-label="select: activate to sort column ascending">선택
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1"
                                            style="text-align: center; max-width: 20%"
                                            colspan="1" aria-label="prdctNm: activate to sort column ascending">제품명
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1"
                                            style="text-align: center; width: 10%;"
                                            colspan="1" aria-label="category: activate to sort column ascending">분류
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1"
                                            style="text-align: center; width: 10%"
                                            colspan="1" aria-label="frcsInvenCnt: activate to sort column ascending">재고량
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1"
                                            style="text-align: center; width: 10%"
                                            colspan="1" aria-label="frcsProperInvenCnt: activate to sort column ascending">적정 재고량
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1"
                                            style="text-align: center; width: 9%"
                                            colspan="1" aria-label="frcsAutoOrderYn: activate to sort column ascending">
                                            자동발주여부
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1"
                                            style="text-align: center; width: 10%;"
                                            colspan="1" aria-label="category: activate to sort column ascending">단가<span class="text-muted fs-3">&nbsp;(원)</span>
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1"
                                            style="text-align: center; width: 20%;"
                                            colspan="1" aria-label="frcsLastInDt: activate to sort column ascending">최근
                                            입고일
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var="frcsInventoryVOCnt" value="${fn:length(frcsInventoryVOList)}"/>
                                    <c:forEach var="frcsInventoryVO" items="${frcsInventoryVOList}" varStatus="stat">
                                        <tr>
                                            <td class="text-center">
                                                <input type="checkbox" class="form-check-input" name="productCheckBox"
                                                       value="${frcsInventoryVO.prdctNo}"
                                                        <c:choose>
                                                            <c:when test="${frcsInventoryVO.productVO.prdctDscnYn eq 'Y'}">disabled </c:when>
                                                            <c:when test="${frcsInventoryVO.frcsInvenCnt <= frcsInventoryVO.frcsInvenProperCnt}">checked </c:when>
                                                        </c:choose>
                                                >
                                            </td>
                                            <td onclick="location.href='/frcs/inventory/detail?prdctNo=${frcsInventoryVO.prdctNo}'"
                                                style="cursor: pointer;" class="text-start">
                                                    ${frcsInventoryVO.productVO.prdctNm}
                                            </td>

                                            <c:choose>
                                                <c:when test="${frcsInventoryVO.productVO.prdctClsfCd eq 'PRCT01'}">
                                                    <td class="text-center"><span class="mb-1 badge rounded-pill" style="background-color: #8d9bc8">원두류</span></td>
                                                </c:when>
                                                <c:when test="${frcsInventoryVO.productVO.prdctClsfCd eq 'PRCT02'}">
                                                    <td class="text-center"><span class="mb-1 badge rounded-pill" style="background-color: #eda69f">제과류</span></td>
                                                </c:when>
                                                <c:when test="${frcsInventoryVO.productVO.prdctClsfCd eq 'PRCT03'}">
                                                    <td class="text-center"><span class="mb-1 badge rounded-pill " style="background-color: #d7d958">식기류</span></td>
                                                </c:when>
                                                <c:when test="${frcsInventoryVO.productVO.prdctClsfCd eq 'PRCT04'}">
                                                    <td class="text-center"><span class="mb-1 badge rounded-pill" style="background-color: #e09ebe">시럽</span></td>
                                                </c:when>
                                                <c:when test="${frcsInventoryVO.productVO.prdctClsfCd eq 'PRCT05'}">
                                                    <td class="text-center"><span class="mb-1 badge rounded-pill" style="background-color: #eebd99">소모품</span></td>
                                                </c:when>
                                                <c:when test="${frcsInventoryVO.productVO.prdctClsfCd eq 'PRCT06'}">
                                                    <td class="text-center"><span class="mb-1 badge rounded-pill" style="background-color: #ab978f">상품</span></td>
                                                </c:when>
                                                <c:when test="${frcsInventoryVO.productVO.prdctClsfCd eq 'PRCT07'}">
                                                    <td class="text-center"><span class="mb-1 badge rounded-pill" style="background-color: #54b5e2">유제품</span></td>
                                                </c:when>
                                                <c:when test="${frcsInventoryVO.productVO.prdctClsfCd eq 'PRCT08'}">
                                                    <td class="text-center"><span class="mb-1 badge rounded-pill" style="background-color: #70b96d">음료류</span></td>
                                                </c:when>
                                                <c:when test="${frcsInventoryVO.productVO.prdctClsfCd eq 'PRCT09'}">
                                                    <td class="text-center"><span class="mb-1 badge rounded-pill" style="background-color: #db7c0b">청과류</span></td>
                                                </c:when>
                                                <c:otherwise>-</c:otherwise>
                                            </c:choose>


                                            <td style="text-align: right; cursor: pointer;"
                                                onclick="javascript:modifyInvent(${frcsInventoryVO.prdctNo}, '${frcsInventoryVO.productVO.prdctNm}', ${frcsInventoryVO.frcsInvenProperCnt})">
                                                <p class="frcsInventCnt mb-0" <c:if test="${frcsInventoryVO.frcsInvenCnt < frcsInventoryVO.frcsInvenProperCnt}">style="color: red;" </c:if>><fmt:formatNumber
                                                        value="${frcsInventoryVO.frcsInvenCnt}" pattern="#,###"/></p>
                                                <p class="frcsInventProperCnt${stat.index} d-none"><fmt:formatNumber
                                                        value="${frcsInventoryVO.frcsInvenProperCnt}"/></p>
                                            </td>
                                            <td style="text-align: right; cursor: pointer;"
                                                onclick="javascript:modifyInvent(${frcsInventoryVO.prdctNo}, '${frcsInventoryVO.productVO.prdctNm}', ${frcsInventoryVO.frcsInvenProperCnt})">
                                                <p class="mb-0 text-end"><fmt:formatNumber value="${frcsInventoryVO.frcsInvenProperCnt}"/></p>
                                            </td>

                                            <%--<td onclick="location.href='/frcs/inventory/detail?prdctNo=${frcsInventoryVO.prdctNo}'"
                                                style="cursor: pointer;" class="text-center">--%>


                                            <c:choose>
                                                <c:when test="${frcsInventoryVO.frcsAutoOrderYn eq 'N'}">
                                                    <td class="text-center" style="cursor: pointer" onclick="javascript:autoOrder(${frcsInventoryVO.prdctNo}, '${frcsInventoryVO.productVO.prdctNm}', '${frcsInventoryVO.frcsAutoOrderYn}', '${frcsInventoryVO.frcsAutoOrderCnt}')">
                                                        -
                                                    </td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td class="text-end" style="cursor: pointer" onclick="javascript:autoOrder(${frcsInventoryVO.prdctNo}, '${frcsInventoryVO.productVO.prdctNm}', '${frcsInventoryVO.frcsAutoOrderYn}', '${frcsInventoryVO.frcsAutoOrderCnt}')">
                                                        <fmt:formatNumber value="${frcsInventoryVO.frcsAutoOrderCnt}" pattern="#,###" />
                                                    </td>
                                                </c:otherwise>
                                            </c:choose>


                                            <td style="text-align: right; cursor: pointer;">
                                                <p class="mb-0 text-end">
                                                    <fmt:formatNumber value="${frcsInventoryVO.productVO.prdctRcvnAmt}" pattern="#,###"/>
<%--                                                    TODO 가격 바꿀거면 전부 다 바꿔야함--%>
<%--                                                    아래는 3% 더 가격 붙은거--%>
<%--                                                    <fmt:formatNumber value="${frcsInventoryVO.productVO.prdctRcvnAmt + ((frcsInventoryVO.productVO.prdctRcvnAmt) * 0.3)}" pattern="#,###"/>--%>
                                                </p>
                                            </td>

                                            <td class="text-center">
                                                <c:choose>
                                                    <c:when test="${frcsInventoryVO.productVO.prdctDscnYn eq 'Y'}">
                                                        <span class="mb-1 badge text-bg-dark">단종</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <fmt:formatDate value="${frcsInventoryVO.frcsLastInDt}" dateStyle="medium"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
<%--                                                <c:choose>--%>
<%--                                                    <c:when test="${productVO.prdctDscnYn == 'N'}">--%>
<%--                                                        <td style="text-align: center;">-</td>--%>
<%--                                                    </c:when>--%>
<%--                                                    <c:otherwise>--%>
<%--                                                        <td style="text-align: center; color: red">단종</td>--%>
<%--                                                    </c:otherwise>--%>
<%--                                                </c:choose>--%>
                                        </tr>
                                    </c:forEach>
                                    </tbody>

                                </table>
                                <sec:csrfInput/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- --------------------- dataTable 끝 ---------------- -->
        </div>
    </div>
</div>


<%--자동발주 모달 시작--%>
<div class="modal fade" id="autoOrder-modal" tabindex="-1" aria-labelledby="vertical-static-modal"
     style="display: none;" aria-modal="true" role="dialog" data-bs-backdrop="static" >
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content w-auto" style="min-width: 550px; min-height: 300px;">
            <div class="modal-header d-flex align-items-center">
                <h4 class="modal-title">
                    자동 발주 수정
                </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="post" action="/frcs/inventory/autoOrderUpdate">
                <div class="modal-body">
                    <div id="autoOrderModalContent" >

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary font-medium waves-effect waves-light text-center"
                            data-bs-dismiss="modal">
                        취소
                    </button>
                    <button type="submit" class="btn btn-primary font-medium waves-effect waves-light text-center">
                        수정
                    </button>
                </div>
                <sec:csrfInput/>
            </form>
        </div>
    </div>
</div>
<%--자동발주 모달 끝--%>

<%--재고량 수정 모달 시작--%>
<div class="modal fade" id="inventCntModify-modal" tabindex="-1" aria-labelledby="vertical-static-modal"
     style="display: none;" aria-modal="true" role="dialog" data-bs-backdrop="static" >
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content w-auto" style="min-width: 550px; min-height: 300px;">
            <div class="modal-header d-flex align-items-center">
                <h4 class="modal-title">
                    자동 발주 수정
                </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="post" action="/frcs/inventory/modifyInventoryCnt">
                <div class="modal-body">
                    <div id="modifyInventModalContent" >

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary font-medium waves-effect waves-light text-center"
                            data-bs-dismiss="modal">
                        취소
                    </button>
                    <button type="submit" class="btn btn-primary font-medium waves-effect waves-light text-center">
                        수정
                    </button>
                </div>
                <sec:csrfInput/>
            </form>
        </div>
    </div>
</div>
<%--재고량 수정 모달 끝--%>


<script src="/resources/bootstrap/src/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/resources/bootstrap/src/assets/js/datatable/datatable-basic.init.js"></script>

<script>
    //발주 신청 버튼을 클릭할 때, 데이터 존재 여부 확인
    document.getElementById("frcsOrderBtn").addEventListener("click", function () {
        var frcsCheckboxes = document.querySelectorAll('input[name=productCheckBox]:checked');

        if (frcsCheckboxes.length === 0) {
            alert("체크된 항목이 없습니다.");
            event.preventDefault(); // 이벤트의 기본 동작을 중지
        } else {
            document.getElementById("frcsOrderBtn").setAttribute("type", "submit");
        }
    });

    //자동발주여부 정보 수정
    function autoOrder(prdctNo, prdctNm, frcsAutoOrderYn, frcsAutoOrderCnt) {
        $("#autoOrderModalContent *").remove();
        console.log("this : ", prdctNo);
        console.log("this : ", prdctNm);
        console.log("this : ", frcsAutoOrderYn);
        console.log("this : ", frcsAutoOrderCnt);

        const stringFrcsAutoOrderCnt = frcsAutoOrderCnt.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

        $("#autoOrder-modal").modal("show");

        let str = `<div class="p-1">
                        <div class="row">
                            <strong>제품명</strong>
                            <input class="form-control mt-1 mb-3" type="text" value="` + prdctNm + `" readonly>
                            <input class="form-control" type="hidden" value="` + prdctNo +`" name="prdctNo">
                        </div>
                        <div style="display: flex; align-items: baseline; justify-content: space-between;">
                            <div style="display: flex; align-items: baseline;" class="mx-3">
                                <strong>자동 발주 신청</strong>
                                <div class="form-chek ms-2">
                                    <input class="form-check-input mb-3 mx-1" type="radio" id="frcsAutoOrderYn-Y" value="Y" name="frcsAutoOrderYn" onclick="autoOrderRadioY()">
                                    <label class="form-check-label" for="frcsAutoOrderYn-Y"><span>신청</span></label>
                                    <input class="form-check-input mb-3 mx-1" type="radio" id="frcsAutoOrderYn-N" value="N" name="frcsAutoOrderYn" onclick="autoOrderRadioN()">
                                    <label class="form-check-label" for="frcsAutoOrderYn-N"><span>미신청</span></label>
                                </div>
                            </div>
                            <div style="display: flex; align-items: baseline;"><strong>자동 발주 수량</strong>
                                <input class="form-control mx-3 text-center" type="number" placeholder="` + stringFrcsAutoOrderCnt + `" name="frcsAutoOrderCnt" id="frcsAutoOrderCnt" style="width: 100px" readonly required>
                            </div>
                        </div>
                    </div>`;

        document.getElementById("autoOrderModalContent").insertAdjacentHTML("beforeend", str);

        if (frcsAutoOrderYn == 'Y') {
            document.getElementById("frcsAutoOrderYn-Y").checked = true;
            $('#frcsAutoOrderCnt').attr("readonly", false);

        } else {
            document.getElementById("frcsAutoOrderYn-N").checked = true;
            $('#frcsAutoOrderCnt').attr("readonly", true);
        }

    }

    function autoOrderRadioY(){
        document.getElementById("frcsAutoOrderCnt").removeAttribute("readonly");
    }
    function autoOrderRadioN(){
        $('#frcsAutoOrderCnt').attr("readonly", true);
    }


//  제품업데이트 버튼 기능 만들기
    document.getElementById("frcsInventoryUpdateBtn").addEventListener("click", function (){
        Swal.fire({
            title: 'UPDATE',
            text: `재고 목록을 '업데이트' 하시겠습니까?`,
            icon: 'question',

            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
            confirmButtonColor: '#763ebd', // confrim 버튼 색깔 지정
            cancelButtonColor: '#95cfd5', // cancel 버튼 색깔 지정
            confirmButtonText: '확인', // confirm 버튼 텍스트 지정
            cancelButtonText: '취소', // cancel 버튼 텍스트 지정

        }).then(result => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '업데이트 완료',
                    icon: 'success',

                    showCancelButton: false,
                    confirmButtonColor: '#763ebd', // confrim 버튼 색깔 지정
                    confirmButtonText: '확인' // confirm 버튼 텍스트 지정

                }).then(result => {
                    if (result.isConfirmed) {
                        location.href = "/frcs/inventory/inventoryUpdate";
                    }
                })
            }
        })

    });

    //재고량 정보 수정 모달
    function modifyInvent(prdctNo, prdctNm, frcsInvenProperCnt) {
        $("#modifyInventModalContent *").remove();
        console.log("this : ", prdctNo);
        console.log("this : ", prdctNm);
        console.log("this : ", frcsInvenProperCnt);

        const stringInventCnt = frcsInvenProperCnt.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

        $("#inventCntModify-modal").modal("show");

        let str = `<div class="p-1">
                       <div >
                            <div style="display: flex; align-items: baseline;" class="mb-3">
                               <strong style="width: 120px; text-align: center;">제품명</strong>
                               <input class="form-control mx-1 text-center"  type="text" value="` + prdctNm + `" readonly>
                               <input class="form-control" type="hidden" value="` + prdctNo +`" name="prdctNo">
                            </div>
                       </div>
                       <div style="display: flex; align-items: baseline; justify-content: space-between;">
                       <div class="col-12" style="display: flex; align-items: baseline;">
                            <strong style="width: 120px; text-align: center;">적정 재고 수량</strong>
                            <input class="form-control mx-3 text-center" id="inventCntNumber" type="number"  placeholder="` + stringInventCnt + `" name="frcsInvenProperCnt" required>
                       </div>
                       </div>
                   </div>`;

        document.getElementById("modifyInventModalContent").insertAdjacentHTML("beforeend", str);

    }



</script>