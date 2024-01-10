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
.negative {
    background-color: rgba(254, 176, 25, 0.85);
}
.left{
    padding-left: 30px;
}
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/datePicker.css">
<script type="text/javascript" src="/resources/js/jquery.mtz.monthpicker.js"></script>


<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
  <div class="card-body px-4 py-3">
    <div class="row align-items-center">
      <div class="col-9">
        <h4 class="fw-semibold mb-8">메뉴 관리</h4>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a class="text-muted text-decoration-none" href="/admin/main">Home</a>
            </li>
            <li class="breadcrumb-item" aria-current="page">메뉴 관리</li>
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
       		              <th scope="row" style="background-color:rgb(42, 53, 71); color: white; 
       		              text-align: center; vertical-align: middle; font-size: larger;">기간</th>
       		              <td scope="col" colspan="3"> 
       		              <input type="text" class="datepicker" id="monthpicker">         
       		              <button class="btn btn-outline-dark btn-sm" id="search" type="button" style="margin: 0px 0px 4px 10px;"> 기간 조회</button></td>
       		          </tr>
       		      </tbody>
       		  </table>
       		</div>
       		<div class="card">
       		<br>
       		<h3 class="fw-semibold left">메뉴 판매 순위 </h3>
       		<br>
       		<br>
       		<!--차트  -->
            <div id="chart"></div>
            
          </div>
          <div>
          <h3 class=" fw-semibold left">전년 동월 판매 비교</h3>	
          <br>
          
          <div class="row">
            <div class="col-lg-6 d-flex align-items-strech">
              <div class="card w-100">
                <div class="card-body p-4">
                  <div id="chart2"></div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 d-flex align-items-strech">
              <div class="card w-100">
                <div class="card-body p-4">
               		<div class="table-responsive">
		        		  <table class="table border" >
		        		          <tr class="tableColor">
		        		              <th>메뉴 번호</th>
		        		              <td>메뉴 명</td>
		        		              <td id="lastData"></td>
		        		              <td id="currentData"></td>
		        		              <td>증감 개수</td>
		        		          </tr>
		        		          <tbody id="tableBody">
		        		      </tbody>
		        		  </table>
		        		</div>
                </div>
              </div>
            </div>
          </div>
          
          </div>
       		
</div>
<script type="text/javascript" defer="defer">

var data={};

$(function() {
	

	data.startDate =  '2023-01';
	data.endDate = '2024-01';
	
	$("#monthpicker").val(data.endDate);
	$("#lastData").html(data.startDate +"월 판매 개수");
	$("#currentData").html(data.endDate +"월 판매 개수");
	
	var currentYear = (new Date()).getFullYear();


		 detail(data);
		
		//monthPicker 옵션
		 options = {
		 			pattern: 'yyyy-mm', // Default is 'mm/yyyy' and separator char is not mandatory
		 			selectedYear: 2024,
		 			startYear: currentYear-5,
		 			finalYear: currentYear,
		 			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		 		};
		 		
		 		/* MonthPicker Set */
		 		$('#monthpicker').monthpicker(options);	
		 
		 //monthPicker 값 바뀐 이벤트
		 $("#monthpicker").on('change', function() {
			 var selectedDate=$("#monthpicker").val();
		        console.log("선택된 날짜 ->", selectedDate);
		        data.endDate=selectedDate;
		        
		        var dateParts = selectedDate.split("-"); // 날짜를 연도와 월로 분리

		        var year = parseInt(dateParts[0], 10); // 연도를 숫자로 변환
		        var month = dateParts[1]; // 월

		        var oneYearBefore = (year - 1) + "-" + month; // 전년도 동일 월 계산

		        console.log("선택된 날짜 ->", selectedDate); // "2024-01"
		        console.log("전년도 동일 월 ->", oneYearBefore); // "2023-01"
		        
		        data.startDate=oneYearBefore;
		        console.log("값 바뀐지 확인 ->",data);
		    });
		
	
		

});

$(document).on("click", "#search", function(){

	$("#lastData").html(data.startDate +"월 판매 개수");
	$("#currentData").html(data.endDate +"월 판매 개수");
	console.log("기간조회 ->",data);
		
	detail(data);
	
});



