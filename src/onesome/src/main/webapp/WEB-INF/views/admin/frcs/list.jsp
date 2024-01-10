<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>1. Basic</title>
<link rel="stylesheet" type="text/css"
	href="/resources/grid/tui-time-picker.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/grid/tui-date-picker.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/grid/tui-pagination.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/grid/tui-grid.css" />
<style>
.btn-wrapper {
	margin-bottom: 10px;
}
</style>
<script>var errorLogs=[];window.onerror=function(o,r,e,n){errorLogs.push({message:o,source:r,lineno:e,colno:n})};</script>

<!--   <script src="https://unpkg.com/babel-standalone@6.26.0/babel.min.js"></script> -->
<!--   <script type="text/babel" class="code-js"> -->
<script src="https://uicdn.toast.com/tui.pagination/v3.4.0/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
<script type="text/javascript" src="/resources/grid/tui-date-picker.js"></script>
<script type="text/javascript" src="/resources/grid/jquery.js"></script>
<script type="text/javascript" src="/resources/grid/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
    const grid = new tui.Grid({
      
      el: document.getElementById('grid'), // [필수] Container element 	
      data : ${data},
      columns: [   //테이블의 각 칼럼들
    	  
        {
          header: '가맹점 번호',  // [필수] 칼럼 이름 
          name: 'frcsNo',    		 // [필수] 칼럼 매핑 이름 값
		  sortingType: 'asc',   // [선택] 정렬  desc(역순), asc(정순)로도 가능
		  resizable: true,       // [선택] 컬럼의 리사이즈 여부 옵션
          sortable: true,		 // [선택] 칼럼의 정렬 여부
          hidden: true,
          align: 'center',   
//           editor: 'text',        // [선택] 수정 옵션
          
          // [선택] 필터 옵션
          filter: {
              type: 'text',
              showApplyBtn: true,
              showClearBtn: true
          },         
        },
        {
          header: '가맹점 이름',  // [필수] 칼럼 이름 
          name: 'frcsNm',    		 // [필수] 칼럼 매핑 이름 값
		  sortingType: 'asc',   // [선택] 정렬  desc(역순), asc(정순)로도 가능
		  resizable: true,       // [선택] 컬럼의 리사이즈 여부 옵션
          sortable: true,		 // [선택] 칼럼의 정렬 여부
          align: 'center',   
//           editor: 'text',        // [선택] 수정 옵션
          
          // [선택] 필터 옵션
          filter: {
              type: 'text',
              showApplyBtn: true,
              showClearBtn: true
          },         
        },

        {
            header: '가맹점 등록 일자',             // [필수] 컬럼 이름
            name: 'frcsRgstDt',                 // [필수] 컬럼 매핑 이름 값
//             editor: 'text',                 // [선택] 수정 옵션
            align: 'center',   
            // [선택] 필터 옵션
            filter: {
                type: 'text',
                showApplyBtn: true,
                showClearBtn: true
            },
        },

        {
            header: '가맹점 지역',             // [필수] 컬럼 이름
            name: 'frcsRegionCd',                 // [필수] 컬럼 매핑 이름 값
            sortable: true,                 // [선택] 컬럼의 정렬 여부
            resizable: true,                // [선택] 컬럼의 리사이즈 여부 옵션
            align: 'center',   
            filter: 'select',
            formatter: 'listItemText', 
            editor: {// [선택] 수정 옵션
             	 type: 'radio',
	             options: {
	                 listItems: [
	                     {text: "서울특별시", value: "11000"},
	                     {text: "부산광역시", value: "26000"},
	                     {text: "대구광역시", value: "27000"},
	                     {text: "인천광역시", value: "28000"},
	                     {text: "광주광역시", value: "29000"},
	                     {text: "대전광역시", value: "30000"},
	                     {text: "울산광역시", value: "31000"},
	                     {text: "경기도", value: "41000"},
	                     {text: "강원도", value: "42000"},
	                     {text: "충청북도", value: "43000"},
	                     {text: "충청남도", value: "44000"},
	                     {text: "전라북도", value: "45000"},
	                     {text: "전라남도", value: "46000"},
	                     {text: "경상북도", value: "47000"},
	                     {text: "경상남도", value: "48000"},
	                     {text: "폐업", value: "50000"},
	                     {text: "폐업", value: "77777"}
                 ]
             },
         },                 
        },
        {
            header: '운영상태',             // [필수] 컬럼 이름
            name: 'frcsStsCd',                 // [필수] 컬럼 매핑 이름 값
//             editor: 'text',                 // [선택] 수정 옵션
            align: 'center',   
            // [선택] 필터 옵션
                   filter: 'select',
            formatter: 'listItemText', 
            editor: {// [선택] 수정 옵션
             	 type: 'radio',
	             options: {
	                 listItems: [
	                     {text: "오픈준비", value: "FRST01"},
	                     {text: "운영중", value: "FRST02"},
	                     {text: "휴업", value: "FRST03"},
	                     {text: "폐업", value: "FRST04"}
                 ]
             },
        },
        }
    ],
    
    // ===== 합계출력   [Option] 최종 요약 데이터 출력 : max, min, sum, avg ===
    summary: {
        height: 40,
        position: 'bottom', // or 'top'
        columnContent: {
        	enabled: {
                template: (valueMap) => {
                    return `사용자 합계 : \${valueMap.cnt} `
                }
            }
        }
    },
      
    // [선택] 순번 기능
    
      rowHeaders: [{   //테이블 맨 왼쪽에 rownum으로 숫자 매겨줌
		type:'rowNum',
// 		width: 100, align: 'left', valign: 'bottom'  width= 헤더의 너비 , align = 가로, valign = 세로
		header : "순번" //칼럼 이름
	},
	  { // 체크박스 
		type: 'checkbox'
		,header: `
	        <label for="all-checkbox" class="checkbox">
	          <input type="checkbox" id="all-checkbox" class="hidden-input" name="_checked" />
	          <span class="custom-input"></span>
	        </label>
	      `
	}
	],
	
      pageOptions: {  //자료 페이징 처리 
        useClient: true,
        perPage: 10 // 한페이지당 데이터 갯수
      },
    


 
      
    //엑셀 화
      contextMenu: ({ rowKey, columnName }) => (
	            [
	              [
	                {
	                  name: 'export',
	                  label: 'Export',
	                  subMenu: [
	                    {
	                      name: 'default',
	                      label: 'Default',
	                      subMenu: [
	                        {
	                          name: 'csvExport',
	                          label: 'CSV export',
	                          action: () => {
	                            grid.export('csv');
	                          }
	                        },
	                        {
	                          name: 'excelExport',
	                          label: 'Excel export',
	                          action: () => {
	                            grid.export('xlsx');
	                          }
	                        },
	                      ]
	                    },
	                    {
	                      name: 'includeHeader',
	                      label: 'includeHeader: false',
	                      subMenu: [
	                        {
	                          name: 'csvExport',
	                          label: 'CSVF export',
	                          action: () => {
	                            grid.export('csv', { includeHeader: false });
	                          }
	                        },
	                        {
	                          name: 'excelExport',
	                          label: 'Excel export',
	                          action: () => {
	                            grid.export('xlsx', { includeHeader: false });
	                          }
	                        },
	                      ]
	                    },
	                    {
	                      name: 'colunmNames',
	                      label: `['name', 'artist']`,
	                      subMenu: [
	                        {
	                          name: 'csvExport',
	                          label: 'CSV export',
	                          action: () => {
	                            grid.export('csv', { columnNames: ['eempno', 'ename'] });
	                          }
	                        },
	                        {
	                          name: 'excelExport',
	                          label: 'Excel export',
	                          action: () => {
	                            grid.export('xlsx', { columnNames: ['eempno', 'ename'] });
	                          }
	                        },
	                      ]
	                    },
	                    {
	                      name: 'onlySelected',
	                      label: 'onlySelected: true',
	                      subMenu: [
	                        {
	                          name: 'csvExport',
	                          label: 'CSV export',
	                          action: () => {
	                            grid.export('csv', { onlySelected: true });
	                          }
	                        },
	                        {
	                          name: 'excelExport',
	                          label: 'Excel export',
	                          action: () => {
	                            grid.export('xlsx', { onlySelected: true });
	                          }
	                        },
	                      ]
	                    },
	                  ],
	                }
	              ],
	            ]
	          )
	 
    });	
    //끝 
    
   
    grid.on('click', (a) => {
  	  console.log('clicked!!');
  	  console.log(a.rowKey);
  	  console.log(a.columnName);
  	  
  	  let columnName = a.columnName;
  	  let rowkey = a.rowKey;
  	  let frcsNo = grid.getFormattedValue(rowkey,'frcsNo');
  	  if(columnName==='frcsNm'){
  		let url = `/admin/frcs/detail?frcsNo=\${frcsNo}`;
  		location.href=url;
	   }
  	  });

  	grid.on('dblclick', () => {
  	  console.log('double clicked!!');
  	});
    
