<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

<style>
.table-responsive {
	cursor: default;
	overflow-x: clip;
}

.dataTables_paginate {
	margin-top: 20px !important;
}

.chart-container {
	width: 400px;
	height: 400px;
	border: 1px solid #ddd;
	padding: 10px;
	border-radius: 8px;
}

#line-chart { 0
	/* 	margin-right:50px; */
	
}

.chart-container-JY {
	display: flex;
	flex-direction: row;
}
</style>

<link rel="stylesheet" href="chart.css">

<br />
<br />
<br />
${frcsSalesPurchaseVOList}

<!--/////////////////상단 차트 시작/////////////////-->
<div class="col-sm-12 col-lg-12">
	<div class="chart-container-JY">
		<div class="card"
			style="width: 400px; margin-left: 100px; margin-right: 40px;">
			<div class="chart-container">
				<canvas id="line-chart"></canvas>
			</div>
		</div>
		<div class="card" style="width: 400px;">
			<div class="chart-container">
				<canvas id="pie-chart"></canvas>
			</div>
		</div>
	</div>
</div>
<!--/////////////////상단 차트 끝/////////////////-->

<!--/////////////////하단 그리드 시작/////////////////-->
<div class="card">
	<div class="card card-body">
		<div class="table-responsive">
			<table class="table search-table align-middle text-nowrap"
				id="frcsSalesPurchaseVO">
				<thead class="header-item">
					<tr>
						<th style="background-color: lightgrey;">
							<div class="n-chk align-self-center text-center">
								<div class="form-check">
									<input type="checkbox" class="form-check-input primary"
										id="contact-check-all"> <label
										class="form-check-label" for="contact-check-all"></label> <span
										class="new-control-indicator"></span>
								</div>
							</div>
						</th>
						<th style="background-color: lightgrey;">제목</th>
						<th style="background-color: lightgrey;">매출액</th>
						<th style="background-color: lightgrey;">매출 날짜</th>
						<th style="background-color: lightgrey;"></th>
					</tr>
				</thead>
				<tbody>
					<!-- start row -->
					<c:choose>
						<c:when test="${fn:length(frcsSalesPurchaseVOList) > 0}">
							<c:forEach items="${frcsSalesPurchaseVOList}"
								var="frcsSalesPurchaseVO" varStatus="stat">
								<tr class="search-items">
									<td>
										<div class="n-chk align-self-center text-center">
											<div class="form-check">
												<input type="checkbox"
													class="form-check-input contact-chkbox primary"
													id="checkbox1"> <label class="form-check-label"
													for="checkbox1"></label>
											</div>
										</div>
									</td>

									<td>
										<div class="d-flex align-items-center">
											<div class="ms-3">
												<div class="user-meta-info">
													<fmt:formatDate value="${frcsSalesPurchaseVO.pynmDt}"
														dateStyle="long" />
													매출액
												</div>
											</div>
										</div>
									</td>
									<td>${frcsSalesPurchaseVO.total}</td>
									<td><fmt:formatDate value="${frcsSalesPurchaseVO.pynmDt}"
											dateStyle="medium" /></td>
									<td>
										<div class="action-btn">
											<button type="button"
												class="btn mb-1 waves-effect waves-light bg-primary-subtle text-primary">
												<a href="/frcs/salespurchase/daysDetail?pynmDt=<fmt:formatDate pattern="yyyy-MM-dd" value="${frcsSalesPurchaseVO.pynmDt}"/>">상세</a></button>
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

