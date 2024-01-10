<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.table {
    --bs-table-color-type: initial;
    --bs-table-bg-type: initial;
    --bs-table-color-state: initial;
    --bs-table-bg-state: initial;
    --bs-table-color: var(--bs-emphasis-color);
    --bs-table-bg: inherit; 
    --bs-table-border-color: #ebf1f6;
    --bs-table-accent-bg: transparent;
    --bs-table-striped-color: var(--bs-emphasis-color);
    --bs-table-striped-bg: #eaeff4;
    --bs-table-active-color: var(--bs-emphasis-color);
    --bs-table-active-bg: rgba(var(--bs-emphasis-color-rgb), 0.1);
    --bs-table-hover-color: var(--bs-emphasis-color);
    --bs-table-hover-bg: #f6f9fc;
    width: 100%;
    margin-bottom: 1rem;
    vertical-align: top;
    border-color: var(--bs-table-border-color);
}
</style>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/datePicker.css">	


<div class="container-fluid">
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
  <div class="card-body px-4 py-3">
    <div class="row align-items-center">
      <div class="col-9">
        <h4 class="fw-semibold mb-8">카테고리 관리</h4>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a class="text-muted text-decoration-none" href="/admin/main">Home</a>
            </li>
            <li class="breadcrumb-item" aria-current="page">카테고리 관리</li>
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
            <ul class="nav nav-pills user-profile-tab" id="pills-tab" role="tablist">
              <li class="nav-item" role="presentation">
                <button class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-4 active" id="pills-account-tab" data-bs-toggle="pill" data-bs-target="#pills-account" type="button" role="tab" aria-controls="pills-account" aria-selected="true">
                  <i class="ti ti-user-circle me-2 fs-6"></i>
                  <span class="d-none d-md-block">전체</span>
                </button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-4" id="pills-notifications-tab" data-bs-toggle="pill" data-bs-target="#pills-notifications" type="button" role="tab" aria-controls="pills-notifications" aria-selected="false" tabindex="-1">
                  <i class="ti ti-bell me-2 fs-6"></i>
                  <span class="d-none d-md-block">음료</span>
                </button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-4" id="pills-bills-tab" data-bs-toggle="pill" data-bs-target="#pills-bills" type="button" role="tab" aria-controls="pills-bills" aria-selected="false" tabindex="-1">
                  <i class="ti ti-article me-2 fs-6"></i>
                  <span class="d-none d-md-block">푸드</span>
                </button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-4" id="pills-security-tab" data-bs-toggle="pill" data-bs-target="#pills-security" type="button" role="tab" aria-controls="pills-security" aria-selected="false" tabindex="-1">
                  <i class="ti ti-lock me-2 fs-6"></i>
                  <span class="d-none d-md-block">상품</span>
                </button>
              </li>
            </ul>
            <div class="card-body">
     
            
              <div class="tab-content" id="pills-tabContent">
              <!--전체  -->
               
                <div class="tab-pane fade active show" id="pills-account" role="tabpanel" aria-labelledby="pills-account-tab" tabindex="0">
                     <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                      <div class="mb-3 mb-sm-0">
                        <h4 class="card-title fw-semibold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">전체 카테고리 매출</font></font></h4>
                        <p class="card-subtitle mb-0 rangeTitle"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></p>
                      </div>
            			<div ><input type="text" class="datepicker startDate" >  ~  <input type="text" class="datepicker endDate">       		              <button class="btn btn-outline-dark btn-sm" id="search" type="button" style="margin: 0px 0px 4px 10px;"> 기간 조회</button></div>    
                    </div>
                  <div class="row" id="totalBody">
                    <!--전체의 바디   -->
           	
                  <!--바디 끝 -->
                </div>
                </div>
                <!--전체 끝  -->
                
                
                <!--음료 -->
                <div class="tab-pane fade" id="pills-notifications" role="tabpanel" aria-labelledby="pills-notifications-tab" tabindex="0">
                  <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                      <div class="mb-3 mb-sm-0">
                        <h4 class="card-title fw-semibold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">음료 매출</font></font></h4>
                        <p class="card-subtitle mb-0 rangeTitle"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></p>
                      </div>
            			<div ><input type="text" class="datepicker startDate" >  ~  <input type="text" class="datepicker endDate"><button id="search2" type="button"> 기간 조회</button></div>    
                    </div>
                 <div class="row" id="beverageBody">
                    <!-- 바디   -->
           	
                  <!--바디 끝 -->
                </div>
                </div>
                <!--음료 끝  -->
                
                <!-- 푸드 -->
                <div class="tab-pane fade" id="pills-bills" role="tabpanel" aria-labelledby="pills-bills-tab" tabindex="0">
                  <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                      <div class="mb-3 mb-sm-0">
                        <h4 class="card-title fw-semibold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">푸드 매출</font></font></h4>
                        <p class="card-subtitle mb-0 rangeTitle"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></p>
                      </div>
            			<div ><input type="text" class="datepicker startDate" >  ~  <input type="text" class="datepicker endDate"><button id="search3" type="button"> 기간 조회</button></div>    
                    </div>
                 <div class="row" id="foodBody">
               
                  </div>
                </div>
                <!--푸드 끝  -->
                
                <!-- 상품 -->
                <div class="tab-pane fade" id="pills-security" role="tabpanel" aria-labelledby="pills-security-tab" tabindex="0">
                    <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                      <div class="mb-3 mb-sm-0">
                        <h4 class="card-title fw-semibold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품 매출</font></font></h4>
                        <p class="card-subtitle mb-0 rangeTitle"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></p>
                      </div>
            			<div ><input type="text" class="datepicker startDate" >  ~  <input type="text" class="datepicker endDate"><button id="search4" type="button"> 기간 조회</button></div>    
                    </div>
                 <div class="row" id="goodsBody">
               
                  </div>
                </div>
                <!--상품 끝 -->
                
              </div>             
            </div>
          </div>
        </div>
        <script type="text/javascript" defer="defer">
	
        let data = {};
        // 카테고리 들어왔을떄 전체카테고리 탭 보여줌
        $(document).ready(function(){
        	
        	$("#pills-account-tab").click();
        	
        });
        
        //전체를 눌렀을떄 
        $("#pills-account-tab").on("click",function(){
        	
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
			data.title= "기간 (" + data.startDate + " ~ " +data.endDate+")";
			$(".rangeTitle").html(data.title);
			console.log("data -> ",data);
			$(".startDate").val(data.startDate);
			$(".endDate").val(data.endDate);
			
			detail(data); 
        });
        
        //전체 카테고리의 조회 버튼
    	$(document).on("click", "#search", function(){
    		
    		data.title= "기간 (" + data.startDate + " ~ " +data.endDate+")";
    		$(".rangeTitle").html(data.title);
    		
    		console.log(data);
    		detail(data);
    		
    	});
        
        
        //음료를 눌렀을떄 
        $("#pills-notifications-tab").on("click",function(){
        	
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
			

			console.log("시작 날짜2: ", startOfLastYear);
			console.log("종료 날짜2: ", endOfLastYear);
			
			data.startDate = '2023-01-01';
			data.endDate = endOfLastYear;
			data.title= "기간 (" + data.startDate + " ~ " +data.endDate+")";
			$(".rangeTitle").html(data.title);
			console.log("data2 -> ",data);
			
			detail2(data); 
        });
        
        //음료 카테고리의 조회 버튼
    	$(document).on("click", "#search2", function(){
    		
    		data.title= "기간 (" + data.startDate + " ~ " +data.endDate+")";
    		$(".rangeTitle").html(data.title);
    		
    		console.log(data);
    		detail2(data);
    	});
        
        
        //푸드를 눌렀을떄 
        $("#pills-bills-tab").on("click",function(){
        	
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
			

			console.log("시작 날짜3: ", startOfLastYear);
			console.log("종료 날짜3: ", endOfLastYear);
			
			data.startDate = '2023-01-01';
			data.endDate = endOfLastYear;
			data.title= "기간 (" + data.startDate + " ~ " +data.endDate+")";
			$(".rangeTitle").html(data.title);
			console.log("data3 -> ",data);
			
			detail3(data); 
        });
        
        //푸드 카테고리의 조회 버튼
    	$(document).on("click", "#search3", function(){
    		
    		data.title= "기간 (" + data.startDate + " ~ " +data.endDate+")";
    		$(".rangeTitle").html(data.title);
    		
    		console.log(data);
    		detail3(data);
    	});
        
        
        
        //상품을 눌렀을떄 
        $("#pills-security-tab").on("click",function(){
        	
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
			

			console.log("시작 날짜4: ", startOfLastYear);
			console.log("종료 날짜4: ", endOfLastYear);
			
			data.startDate = '2023-01-01';
			data.endDate = endOfLastYear;
			data.title= "기간 (" + data.startDate + " ~ " +data.endDate+")";
			$(".rangeTitle").html(data.title);
			console.log("data4 -> ",data);
			
			detail4(data); 
        });
        
        //상품 카테고리의 조회 버튼
    	$(document).on("click", "#search4", function(){
    		
    		data.title= "기간 (" + data.startDate + " ~ " +data.endDate+")";
    		$(".rangeTitle").html(data.title);
    		
    		console.log(data);
    		detail4(data);
    	});
        
        
        
        
        function detail(data){
        	$.ajax({
        		url : "/admin/hqSales/ctgryList",
        		type : "post",
        		contentType : "application/json; charset=utf-8", 
    			data:JSON.stringify(data),
    			dataType:"json",
    			beforeSend:function(xhr){
    	               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    	          },
    	        success : function(result){
    	        	console.log("detail -> ",result);
    	        	
    	        	let pieChartArray = result.totalSales;
    	        	let maxIndex ="";
    	        	if (pieChartArray.length > 0) {
    	        	    maxIndex = pieChartArray.length - 1;
    	        	    console.log(maxIndex);
    	        	} else {
    	        	    console.log("배열이 비어 있습니다.");
    	        	}
					
    	        	//파이차트에 넣을 데이터 배열 생성
    	        	let pieData = pieChartArray.slice(0, -1).map(sale => sale.ORDERAMOUNT);
    	        	//파이차트에 넣을 데이터 이름
    	        	let pieName = pieChartArray.slice(0, -1).map(sale => sale.CATEGORYNAME);

    	        	console.log("pieData",pieData); // 
    	        	console.log("pieName",pieName); // 
    	        	
    	        	// 카테고리의 판매 매출
    	        	let totalsales = pieChartArray[maxIndex].ORDERAMOUNT;
    	        	// 카테고리의 판매 갯수
    	        	let totalcnt = pieChartArray[maxIndex].SALESCOUNT;
    	        	// 판매된 메뉴의 갯수
    	        	let menuCnt = result.menuCnt.MENUCOUNT; 
    	        	// 최다 판매 메뉴
    	        	let bestMenu =result.topSales.MenuName;

    	           	//바차트용 데이터  
    	        	// month data
    	        	let monthSales = result.monthSales;
    	        	
				 	// 월만 뺴오기
    	        	let month = monthSales.slice(0, -1).map(month => month.날짜);
					console.log("월 data : ",month);
    	        	// 상품
    	        	let goods = monthSales.slice(0, -1).map(month => month.상품);
					console.log("월 goods : ",goods);
					// food
    	        	let food = monthSales.slice(0, -1).map(month => month.푸드);
					console.log("월 food : ",food);
					// 음료
    	        	let beverage = monthSales.slice(0, -1).map(month => month.음료);
					console.log("월 beverage : ",beverage); 
     	        	
					let totalSale = monthSales[monthSales.length - 1]
					// totalSale 출력
					console.log("Total Sale Data: ", totalSale);
					
				   var tableBody = "";
		        	    $.each(monthSales, function(index, monthData) {
		        	    	  
		        	    	if (monthData.날짜 === "Total") {
		        	    	        return true; // continue to the next iteration
		        	    	}
		        	    	
		        	    	tableBody += 
		        	            `<tr>
		        	                <td>\${monthData.날짜}월</td>
		        	                <td>\${(monthData.음료).toLocaleString('ko-KR')}</td>
		        	                <td>\${(monthData.푸드).toLocaleString('ko-KR')}</td>
		        	                <td>\${(monthData.상품).toLocaleString('ko-KR')}</td>
		        	                <td>\${(monthData.음료+monthData.푸드+monthData.상품).toLocaleString('ko-KR')}</td>
		        	            </tr>
		        	            `;
		        	    });
					
					
    	        	let str =
    	        	 `
    	            <div class="col-lg-6 d-flex align-items-stretch">
                    <div class="card w-100 position-relative overflow-hidden">
                      <div class="card-body p-4" style="display: flex;flex-direction: column;align-items: center;">
                        <h5 class="card-title fw-semibold">카테고리별 매출 비중</h5>
                        <div class="text-center">
							<div id="chartPie"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-6 d-flex align-items-stretch">
                    <div class="card w-100 position-relative overflow-hidden">
                      <div class="stats-grid">
						  <div class="stat-card">
						    <div class="stat-title">매출</div>
						    <div class="stat-value">\${totalsales.toLocaleString('ko-KR')}원</div>
						  </div>
						  <div class="stat-card">
						    <div class="stat-title">판매량</div>
						    <div class="stat-value">\${totalcnt.toLocaleString('ko-KR')}</div>
						  </div>
						  <div class="stat-card">
						    <div class="stat-title">판매된 제품</div>
						    <div class="stat-value">\${menuCnt.toLocaleString('ko-KR')}</div>
						  </div>
						  <div class="stat-card">
						    <div class="stat-title">최다 판매 메뉴</div>
						    <div class="stat-value">\${bestMenu}</div>
						  </div>
						</div>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="card w-100 position-relative overflow-hidden mb-0">
                      <div class="card-body p-4">
							<div id="chartBar"></div>
                      </div>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="card w-100 position-relative overflow-hidden mb-0">
                      <div class="card-body p-4">
                      <div class="table-responsive">
						<table class="table border">
						    <thead>
						        <tr class="tableColor">
						            <th>날짜</th>
						            <th>음료</th>
						            <th>푸드</th>
						            <th>상품 </th>
						            <th>합계</th>
						        </tr>
						    </thead>
						    <tbody>
							
						    \${tableBody}
							        	
						    </tbody>
						    <tfoot class="tableColor">
						    	<tr class="tableColor">
							    	<td>합계</td>
		        	                <td>\${(totalSale.음료).toLocaleString('ko-KR')}</td>
		        	                <td>\${(totalSale.푸드).toLocaleString('ko-KR')}</td>
		        	                <td>\${(totalSale.상품).toLocaleString('ko-KR')}</td>
		        	                <td>\${(totalSale.음료+totalSale.푸드+totalSale.상품).toLocaleString('ko-KR')}</td>
						    	</tr>
						</table>
					</div>
                      </div>
                    </div>
                  </div>
                </div>
    	        	`;
    	        	
    	        $("#totalBody").html(str);
    	        	
    	        	
    	        	//차트 도넛 옵션
    	            var options = {
    	              series: pieData,
    	              chart: {
    	              width: 450,
    	              type: 'donut',
    	             
    	            },
    	            labels: pieName,
    	            legend: {
    	                show: true,
    	                showForSingleSeries: false,
    	                showForNullSeries: true,
    	                showForZeroSeries: true,
    	                position: 'right',
    	                horizontalAlign: 'center', 
    	                floating: false,
    	                fontSize: '20px',
    	                fontFamily: 'Helvetica, Arial',
    	                fontWeight: 400,
    	                formatter: undefined,
    	                inverseOrder: false,
    	                width: undefined,
    	                height: undefined,
    	                tooltipHoverFormatter: undefined,
    	                customLegendItems: [],
    	                offsetX: 0,
    	                offsetY: 0
    	          	  }
    	            };

    	            var chart = new ApexCharts(document.querySelector("#chartPie"), options);
    	            chart.render();
    	        
    	            // 바 차트
    	            var options2 = {
    	                    series: [{
    	                    name: '상품',
    	                    data: beverage
    	                  }, {
    	                    name: '음료',
    	                    data: food
    	                  }, {
    	                    name: '푸드',
    	                    data: goods
    	                  }], 
    	                    chart: {
    	                    type: 'bar',
    	                    height: 350,
    	                    stacked: true,
    	                    stackType: '100%',
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
    	                   
    	                    },
    	                  },
    	                  xaxis: {
    	                    categories: month,
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
    	            
    	        } //sucess 끝
    	    }); // ajax 끝
        };// detail 끝
        
        
        
        function detail2(data){
        	$.ajax({
        		url : "/admin/hqSales/ctgryBeverageList",
        		type : "post",
        		contentType : "application/json; charset=utf-8", 
    			data:JSON.stringify(data),
    			dataType:"json",
    			beforeSend:function(xhr){
    	               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    	          },
    	        success : function(result){
    	        	console.log("detail2 -> ",result);
    	        	
    	        	let pieChartArray = result.totalSales;
    	        	let maxIndex ="";
    	        	if (pieChartArray.length > 0) {
    	        	    maxIndex = pieChartArray.length - 1;
    	        	    console.log(maxIndex);
    	        	} else {
    	        	    console.log("배열이 비어 있습니다.");
    	        	}
					
    	        	//파이차트에 넣을 데이터 배열 생성
    	        	let pieData = pieChartArray.slice(0, -1).map(sale => sale.주문금액);
    	        	//파이차트에 넣을 데이터 이름
    	        	let pieName = pieChartArray.slice(0, -1).map(sale => sale.카테고리);

    	        	console.log("pieData",pieData); // 
    	        	console.log("pieName",pieName); // 
    	        	
    	        	// 카테고리의 판매 매출
    	        	let totalsales = pieChartArray[maxIndex].주문금액;
    	        	// 카테고리의 판매 갯수
    	        	let totalcnt = pieChartArray[maxIndex].판매갯수;
    	        	// 판매된 메뉴의 갯수
    	        	let menuCnt = result.menuCnt.메뉴갯수; 
    	        	// 최다 판매 메뉴
    	        	let bestMenu =result.topSales.메뉴;

    	           	//바차트용 데이터  
    	        	// month data
    	        	let monthSales = result.monthSales;
    	        	
				 	// 월만 뺴오기
    	        	let month = monthSales.slice(0, -1).map(month => month.날짜);
					console.log("월 data : ",month);
    	        	// 기타
    	        	let other  = monthSales.slice(0, -1).map(month => month.기타);
					console.log("월 other : ",other);
					// 티
    	        	let tea = monthSales.slice(0, -1).map(month => month.티);
					console.log("월 tea : ",tea);
					// 커피
    	        	let coffee = monthSales.slice(0, -1).map(month => month.커피);
					console.log("월 coffee : ",coffee); 
					// 스무디
    	        	let smoothie = monthSales.slice(0, -1).map(month => month.스무디);
					console.log("월 smoothie : ",smoothie); 
					// 프라푸치노
    	        	let frappuccino = monthSales.slice(0, -1).map(month => month.프라푸치노);
					console.log("월 frappuccino : ",frappuccino); 
     	        	
					let totalSale = monthSales[monthSales.length - 1]
					// totalSale 출력
					console.log("Total Sale Data: ", totalSale);
					
				   var tableBody = "";
		        	    $.each(monthSales, function(index, monthData) {
		        	    	  
		        	    	if (monthData.날짜 === "Total") {
		        	    	        return true; // continue to the next iteration
		        	    	}
		        	    	
		        	    	tableBody += 
		        	            `<tr>
		        	                <td>\${monthData.날짜}월</td>
		        	                <td>\${(monthData.티).toLocaleString('ko-KR')}</td>
		        	                <td>\${(monthData.기타).toLocaleString('ko-KR')}</td>
		        	                <td>\${(monthData.커피).toLocaleString('ko-KR')}</td>
		        	                <td>\${(monthData.스무디).toLocaleString('ko-KR')}</td>
		        	                <td>\${(monthData.프라푸치노).toLocaleString('ko-KR')}</td>
		        	                <td>\${(monthData.기타+monthData.티+monthData.커피 +monthData.스무디+monthData.프라푸치노).toLocaleString('ko-KR')}</td>
		        	            </tr>
		        	            `;
		        	    });
					
					
    	        	let str =
    	        	 `
    	            <div class="col-lg-6 d-flex align-items-stretch">
                    <div class="card w-100 position-relative overflow-hidden">
                      <div class="card-body p-4" style="display: flex;flex-direction: column;align-items: center;">
                        <h5 class="card-title fw-semibold">카테고리별 매출 비중</h5>
                        <div class="text-center">
							<div id="chartPie2"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-6 d-flex align-items-stretch">
                    <div class="card w-100 position-relative overflow-hidden">
                      <div class="stats-grid">
						  <div class="stat-card">
						    <div class="stat-title">매출</div>
						    <div class="stat-value">\${totalsales.toLocaleString('ko-KR')}원</div>
						  </div>
						  <div class="stat-card">
						    <div class="stat-title">판매량</div>
						    <div class="stat-value">\${totalcnt.toLocaleString('ko-KR')}</div>
						  </div>
						  <div class="stat-card">
						    <div class="stat-title">판매된 제품</div>
						    <div class="stat-value">\${menuCnt.toLocaleString('ko-KR')}</div>
						  </div>
						  <div class="stat-card">
						    <div class="stat-title">최다 판매 메뉴</div>
						    <div class="stat-value">\${bestMenu}</div>
						  </div>
						</div>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="card w-100 position-relative overflow-hidden mb-0">
                      <div class="card-body p-4">
							<div id="chartBar2"></div>
                      </div>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="card w-100 position-relative overflow-hidden mb-0">
                      <div class="card-body p-4">
                      <div class="table-responsive">
						<table class="table table-bordered border-dark">
						    <thead class="bg-inverse text-white tableColor">
						        <tr>
						            <th>날짜</th>
						            <th>티</th>
						            <th>기타</th>
						            <th>커피</th>
						            <th>스무디</th>
						            <th>프라푸치노</th>
						            <th>합계</th>
						        </tr>
						    </thead>
						    <tbody>
							
						    \${tableBody}
							        	
						    </tbody>
						    <tfoot class="tableColor">
						    	<tr>
							    	<td>합계</td>
		        	                <td>\${(totalSale.티).toLocaleString('ko-KR')}</td>
		        	                <td>\${(totalSale.기타).toLocaleString('ko-KR')}</td>
		        	                <td>\${(totalSale.커피).toLocaleString('ko-KR')}</td>
		        	                <td>\${(totalSale.스무디).toLocaleString('ko-KR')}</td>
		        	                <td>\${(totalSale.프라푸치노).toLocaleString('ko-KR')}</td>
		        	                <td>\${(totalSale.기타+totalSale.티+totalSale.커피+totalSale.스무디+totalSale.프라푸치노).toLocaleString('ko-KR')}</td>
						    	</tr>
						</table>
					</div>
                      </div>
                    </div>
                  </div>
                </div>
    	        	`;
    	        	
    	        $("#beverageBody").html(str);
    	        	
    	        	
    	        	//차트 도넛 옵션
    	            var options = {
    	              series: pieData,
    	              chart: {
    	              width: 450,
    	              type: 'donut',
    	             
    	            },
    	            labels: pieName,
    	            legend: {
    	                show: true,
    	                showForSingleSeries: false,
    	                showForNullSeries: true,
    	                showForZeroSeries: true,
    	                position: 'right',
    	                horizontalAlign: 'center', 
    	                floating: false,
    	                fontSize: '20px',
    	                fontFamily: 'Helvetica, Arial',
    	                fontWeight: 400,
    	                formatter: undefined,
    	                inverseOrder: false,
    	                width: undefined,
    	                height: undefined,
    	                tooltipHoverFormatter: undefined,
    	                customLegendItems: [],
    	                offsetX: 0,
    	                offsetY: 0
    	          	  }
    	            };

    	            var chart = new ApexCharts(document.querySelector("#chartPie2"), options);
    	            chart.render();
    	        
    	            // 바 차트
    	            var options2 = {
    	                    series: [{
    	                    name: '티',
    	                    data: other
    	                  }, {
    	                    name: '기타',
    	                    data: tea
    	                  }, {
    	                    name: '커피',
    	                    data: coffee
    	                  }, 
    	                  {
    	                    name: '스무디',
    	                    data: smoothie
    	                  }, 
    	                  {
    	                    name: '프라푸치노',
    	                    data: frappuccino
    	                  }], 
    	                    chart: {
    	                    type: 'bar',
    	                    height: 350,
    	                    stacked: true,
    	                    stackType: '100%',
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
    	                   
    	                    },
    	                  },
    	                  xaxis: {
    	                    categories: month,
    	                  },
    	                  legend: {
    	                    position: 'right',
    	                    offsetY: 40
    	                  },
    	                  fill: {
    	                    opacity: 1
    	                  }
    	                  };

    	                  var chart = new ApexCharts(document.querySelector("#chartBar2"), options2);
    	                  chart.render();
    	            
    	        } //sucess 끝
    	    }); // ajax 끝
        }; // detail2 음료 끝 
        
        
        
        function detail3(data){
        	$.ajax({
        		url : "/admin/hqSales/ctgryFoodList",
        		type : "post",
        		contentType : "application/json; charset=utf-8", 
    			data:JSON.stringify(data),
    			dataType:"json",
    			beforeSend:function(xhr){
    	               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    	          },
    	        success : function(result){
    	        	console.log("detail3 -> ",result);
    	        	
    	        	let pieChartArray = result.totalSales;
    	        	let maxIndex ="";
    	        	if (pieChartArray.length > 0) {
    	        	    maxIndex = pieChartArray.length - 1;
    	        	    console.log(maxIndex);
    	        	} else {
    	        	    console.log("배열이 비어 있습니다.");
    	        	}
					
    	        	//파이차트에 넣을 데이터 배열 생성
    	        	let pieData = pieChartArray.slice(0, -1).map(sale => sale.주문금액);
    	        	//파이차트에 넣을 데이터 이름
    	        	let pieName = pieChartArray.slice(0, -1).map(sale => sale.카테고리);

    	        	console.log("pieData",pieData); // 
    	        	console.log("pieName",pieName); // 
    	        	
    	        	// 카테고리의 판매 매출
    	        	let totalsales = pieChartArray[maxIndex].주문금액;
    	        	// 카테고리의 판매 갯수
    	        	let totalcnt = pieChartArray[maxIndex].판매갯수;
    	        	// 판매된 메뉴의 갯수
    	        	let menuCnt = result.menuCnt.메뉴갯수; 
    	        	// 최다 판매 메뉴
    	        	let bestMenu =result.topSales.메뉴;

    	           	//바차트용 데이터  
    	        	// month data
    	        	let monthSales = result.monthSales;
    	        	
				 	// 월만 뺴오기
    	        	let month = monthSales.slice(0, -1).map(month => month.날짜);
					console.log("월 data : ",month);
    	        	// 빵
    	        	let bread  = monthSales.slice(0, -1).map(month => month.빵);
					console.log("월 bread : ",bread);
					// 케이크
    	        	let cake = monthSales.slice(0, -1).map(month => month.케이크);
					console.log("월 cake : ",cake);
					// 샌드위치
    	        	let sandwich = monthSales.slice(0, -1).map(month => month.샌드위치);
					console.log("월 sandwich : ",sandwich); 
     	        	
					let totalSale = monthSales[monthSales.length - 1]
					// totalSale 출력
					console.log("Total Sale Data: ", totalSale);
					
				   var tableBody = "";
		        	    $.each(monthSales, function(index, monthData) {
		        	    	  
		        	    	if (monthData.날짜 === "Total") {
		        	    	        return true; // continue to the next iteration
		        	    	}
		        	    	
		        	    	tableBody += 
		        	            `<tr>
		        	                <td>\${monthData.날짜}월</td>
		        	                <td>\${(monthData.빵).toLocaleString('ko-KR')}</td>
		        	                <td>\${(monthData.케이크).toLocaleString('ko-KR')}</td>
		        	                <td>\${(monthData.샌드위치).toLocaleString('ko-KR')}</td>
		        	                <td>\${(monthData.빵+monthData.케이크+monthData.샌드위치).toLocaleString('ko-KR')}</td>
		        	            </tr>
		        	            `;
		        	    });
					
					
    	        	let str =
    	        	 `
    	            <div class="col-lg-6 d-flex align-items-stretch">
                    <div class="card w-100 position-relative overflow-hidden">
                      <div class="card-body p-4">
                        <h5 class="card-title fw-semibold">카테고리별 매출 비중</h5>
                        <div class="text-center">
							<div id="chartPie3"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-6 d-flex align-items-stretch">
                    <div class="card w-100 position-relative overflow-hidden">
                      <div class="stats-grid">
						  <div class="stat-card">
						    <div class="stat-title">매출</div>
						    <div class="stat-value">\${totalsales.toLocaleString('ko-KR')}원</div>
						  </div>
						  <div class="stat-card">
						    <div class="stat-title">판매량</div>
						    <div class="stat-value">\${totalcnt.toLocaleString('ko-KR')}</div>
						  </div>
						  <div class="stat-card">
						    <div class="stat-title">판매된 제품</div>
						    <div class="stat-value">\${menuCnt.toLocaleString('ko-KR')}</div>
						  </div>
						  <div class="stat-card">
						    <div class="stat-title">최다 판매 메뉴</div>
						    <div class="stat-value">\${bestMenu}</div>
						  </div>
						</div>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="card w-100 position-relative overflow-hidden mb-0">
                      <div class="card-body p-4" style="display: flex;flex-direction: column;align-items: center;">
							<div id="chartBar3"></div>
                      </div>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="card w-100 position-relative overflow-hidden mb-0">
                      <div class="card-body p-4">
                      <div class="table-responsive">
						<table class="table table-bordered border-dark">
						    <thead class="bg-inverse text-white tableColor">
						        <tr>
						            <th>날짜</th>
						            <th>빵</th>
						            <th>케이크</th>
						            <th>샌드위치</th>
						            <th>합계</th>
						        </tr>
						    </thead>
						    <tbody>
							
						    \${tableBody}
							        	
						    </tbody>
						    <tfoot class="tableColor">
						    	<tr>
							    	<td>합계</td>
		        	                <td>\${(totalSale.빵).toLocaleString('ko-KR')}</td>
		        	                <td>\${(totalSale.케이크).toLocaleString('ko-KR')}</td>
		        	                <td>\${(totalSale.샌드위치).toLocaleString('ko-KR')}</td>
		        	                <td>\${(totalSale.빵+totalSale.케이크+totalSale.샌드위치).toLocaleString('ko-KR')}</td>
						    	</tr>
						</table>
					</div>
                      </div>
                    </div>
                  </div>
                </div>
    	        	`;
    	        	
    	        $("#foodBody").html(str);
    	        	
    	        	
    	        	//차트 도넛 옵션
    	            var options = {
    	              series: pieData,
    	              chart: {
    	              width: 450,
    	              type: 'donut',
    	             
    	            },
    	            labels: pieName,
    	            legend: {
    	                show: true,
    	                showForSingleSeries: false,
    	                showForNullSeries: true,
    	                showForZeroSeries: true,
    	                position: 'right',
    	                horizontalAlign: 'center', 
    	                floating: false,
    	                fontSize: '20px',
    	                fontFamily: 'Helvetica, Arial',
    	                fontWeight: 400,
    	                formatter: undefined,
    	                inverseOrder: false,
    	                width: undefined,
    	                height: undefined,
    	                tooltipHoverFormatter: undefined,
    	                customLegendItems: [],
    	                offsetX: 0,
    	                offsetY: 0
    	          	  }
    	            };

    	            var chart = new ApexCharts(document.querySelector("#chartPie3"), options);
    	            chart.render();
    	        
    	            // 바 차트
    	            var options2 = {
    	                    series: [{
    	                    name: '빵',
    	                    data: bread
    	                  }, {
    	                    name: '케이크',
    	                    data: cake
    	                  }, {
    	                    name: '샌드위치',
    	                    data: sandwich
    	                  }], 
    	                    chart: {
    	                    type: 'bar',
    	                    height: 350,
    	                    stacked: true,
    	                    stackType: '100%',
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
    	                   
    	                    },
    	                  },
    	                  xaxis: {
    	                    categories: month,
    	                  },
    	                  legend: {
    	                    position: 'right',
    	                    offsetY: 40
    	                  },
    	                  fill: {
    	                    opacity: 1
    	                  }
    	                  };

    	                  var chart = new ApexCharts(document.querySelector("#chartBar3"), options2);
    	                  chart.render();
    	            
    	        } //sucess 끝
    	    }); // ajax 끝
        }; // detail3 음료 끝  
        
        
        function detail4(data){
        	$.ajax({
        		url : "/admin/hqSales/ctgryGoodsList",
        		type : "post",
        		contentType : "application/json; charset=utf-8", 
    			data:JSON.stringify(data),
    			dataType:"json",
    			beforeSend:function(xhr){
    	               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    	          },
    	        success : function(result){
    	        	console.log("detail4 -> ",result);
    	        	
    	        	let pieChartArray = result.totalSales;
    	        	let maxIndex ="";
    	        	if (pieChartArray.length > 0) {
    	        	    maxIndex = pieChartArray.length - 1;
    	        	    console.log(maxIndex);
    	        	} else {
    	        	    console.log("배열이 비어 있습니다.");
    	        	}
					
    	        	//파이차트에 넣을 데이터 배열 생성
    	        	let pieData = pieChartArray.slice(0, -1).map(sale => sale.주문금액);
    	        	//파이차트에 넣을 데이터 이름
    	        	let pieName = pieChartArray.slice(0, -1).map(sale => sale.카테고리);

    	        	console.log("pieData",pieData); // 
    	        	console.log("pieName",pieName); // 
    	        	
    	        	// 카테고리의 판매 매출
    	        	let totalsales = pieChartArray[maxIndex].주문금액;
    	        	// 카테고리의 판매 갯수
    	        	let totalcnt = pieChartArray[maxIndex].판매갯수;
    	        	// 판매된 메뉴의 갯수
    	        	let menuCnt = result.menuCnt.메뉴갯수; 
    	        	// 최다 판매 메뉴
    	        	let bestMenu =result.topSales.메뉴;

    	           	//바차트용 데이터  
    	        	// month data
    	        	let monthSales = result.monthSales;
    	        	
				 	// 월만 뺴오기
    	        	let month = monthSales.slice(0, -1).map(month => month.날짜);
					console.log("월 data : ",month);
    	        	// 빵
    	        	let cup  = monthSales.slice(0, -1).map(month => month.머그컵);
					console.log("월 cup : ",cup);
					// 케이크
    	        	let tumbler = monthSales.slice(0, -1).map(month => month.텀블러);
					console.log("월 tumbler : ",tumbler);
					// 샌드위치
    	        	let planner = monthSales.slice(0, -1).map(month => month.플래너);
					console.log("월 planner : ",planner); 
     	        	
					let totalSale = monthSales[monthSales.length - 1]
					// totalSale 출력
					console.log("Total Sale Data: ", totalSale);
					
				   var tableBody = "";
		        	    $.each(monthSales, function(index, monthData) {
		        	    	  
		        	    	if (monthData.날짜 === "Total") {
		        	    	        return true; // continue to the next iteration
		        	    	}
		        	    	
		        	    	tableBody += 
		        	            `<tr>
		        	                <td>\${monthData.날짜}월</td>
		        	                <td>\${(monthData.머그컵).toLocaleString('ko-KR')}</td>
		        	                <td>\${(monthData.텀블러).toLocaleString('ko-KR')}</td>
		        	                <td>\${(monthData.플래너).toLocaleString('ko-KR')}</td>
		        	                <td>\${(monthData.머그컵+monthData.텀블러+monthData.플래너).toLocaleString('ko-KR')}</td>
		        	            </tr>
		        	            `;
		        	    });
					
					
    	        	let str =
    	        	 `
    	            <div class="col-lg-6 d-flex align-items-stretch">
                    <div class="card w-100 position-relative overflow-hidden">
                      <div class="card-body p-4">
                        <h5 class="card-title fw-semibold">카테고리별 매출 비중</h5>
                        <div class="text-center">
							<div id="chartPie4"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-6 d-flex align-items-stretch">
                    <div class="card w-100 position-relative overflow-hidden">
                      <div class="stats-grid">
						  <div class="stat-card">
						    <div class="stat-title">매출</div>
						    <div class="stat-value">\${totalsales.toLocaleString('ko-KR')}원</div>
						  </div>
						  <div class="stat-card">
						    <div class="stat-title">판매량</div>
						    <div class="stat-value">\${totalcnt.toLocaleString('ko-KR')}</div>
						  </div>
						  <div class="stat-card">
						    <div class="stat-title">판매된 제품</div>
						    <div class="stat-value">\${menuCnt.toLocaleString('ko-KR')}</div>
						  </div>
						  <div class="stat-card">
						    <div class="stat-title">최다 판매 메뉴</div>
						    <div class="stat-value">\${bestMenu}</div>
						  </div>
						</div>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="card w-100 position-relative overflow-hidden mb-0">
                      <div class="card-body p-4" style="display: flex;flex-direction: column;align-items: center;">
							<div id="chartBar4"></div>
                      </div>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="card w-100 position-relative overflow-hidden mb-0">
                      <div class="card-body p-4">
                      <div class="table-responsive">
						<table class="table table-bordered border-dark">
						    <thead class="bg-inverse text-white tableColor">
						        <tr>
						            <th>날짜</th>
						            <th>머그컵</th>
						            <th>텀블러</th>
						            <th>플래너</th>
						            <th>합계</th>
						        </tr>
						    </thead>
						    <tbody>
							
						    \${tableBody}
							        	
						    </tbody>
						    <tfoot class="tableColor">
						    	<tr>
							    	<td>합계</td>
		        	                <td>\${(totalSale.머그컵).toLocaleString('ko-KR')}</td>
		        	                <td>\${(totalSale.텀블러).toLocaleString('ko-KR')}</td>
		        	                <td>\${(totalSale.플래너).toLocaleString('ko-KR')}</td>
		        	                <td>\${(totalSale.머그컵+totalSale.텀블러+totalSale.플래너).toLocaleString('ko-KR')}</td>
						    	</tr>
						</table>
					</div>
                      </div>
                    </div>
                  </div>
                </div>
    	        	`;
    	        	
    	        $("#goodsBody").html(str);
    	        	
    	        	
    	        	//차트 도넛 옵션
    	            var options = {
    	              series: pieData,
    	              chart: {
    	              width: 450,
    	              type: 'donut',
    	             
    	            },
    	            labels: pieName,
    	            legend: {
    	                show: true,
    	                showForSingleSeries: false,
    	                showForNullSeries: true,
    	                showForZeroSeries: true,
    	                position: 'right',
    	                horizontalAlign: 'center', 
    	                floating: false,
    	                fontSize: '20px',
    	                fontFamily: 'Helvetica, Arial',
    	                fontWeight: 400,
    	                formatter: undefined,
    	                inverseOrder: false,
    	                width: undefined,
    	                height: undefined,
    	                tooltipHoverFormatter: undefined,
    	                customLegendItems: [],
    	                offsetX: 0,
    	                offsetY: 0
    	          	  }
    	            };

    	            var chart = new ApexCharts(document.querySelector("#chartPie4"), options);
    	            chart.render();
    	        
    	            // 바 차트
    	            var options2 = {
    	                    series: [{
    	                    name: '머그컵',
    	                    data: cup
    	                  }, {
    	                    name: '텀블러',
    	                    data: tumbler
    	                  }, {
    	                    name: '플래너',
    	                    data: planner
    	                  }], 
    	                    chart: {
    	                    type: 'bar',
    	                    height: 350,
    	                    stacked: true,
    	                    stackType: '100%',
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
    	                   
    	                    },
    	                  },
    	                  xaxis: {
    	                    categories: month,
    	                  },
    	                  legend: {
    	                    position: 'right',
    	                    offsetY: 40
    	                  },
    	                  fill: {
    	                    opacity: 1
    	                  }
    	                  };

    	                  var chart = new ApexCharts(document.querySelector("#chartBar4"), options2);
    	                  chart.render();
    	            
    	        } //sucess 끝
    	    }); // ajax 끝
        }; // detail4 푸드 끝  
        
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
		    
		    $(".startDate").datepicker({
		        onSelect: function(startDate, inst) {
		            console.log("시작 날짜 선택 ->", startDate);
		            data.startDate = startDate;
		        }
		    });
		
		
		    $(".endDate").datepicker({
		        onSelect: function(endDate, inst) {
		            console.log("종료 날짜 선택 ->", endDate);
		            data.endDate = endDate;
		        }
		    });
        
    
        </script>