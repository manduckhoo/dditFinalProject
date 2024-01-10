<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/datePicker.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript" defer="defer">
  
  //구글 지도 차트
 
  
//datePicker 옵션
	$.datepicker.setDefaults({
		  dateFormat: 'yy-mm-dd',
		  prevText: '이전 달',
		  nextText: '다음 달',
		  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		  showMonthAfterYear: true,
		  showOtherMonths:true,
		  yearSuffix: '년',
		  changeYear: true, //option값 년 선택 가능
        changeMonth: true, //option값  월 선택 가능
        maxDate : new Date(),
		});
	
	//datePicker
	$( function() {
	    
	    $("#startDate").datepicker({
	        onSelect: function(startDate, inst) {
	            console.log("시작 날짜 선택 ->", startDate);
	            data.startDate = startDate;
	        }
	    });
		
		
	    $("#endDate").datepicker({
	        onSelect: function(endDate, inst) {
	            console.log("종료 날짜 선택 ->", endDate);
	            data.endDate = endDate;
	        }
	    });
	});
	

</script>
<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
  <div class="card-body px-4 py-3">
    <div class="row align-items-center">
      <div class="col-9">
        <h4 class="fw-semibold mb-8">지역별 관리</h4>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a class="text-muted text-decoration-none" href="/admin/main">Home</a>
            </li>
            <li class="breadcrumb-item" aria-current="page">지역별 관리</li>
          </ol>
        </nav>
      </div>
      <div class="col-3">
        <div class="text-center mb-n5">
          <img src="../assets/images/breadcrumb/ChatBc.png" alt="" class="img-fluid mb-n4">
        </div>
      </div>
    </div>
  </div>
</div>
<div class="card">
   		<div class="table-responsive">
       		  <table class="table table-bordered table-dark mb-0 jaeram" >
       		      <tbody>
       		          <tr>
       		              <th scope="row" style="text-align: center; vertical-align: middle; font-size: larger;">기간</th>
       		              <td scope="col" colspan="3"> 
       		              <input type="text" class="datepicker" id="startDate">  ~  <input type="text" class="datepicker" id="endDate">          
       		              <button class="btn btn-outline-dark btn-sm" id="search" type="button" style="margin: 0px 0px 4px 10px;"> 기간 조회</button></td>
       		          </tr>
       		      </tbody>
       		  </table>
       		</div>

	<div class="shop-detail">
	
	</div>
</div>
<script type="text/javascript" defer="defer">

