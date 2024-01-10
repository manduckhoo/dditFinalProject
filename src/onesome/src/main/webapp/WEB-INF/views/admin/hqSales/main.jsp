<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/datePicker.css">

<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
  <div class="card-body px-4 py-3">
    <div class="row align-items-center">
      <div class="col-9">
        <h4 class="fw-semibold mb-8">매출 관리</h4>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a class="text-muted text-decoration-none" href="/admin/main">Main</a>
            </li>
            <li class="breadcrumb-item" aria-current="page">매출 관리</li>
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
<div class="container-fluid">
<div>
            <!--  Owl carousel -->
            <h1 class="fw-semibold fs-8 mt-5 mb-4">본사 매출</h1>
            <!--  Row 1 -->
            <div class="row">
              <div class="col-lg-8 d-flex align-items-strech">
                <div class="card w-100">
                  <div class="card-body">
                    <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                      <div class="mb-3 mb-sm-0">
                        <!-- <h5 class="card-title fw-semibold">본사 매출</h5> -->
                      </div>
                    </div>
                    <div class="row align-items-center">
                   	 <div id="wrap">
					   <div id="chart-year">
					       <!-- 차트 컨테이너 -->
					   </div>
					   <div id="chart-quarter">
					       <!-- 차트 컨테이너 -->
					   </div>
					</div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 d-flex align-items-strech">
                <div class="card w-100">
                  <div class="card-body">
                  <h5 class="card-title fw-semibold">매출 비중</h5>
                    <div id="piechart">
                    <div id="piechart2">
                    
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
		</div>
</div>
	
<script type="text/javascript">

var maindata = JSON.parse('${maindata}');
    console.log("data 왔다", maindata);

    function convertTimestampToDate(timestamp) {
        var date = new Date(timestamp);
        return date.getFullYear() + '-' + (date.getMonth() + 1).toString().padStart(2, '0');
    }

    // 배열의 모든 원소에 대해 날짜 변환 수행
    maindata.month.forEach(item => {
        item.MONTH = convertTimestampToDate(item.MONTH);
    });

	//월별 data
    var month = maindata.month
    
 // 년도별로 데이터를 그룹화하는 함수
    function groupByYear(dataArray) {
        return dataArray.reduce((acc, currentValue) => {
            // 'MONTH' 필드에서 년도 추출
            let year = currentValue.MONTH.split('-')[0];

            // 해당 년도의 키가 이미 accumulator에 있는지 확인
            if (!acc[year]) {
                acc[year] = []; // 해당 년도의 키가 없으면 새 배열 생성
            }

            acc[year].push(currentValue); // 현재 값을 해당 년도의 배열에 추가
            return acc;
        }, {});
    }

    var monthData = groupByYear(month);
    console.log("monthData -> ",monthData);
    
    //전체 파이차트에 넣을 data
    var bigPieNm=Object.keys(maindata.salesP[0]);
    var bigPieVal=Object.values(maindata.salesP[0]);
    
    console.log("bigPieNm ->",bigPieNm);
    console.log("bigPieVal ->",bigPieVal);
    
    //전체 차트에 넣을 data
    var yearData = maindata.yearData;
    //각각의 key값별로 배열화
    
    //총 매출
    var sales = yearData.map(item => item.SALES);
    // 인건비
    var salaries = yearData.map(item => item.SALARY);
    // 물건 구입금
    var totalOrders = yearData.map(item => item.TOTALORDER);
    var years = yearData.map(item => item.YEAR);
    //비용
    var cost = yearData.map(item => item.TOTALORDER + item.SALARY);
    var costRate = yearData.map(item => parseFloat(((item.SALES - (item.TOTALORDER + item.SALARY)) / item.SALES * 100).toFixed(1)));
	
    console.log("순익률 -> ", costRate);
    console.log("비용 ->",cost);
    
    
    
