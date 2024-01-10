<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

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
    .adminMainHeader {
    	line-height: 5;
    }
    .pointer {
    	cursor: pointer;
    }
</style>


<div class="row frcs-welcom-area">
	<h2 class="fw-semibold mb-4" style="margin-bottom: 13px;">
		<span class="text-primary"> ${adminVO.adminNm} </span> 
		<span>님 환영합니다.</span>
	</h2>
</div>

<div class="row">
	<!-- 창업상담 대기내역 -->
	<div class="col-sm-2 adminMainHeader">
		<div class="card bg-primary-subtle short-cut-card">
			<div class="card-body" style="background-color: #9bdbff;">
				<a href="/admin/inqr/waitList" class="pointer">
					<div class="d-flex align-items-center justify-content-center">
						<i class="ti ti-receipt-2 fs-9 text-black"></i>
					</div>
					<div class="d-flex justify-content-center mt-3">
						<h3 class="mb-0 fw-semibold fs-9 text-info mb-1">${fn:length(waitList)}</h3>
					</div>
					<div class="d-flex justify-content-center mt-3">
						<span class="mb-0 fw-semibold fs-4">창업 상담대기 건수</span>
					</div>
				</a>
			</div>
		</div>
	</div>
	<!-- 가맹점 발주 대기 내역 -->
	<div class="col-sm-2 short-cut-card adminMainHeader">
		<div class="card bg-danger-subtle short-cut-card">
			<div class="card-body" style="background-color:#ffda97;">
				<a href="/admin/frcsOrder" class="pointer">
					<div class="d-flex align-items-center justify-content-center">
						<i class="ti ti-currency-won fs-9 text-black"></i>
					</div>
					<div class="d-flex justify-content-center mt-3">
						<h3 class="mb-0 fw-semibold fs-9 text-info mb-1">
							${fn:length(frcsOrderVOList)}</h3>
					</div>
					<div class="d-flex justify-content-center mt-3">
						<span class="mb-0 fw-semibold fs-4">가맹점 발주 대기내역</span>
					</div>
				</a>
			</div>
		</div>
	</div>
	
	<!-- 오픈 예정 매장 -->
	<div class="col-sm-2 adminMainHeader">
		<div class="card bg-info-subtle short-cut-card">
			<div class="card-body" style="background-color:#9fc7ff;">
				<a href="/admin/frcs/openList" class="pointer">
					<div class="d-flex align-items-center justify-content-center">
						<i class="ti ti-truck-loading fs-9 text-black"></i>
					</div>
					<div class="d-flex justify-content-center mt-3">
						<h3 class="mb-0 fw-semibold fs-10 text-info">${fn:length(openList)}</h3>
					</div>
					<div class="d-flex justify-content-center mt-3">
						<span class="mb-0 fw-semibold fs-4">오픈 예정 매장</span>
					</div>
				</a>
			</div>
		</div>
	</div>
	
	<!-- 오픈 매장 -->
	<div class="col-sm-2 adminMainHeader">
		<div class="card bg-secondary-subtle short-cut-card">
			<div class="card-body" style="background-color:#ffd2c3;">
				<a href="/admin/frcs/list" class="pointer">
					<div class="d-flex align-items-center justify-content-center">
						<i class="ti ti-truck-loading fs-9 text-black"></i>
					</div>
					<div class="d-flex justify-content-center mt-3">
						<h3 class="mb-0 fw-semibold fs-10 text-info">${fn:length(openedList)}</h3>
					</div>
					<div class="d-flex justify-content-center mt-3">
						<span class="mb-0 fw-semibold fs-4">운영 중인 매장</span>
					</div>
				</a>
			</div>
		</div>
	</div>
	<div class="col-sm-4 d-flex align-items-strech">
		<div class="card w-100">
			<div class="card-body">
				<div
					class="d-sm-flex d-block align-items-center justify-content-between mb-10">
					<div class="mb-3 mb-sm-0">
						<h5 class="card-title fw-semibold"><span class="card-subtitle mb-0">가맹점 매출 순위</span>&nbsp;&nbsp; <span class="badge text-bg-primary">Top 3</span> </h5>
						
					</div>
				</div>
				<div class="table-responsive">
					<table class="table align-middle text-nowrap mb-0">
						<tbody class="border-top">
						<c:forEach var="salesRank" items="${salesList}">
							<tr>
								<td>
									<div class="d-flex align-items-center">
										<div>
											<h6 class="fw-semibold mb-1">${salesRank.RANK}</h6>
										</div>
									</div>
								</td>
								<td>
									<h6 class="fw-semibold mb-1">${salesRank.FRCSNM}</h6>
								</td>
								<td>
									<h6 class="fw-semibold mb-1"><fmt:formatNumber maxFractionDigits="3">${salesRank.TOTALAMTSUM}</fmt:formatNumber>원</h6>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
