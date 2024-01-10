<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>



<style>
.card {
	min-width: 600px !important;
}

/* .chart-container { */
/* 	width: 600px; */
/* 	height: 600px; */
/* 	border: 1px solid #ddd; */
/* 	padding: 10px; */
/* 	border-radius: 8px; */
/* } */
.chart-container {
	width: 700px;
	height: 700px;
	/* 	border: 1px solid #ddd; */
	padding: 10px;
	/* 	border-radius: 8px; */
}

.card-wrap {
	display: flex;
	gap: 16px;
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

/* #publicdues-pie-container { */
/* 	display: none; */
/* } */

/* #royalty-pie-container { */
/* 	display: none; */
/* } */
</style>

<%-- ${paymentVOList} --%>
<!-- <hr /> -->
<%-- ${frcsOrderVOList} --%>
<!-- <hr /> -->
<%-- ${royaltyVOList} --%>
<!-- <hr /> -->
<%-- ${publicduesVOList} --%>


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
						<li class="breadcrumb-item text-muted" aria-current="page">영업이익
							분석</li>
					</ol>
				</nav>
			</div>
			<div class="col-3">
				<div class="text-center mb-n5">
					<img src="/resources/image/logo_black.png" alt=""
						class="img-fluid mb-n4">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 브레드 크럼 끝  -->

<div class="card">
	<form id="frm" class="text-center">
		<button class="date-btns" type="submit" name="viewDate"
			value="${previousMonth}">
			<i class='bx bxs-left-arrow'></i>
		</button>
		<strong>${viewDate}월</strong>
		<button class="date-btns" type="submit" name="viewDate"
			value="${nextMonth}"
			<c:if test="${nextMonth gt crrDate}">disabled</c:if>>
			<i class='bx bxs-right-arrow'></i>
		</button>
	</form>
</div>
<div class="card-wrap">
	<div class="card" style="width: 100%; height: 600px;">
		<div class="border-bottom title-part-padding">
			<h4 class="card-title mb-0">${viewDate}월 영업 이익</h4>
		</div>
		<div class="card-body">
			<table
				class="tablesaw table-striped table-hover table-bordered table no-wrap tablesaw-columntoggle"
				data-tablesaw-mode="columntoggle" id="tablesaw-1233">
				<thead>
					<tr class="text-center">
						<th scope="col" data-tablesaw-sortable-col=""
							data-tablesaw-priority="persist" class="border">항목</th>
						<th scope="col" data-tablesaw-sortable-col=""
							data-tablesaw-priority="4" class="border tablesaw-priority-4">
							금액(원)</th>
					</tr>
				</thead>
				<c:set var="total"
					value="${paymentVOList.paymentTotal-frcsOrderVOList.total-publicduesVOList.publicduesTotal-royaltyVOList.ryTotalAmt+royaltyVOList.ryOrderAmt}" />

				<tbody>
					<tr>
						<td class="title">매출액</td>
						<td class="tablesaw-priority-3 text-end"><fmt:formatNumber
								type="number" maxFractionDigits="3"
								value="${paymentVOList.paymentTotal}" /> 원</td>
					</tr>
					<tr id="purchase-row">
						<td class="title">매입가</td>
						<td class="tablesaw-priority-3 text-end">- <fmt:formatNumber
								type="number" maxFractionDigits="3"
								value="${frcsOrderVOList.total}" /> 원
						</td>
					</tr>
					<tr id="publicdues-row">
						<td class="title">공과금</td>
						<td class="tablesaw-priority-3 text-end">- <fmt:formatNumber
								type="number" maxFractionDigits="3"
								value="${publicduesVOList.publicduesTotal}" /> 원
						</td>
					</tr>
					<tr id="royalty-row">
						<td class="title">본사 청구액</td>
						<td class="tablesaw-priority-3 text-end">- <fmt:formatNumber
								type="number" maxFractionDigits="3"
								value="${royaltyVOList.ryTotalAmt-royaltyVOList.ryOrderAmt}" />
							원
						</td>
					</tr>
					<tr>
						<td class="title"></td>
						<td class="tablesaw-priority-3"></td>
					</tr>
					<tr>
						<td class="title">영업 총 이익</td>
						<td class="tablesaw-priority-3 text-end"><fmt:formatNumber
								type="number" maxFractionDigits="3" value="${total}" /> 원</td>
					</tr>
					<c:set var="totalRate" value="${total/paymentVOList.paymentTotal}" />
					<tr>
						<td class="title">영업 총 이익률</td>
						<td class="tablesaw-priority-3 text-end"><fmt:formatNumber
								value="${totalRate * 100}" type="number" maxFractionDigits="0" />%

						
					</tr>
				</tbody>
			</table>
		</div>
	</div>


	<!-- 우측 차트 시작 -->
	<div class="card" style="width: 100%; height: 600px;">
		<div class="chart-container">
			<canvas id="purchase-pie"></canvas>
			<canvas id="publicdues-pie"></canvas>
			<canvas id="royalty-pie"></canvas>
		</div>
	</div>
</div>
<!-- 우측 차트 끝 -->
<script>
const token = $("meta[name='_csrf']").attr("content");
const header = $("meta[name='_csrf_header']").attr("content");

const veiwDate = $("#viewDate").val();
const thisPageDateJson = {"viewDate": veiwDate}
const detTbody = $("#det-info-area");
</script>

<script type="text/javascript">

$(function(){
	
	console.log("${viewDate}#####" + '${viewDate}');
	console.log("${previousMonth}#####" + '${previousMonth}');
	console.log("frcsNo@@@@" + ${paymentVO.frcsNo});
	
	let data={
			"frcsNo" : ${paymentVO.frcsNo},
			"viewDate" : '${viewDate}'
	};
	
	$.ajax({
		url:"/frcs/salespurchase/operatingProfit",
		contentType:"application/json;charset=utf-8",
		type:"post",
	    data:JSON.stringify(data),
	    dataType:"json",
	    async:false,
	    beforeSend:function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	    },
	    success:function(result){
	    	  console.log("됐누?", result);
	    	  
	    	  console.log("로얄티", result.royaltyPie);
	    	  console.log("매입액", result.frcsOrderDetailPie);
	    	  console.log("공과금", result.publicduesPie);
	    	  
// 	    	  $("#purchase-row").on("click", () =>{
// 	    		  $('#purchase-pie-container').css('display', 'block');
// 	    		  $('#publicdues-pie-container').css('display', 'none');
// 	    		  $('#royalty-pie-container').css('display', 'none');
// 	    	  })
	    	  
// 	    	  $("#publicdues-row").on("click", () =>{
// 	    		  $('#purchase-pie-container').css('display', 'none');
// 	    		  $('#publicdues-pie-container').css('display', 'block');
// 	    		  $('#royalty-pie-container').css('display', 'none');
// 	    	  })
	    	  
// 	    	  $("#royalty-row").on("click", () =>{
// 	    		  $('#purchase-pie-container').css('display', 'none');
// 	    		  $('#publicdues-pie-container').css('display', 'none');
// 	    		  $('#royalty-pie-container').css('display', 'block');
// 	    	  })
	    	  
	    	  //@@@@@@@@@@@@매입액 선택해서 매입액 차트 만들기 시작@@@@@@@@@@@@//
	    	  $("#purchase-row").on("click", () =>{
	    		  $('.chart-container').html("");
	    		  $('.chart-container').append("<canvas id='purchase-pie'></canvas>");
	    		  console.log("뭬입웩")
	    		  
	    		  //매입 파이 선언
	    		  var purchasePie = $('#purchase-pie');
	    		  
	    		  //매입액 파이 데이터 배열에 저장
	    		  var purchasePieLabels = [];
	    		  var purchasePieData = [];
	    		  
	    		  for(var i = 0; i < result.frcsOrderDetailPie.length; i++){
	    			  purchasePieLabels.push(result.frcsOrderDetailPie[i].productVO.prdctNm);
	    			  purchasePieData.push(result.frcsOrderDetailPie[i].frcsOrderVOList[0].frcsOrderOrderAmt);
	    			  console.log("purchasePieData -> " + purchasePieData)
	    		  }
	    		  
	    		  // 매입액 파이 data
	    		  var piePurchase = {
	    				  label : ['매입액'],
	    				  data : purchasePieData,
	    				  backgroundColor : ["red", "orange", "yellow", "pink", "black"]
	    		  }
	    		  
	    		  /* 매입액 파이차트 만들기  */
	    		  var myPurchaseChart = new Chart(purchasePie, {
	    			  type : 'doughnut',
	    			  data : {
	    				  labels : purchasePieLabels,
	    				  datasets : [piePurchase]
	    			  },
	    			  options:{
	    				  maintainAspectRatio : false,
	    				  plugins:{
	    					  legend:{
		    						position : 'right', 
		    						labels:{
		    							font:{
		    								size:20
		    							}
		    						}
		    					  },
	    					  title:{
	    						  display:true,
	    						  text:'${viewDate}월 매입 내역',
	    						  padding:20,
	    						  font:{
	    							  size : 25
	    						  }
	    					  }
	    				  }
	    			  }
	    		  })
	    		  console.log("뭬입액 퐈위 잘 맹글어졌는데?")
	    	  })
	    	  //@@@@@@@@@@@@매입액 선택해서 매입액 차트 만들기 끝@@@@@@@@@@@@//
	    	  
	    	  
	    	  
	    	  //@@@@@@@@@@@@공과금 선택해서 매입액 차트 만들기 시작@@@@@@@@@@@@//
	    	  $("#publicdues-row").on("click", () =>{
	    		  $('.chart-container').html("");
	    		  $('.chart-container').append("<canvas id='publicdues-pie'></canvas>");
	    		  console.log("꽁꽈끔")
	    		  
	    		  //전기세 얼마여?
	    		  console.log("전기세", result.publicduesPie[0].duesElectricAmt);	    		  
	    		  
	    		  //공과금 파이 선언
	    		  var publicduesPie = $('#publicdues-pie');
	    		  
	    		  //공과금 파이 data
	    		  var piePublicdues = {
	    				  label : ['공과금'],
	    				  data : [result.publicduesPie[0].duesElectricAmt,
	    					  	  result.publicduesPie[0].duesWaterAmt,
	    					  	  result.publicduesPie[0].duesGasAmt,
	    					  	  result.publicduesPie[0].duesMtrtAmt],
	    				  backgroundColor : ["pink", "black", "yellow", "green"]
	    		  
	    		  }
	    		  
	    		  /* 공과금 파이 차트 만들기  */
	    		  var myPublicduesChart = new Chart(publicduesPie, {
	    			  type : 'doughnut',
	    			  data:{
	    				labels : ['전기세', '수도세', '가스비', '월세'],
	    				datasets:[piePublicdues]
	    			  },
	    			  options:{
	    				  maintainAspectRatio : false,
	    				  plugins:{
	    					  legend:{
	    						position : 'right',
	    						labels:{
	    							font:{
	    								size : 20
	    							}
	    						}
	    					  },
	    					  title:{
	    						  display : true,
	    						  text : '${viewDate}월 공과금 내역',
	    						  padding:20,
	    						  font:{
	    							  size : 25
	    						  }
	    					  }
	    					  
	    				  }
	    			  }
	    		  })
	    		  console.log("꽁꽈끔 퐈위 잘 됐니?")
	    	  })
	    	  //@@@@@@@@@@@@공과금 선택해서 매입액 차트 만들기 끝@@@@@@@@@@@@//
	    	  
	    	  //@@@@@@@@@@@@로열티 선택해서 매입액 차트 만들기 시작@@@@@@@@@@@@//
	    	  $("#royalty-row").on("click", () =>{
	    		  $('.chart-container').html("");
	    		  $('.chart-container').append("<canvas id='royalty-pie'></canvas>");
	    		  console.log("롸얄티")
	    		  
	    		  //로열티 파이 선언
	    		  var royaltyPie = $('#royalty-pie');
	    		  
	    		  //로얄티 파이 data
	    		  var pieRoyalty = {
	    				  label : ['로열티'],
	    				  data : [result.royaltyPie[0].ryFrcsFeeAmt,
	    					 	  result.royaltyPie[0].ryNpmntAmt,
	    					  	  result.royaltyPie[0].ryOvrintAmt,
	    					 	  result.royaltyPie[0].ryRoyaltyAmt],
	    				  backgroundColor:["grey", "yellow", "blue", "pink", "black"]
	    		  }
	    		  
	    		  //로얄티 파이 차트 만들기
	    		  var myRoyaltyChart = new Chart(royaltyPie, {
	    			  type : 'doughnut',
	    			  data : {
	    				  labels : ['가맹비', '미납금액', '연체이자', '로열티'],
	    		  		  datasets : [pieRoyalty]
	    			  },
	    			  options:{
	    				  maintainAspectRatio : false,
	    				  plugins:{
	    					  legend:{
		    						position : 'right',
		    						labels:{
		    							font:{
		    								size:20
		    							}
		    						}
		    					  },
	    					  title:{
	    						  display : true,
	    						  text : '${viewDate}월 본사청구액 내역',
	    						  padding:20,
	    						  font:{
	    							  size:25
	    						  }
	    					  }
	    				  }
	    			  }
	    		  })
	    		  
	    	  })
	    	  console.log("롸얄티 끘")
	    	  //@@@@@@@@@@@@로열티 선택해서 매입액 차트 만들기 끝@@@@@@@@@@@@//
	    }
	})
	
	
})
</script>



