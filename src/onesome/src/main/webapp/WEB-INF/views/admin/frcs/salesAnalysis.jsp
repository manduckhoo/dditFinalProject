<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/datePicker.css">
<script src="/resources/bootstrap/src/assets/js/apps/customInvoice.js"></script>
<div class="container-fluid">
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
  <div class="card-body px-4 py-3">
    <div class="row align-items-center">
      <div class="col-9">
        <h4 class="fw-semibold mb-8">매출 분석</h4>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a class="text-muted text-decoration-none" href="../main/index.html">가맹점</a>
            </li>
            <li class="breadcrumb-item" aria-current="page">매출 분석</li>
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

          <div class="card overflow-hidden invoice-application">
            <div class="d-flex align-items-center justify-content-between gap-3 m-3 d-lg-none">
              <button class="btn btn-primary d-flex" type="button" data-bs-toggle="offcanvas" data-bs-target="#chat-sidebar" aria-controls="chat-sidebar">
                <i class="ti ti-menu-2 fs-5"></i>
              </button>
              <form class="position-relative w-100">
                <input type="text" class="form-control search-chat py-2 ps-5" id="text-srh" placeholder="Search Contact">
                <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
              </form>
            </div>
             <div class="d-flex">
              <div class="w-25 d-none d-lg-block border-end user-chat-box">
                <div class="p-3 border-bottom">
                  <form class="position-relative">
                    <input type="search" class="form-control search-invoice ps-5" id="text-srh"
                      placeholder="Search Invoice" />
                    <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
                  </form>
                </div>
                <div class="app-invoice">
                  <ul class="overflow-auto invoice-users" style="height: calc(100vh - 262px)" data-simplebar="init"><div class="simplebar-wrapper" style="margin: 0px;"><div class="simplebar-height-auto-observer-wrapper"><div class="simplebar-height-auto-observer"></div></div><div class="simplebar-mask"><div class="simplebar-offset" style="right: 0px; bottom: 0px;"><div class="simplebar-content-wrapper" tabindex="0" role="region" aria-label="scrollable content" style="height: 100%; overflow: hidden;"><div class="simplebar-content" style="padding: 0px;">
                  
                  <!-- 가맹점 list for문 출력 시작-->
                  <c:forEach var="FranchiseVO" items="${data}" varStatus="stat">
                    <li>
                      <a href="javascript:void(0)" class="p-3 bg-hover-light-black border-bottom d-flex align-items-start invoice-user listing-user clsListClick" id="invoice-${FranchiseVO.FRCS_NO}" data-invoice-id="${FranchiseVO.FRCS_NO}" data-opendate="<fmt:formatDate value="${FranchiseVO.FRCS_OPNG_DT}" pattern="yyyy-MM-dd" />" data-num="${stat.count}"/>
                        <div class="btn btn-primary round rounded-circle d-flex align-items-center justify-content-center">
                          <i class="ti ti-user fs-6"></i>
                        </div>
                        <div class="ms-3 d-inline-block w-75">
                          <h6 class="fs-3 invoice-id text-truncate thisName">${FranchiseVO.FRCS_NM}</h6>

                          <span class="fs-3 invoice-date text-nowrap text-body-color d-block">개점일 : <fmt:formatDate value="${FranchiseVO.FRCS_OPNG_DT}" pattern="yyyy-MM-dd" /></span>
                        </div>
                      </a>
                    </li>
                    </c:forEach>
                    <!-- 가맹점 list for문 출력 끝-->
                    
                    <li></li>
                  </div></div></div></div><div class="simplebar-placeholder" style="width: 287px; height: 459px;"></div></div><div class="simplebar-track simplebar-horizontal" style="visibility: hidden;"><div class="simplebar-scrollbar" style="width: 0px; display: none;"></div></div><div class="simplebar-track simplebar-vertical" style="visibility: hidden;"><div class="simplebar-scrollbar" style="height: 0px; display: none;"></div></div></ul>
                </div>
              </div>
              
  			<div class="w-75 w-xs-100 chat-container">
                <div class="invoice-inner-part h-100">
                  <div class="invoiceing-box">
                    <div class="invoice-header d-flex align-items-center border-bottom p-3">
