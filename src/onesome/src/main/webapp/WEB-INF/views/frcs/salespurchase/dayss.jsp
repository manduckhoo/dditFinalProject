<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<%-- ${daysList} --%>
<%-- ${daysList[0].yyyymmdd} --%>
<!-- <br /> -->
<%-- ${daysList[1].yyyymmdd} --%>
<!-- <br /> -->
<%-- ${daysList[0].pynmDt} --%>
<!--페이지네이션-->
<script
	src="/resources/bootstrap/src/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>

<style>
/* 페이지네이션 버튼을 가운데 정렬하기 위한 CSS */
#paymentVO_paginate {
	display: flex;
	justify-content: center;
	align-items: center;
}

#daysTitle {
	display: flex !important;
	justify-content: center;
}
</style>
<!-- 브레드 크럼 시작  -->
<div
	class="card bg-success-subtle shadow-none position-relative overflow-hidden mb-4">
	<div class="card-body px-4 py-3">
		<div class="row align-items-center">
			<div class="col-9">
				<h4 class="fw-semibold mb-8">매입/매출 분석</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							class="text-muted text-decoration-none" href="/frcs/main">Main</a>
						</li>
						<li class="breadcrumb-item text-muted" aria-current="page">일일
							매출 분석</li>
					</ol>
				</nav>
			</div>
			<div class="col-3">
				<div class="text-center mb-n5">
					<img
						src="/resources/bootstrap/src/assets/images/breadcrumb/ChatBc.png"
						alt="" class="img-fluid mb-n4">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 브레드 크럼 끝  -->

<!-- 상단 차트 시작 -->
<div class="card"
	style="width: 100%; height: 440px; display: flex; flex-direction: row; justify-content: space-around; padding: 32px 0px;">
	<div class="chart-container">
		<canvas id="price-pie"></canvas>
	</div>
	<div class="chart-container">
		<canvas id="count-pie"></canvas>
	</div>
	<div class="chart-container">
		<canvas id="line-Chart"></canvas>
	</div>
</div>
<!-- 상단 차트 끝 -->

<!--/////////////////하단 표 시작/////////////////-->
<div class="card">
	<div class="card card-body">
		<div class="table-responsive">
			<!-- 			<table class="table search-table align-middle text-nowrap" -->
			<table class="table align-middle text-nowrap" id="paymentVO">
				<thead class="header-item">
					<tr>
						<th scope="col" data-tablesaw-priority="persist"
							class="border text-center"
							style="background-color: #eeddff; color: #495057;">제목</th>
						<th scope="col" data-tablesaw-sortable-default-col=""
							data-tablesaw-priority="3" class="border text-center"
							style="background-color: #eeddff; color: #495057;">매출액</th>
						<th scope="col" data-tablesaw-priority="2"
							class="border text-center"
							style="background-color: #eeddff; color: #495057;">매출 날짜</th>
						<th scope="col" data-tablesaw-priority="4" class="border"
							style="background-color: #eeddff; color: #495057;"></th>
					</tr>
				</thead>

				<tbody>
					<!-- start row -->
					<c:choose>
						<c:when test="${fn:length(daysList) > 0}">
							<c:forEach items="${daysList}" var="paymentVO" varStatus="stat">
								<tr class="search-items">
									<td class="tdtd"
										data-date="<fmt:formatDate pattern="yyyy-MM-dd" value="${paymentVO.pynmDt}"/>">
										<div class="align-items-center" id="daysTitle">
											<div class="ms-3">
												<div class="user-meta-info">
													<fmt:formatDate value="${paymentVO.pynmDt}"
														dateStyle="long" />
													매출액
												</div>
											</div>
										</div>
									</td>
									<td class="text-end"><fmt:formatNumber type="number"
											maxFractionDigits="3" value="${paymentVO.paymentTotal}" /> 원</td>
									<td class="text-center"><fmt:formatDate
											value="${paymentVO.pynmDt}" dateStyle="medium" /></td>
									<td class="text-center">
										<div class="action-btn">
											<button type="button"
												class="btn mb-1 waves-effect waves-light bg-primary-subtle text-primary">
												<a
													href="/frcs/salespurchase/dayssDetail?pynmDt=<fmt:formatDate pattern="yyyy-MM-dd" value="${paymentVO.pynmDt}"/>">상세</a>
<!-- 													href="/frcs/salespurchase/dayssDetail">상세</a> -->
											</button>
										</div>
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
<!--/////////////////하단 그리드 끝/////////////////-->

<script>
	$("#paymentVO").DataTable({
						pageLength : 4,
						bLengthChange : false,
						info : false,
						order : [],
						searching: false // 검색 기능 비활성화
					});
</script>

<script type="text/javascript">