function detail(data){
	 console.log("chartData ->",data);
	 $.ajax({
		 url : "/admin/hqSales/menuData",
		 type: "post",
		 contentType: "application/json;charset=utf-8",
		 data : JSON.stringify(data),
		 dataType : "json",
		 beforeSend:function(xhr){
             xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        },
        success : function(result){
        	console.log("ajaxResult -> ",result);
        	
        	//chart1
        	//메뉴의 배열화
        	var menu = result.menuTop10;
        	var menuNmArray = menu.map(sale => sale.MENU_NM);
        	var menuCntArray = menu.map(sale => sale.SALES);
        	data.menuNm = menuNmArray;
        	data.menuCnt = menuCntArray;
        	
        	console.log("menuNmArray",menuNmArray);
        	console.log("menuCntArray",menuCntArray);
        	
        	//chart2
        	var mp = result.menuSalesMp;
        	var mpMenuNm = mp.map(mp => mp.MENU_NM);
		    var mpChangeData = mp.map(mp =>mp.SALES_DIFFERENCE);
		   
		    var mpStartData = mp.map(mp =>mp.SALES_2023);
		    var mpEndData = mp.map(mp =>mp.SALES_2024);
		    
		    
		    data.mpMenuNm = mpMenuNm;
		    data.mpChangeData =mpChangeData;
		    console.log("mpMenuNm ->",mpMenuNm);
		    console.log("mpChangeData ->",mpChangeData);
		    
		    
     	   var tableBody = "";
	   	    $.each(mp, function(index, changeData) {
	   	    	  
	   	    	var rowClass = (changeData.SALES_DIFFERENCE < 0) ? 'negative' : '';
	   	    	
	   	    	tableBody += 
	   	            `<tr class=\${rowClass}>
	   	                <td>\${changeData.MENU_NO}</td>
	   	                <td>\${changeData.MENU_NM}</td>
	   	                <td>\${(changeData.SALES_2023).toLocaleString('ko-KR')}</td>
	   	                <td>\${(changeData.SALES_2024).toLocaleString('ko-KR')}</td>
	   	                <td>\${(changeData.SALES_DIFFERENCE).toLocaleString('ko-KR')}</td>
	   	            </tr>
	   	            `;
	   	    });
		    $("#tableBody").html(tableBody);
	   	    

			 var options = {
			         series: [{
			         data: data.menuCnt
			       }],
			         chart: {
			         type: 'bar',
			         height: 380
			       },
			       plotOptions: {
			         bar: {
			           barHeight: '100%',
			           distributed: true,
			           horizontal: true,
			           dataLabels: {
			             position: 'bottom'
			           },
			         }
			       },
			       colors: ['#33b2df', '#546E7A', '#d4526e', '#13d8aa', '#A5978B', '#2b908f', '#f9a3a4', '#90ee7e',
			         '#f48024', '#69d2e7'
			       ],
			       dataLabels: {
			         enabled: true,
			         textAnchor: 'start',
			         style: {
			           colors: ['#fff']
			         },
			         formatter: function (val, opt) {
			           return opt.w.globals.labels[opt.dataPointIndex] + ":  " + val
			         },
			         offsetX: 0,
			         dropShadow: {
			           enabled: true
			         }
			       },
			       stroke: {
			         width: 1,
			         colors: ['#fff']
			       },
			       xaxis: {
			         categories: data.menuNm
			       },
			       yaxis: {
			         labels: {
			           show: false
			         }
			       },
			       title: {
			           text: '판매 TOP 10',
			           align: 'center',
			           floating: true
			       },
			       tooltip: {
			         theme: 'dark',
			         x: {
			           show: false
			         },
			         y: {
			           title: {
			             formatter: function () {
			               return ''
			             }
			           }
			         }
			       }
			       };

			       var chart = new ApexCharts(document.querySelector("#chart"), options);
			       chart.render();
			       chart.updateSeries([{
			    	    data: data.menuCnt // 새로운 데이터 배열
			    	}]);

			    	// 카테고리 업데이트
			    	chart.updateOptions({
			    	    xaxis: {
			    	        categories: data.menuNm // 새로운 카테고리 배열
			    	    }
			    	});
			    	
			       //증감 차트
			         var options2 = {
			                 series: [{
			                     name: data.startDate,
			                     type: 'column',
			                     data:  mpStartData
			                   }, {
			                     name: data.endDate,
			                     type: 'column',
			                     data:  mpEndData
			                   }],
				             colors:['#d2e9e8','#01c0c8'], 
			                 chart: {
			                 type: 'bar',
			                 height: '100%'
			               },
			               plotOptions: {
			                   bar: {
			                       barHeight: '100%',
			                       columnWidth: '80%'
			                   }
			               },
			               dataLabels: {
			                 enabled: false,
			               },
			               yaxis: {
			                 title: {
			                   text: 'Growth',
			                 },
			                 labels: {
			                   formatter: function (y) {
			                     return y + "개";
			                   }
			                 }
			               },
			               xaxis: {
			                 categories: data.mpMenuNm,
			                 labels: {
			                   rotate: -90
			                 }
			               }
			               };

			               var chart2 = new ApexCharts(document.querySelector("#chart2"), options2);
			               chart2.render();
			               
        },
        error:function(request,status,error){        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
        }
	 });
	 
	 
}


</script>