let data= {};
data.region='';
//시작시 실행
 $(document).ready(function(){
	 
	// 현재 날짜를 구함
	let currentDate = new Date();

	// 현재 연도에서 1을 빼서 작년을 구함
	let lastYear = currentDate.getFullYear() - 1;

	// 작년의 1월 1일
	let startOfLastYear = new Date(lastYear, 0, 1).toISOString().split('T')[0];

	// 올해의 1월 1일
	let startOfThisYear = new Date(currentDate.getFullYear(), 0, 1);

	// 작년의 마지막 날짜 (올해의 1월 1일에서 하루를 빼서 계산)
	let endOfLastYear = new Date(startOfThisYear - 1).toISOString().split('T')[0];
	

	console.log("시작 날짜: ", startOfLastYear);
	console.log("종료 날짜: ", endOfLastYear);
	
	data.startDate = '2023-01-01';
	data.endDate = endOfLastYear;
	
	$("#startDate").val(data.startDate);
	$("#endDate").val(data.endDate);
	

	
	console.log("data -> ",data);
		
	detail(data);


	
 });

 //전체 카테고리의 조회 버튼
	$(document).on("click", "#search", function(){
		
		data.title= "기간 (" + data.startDate + " ~ " +data.endDate+")";
		$("#rangeTitle").html(data.title);
		
		console.log("시작할떄 data ->",data);
		detail(data);
    	
	});
 	
 function detail(data){
	 console.log("detail data ->",data);
	 $.ajax({
		 url : "/admin/hqSales/regionList",
		 type: "post",
		 contentType: "application/json;charset=utf-8",
		 data : JSON.stringify(data),
		 dataType : "json",
		 beforeSend:function(xhr){
             xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        },
        success : function(result){
        	console.log("detail success -> ", result);
        	
        	var gchartMap = new Map();
        	gchartMap.set('Province', 'Sales');
        	
        	
        	//매출 합계
        	let total = result[0].TOTAL_PRICE;
        	console.log("매출 합계 ->",total);
        	
        	//매칠 가장 상위 지역
        	let firstRegion = result[1].REGION_NAME;
        	console.log("매출 상위 지역 ->",firstRegion);
        	
        	console.log("지역이 바뀌는지 확인해보자 ->",data);
        	
        	if (data.region == '' || data.region == firstRegion){
        		data.region = firstRegion;
        	}
        	console.log("바꼇냐 ->",data);
        	
        	
        	var tableBody = "";
        	// 테이블 만드는 for문
        	for (var i = 1; i < result.length; i++) {
        		//map에 값을 다 넣어줌
        		gchartMap.set(result[i].REGION_NAME,result[i].TOTAL_PRICE);
        		
        		if(result[i].REGION_NAME=='서울'){
        			result[i].REGION_NAME='서울특별시';
        		}
        		
        	    tableBody += 
    	            `<tr>
    	                <td>\${result[i].REGION_NAME}</td>
    	                <td>\${(result[i].TOTAL_PRICE).toLocaleString('ko-KR')}</td>
    	                <td>\${((result[i].TOTAL_PRICE / total) * 100).toFixed(1)}%</td>
    	            </tr>
    	            `;
        		}
        	//map에 넣은 data 배열화
        	var gchartArray = Array.from(gchartMap);
        	
        	console.log("이게 지도차트dataArray ->", gchartArray);
        	
        	let str =
        		`
        		
            <div class="card shadow-none border">
              <div class="card-body p-4">
                <div class="row">
                  <div class="col-lg-6">
          <h3>지역별 매출 현황</h3>        
              
               <div class="table-responsive">
						<table class="table table-bordered border-dark">
						    <thead class="bg-inverse text-white tableColor">
						        <tr>
						            <th>지역</th>
						            <th>매출액</th>
						            <th>매출비율</th>
						        </tr>
						    </thead>
						    <tbody>
							
						    \${tableBody}
							        	
						    </tbody>
						    <tfoot class="tableColor">
						    	<tr>
							    	<td>합계</td>
		        	                <td>\${(total).toLocaleString('ko-KR')}</td>
		        	                <td>-</td>
						    	</tr>
						</table>
					</div>
              
                  
                  </div>
                  <div class="col-lg-6">
                  <div id="regions_div" style="width: 700px; height: 600px;"></div>
                  </div>
                </div>
              </div>
            </div>
        		`
        	$(".shop-detail").html(str);	
        	
      
        		
        	      google.charts.load('current', {
        	    	    'packages':['geochart'],
        	    	    // Note: you will need to get a mapsApiKey for your project.
        	    	    // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
        	    	    'mapsApiKey': ''
        	    	  });
        	    	  google.charts.setOnLoadCallback(drawRegionsMap);

        	    	  function drawRegionsMap() {
        	    	    var data2 = google.visualization.arrayToDataTable(gchartArray);

        	    	    var options = {
        	    	            region: 'KR', // 한국 지도
        	    	            displayMode: 'regions',
        	    	            resolution: 'provinces',
        	    	            keepAspectRatio: false, // 종횡비 유지 안 함
        	    	            colorAxis: {colors: ['#e5f5e0', '#006d2c']} // 색상 범위
        	    	          };

        	    	    var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));
        	    	    
        	    	    google.visualization.events.addListener(chart, 'select', function() {
        	    	        var selection = chart.getSelection();
        	    	        if (selection.length === 1) {
        	    	          var selectedRegion = data2.getValue(selection[0].row, 0);
        	    	          // 선택된 지역 이름을 가져옵니다.
        	    	          data.region = selectedRegion;
        	    	          console.log("선택한 지역 ->",data.region);
        	    	          detail(data);
        	    	        }
        	    	      });
        	    	    
        	    	    chart.draw(data2, options);
        	    	  }
        	      
        	    		chartData(data);	
        	  
        	    		
        } //succes 끝
	 })//ajax끝
 }// function detail 끝

  
	 function chartData(data){
	 console.log("chartData ->",data);
		 $.ajax({
			 url : "/admin/hqSales/regionChartData",
			 type: "post",
			 contentType: "application/json;charset=utf-8",
			 data : JSON.stringify(data),
			 dataType : "json",
			 beforeSend:function(xhr){
	             xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	        },
	        success : function(result){
	        	console.log("charData -> ",result);
	        	
	        	   //메뉴 목록
	        	var menu = result.menu;
	        	
	        	if(menu.length > 0 && menu[menu.length-1].TOTAL_PRICE != null){   
	        		
	        	var menuTotalPrice = menu[menu.length-1].TOTAL_PRICE
	        	var menuTotalCnt = menu[menu.length-1].CNT
	        	
	        	//가맹점 목록
	        	var frcs = result.frscList
	        	var frcsTotalPrice = frcs[frcs.length-1].TOTAL_PRICE
	        	
	         
	        	
	        	//월별 매출
	        	var sales = result.sales;
	        	var prices = sales.map(sale => sale.TOTAL_PRICE);
	        	var months = sales.map(sale => sale.PAYMENT_MONTH);
	        	
				data.prices =prices;
				data.months = months;
				//각 탭의 title
				var chartTitle = data.region + "의 월별 매출 ("+data.startDate +" ~ "+data.endDate+")" ;
				
				var frcsListTitle = data.region + "의 가맹점 목록"
				
				var menuTitle = data.region + "의 메뉴 판매 순위"
				
	           //가맹점 목록 table 
	        	var frcsListTableBody = "";
	        	// 테이블 만드는 for문
	        	for (var i = 0; i < frcs.length-1; i++) {
	        		
	        		
	        		frcsListTableBody += 
	    	            `<tr>
	        				<td>\${i+1}</td>
	    	                <td>\${frcs[i].FRCS_NM}</td>
	    	                <td>\${(frcs[i].TOTAL_PRICE).toLocaleString('ko-KR')}</td>
	    	                <td>\${((frcs[i].TOTAL_PRICE / frcsTotalPrice) * 100).toFixed(1)}%</td>
	    	            </tr>
	    	            `;
	        		}
	            
	            //매출 top10 table
	        	var MenutableBody = "";
	        	// 테이블 만드는 for문
	        	for (var i = 0; i < menu.length-1; i++) {
	        		
	        		MenutableBody += 
	    	            `<tr>
	    	                <td>\${i+1}</td>
	    	                <td>\${menu[i].CTGRY_DETAIL_NM}</td>
	    	                <td>\${menu[i].MENU_NM}</td>
	    	                <td>\${menu[i].CNT}</td>
	    	                <td>\${(menu[i].TOTAL_PRICE).toLocaleString('ko-KR')}</td>
	    	                <td>\${((menu[i].TOTAL_PRICE / menuTotalPrice) * 100).toFixed(1)}%</td>
	    	            </tr>
	    	            `;
	        		}
	        	
	         
	        	
	            var bottomStr=
	            	`
	            	 <div class="card shadow-none border">
	              <div class="card-body p-4">
	                <ul class="nav nav-pills user-profile-tab border-bottom" id="pills-tab" role="tablist">
	                  <li class="nav-item" role="presentation">
	                    <button class="nav-link position-relative rounded-0 active d-flex align-items-center justify-content-center bg-transparent fs-3 py-6" id="pills-description-tab" data-bs-toggle="pill" data-bs-target="#pills-description" type="button" role="tab" aria-controls="pills-description" aria-selected="true">
	                      월별 매출 
	                     
	                    </button>
	                  </li>
	                  <li class="nav-item" role="presentation">
	                    <button class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-6" id="pills-reviews-tab" data-bs-toggle="pill" data-bs-target="#pills-reviews" type="button" role="tab" aria-controls="pills-reviews" aria-selected="false" tabindex="-1">
	                      가맹점 목록
	                    </button>
	                  </li>
	                  <li class="nav-item" role="presentation">
	                    <button class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-6" id="pills-top-tab" data-bs-toggle="pill" data-bs-target="#pills-top" type="button" role="tab" aria-controls="pills-top" aria-selected="false" tabindex="-2">
	                      메뉴 판매 순위
	                    </button>
	                  </li>
	                </ul>
	                <div class="tab-content pt-4" id="pills-tabContent">
	                  
	                  <div class="tab-pane fade show active" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab" tabindex="0">
	                    <h5 class="fs-5 fw-semibold mb-7" id="barTitle">\${chartTitle}</h5>                  
		                      
	                       <div id="chartBar"></div>
	                    
	                  </div>
	                  
	                  <div class="tab-pane fade" id="pills-reviews" role="tabpanel" aria-labelledby="pills-reviews-tab" tabindex="0">
			           <h5 class="fs-5 fw-semibold mb-7" id="frcsListTitle">\${frcsListTitle}</h5>
	              		        
	              	            <div class="table-responsive">
	    						<table class="table table-bordered border-dark">
	    						    <thead class="bg-inverse text-white tableColor">
	    						        <tr>
	    						            <th>순번</th>
	    						            <th>가맹점명</th>
	    						            <th>매출액</th>
	    						            <th>매출비율</th>
	    						        </tr>
	    						    </thead>
	    						    <tbody>
	    							
	    						    \${frcsListTableBody} 
	    							        	
	    						    </tbody>
	    						    <tfoot class="tableColor">
	    						    	<tr>
	    							    	<td>합계</td>
	    							    	<td>-</td>
	    		        	                <td>\${(frcsTotalPrice).toLocaleString('ko-KR')}</td>
	    		        	                <td>-</td>
	    						    	</tr>
	    						</table>
	    					</div>
	    					
						                     
	                  </div>
	                  
	                   <div class="tab-pane fade" id="pills-top" role="tabpanel" aria-labelledby="pills-top-tab" tabindex="0">
	                    <h5 class="fs-5 fw-semibold mb-7" id="menuTitle">\${menuTitle}</h5>                  
	                	
			                   <div class="table-responsive">
	   						<table class="table table-bordered border-dark">
	   						    <thead class="bg-inverse text-white tableColor">
	   						        <tr>
	   						            <th>순번</th>
	   						            <th>카테고리</th>
	   						            <th>메뉴 명</th>
	   						            <th>판매 개수</th>
	   						            <th>매출 금액</th>
	   						            <th>매출 비율</th>
	   						            
	   						        </tr>
	   						    </thead>
	   						    <tbody>
	   						
	   						     \${MenutableBody} 
	   							        	
	   						    </tbody>
	   						    <tfoot class="tableColor">
	   						    	<tr>
	   							    	<td>합계</td>
	   		        	                <td>-</td>
	   		        	                <td>-</td>
	   		        	                <td>\${(menuTotalCnt).toLocaleString('ko-KR')}</td>
	   		        	                <td>\${(menuTotalPrice).toLocaleString('ko-KR')}</td>
	   		        	                <td>-</td>
	   						    	</tr>
	   						</table>
	   					</div>
	                  </div>
	                  
	                  
	                </div>
	              </div>
	            </div>
	            	`
	            $(".shop-detail").append(bottomStr);
	            
	            		console.log("chartbar ~~",document.querySelector("#chartBar"));
	            		console.log("prices : ", prices);
	            		console.log("months : ", months);
	            		
	            		
	        	var options2 = {
	        			series: [{
        				  name: 'price',
        				  data: prices
        				}], 
            	        chart: {
            	        type: 'bar',
            	        height: 350,
            	        stacked: true,
            	        toolbar: {
            	          show: true
            	        },
            	        zoom: {
            	          enabled: true
            	        }
            	      },
            	      plotOptions: {
            	        bar: {
            	          horizontal: false,
            	          dataLabels: {
            	            total: {
            	              enabled: true,
            	              style: {
            	                fontSize: '13px',
            	                fontWeight: 900
            	              }
            	            }
            	          }
            	        },
            	      },
            	      xaxis: {
            	        categories: months,
            	      },
            	      legend: {
            	        position: 'right',
            	        offsetY: 40
            	      },
            	      fill: {
            	        opacity: 1
            	      }
            	      };

            	      var chart = new ApexCharts(document.querySelector("#chartBar"), options2);
            	      chart.render();
	        	}else{
	        		let nodata = '<br><br><h1 style="text-align: center;">No Data</h1><br><br><br>'
	        		 $(".shop-detail").append(nodata);
	        	}	
	           
	        } //success 끝
	 	}); // ajax 끝
	 } // 함수 끝

      
</script>