<div class="col-sm-7">
<div class="card" style="height: 550px;">
    <div class="card-body">
        <div class="row">
            <div>
                <form id="frm">
                    <button class="date-btns" type="submit" name="viewDate" value="${previousMonth}">
                        <i class='bx bxs-left-arrow'></i>
                    </button>
                    <strong>${viewDate}월 가맹점 미납 내역</strong>
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
                                            <span class="badge text-bg-danger">미납</span>
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
</div>

<!-- chart (본사 월 매입/매출)-->
<div class="card col-sm-5">
    <div class="card-body">
    	<div class="row">
	    	<div id="changeMonth" style="margin-top: 10px;">
	            <form id="frm">
	<%--                 <button class="date-btns" type="submit" name="viewDate2" value="${previousMonth2}"> --%>
	<!--                     <i class='bx bxs-left-arrow'></i> -->
	<!--                 </button> -->
	                <strong>당월 본사 매입/매출</strong>
	<%--                 <button class="date-btns" type="submit" name="viewDate2" value="${nextMonth2}" --%>
	<%--                         <c:if test="${nextMonth2 gt crrDate2}">disabled</c:if>> --%>
	<!--                     <i class='bx bxs-right-arrow'></i> -->
	<!--                 </button> -->
	            </form>
	        </div>
	        <div class="card-body d-flex align-items-center">
	            <canvas id="chartId" aria-label="chart" height="350" width="580"></canvas>
	        </div>
        </div>
    </div>
</div>
</div>

 
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.1.1/chart.min.js"></script>
<script src="/resources/bootstrap/src/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script>
$("#adminInquiryList").DataTable({
    bLengthChange: false,
    info: false,
    order: [],
    displayLength: 5,
    "searching": false
});


    $(function() {
    	 // 본사 월 매입/매출 데이터 가져오는 AJAX
    	 let data = {
    		"viewData": "${viewData}"
    	 }
    	 console.log("data!!!!!!!!:::::: ", data);
        $.ajax({
            url: "/admin/main/getMonthlyInOut",
            dataType: "json"
        }).done(rst => {
			
            let inMonth = [];
            let outMonth = [];

            $.each(rst, function (idx, data) {
                inMonth.unshift(data.hqOrderTotalAmt);
                outMonth.unshift(data.ryTotalAmt);
				console.log("data!!!!!!: ", data);
				console.log("rst!!!!!!!: ", rst);
				
            });

            var chrt = document.getElementById("chartId").getContext("2d");

            var chartId = new Chart(chrt, {
            	   type: 'doughnut',
            	   data: {
            	      labels: ["매입", "매출"],
            	      
            	      
            	      datasets: [{
            	      label: "online tutorial subjects",
            	      data: [inMonth[0], outMonth[0]], /* 매입, 매출 */
            	      backgroundColor: ['lightgreen', 'pink'],
            	      hoverOffset: 2
            	      }],
            	   },
            	   options: {
            	      responsive: false,
            	   },
            	});
        });
    });
</script>