//     grid.on('click', (ev) => {
//         let _this = this;
//         let selectedColumn = ev.columnName;

//         /* 내용을 선택하는 경우에만 수행 */
//         if (selectedColumn != "inqrNm") return;

//         /* Column을 클릭했을 때만 수행 */
//         let focuesCell = this.grid.getFocusedCell();

//         if (focuesCell) {

//           let review_id = _this.grid.getRow(ev.rowKey).inqrStatusYn;
//           this.readOne(inqrStatusYn);
//         }
//       });
    
    tui.Grid.applyTheme('striped'); // 기본 테마 설정

    // [선택]Grid confirm 메시지
    
    tui.Grid.setLanguage('en', {
        display: {
            noData: '데이터가 존재하지 않습니다.',
            loadingData: '데이터가 로딩중입니다.',
            resizeHandleGuide: 'You can change the width of the column by mouse drag, ' +
                'and initialize the width by double-clicking.'
        },
        net: {
            confirmCreate: 'Are you sure you want to create {{count}} data?',
            confirmUpdate: 'Are you sure you want to update {{count}} data?',
            confirmDelete: 'Are you sure you want to delete {{count}} data?',
            confirmModify: 'Are you sure you want to modify {{count}} data?',
            noDataToCreate: '등록 하려는 데이터가 존재하지 않습니다. ',
            noDataToUpdate: '수정 하려는 데이터가 존재하지 않습니다. ',
            noDataToDelete: 'No data to delete.',
            noDataToModify: '수정 할 데이터가 존재하지 않습니다. ',
            failResponse: 'An error occurred while requesting data.\nPlease try again.'
        }
    }); // set Korean
    
	
    const appendBtn = document.getElementById('appendBtn');
    const prependBtn = document.getElementById('prependBtn');


    