<script type="text/javascript">
$(function(){
	
	console.log("이거냐공@@@", '${frcsSalesPurchaseVOList}');
	console.log("이거냐공@@@", '${frcsSalesPurchaseVOList[0].frcsNo}');
	
	//여기에 들어있는 frcsNo 값을 데이터에 넣어햐함
	
	let data={"frcsNo":${frcsSalesPurchaseVOList[0].frcsNo}};
	console.log("frcsNo@@@@ : ", data)
	
	$.ajax({
		url:"/frcs/salespurchase/days",
		contentType:"application/json;charset=utf-8",
		type:"post",
		data:JSON.stringify(data),
		dataType:"json",
		async:false,
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success:function(result){
			//맵에서 요로코롬 꺼내 쓰도록
			console.log("result 뤼졸트@@: "+result.result);
			console.log("pie 뤼졸트@@: "+result.pie);
			//console.log("result : " + result[0].total);
			//차트의 data 값을 넣어볼게
			
			//line차트 data 값
			var value = result.result[0].total;
			var value2 = result.result[1].total;
			var value3 = result.result[2].total;
			var value4 = result.result[3].total;
			var value5 = result.result[4].total;
			var value6 = result.result[5].total;
			var value7 = result.result[6].total;
 			var value8 = result.result[7].total;
			var value9 = result.result[8].total;
			var value10 = result.result[9].total;
			var value11 = result.result[10].total;
			var value12 = result.result[11].total;
			var value13 = result.result[12].total;
			var value14 = result.result[13].total; 
		
			console.log("외않되?", value14);
			
			//pie차트 data 값
			var pieLabel1 = result.pie[0].menuNm;
			var pieLabel2 = result.pie[1].menuNm;
			var pieLabel3 = result.pie[2].menuNm;
			var pieLabel4 = result.pie[3].menuNm;
			
			var pieData1 = result.pie[0].pynmCnt;
			var pieData2 = result.pie[1].pynmCnt;
			var pieData3 = result.pie[2].pynmCnt;
			var pieData4 = result.pie[3].pynmCnt;
			
			console.log("왔냐"+value); //들어갔음80000
			
			////////////////////썩세스에서 다 차트를 때려 넣어야한다//////////////////////////

						var mychart = $('#line-chart');
						var pie = $("#pie-chart")
						
						// line차트 data 값 설정하기 시작 //
						var lastweek={
								label : '지난주',
								data : [value, value2, value3, value4, value5, value6, value7],
								backgroundColor : 'black',
								borderColor : 'black',
								borderWidth : 1,
								lineTension:0,
								fill : false
						} 
						
						var thisweek={
								label : '이번주',
								data : [value8, value9, value10, value11, value12, value13, value14],
								backgroundColor : 'red',
								borderColor : 'red',
								borderWidth : 1,
								lineTension:0,
								fill : false
						} 
						// line차트 data 값 설정하기 끝 //
						
						// line차트 생성하기  시작//
						var myLineChart = new Chart(mychart, {
							type : 'line',
							data : {
								labels : [ '월', '화', '수', '목', '금', '토', '일' ],
								datasets : [ 
									lastweek,
									thisweek
								]
							},
							options : {
								maintainAspectRatio : false,
							}
						});
						// line차트 생성하기 끝 //
						
						//pie차트 data 값 설정하기 시작//
						var piepie={
								label : '메뉴 판매 비율',
								data:[pieData1, pieData2, pieData3, pieData4],
								backgroundColor : ["rgba(242,166,54,.5)", "rgba(39,79,76,.5)", "rgba(40,161,130,.5)", "rgba(206,29,22,.5)"]
						}
						//pie차트 data 값 설정하기 끝//
						
						// pie차트 생성하기 시작//
						var myPieChart = new Chart(pie,{
							type : 'pie',
							data : {
								labels : [pieLabel1, pieLabel2, pieLabel3, pieLabel4],
								datasets :[
									piepie
								]
							},
							options : {
								maintainAspectRatio : false,
							}
						});
						// pie차트 생성하기 끝//

			////////////////////라인차트 끝//////////////////////////
		},
		error:function(xhr){
			console.log(xhr);
		}
	})
})
</script>

<script
	src="/resources/bootstrap/src/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script>
	

	$("#frcsSalesPurchaseVO").DataTable({
						pageLength : 5,
						bLengthChange : false,
						info : false,
						order : []
					});
</script>