$(function(){
	
	// 차트를 임시적으로 저장할 변수
	let myPricePie = '';
	let myCountPie = '';
	let myLineChart = '';
	
	$(".tdtd").on("click", function(){
		
		if(myPricePie && myCountPie && myLineChart){
			myPricePie.destroy();
			myCountPie.destroy();
			myLineChart.destroy();
		}
		
		console.log($(this).data("date"))
		
			let data = {
				"frcsNo" : ${paymentVO.frcsNo},
				"pynmDt" : new Date($(this).data("date"))
			};
		
		console.log("이건 뭐지??", data.pynmDt);
	
	$.ajax({
		 url:"/frcs/salespurchase/dayss",
		 contentType:"application/json;charset=utf-8",
	     type:"post",
	     data:JSON.stringify(data),
	     dataType:"json",
	     async:false,
	     beforeSend:function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	      },
	     success:function(result){
// 	    	 console.log("잘왔니? : ", result);
// 	    	 console.log("잘왔냐구 : ", result.pieChart);
// 	    	 console.log("여수 : ", result.pieChart[0].paymentDetailVOList[0].menuNm);
	    	 //console.log("모카 : ", result.pieChart[0].paymentDetailVOList[1].menuNm);
// 	    	 console.log("모카 : ", result.pieChart[1].paymentDetailVOList[0].menuNm);
// 	    	 console.log("6개 : ", result.pieChart[0].paymentDetailVOList[0].pynmCnt);
// 	    	 console.log("얼마 : ", result.pieChart[0].paymentDetailVOList[0].menuPrice);
			 console.log("라인차트 : ", result.lineChart);
			 //console.log("211 : ", result.lineChart[0].paymentVO[0].paymentTotal);
			 //console.log("211 : ", result.lineChart[0].paymentVO.paymentTotal);
// 	    	 console.log("라인차트 : ", result.lineChart[0]);
// 	    	 console.log("211? : ", result.lineChart[0].paymentTotal);
// 	    	 console.log("다음? : ", result.lineChart[1].paymentTotal);
// 	    	 console.log("날짜? : ", result.lineChart[1].yyyymmdd);
	    	 
	    	 //////////// 파이 차트 시작 //////////////
	    	 
	    	 console.log("길이길이길이 : ", result.pieChart.length)
	    	 
	    	 //가격 파이, 수량 파이 선언
	    	 var pricePie = $('#price-pie');
	    	 var countPie = $('#count-pie');
	    	 
	    	 //가격 파이, 수량 파이 데이터 배열에 저장
	    	 var pricePieLabels = [];
	    	 var pricePieData = [];
	    	 
	    	 var countPieLabels = [];
	    	 var countPieData = [];
	    	 
	    	 for(var i = 0; i < result.pieChart.length; i++){
	    		 for(var j = 0; j < result.pieChart[i].paymentDetailVOList.length; j++){
		    		 pricePieLabels.push(result.pieChart[i].paymentDetailVOList[j].menuNm);
		    		 countPieLabels.push(result.pieChart[i].paymentDetailVOList[j].menuNm);
		    		 pricePieData.push(result.pieChart[i].paymentDetailVOList[j].menuPrice);
		    		 countPieData.push(result.pieChart[i].paymentDetailVOList[j].pynmCnt);
	    		 }
	    	 }
	    	 
	    	 console.log("값이 들어갔니?1 : ", pricePieLabels);
	    	 console.log("값이 들어갔니?2 : ", pricePieData);
	    	 console.log("값이 들어갔니?3 : ", countPieLabels);
	    	 console.log("값이 들어갔니?4 : ", countPieData);
	    	 
	    	 //누적 금액 파이 차트 시작
	    	 var piePrice = {
	    			 label : ['판매 금액(?)'],
	    			 data : pricePieData,
	    			 backgroundColor : ["#ffa970",
	                     "#cce8ff", "#ffe99c", "#979eba", '#8ecaee']
	    	 }
	    	 
	    	 myPricePie = new Chart(pricePie,{
	    		 type : 'pie',
	    		 data : {
	    			 labels : pricePieLabels,
	    			 datasets : [piePrice]
	    		 },
	    		 options:{
	    			 maintainAspectRatio : false,
	    			 plugins:{
	    				 title:{
	    					 display:true,
	    					 text : '금일 누적 판매 금액(?)'
	    				 }
	    			 }
	    		 }
	    	 })
	    	//누적 금액 파이 차트 끝
	    	
	    	//누적 수량 파이 차트 시작
	    	 var pieCount = {
    			 label : ['판매 수량'],
    			 data : countPieData,
    			 backgroundColor : ["#eeee", "rgba(39,79,76,.5)", "rgba(40,161,130,.5)", "rgba(206,29,22,.5)", 'red']
    		 }
	    	 
	    	 myCountPie = new Chart(countPie,{
	    		 type : 'pie',
	    		 data : {
	    			 labels : countPieLabels,
	    			 datasets : [pieCount]
	    		 },
	    		 options:{
	    			 maintainAspectRatio : false,
	    			 plugins:{
	    				 legend:{
	    					position : 'right' 
	    				 },
	    				 title:{
	    					 display:true,
	    					 text : '금일 누적 판매 수량(?)'
	    				 }
	    			 }
	    		 }
	    	 })
	    	 //누적 수량 파이 차트 끝
	    	 //////////// 파이 차트 끝 //////////////
	    	 
	    	 //라인 차트 시작하기
	    	 var lineChart = $('#line-Chart');
	    	 
	    	 //라인차트 데이터 배열에 저장
	    	 var lineLabels =[];
	    	 var lineData = [];
	    	 
	    	 for(var i = 6; i>=0; i--){
	    		 lineLabels.push(result.lineChart[i].yyyymmdd);
	    		 lineData.push(result.lineChart[i].paymentTotal);
	    	 }
	    	 
	    	 var linePrice = {
	    			 label : ['매출액'],
	    			 data : lineData,
	    			 backgroundColor:["rgba(39,79,76,.5)"]
	    	 }
	    	 
	    	 myLineChart = new Chart(lineChart,{
	    		 type:'line',
	    		 data:{
	    			 labels : lineLabels,
	    			 datasets:[linePrice]
	    		 },
	    		 options:{
	    			 maintainAspectRatio: false,
	    			 plugins:{
	    				 title:{
	    					 display:true,
	    					 text : '최근 7일 매출 추이'
	    				 }
	    			 }
	    		 }
	    	 })
	    	 //라인 차트 끝
	     }
	})
		
	})
	
	

	
})
</script>