<%--                       <h4 class="font-medium text-uppercase mb-0">${data[0].frcsNm}</h4> --%>
                      <h4 class="mb-0 invoice-customer frcsNm">${data[0].FRCS_NM}</h4>
                      <div class="ms-auto">
                        <h4 class="invoice-number num">매출 1위</h4>
                      </div>
                    </div>
                    <div class="p-3" id="custom-invoice" style="display: block;">
   					<c:forEach var="frcsVO" items="${data}" varStatus="stat">
                      <div class="invoice-${frcsVO.FRCS_NO}" id="printableArea" style="display: none;">
                          <!--본문 시작 -->
                        <div class="row pt-3">
                          <div class="col-md-12">
                            <div id="start">
                       
			                  
                          </div>
                         </div>
                         </div>
              			<!--본문 끝  -->
                        </div>
                      </c:forEach>
                    </div>
                  </div>
                </div>
              </div>
             
              <div class="offcanvas user-chat-box offcanvas-end" tabindex="-1" id="chat-sidebar" aria-labelledby="offcanvasExampleLabel">
                <div class="offcanvas-header">
                  <h5 class="offcanvas-title" id="offcanvasExampleLabel">
                    Invoice
                  </h5>
                  <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="p-3 border-bottom">
                  <form class="position-relative">
                    <input type="search" class="form-control search-invoice ps-5" id="text-srh" placeholder="Search Invoice" >
                    <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
                  </form>
                </div>
                <div class="app-invoice overflow-auto">
                  <ul class="invoice-users">
                  	<c:forEach var="frscVO" items="${data}">
                    <li>
                      <a href="javascript:void(0)" class="p-3 bg-hover-light-black border-bottom d-flex align-items-start invoice-user listing-user" id="invoice-123" data-invoice-id="123">
                        <div class="btn btn-primary round rounded-circle d-flex align-items-center justify-content-center">
                          <i class="ti ti-user fs-6"></i>
                        </div>
                        <div class="ms-3 d-inline-block w-75">
                          <h6 class="mb-0 invoice-customer">James Anderson</h6>

                          <span class="fs-3 invoice-id text-truncate text-body-color d-block w-85">Id: #123</span>
                          <span class="fs-3 invoice-date text-nowrap text-body-color d-block">9 Fab 2020</span>
                        </div>
                      </a>
                    </li>
                    </c:forEach>
                    
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>