var data ={};
data.xName='';
var colors = [
    "#008FFB",
    "#00E396",
    "#FEB019",
    "#FF4560",
    "#775DD0",
    "#00D9E9",
    "#FF66C3"
];
var options = {
	    series: [{
	        name: '매출',
	        type: 'column',
	        data: sales
	    }, {
	        name: '비용',
	        type: 'column',
	        data: cost
	    }, {
	        name: '손익률',
	        type: 'line',
	        data: costRate
	    }],
	    xaxis: {
	        categories: years,
	    },
	    yaxis: [
            {
          	seriesName: '매출',
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
              seriesName: '매출',
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
	    title: {
	        text: '본사 매출 (2020 - 2024)',
	        align: 'center', // 제목 위치
	        fontSize: '20px', // 제목 사이즈
	    },
	    dataLabels: {
	        enabled: true
	    },  
	    colors:['#d50037', '#0254d3', '#152b4f'],
	    chart: {
	        id: 'barYear',
	        height: 400,
	        width: '100%',
	        events: {
	            dataPointSelection: function (e, chart, opts) {
	            	console.log("e",e);
	            	console.log("chart",chart);
	            	console.log("opts",opts);
	                var quarterChartEl = document.querySelector("#chart-quarter");
	                var piechart2El = document.querySelector("#piechart2");
	                var yearChartEl = document.querySelector("#chart-year");
	                //클릭한 data의 index 값
	                var selectedDataPointIndex = opts.dataPointIndex;
	                //클릭한 data의 x축 이름
	                data.xName = chart.data.w.globals.categoryLabels[selectedDataPointIndex];
	                console.log("나오냐",data.xName);
	                
	                chartQuarter.updateOptions({
	                    title: {
	                        text: data.xName + '년의 월별 매출'
	                    }
	                });
	                
	                piechart2.updateOptions({
	                    title: {
	                        text: data.xName + '년의 매출 비중'
	                    }
	                });
	                updateSecondChart(data.xName); // 수정된 호출
	                
	                if (opts.selectedDataPoints[0].length === 1) {
	                    yearChartEl.classList.add("chart-quarter-activated");
	                    quarterChartEl.style.display = 'block'; // 쿼터 차트 표시
	                    piechart2El.style.display ='block';
	                    
	                } else {
	                    yearChartEl.classList.remove("chart-quarter-activated");
	                    quarterChartEl.style.display = 'none'; // 쿼터 차트 숨기기
	                    piechart2El.style.display ='none';
	                }
	            }
	        }
	    },
	};

var chart = new ApexCharts(document.querySelector("#chart-year"), options);
chart.render();

console.log("ss",data.xName);
document.addEventListener('DOMContentLoaded', function() {
    
	var quarterChartEl = document.querySelector("#chart-quarter");
    quarterChartEl.style.display = 'none';

    var piechart2El = document.querySelector("#piechart2");
    piechart2El.style.display = 'none';
});


chart.addEventListener('dataPointSelection', function (e, chart, opts) {
    var selectedDataPointIndex = opts.dataPointIndex;
    data.xName = chart.data.w.globals.categoryLabels[selectedDataPointIndex];
    
    updateSecondChart(data.xName); // 두 번째 차트 업데이트 함수 호출

    // 차트의 선택된 데이터 포인트가 있는 경우
    if (opts.selectedDataPoints[0].length === 1) {
        quarterChartEl.style.display = 'block'; // 쿼터 차트 표시
        piechart2El.style.display = 'block'; // 파이차트 2 표시
    } else {
        quarterChartEl.style.display = 'none'; // 쿼터 차트 숨기기
        piechart2El.style.display = 'none'; // 파이차트 2 숨기기
    }
});

var optionsQuarter = {
    series: [{
        data: []
    }],
    xaxis: {
        categories: [],
    },
    title: {
        text: data.xName+'의 월별 매출',
        align: 'center', // 제목 위치
        fontSize: '20px', // 제목 사이즈
    },
    dataLabels: {
        enabled: true
    },
    chart: {
        id: 'barQuarter',
        height: 400,
        width: '100%',
    },
};



var chartQuarter = new ApexCharts(document.querySelector("#chart-quarter"), optionsQuarter);
chartQuarter.render();

//2번쨰차트 값 꺼내기
function updateSecondChart(selectedYear) {
    var secondChartData = monthData[selectedYear];
    
    if (!secondChartData) {
        console.error("데이터를 찾을 수 없습니다.");
        return;
    }

    var quartersSeries = [
        { name: '매출', type: 'column', data: secondChartData.map(q => q.FEE + q.ROYAL + q.ORDERAMT + q.OVRINT) },
        { name: '비용', type: 'column', data: secondChartData.map(q => q.TOTAL + q.SALARY) },
        { name: '손익률', type: 'line', data: secondChartData.map(q => {
            const 매출 = q.FEE + q.ROYAL + q.ORDERAMT + q.OVRINT;
            const 비용 = q.TOTAL + q.SALARY;
            if (매출 > 0) {
                return parseFloat(((매출 - 비용) / 매출 * 100).toFixed(1));
            } else {
                return 0; // 매출이 0이하인 경우, 손익률을 0으로 처리
            }
        })}
    ];

    chartQuarter.updateSeries(quartersSeries);
    chartQuarter.updateOptions({
        xaxis: {
            categories: secondChartData.map(q => q.MONTH),
        },
        yaxis: [
            {
          	seriesName: '매출',
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
              seriesName: '매출',
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
    });
}

    
    
    
    	
    var pieoptions = {
            series: bigPieVal,
            chart: {
            id:'pie1',
            width: 500,
            type: 'pie',
           
          },
          legend: {
              show: true,
              showForSingleSeries: false,
              showForNullSeries: true,
              showForZeroSeries: true,
              position: 'bottom',
              horizontalAlign: 'center', 
              floating: false,
              fontSize: '14px',
            },
          labels: bigPieNm,
        
          };

          var piechart = new ApexCharts(document.querySelector("#piechart"), pieoptions);
          piechart.render();

          var pieoptions2 = {	
            series: [44, 55, 13, 43, 22],
            chart: {
            id:'pie2',
            width: 500,
            type: 'pie',
           
          },
          legend: {
              show: true,
              showForSingleSeries: false,
              showForNullSeries: true,
              showForZeroSeries: true,
              position: 'bottom',
              horizontalAlign: 'center', 
              floating: false,
              fontSize: '14px',
            },
          labels: ['Team A', 'Team B', 'Team C', 'Team D', 'Team E'],
        
          };

          var piechart2 = new ApexCharts(document.querySelector("#piechart2"), pieoptions2);
          piechart2.render();



</script>