//     //추가버튼
//     appendBtn.addEventListener('click', () => {
    	
//     	grid.check(cnt);
//         grid.prependRow({
//                 "eempno": "자동생성",
//                 "ename": "",
//                 "eaddress": "",
//                 "etelno": "",
//                 "eposition": "",
//                 "edept": "",
//             },
//             {focus: true}
//         );
//         grid.setPerPage(10);    // 페이지당 10개씩 보여지고 페이지 새로고침을 수행합니다.
//         cnt++;
//     });
    
  // 수정버튼 클릭시 
   $(document).on("click","#updateBtn",function(){
	   var datas = grid.getCheckedRows();
	   var count = datas.length;
	   console.log(count);
	   var data = JSON.stringify(datas);
	   var parsedData = JSON.parse(data);
	
	   
	   if(count>0){ // data가 한개이상일때만 실행
	    for (let i = 0; i < count; i++) {
			var db = datas[i];
			var rowKey = parsedData[i].rowKey; 
			console.log("rowkey",rowKey);
			$.ajax({
				url : "/admin/FranChiseOwner/updatePost",
				type : "post",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(db),
				dataType : "JSON",
				beforeSend:function(xhr){
		               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		        },
				success : function(result){
					console.log(result);
// 					grid.setRow(rowKey, db);
					grid.setPerPage(10);
					grid.refreshLayout()
					
// 					location.reload();
				}
			}); //ajax 끝
		} 
	    grid.uncheckAll();
	    alert("수정이 완료되었습니다.");
	   }
   })
 
   //삭제버튼 클릭 시
      $(document).on("click","#deleteBtn",function(){
    
	   var datas = grid.getCheckedRows();
	   var count = datas.length;
	   console.log(count);
	   var data = JSON.stringify(datas);
	   var parsedData = JSON.parse(data);
	   if(confirm("삭제하시겠습니까?")){ 
		   if(count>0){ // data가 한개이상일때만 실행
			   
			    for (let i = 0; i < count; i++) {
					var db = datas[i];
					var rowKey = parsedData[i].rowKey; 
					
					$.ajax({
						url : "/admin/FranChiseOwner/deletePost",
						type : "post",
						contentType : "application/json;charset=utf-8",
						data : JSON.stringify(db),
						dataType : "JSON",
						beforeSend:function(xhr){
				               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				            },
						success : function(result){
							console.log(result)
						}
					}); //ajax 끝
				}
			 grid.removeCheckedRows(true);
			 alert("삭제가 완료되었습니다.");
		   }
	   }
   })

   //등록버튼 클릭 시
      $(document).on("click","#registerBtn",function(){
    	  grid.disable(); //행 비활성화
	   var datas = grid.getCheckedRows();
	   var count = datas.length;
	   console.log(count);
	   var data = JSON.stringify(datas);
	   var parsedData = JSON.parse(data);
	   console.log(parsedData);
	   
	   if(count>0){ // data가 한개이상일때만 실행
	    for (let i = 0; i < count; i++) {
			var db = datas[i];
			var rowKey = parsedData[i].rowKey; 
			
			$.ajax({
				url : "/admin/FranChiseOwner/createPost",
				type : "post",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(db),
				dataType : "JSON",
				beforeSend:function(xhr){
		               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		            },
				success : function(result){
					console.log(result)
					grid.setPerPage(10,result);
					
				}
				
			}); //ajax 끝
		} 
	    cnt = 0;
	    grid.refreshLayout()
	    grid.uncheckAll();
	    grid.enable(); //행 활성화
		 alert("등록이 완료되었습니다.");
	   }
   })
   })
  </script>

</head>
<body>
	<div class="description">
		<strong>가맹점 조회 </strong>
	</div>
	<h1 style="margin-bottom: 50px; margin-top: 50px; text-align: center">
	가맹점 목록</h1>
	<!-- 테이블 추가 이벤트 -->
	<div class="btn-wrapper" style="margin-bottom: 10px;">
		<div class="code-html contents">
			<div class="btn-wrapper">
				<button id="appendBtn">추가</button>
				<button id="registerBtn">등록</button>
				<button id="updateBtn">수정</button>
				<button id="deleteBtn">삭제</button>
			</div>

			<!-- 그리드 출력 -->
			<div id="grid"></div>
			<!-- 테마 출력 -->
			<div id="theme"></div>
		</div>
	</div>
</body>
</html>