<script type="text/javascript" defer="defer">
	
	// 전역함수로 위치이동 차트에서 사용하는 지점정보
	let data = {};
	
	$(document).ready(function(){
	 $(".listing-user").click(function () {
        var selectedInvoiceId = $(this).data("invoice-id");
        $("#custom-invoice .invoice-" + selectedInvoiceId).show().siblings().hide();
    });
		
	    setTimeout(() => { // 0.3 초 후에 실행 된다.
	    	
			$(".clsListClick")[0].click();
	    	
		}, 300);
	    
	    
	});
	
	$(".clsListClick").on("click",function(){
		let frcsNo = $(this).data("invoiceId");
		let frcsOpngDt = $(this).data("opendate");
		let num = $(this).data("num");
		console.log(num);
		
		
		console.log("오픈일자 -> ",frcsOpngDt);
		console.log("frcsNo -> ",frcsNo);
		console.log("this =>", $(this));
		console.log("this =>", $(this).find("h6"));
		console.log("this =>", $(this).find("h6").text());
		$(".num").text("매출 "+num+"위");
		$(".frcsNm").text($(this).find("h6").text());
			
		//현재 년도 구하기
		var currentDate = new Date().toISOString().split('T')[0];
		var startOfYear = new Date().getFullYear() + '-01-01';
		
		data.openDate = frcsOpngDt;
		data.frcsNo = frcsNo;
		data.frcsNm = $(this).find("h6").text();
		data.startDate = '2023-01-01'
		data.endDate = currentDate
		data.frcsTitle=  data.frcsNm + " (" + data.startDate + " ~ " +data.endDate+")";
			
		console.log(data);
			
		detail(data);

	});
	

	$(document).on("click", "#search", function(){

		let frcsNo = $(this).data("invoiceId");

	/* 	console.log("this =>", $(this));
		console.log("this =>", $(this).find("h6"));
		console.log("this =>", $(this).find("h6").text()); */
		
		data.frcsTitle =  data.frcsNm + " (" + data.startDate + " ~ " +data.endDate+")";
		console.log(data);
			
		detail(data);
		
	});


	
	function detail(data){
		$.ajax({
			url:"/admin/frcs/yearSales",
			type:"post",
			contentType : "application/json; charset=utf-8", 
			data:JSON.stringify(data),
			dataType:"json",
			beforeSend:function(xhr){
	               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	          },
	        success : function(result){
				
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
	                  maxDate : new Date()
	               	  /* minDate : data.openDate */
	        		});
	        	
	        	//datePicker
	        	$( function() {
	        	    
	        	    $("#startDate").datepicker({
	        	        onSelect: function(startDate, inst) {
	        	            console.log("시작 날짜 선택 ->", startDate);
	        	            data.startDate = startDate
	        	        }
	        	    });

	        	    $("#endDate").datepicker({
	        	        onSelect: function(endDate, inst) {
	        	            console.log("종료 날짜 선택 ->", endDate);
	        	            data.endDate = endDate
	        	        }
	        	    });
	        	});
	        	
	        	
	    		
	        	console.log("detail",result);
	        	        	
	        	var totalIndex = result.length - 1;
	        	var total = result[totalIndex];
	        	console.log("total : ",total);
				
	          	//차트에 넣을 총매출 배열 구하기
	        	var pynmTotalAmtArray = result.filter(function(item) {
	        	    return item.RYCKLMYM !== 'Total'; // 'Total' 행 제외
	        	}).map(function(item) {
	        	    return item.PYNMTOTALAMT/1000; // pynmTotalAmt 값만 추출
	        	});

	        	console.log(pynmTotalAmtArray); 
	        	
	        	//차트에 넣을 비용합계 배열 구하기
	        	var totalCostArray = result.filter(function(item) {
	        	    return item.RYCKLMYM !== 'Total'; // 'Total' 행 제외
	        	}).map(function(item) {
	        	    return item.TOTALCOST/1000; // pynmTotalAmt 값만 추출
	        	});

	        	console.log(totalCostArray); 
	        	
	        	//차트에 넣을 손익률 배열 구하기
        		var soneikRateArray = result.filter(function(item) {
	        	    return item.RYCKLMYM !== 'Total'; // 'Total' 행 제외
	        	}).map(function(item) {
	        	    return item.SONEIKRATE; // pynmTotalAmt 값만 추출
	        	});

	        	console.log(soneikRateArray); 
	     
	        	//차트에 넣을 월 배열 구하기
        		var MonthArray = result.filter(function(item) {
	        	    return item.RYCKLMYM !== 'Total'; // 'Total' 행 제외
	        	}).map(function(item) {
	        	    return item.RYCKLMYM; // pynmTotalAmt 값만 추출
	        	});

	        	console.log(MonthArray); 
	     
					if(total != null){


			        	   var tableBody = "";
			        	    $.each(result, function(index, monthData) {
			        	    	  
			        	    	if (monthData.RYCKLMYM === 'Total') {
			        	    	        return true; // continue to the next iteration
			        	    	}
			        	    	
			        	    	tableBody += 
			        	            `<tr>
			        	                <td>\${monthData.RYCKLMYM}월</td>
			        	                <td>\${(monthData.PYNMTOTALAMT/1000).toLocaleString('ko-KR')}</td>
			        	                <td>\${(monthData.RYORDERAMT/1000).toLocaleString('ko-KR')}</td>
			        	                <td>\${(monthData.FRCSEMPSAL/1000).toLocaleString('ko-KR')}</td>
			        	                <td>\${(monthData.RYFRCSFEEAMT/1000).toLocaleString('ko-KR')}</td>
			        	                <td>\${(monthData.RYROYALTYAMT/1000).toLocaleString('ko-KR')}</td>
			        	                <td>\${(monthData.GONGA/1000).toLocaleString('ko-KR')}</td>
			        	                <td>\${(monthData.TOTALCOST/1000).toLocaleString('ko-KR')}</td>
			        	                <td>\${(monthData.SONEIK/1000).toLocaleString('ko-KR')}</td>
			        	                <td>\${monthData.SONEIKRATE}%</td>
			        	                <!-- 나머지 셀에 필요한 데이터 추가 -->
			        	            </tr>
			        	            `;
			        	    });
			        	 
			        	let str = 
			        		`
			        		<div class="table-responsive">
			        		  <table class="table table-bordered table-dark mb-0 jaeram" >
			        		      <tbody>
			        		          <tr>
			        		              <th scope="row">기간</th>
			        		              <td scope="col" colspan="3"> 
			        		              <input type="text" class="datepicker" id="startDate">  ~  <input type="text" class="datepicker" id="endDate">          
			        		              <button id="search" type="button"> 기간 조회</button></td>
			        		          </tr>
			        		          <tr>
			        		              <th scope="row">매출 총액</th>
			        		              <td>\${(total.PYNMTOTALAMT).toLocaleString('ko-KR')}원</td>
			        		              <td> 비용 총액</td>
			        		              <td>\${(total.TOTALCOST).toLocaleString('ko-KR')}원</td>
			        		          </tr>
			        		          <tr>
			        		              <th scope="row">손  익</th>
			        		              <td>\${(total.SONEIK).toLocaleString('ko-KR')}원</td>
			        		              <td>손익률</td>
			        		              <td>\${total.SONEIKRATE}%</td>
			        		          </tr>
			        		      </tbody>
			        		  </table>
			        		</div>
			        		
			        		<br>
			        		<br>
			        		
			        		<div id="chart">
			        		</div>
			        		
			        		<br>
			        		<h5>1.월별 현황 </h5>
			        		<span style="text-align:right">(단위 : 천원)</span>
			        		<div class="table-responsive">
								<table class="table table-bordered border-dark">
								    <thead class="bg-inverse text-white">
								        <tr>
								            <th rowspan="2">구분</th>
								            <th rowspan="2">매출액</th>
								            <th colspan="6">비용</th>
								            <th rowspan="2">손익</th>
								            <th rowspan="2">손익률(%)</th>
								        </tr>
								        <tr>
								            <th>원가</th>
								            <th>인건비</th>
								            <th>가맹비</th>
								            <th>로얄티</th>
								            <th>공과금</th>
								            <th>비용합계</th>
								        </tr>
								    </thead>
								    <tbody>
									
								    \${tableBody}
									        	
								    </tbody>
								    <tfoot>
								    	<tr>
									    	<td>합계</td>
				        	                <td>\${(total.PYNMTOTALAMT/1000).toLocaleString('ko-KR')}</td>
				        	                <td>\${(total.RYORDERAMT/1000).toLocaleString('ko-KR')}</td>
				        	                <td>\${(total.FRCSEMPSAL/1000).toLocaleString('ko-KR')}</td>
				        	                <td>\${(total.RYFRCSFEEAMT/1000).toLocaleString('ko-KR')}</td>
				        	                <td>\${(total.RYROYALTYAMT/1000).toLocaleString('ko-KR')}</td>
				        	                <td>\${(total.GONGA/1000).toLocaleString('ko-KR')}</td>
				        	                <td>\${(total.TOTALCOST/1000).toLocaleString('ko-KR')}</td>
				        	                <td>\${(total.SONEIK/1000).toLocaleString('ko-KR')}</td>
				        	                <td>\${total.SONEIKRATE}%</td>
								    	</tr>
								</table>
							</div>
							
							<br>
							<br>
							
							<p>2.매출 및 비용 세부내용 </p>
							<div class="table-responsive">
							<table class="table table-bordered border-dark">
							    <thead class="bg-inverse text-white">
							        <tr>
							            <th rowspan="2">구분</th>
							            <th rowspan="2">내용</th>
							            <th colspan="6">비고</th>
							        </tr>
							    </thead>
							    <tbody>
							        <tr>
							            <td>매출</td>
							            <td>상품 판매, 이자, 임대료, 기타 수입 등</td>
							            <td></td>
							        </tr>
							        <tr>
							        	<td>원가</td>
							        	<td>제품 원가, 제품 이자, 수수료 등</td>
							        	<td></td>
									</tr>
							        <tr>
							        	<td>인건비</td>
							        	<td>직원 급여, 용역 비용</td>
							        	<td></td>
									</tr>
							        <tr>
							        	<td>가맹비</td>
							        	<td>월 50만원</td>
							        	<td></td>
									</tr>
							        <tr>
							        	<td>로열티</td>
							        	<td>월 매출의 3%</td>
							        	<td></td>
									</tr>
							        <tr>
							        	<td>공과금</td>
							        	<td>월세, 가스비, 전기세 등</td>
							        	<td></td>
									</tr>
							    </tbody>
							</table>
						</div>
			        	`;
			        	$("#custom-invoice").html(str);
			        	
			        	
			        	/*apexchart js  */
			            var options = {
			              series: [{
			              name: '매출액',
			              type: 'column',
			              data: pynmTotalAmtArray
			            }, {
			              name: '비용합계',
			              type: 'column',
			              data: totalCostArray
			            }, {
			              name: '손익률',
			              type: 'line',
			              data: soneikRateArray
			            }],
			              chart: {
			              height: 350,
			              type: 'line',
			              stacked: false,
			             
			            },
			            dataLabels: {
				              enabled: true
				            },
			            colors:['#d50037', '#0254d3', '#152b4f'],
			           
			            stroke: {
			              width: [1, 1, 4]
			            },
			            title: {
			              text: data.frcsTitle,
			              align: 'left',
			              offsetX: 110,
			              style: {
			                  fontSize:  '30px',
			                  fontWeight:  'bold'
			              }
			            },
			            xaxis: {
			              categories: MonthArray,
			            },
			            yaxis: [
			              {
			            	seriesName: '매출액',
				            opposite: false,
			                axisTicks: {
			                  show: false,
			                },
			                axisBorder: {
			                  show: false,
			                  color: '#d50037'
			                },
			                labels: {
			                  style: {
			                    colors: '#d50037',
			                  }
			                },
			                title: {
			                  text: "매출 및 비용 (단위 : 천원)",
			                  style: {
			                    color: '#d50037',
			                  }
			                },
			                tooltip: {
			                  enabled: true
			                }
			              },
			              {
			            	show : false,
			                seriesName: '매출액',
			                opposite: false,
			                axisTicks: {
			                  show: false,
			                },
			                axisBorder: {
			                  show: false,
			                  color: '#d50037'
			                },
			                labels: {
			                  style: {
			                    colors: '#d50037',
			                  }
			                },
			                title: {
			                  text: "비용합계 (단위 : 천원)",
			                  style: {
			                    color: '#d50037',
			                  }
			                },
			              }, 
			              {
			                seriesName: '손익률',
			                opposite: true,
			                axisTicks: {
			                  show: true,
			                },
			                axisBorder: {
			                  show: true,
			                  color: '#152b4f'
			                },
			                labels: {
			                  style: {
			                    colors: '#152b4f',
			                  },
			                },
			                title: {
			                  text: "손익률 %",
			                  style: {
			                    color: '#152b4f',
			                  }
			                }
			              },
			            ],
			            tooltip: {
			              fixed: {
			                enabled: true,
			                position: 'topLeft', // topRight, topLeft, bottomRight, bottomLeft
			                offsetY: 30,
			                offsetX: 60
			              },
			            },
			            legend: {
			              horizontalAlign: 'left',
			              offsetX: 40
			            }
			            };

			            var chart = new ApexCharts(document.querySelector("#chart"), options);
			            chart.render();
						
					} else {

						$("#custom-invoice").empty();
						
						
						
						
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
						
						console.log("계산된 시작 날짜:", startOfLastYear);
						console.log("계산된 종료 날짜:", endOfLastYear);
						
						data.startDate = startOfLastYear;
						data.endDate = endOfLastYear;
						data.frcsTitle=  data.frcsNm + " (" + data.startDate + " ~ " +data.endDate+")";
							
						console.log("else data -> ",data);
							
						detail(data);
	
					}
			
	        	
        }
      });
	}
</script>
