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
.table-thead {
	text-align: center;
}

.table-tbody {
	text-align: center;
}

.table-tbody-number {
	text-align: right;
}

.card {
	min-width: 600px !important;
}

.chart-container {
	width: 400px;
	height: 400px;
	/* 	border: 1px solid #ddd; */
	padding: 10px;
	/* 	border-radius: 8px; */
}

.card-wrap {
	display: flex;
	gap: 16px;
}

.border-bottom.title-part-padding {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
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
</style>

<%-- <p>${frcsOrderDetailVOList}</p> --%>
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
						<li class="breadcrumb-item text-muted" aria-current="page">매입
							분석</li>
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
<!-- 우측 차트 시작 -->
<div class="card"
	style="width: 100%; height: 400px; display: flex; flex-direction: row; justify-content: space-around;">
	<div class="chart-container">
		<canvas id="pie-chart"></canvas>
	</div>
	<div class="chart-container">
		<canvas id="bar-chart"></canvas>
	</div>
</div>
<!-- 우측 차트 끝 -->

<%-- <p>${frcsOrderDetailVOList}</p> --%>
<div class="card-wrap">
	<div class="card" style="width: 100%;">
		<div class="border-bottom title-part-padding">
			<div>
				<form id="frm">
					<button class="date-btns" type="submit" name="viewDate"
						value="${previousMonth}">
						<i class='bx bxs-left-arrow'></i>
					</button>
					<h4 class="card-title mb-0">${viewDate}월 매입내역</h4>
					<button class="date-btns" type="submit" name="viewDate"
						value="${nextMonth}"
						<c:if test="${nextMonth gt crrDate}">disabled</c:if>>
						<i class='bx bxs-right-arrow'></i>
					</button>
				</form>
			</div>

		</div>
		<div class="card-body">
			<div class="tablesaw-bar tablesaw-mode-stack"></div>
			<table
				class="tablesaw no-wrap table-bordered table-hover table tablesaw-stack"
				data-tablesaw-mode="stack" id="tablesaw-2564">
				<thead class="table-thead">
					<tr>
						<th scope="col" data-tablesaw-priority="persist" class="border"
							style="background-color: #eeddff; color: #495057;">항목</th>
						<th scope="col" data-tablesaw-sortable-default-col=""
							data-tablesaw-priority="3" class="border"
							style="background-color: #eeddff; color: #495057;">매입 수량</th>
						<th scope="col" data-tablesaw-priority="2" class="border"
							style="background-color: #eeddff; color: #495057;">매입 단가(원)</th>
						<th scope="col" data-tablesaw-priority="4" class="border"
							style="background-color: #eeddff; color: #495057;">총 매입
							금액(원)</th>
					</tr>
				</thead>
				<!-- start row -->
				<tbody class="table-tbody">
					<c:choose>
						<c:when test="${fn:length(frcsOrderDetailVOList)>0}">
							<c:set var="totalOrderAmt" value="0" />
							<c:forEach items="${frcsOrderDetailVOList}"
								var="frcsOrderDetailVO" varStatus="stat">
								<tr>
									<td>${frcsOrderDetailVO.productVO.prdctNm}</td>
									<td class="text-end"><fmt:formatNumber type="number"
											maxFractionDigits="3"
											value="${frcsOrderDetailVO.frcsOrderQy}" /></td>
									<td class="text-end"><fmt:formatNumber type="number"
											maxFractionDigits="3"
											value="${frcsOrderDetailVO.productVO.prdctRcvnAmt}" /></td>
									<td class="text-end"><fmt:formatNumber type="number"
											maxFractionDigits="3"
											value="${frcsOrderDetailVO.frcsOrderVOList[0].frcsOrderOrderAmt}" /></td>
								</tr>
								<c:set var="totalOrderAmt"
									value="${totalOrderAmt + frcsOrderDetailVO.frcsOrderVOList[0].frcsOrderOrderAmt}" />
							</c:forEach>
						</c:when>
					</c:choose>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>합계</td>
						<td></td>
						<td></td>
						<td class="text-end"><fmt:formatNumber type="number"
								maxFractionDigits="3" value="${totalOrderAmt}" /></td>
					</tr>
				</tbody>
				<!-- end row -->

			</table>
		</div>
	</div>


</div>

<!-- 파이파이 -->
<script>

const token = $("meta[name='_csrf']").attr("content");
const header = $("meta[name='_csrf_header']").attr("content");

const veiwDate = $("#viewDate").val();
const thisPageDateJson = {"viewDate": veiwDate}
const detTbody = $("#det-info-area");

</script>

<script type="text/javascript">

$(function(){
	
	console.log("${viewDate}@@@" + '${viewDate}');
	console.log("${previousMonth}@@@" + '${previousMonth}');
	
	console.log("찍히니? 형아랑 똑같구나", '${frcsOrderDetailVO}');
	
	let data={
			"frcsNo" : ${frcsOrderDetailVO.frcsNo},
			"viewDate" : '${viewDate}'		
	};
	
	console.log("@@frcsNo@@ : ", data)
	
	$.ajax({
		url:"/frcs/salespurchase/purchaseAnalysis",
		contentType:"application/json;charset=utf-8",
		type:"post",
		data:JSON.stringify(data),
		dataType:"json",
		async:false,
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success:function(result){
			//맵에서 요로코롬 꺼내 쓰자
			console.log("파이파이파이 : " + result.pie);
			console.log("바바바바바바 : " + result.bar);
			console.log("result.pie의 길이: ", result.pie.length)
			
// 			console.log("1월이 나올거야 : ", result.bar[0].yyyymm);
			
			
			/* 이건 OK */
//  		console.log("이게 되나? : " + result.pie[0].frcsOrderQy);
// 			console.log("이게 되나? : " + result.pie[1].frcsOrderQy);
// 			console.log("이게 되나? : " + result.pie[2].frcsOrderQy);
// 			console.log("이게 되나? : " + result.pie[3].frcsOrderQy);
			
// 			console.log("메뉴명 : " + result.pie[0].productVO.prdctNm);
// 			console.log("메뉴명 : " + result.pie[1].productVO.prdctNm);
// 			console.log("메뉴명 : " + result.pie[2].productVO.prdctNm);
// 			console.log("메뉴명 : " + result.pie[3].productVO.prdctNm); 
			
//  	  	console.log("12월 : "+result.bar[11].total);
//  	  	console.log("7월 : "+result.bar[6].total);
			
 	  		//파이차트, 바차트 선언 때리기
 	  		var mypie = $('#pie-chart');
 	  		var mybar = $('#bar-chart');
 	  		
			// pie 데이터를 배열에 저장
			var pieLabels = [];
			var pieData = [];
			for (var i = 0; i < result.pie.length; i++) {
			    pieLabels.push(result.pie[i].productVO.prdctNm);
			    pieData.push(result.pie[i].frcsOrderQy);
			}

			/* 파이 차트 data*/
			var piepie = {
				label : ['매입 수량'],
				data : pieData,
				backgroundColor : [ "rgba(242,166,54,.5)",
						"rgba(39,79,76,.5)", "rgba(40,161,130,.5)", "rgba(206,29,22,.5)", 'red' ]
			}
 	  		
			/* 파이차트 생성 */
			var myPieChart = new Chart(mypie, {
				type : 'pie',
				data : {
					
					labels : pieLabels,
					datasets : [ piepie ]
				},
				
				options : {
					maintainAspectRatio : false,
					plugins: {
						title:{
							display:true,
							text:'${viewDate}월 매입 항목'
						}
// 				,
// 				          legend: {
// 				            position: 'right',
// 				          }
					}
				}
			})
 	  		
			// bar 데이터를 배열에 저장
			var barData = [];
			for (var i = 0; i < result.bar.length; i++) {
			    barData.push(result.bar[i].total);
			}
 	  		
			/* 바 차트 data */
			var baryear = {
				type : 'bar',
				label : '월별 매입액(원)',
				data : barData,
				backgroundColor : 'rgba(242,166,54,.5)',
				borderColor : 'black',
				borderWidth : 1,
				fill : false
			}
 	  		
			/* 바 차트 생성  */
			var myLineChart = new Chart(mybar,
					{
						type : 'bar',
						data : {
							labels : [ '1월', '2월', '3월', '4월',
									'5월', '6월', '7월', '8월', '9월',
									'10월', '11월', '12월', '1월' ],
							datasets : [ baryear ]
						},
						options: {
						    maintainAspectRatio: false,
						    scales: {
						        y: {
						            beginAtZero: true
						        }
						    }
						}
					})
		}
	})
})
</script>




