<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--<link rel="stylesheet" type="text/css"--%>
<%--	href="/resources/grid/tui-time-picker.css" />--%>
<%--<link rel="stylesheet" type="text/css"--%>
<%--	href="/resources/grid/tui-date-picker.css" />--%>
<%--<link rel="stylesheet" type="text/css"--%>
<%--	href="/resources/grid/tui-pagination.css" />--%>
<%--<link rel="stylesheet" type="text/css"--%>
<%--	href="/resources/grid/tui-grid.css" />--%>

<%--<script>var errorLogs=[];window.onerror=function(o,r,e,n){errorLogs.push({message:o,source:r,lineno:e,colno:n})};</script>--%>

<%--<!--   <script src="https://unpkg.com/babel-standalone@6.26.0/babel.min.js"></script> -->--%>
<%--<!--   <script type="text/babel" class="code-js"> -->--%>
<%--<script src="https://uicdn.toast.com/tui.pagination/v3.4.0/tui-pagination.js"></script>--%>
<%--<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>--%>
<%--<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>--%>
<%--<script type="text/javascript" src="/resources/grid/tui-date-picker.js"></script>--%>
<%--<script type="text/javascript" src="/resources/grid/jquery.js"></script>--%>
<%--<script type="text/javascript" src="/resources/grid/jquery-ui.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>--%>
<%--<script type="text/javascript">--%>
<%--   $(document).ready(function(){--%>
<%--    const grid = new tui.Grid({--%>
<%--      --%>
<%--      data : ${data},--%>
<%--      el: document.getElementById('grid'), // [필수] Container element 		  --%>
<%--      columns: [   //테이블의 각 칼럼들--%>
<%--    	  --%>
<%--        {--%>
<%--          header: '코드 번호',  // [필수] 칼럼 이름 --%>
<%--          name: 'inqrNo',    		 // [필수] 칼럼 매핑 이름 값--%>
<%--		  sortingType: 'asc',   // [선택] 정렬  desc(역순), asc(정순)로도 가능--%>
<%--		  resizable: true,       // [선택] 컬럼의 리사이즈 여부 옵션--%>
<%--          sortable: true,		 // [선택] 칼럼의 정렬 여부--%>
<%--          hidden: true,--%>
<%--          align: 'center',   --%>
<%--//           editor: 'text',        // [선택] 수정 옵션--%>
<%--          --%>
<%--          // [선택] 필터 옵션--%>
<%--          filter: {--%>
<%--              type: 'text',--%>
<%--              showApplyBtn: true,--%>
<%--              showClearBtn: true--%>
<%--          },         --%>
<%--        },--%>
<%--    		--%>
<%--        {--%>
<%--            header: '이름',             // [필수] 컬럼 이름--%>
<%--            name: 'inqrNm',                 // [필수] 컬럼 매핑 이름 값--%>
<%--            editor: 'text',                 // [선택] 수정 옵션--%>
<%--            align: 'center',   --%>
<%--            // [선택] 필터 옵션--%>
<%--            filter: {--%>
<%--                type: 'text',--%>
<%--                showApplyBtn: true,--%>
<%--                showClearBtn: true--%>
<%--            },--%>
<%--        },             --%>
<%--        {--%>
<%--            header: '희망 지역',            --%>
<%--            name: 'inqrRgnlHope',             --%>
<%--            sortable: true,               --%>
<%--            resizable: true,                --%>
<%--            align: 'center',                --%>
<%--            filter: 'select',             --%>
<%--            formatter: 'listItemText',      --%>
<%--            editor: {--%>
<%--                type: 'radio',--%>
<%--                options: {--%>
<%--                    listItems:--%>
<%--                        [--%>
<%--                            {text: '서울', value: "서울"},--%>
<%--                            {text: '인천', value: "인천"},--%>
<%--                            {text: '경기도', value: "경기도"},--%>
<%--                            {text: '충청도', value: "충청도"},--%>
<%--                            {text: '전라도', value: "전라도"},--%>
<%--                            {text: '경상도', value: "경상도"},--%>
<%--                            {text: '강원/제주', value: "강원/제주"},--%>
<%--                            {text: '해외', value: "해외"},--%>
<%--                        ]--%>
<%--                },--%>
<%--            },--%>
<%--        },--%>
<%--        {--%>
<%--            header: '예상 비용',            --%>
<%--            name: 'inqrExpctCost',             --%>
<%--            sortable: true,               --%>
<%--            resizable: true,                --%>
<%--            align: 'center',                --%>
<%--            filter: 'select',             --%>
<%--            formatter: 'listItemText',      --%>
<%--            editor: {--%>
<%--                type: 'radio',--%>
<%--                options: {--%>
<%--                    listItems:--%>
<%--                        [--%>
<%--                            {text: '1억 미만', value: "100000000"},--%>
<%--                            {text: '1.5억 미만', value: "150000000"},--%>
<%--                            {text: '2억 미만', value: "200000000"},--%>
<%--                            {text: '2.5억 미만', value: "250000000"},--%>
<%--                            {text: '3억 이상 이상', value: "300000000"},--%>
<%--                        ]--%>
<%--                },--%>
<%--            },--%>
<%--        },--%>
<%--        --%>
<%--        {--%>
<%--            header: '상가 보유 ',             // [필수] 컬럼 이름--%>
<%--            name: 'inqrStoreYn',                 // [필수] 컬럼 매핑 이름 값--%>
<%--            sortable: true,                 // [선택] 컬럼의 정렬 여부--%>
<%--            resizable: true,                // [선택] 컬럼의 리사이즈 여부 옵션--%>
<%--            align: 'center',   --%>
<%--             filter: 'select',--%>
<%--             formatter: 'listItemText', --%>
<%--            editor: {// [선택] 수정 옵션--%>
<%--             type: 'select',--%>
<%--	             options: {--%>
<%--	                 listItems: [--%>
<%--	                     {text: "유", value: "Y"},--%>
<%--	                     {text: "무", value: "N"},--%>
<%--                 ]--%>
<%--             },--%>
<%--         },                 --%>
<%--            // [선택] 필터 옵션--%>
<%--            filter: {--%>
<%--                type: 'text',--%>
<%--                showApplyBtn: true,--%>
<%--                showClearBtn: true--%>
<%--            },--%>
<%--        },--%>

<%--        --%>
<%--        {--%>
<%--            header: '창업 경험  ',             // [필수] 컬럼 이름--%>
<%--            name: 'inqrStrtpXp',                 // [필수] 컬럼 매핑 이름 값--%>
<%--            sortable: true,                 // [선택] 컬럼의 정렬 여부--%>
<%--            resizable: true,                // [선택] 컬럼의 리사이즈 여부 옵션--%>
<%--            align: 'center',  --%>
<%--             filter: 'select',--%>
<%--             formatter: 'listItemText',  --%>
<%--            editor: {// [선택] 수정 옵션--%>
<%--            align: 'center',   --%>
<%--             type: 'select',--%>
<%--             options: {--%>
<%--                 listItems: [--%>
<%--                     {text: "유", value: "Y"},--%>
<%--                     {text: "무", value: "N"}--%>
<%--                 ]--%>
<%--             }--%>
<%--         },                 --%>
<%--            // [선택] 필터 옵션--%>
<%--            filter: {--%>
<%--                type: 'text',--%>
<%--                showApplyBtn: true,--%>
<%--                showClearBtn: true--%>
<%--            },--%>
<%--        },--%>
<%--        --%>
<%--        {--%>
<%--            header: '신청 일시',             // [필수] 컬럼 이름--%>
<%--            name: 'inqrReqDt',                 // [필수] 컬럼 매핑 이름 값--%>
<%--            sortable: true,                 // [선택] 컬럼의 정렬 여부--%>
<%--            resizable: true,                // [선택] 컬럼의 리사이즈 여부 옵션--%>
<%--            editor: 'text',                 // [선택] 수정 옵션--%>
<%--            // [선택] 필터 옵션--%>
<%--            filter: {--%>
<%--                type: 'date',--%>
<%--                showApplyBtn: true,--%>
<%--                showClearBtn: true--%>
<%--            },--%>
<%--        },--%>

<%--        {--%>
<%--            header: '처리 상태',             // [필수] 컬럼 이름--%>
<%--            name: 'inqrStatusYn',             // [필수] 컬럼 매핑 이름 값--%>
<%--            sortable: true,                 // [선택] 컬럼의 정렬 여부--%>
<%--            resizable: true,                // [선택] 컬럼의 리사이즈 여부 옵션--%>
<%--            align: 'center',                // [선택] 텍스트 정렬 옵션--%>
<%--            filter: 'select',               // [선택] 필터 옵션--%>
<%--            formatter: 'listItemText',      // [선택] select box 옵션--%>
<%--            filter: {--%>
<%--                type: 'text',--%>
<%--                showApplyBtn: true,--%>
<%--                showClearBtn: true--%>
<%--            },--%>
<%--            editor: {--%>
<%--                type: 'radio',--%>
<%--                options: {--%>
<%--                    listItems:--%>
<%--                        [--%>
<%--                            {text: '대기', value: "P"},--%>
<%--                            {text: '승인', value: "Y"},--%>
<%--                            {text: '거절', value: "N"},--%>
<%--                        ]--%>
<%--                },--%>
<%--            },--%>
<%--        }--%>

<%--    ],--%>
<%--    --%>
<%--    // ===== 합계출력   [Option] 최종 요약 데이터 출력 : max, min, sum, avg ===--%>
<%--    summary: {--%>
<%--        height: 40,--%>
<%--        position: 'bottom', // or 'top'--%>
<%--        columnContent: {--%>
<%--        	inqrStatusYn: {--%>
<%--                template: (valueMap) => {--%>
<%--                    return `사용자 합계 : \${valueMap.cnt} `--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>
<%--    },--%>
<%--      --%>
<%--    // [선택] 순번 기능--%>
<%--    --%>
<%--      rowHeaders: [{   //테이블 맨 왼쪽에 rownum으로 숫자 매겨줌--%>
<%--		type:'rowNum',--%>
<%--// 		width: 100, align: 'left', valign: 'bottom'  width= 헤더의 너비 , align = 가로, valign = 세로--%>
<%--		header : "순번" //칼럼 이름--%>
<%--	},--%>
<%--	  { // 체크박스 --%>
<%--		type: 'checkbox'--%>
<%--		,header: `--%>
<%--	        <label for="all-checkbox" class="checkbox">--%>
<%--	          <input type="checkbox" id="all-checkbox" class="hidden-input" name="_checked" />--%>
<%--	          <span class="custom-input"></span>--%>
<%--	        </label>--%>
<%--	      `--%>
<%--	}--%>
<%--	],--%>
<%--	--%>
<%--      pageOptions: {  //자료 페이징 처리 --%>
<%--        useClient: true,--%>
<%--        perPage: 10 // 한페이지당 데이터 갯수--%>
<%--      },--%>
<%--    --%>


<%-- --%>
<%--      --%>
<%--    //엑셀 화--%>
<%--      contextMenu: ({ rowKey, columnName }) => (--%>
<%--	            [--%>
<%--	              [--%>
<%--	                {--%>
<%--	                  name: 'export',--%>
<%--	                  label: 'Export',--%>
<%--	                  subMenu: [--%>
<%--	                    {--%>
<%--	                      name: 'default',--%>
<%--	                      label: 'Default',--%>
<%--	                      subMenu: [--%>
<%--	                        {--%>
<%--	                          name: 'csvExport',--%>
<%--	                          label: 'CSV export',--%>
<%--	                          action: () => {--%>
<%--	                            grid.export('csv');--%>
<%--	                          }--%>
<%--	                        },--%>
<%--	                        {--%>
<%--	                          name: 'excelExport',--%>
<%--	                          label: 'Excel export',--%>
<%--	                          action: () => {--%>
<%--	                            grid.export('xlsx');--%>
<%--	                          }--%>
<%--	                        },--%>
<%--	                      ]--%>
<%--	                    },--%>
<%--	                    {--%>
<%--	                      name: 'includeHeader',--%>
<%--	                      label: 'includeHeader: false',--%>
<%--	                      subMenu: [--%>
<%--	                        {--%>
<%--	                          name: 'csvExport',--%>
<%--	                          label: 'CSVF export',--%>
<%--	                          action: () => {--%>
<%--	                            grid.export('csv', { includeHeader: false });--%>
<%--	                          }--%>
<%--	                        },--%>
<%--	                        {--%>
<%--	                          name: 'excelExport',--%>
<%--	                          label: 'Excel export',--%>
<%--	                          action: () => {--%>
<%--	                            grid.export('xlsx', { includeHeader: false });--%>
<%--	                          }--%>
<%--	                        },--%>
<%--	                      ]--%>
<%--	                    },--%>
<%--	                    {--%>
<%--	                      name: 'colunmNames',--%>
<%--	                      label: `['name', 'artist']`,--%>
<%--	                      subMenu: [--%>
<%--	                        {--%>
<%--	                          name: 'csvExport',--%>
<%--	                          label: 'CSV export',--%>
<%--	                          action: () => {--%>
<%--	                            grid.export('csv', { columnNames: ['eempno', 'ename'] });--%>
<%--	                          }--%>
<%--	                        },--%>
<%--	                        {--%>
<%--	                          name: 'excelExport',--%>
<%--	                          label: 'Excel export',--%>
<%--	                          action: () => {--%>
<%--	                            grid.export('xlsx', { columnNames: ['eempno', 'ename'] });--%>
<%--	                          }--%>
<%--	                        },--%>
<%--	                      ]--%>
<%--	                    },--%>
<%--	                    {--%>
<%--	                      name: 'onlySelected',--%>
<%--	                      label: 'onlySelected: true',--%>
<%--	                      subMenu: [--%>
<%--	                        {--%>
<%--	                          name: 'csvExport',--%>
<%--	                          label: 'CSV export',--%>
<%--	                          action: () => {--%>
<%--	                            grid.export('csv', { onlySelected: true });--%>
<%--	                          }--%>
<%--	                        },--%>
<%--	                        {--%>
<%--	                          name: 'excelExport',--%>
<%--	                          label: 'Excel export',--%>
<%--	                          action: () => {--%>
<%--	                            grid.export('xlsx', { onlySelected: true });--%>
<%--	                          }--%>
<%--	                        },--%>
<%--	                      ]--%>
<%--	                    },--%>
<%--	                  ],--%>
<%--	                }--%>
<%--	              ],--%>
<%--	            ]--%>
<%--	          )--%>
<%--	 --%>
<%--    });	--%>
<%--    //끝 --%>
<%--//     list();--%>
<%--    --%>
<%--    grid.on('click', (a) => {--%>
<%--  	  console.log('clicked!!');--%>
<%--  	  console.log(a.rowKey);--%>
<%--  	  console.log(a.columnName);--%>
<%--  	  --%>
<%--  	  let columnName = a.columnName;--%>
<%--  	  let rowkey = a.rowKey;--%>
<%--  	  let inqrno = grid.getFormattedValue(rowkey,'inqrNo');--%>
<%--  	  if(columnName==='inqrNm'){--%>
<%--  		let url = `/admin/inqr/detail?InqrNo=\${inqrno}`;--%>
<%--  		location.href=url;--%>
<%--	   }--%>
<%--  	  });--%>

<%--  	grid.on('dblclick', () => {--%>
<%--  	  console.log('double clicked!!');--%>
<%--  	});--%>
<%--    --%>
<%--//     grid.on('click', (ev) => {--%>
<%--//         let _this = this;--%>
<%--//         let selectedColumn = ev.columnName;--%>

<%--//         /* 내용을 선택하는 경우에만 수행 */--%>
<%--//         if (selectedColumn != "inqrNm") return;--%>

<%--//         /* Column을 클릭했을 때만 수행 */--%>
<%--//         let focuesCell = this.grid.getFocusedCell();--%>

<%--//         if (focuesCell) {--%>

<%--//           let review_id = _this.grid.getRow(ev.rowKey).inqrStatusYn;--%>
<%--//           this.readOne(inqrStatusYn);--%>
<%--//         }--%>
<%--//       });--%>
<%--    --%>
<%--    tui.Grid.applyTheme('striped'); // 기본 테마 설정--%>

<%--    // [선택]Grid confirm 메시지--%>
<%--    --%>
<%--    --%>
<%--	--%>
<%--    const appendBtn = document.getElementById('appendBtn');--%>
<%--    const prependBtn = document.getElementById('prependBtn');--%>

<%--     --%>
<%--//     function list(){--%>
<%--//     	   $.ajax({--%>
<%--//     			url : "/admin/inqr/getList",--%>
<%--//     			method : "get",--%>
<%--//     			dataType : "JSON",--%>
<%--//     			contentType : "application/json;charset=UTF-8",--%>
<%--//     			beforeSend:function(xhr){--%>
<%--//     	               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");--%>
<%--//     	            },--%>
<%--//     			success : function(result) {--%>
<%--//     				console.log("result : " + result);--%>
<%--//     				grid.resetData(result);--%>
<%--    				--%>
<%--//     			}// suc--%>
<%--//     		}); //ajax--%>
<%--//     	   }--%>
<%--    --%>
<%--//     //추가버튼--%>
<%--//     appendBtn.addEventListener('click', () => {--%>
<%--    	--%>
<%--//     	grid.check(cnt);--%>
<%--//         grid.prependRow({--%>
<%--//                 "eempno": "자동생성",--%>
<%--//                 "ename": "",--%>
<%--//                 "eaddress": "",--%>
<%--//                 "etelno": "",--%>
<%--//                 "eposition": "",--%>
<%--//                 "edept": "",--%>
<%--//             },--%>
<%--//             {focus: true}--%>
<%--//         );--%>
<%--//         grid.setPerPage(10);    // 페이지당 10개씩 보여지고 페이지 새로고침을 수행합니다.--%>
<%--//         cnt++;--%>
<%--//     });--%>
<%--    --%>
<%--  // 수정버튼 클릭시 --%>
<%--   $(document).on("click","#updateBtn",function(){--%>
<%--	   var datas = grid.getCheckedRows();--%>
<%--	   var count = datas.length;--%>
<%--	   console.log(count);--%>
<%--	   var data = JSON.stringify(datas);--%>
<%--	   var parsedData = JSON.parse(data);--%>
<%--	--%>
<%--	   --%>
<%--	   if(count>0){ // data가 한개이상일때만 실행--%>
<%--	    for (let i = 0; i < count; i++) {--%>
<%--			var db = datas[i];--%>
<%--			var rowKey = parsedData[i].rowKey; --%>
<%--			console.log("rowkey",rowKey);--%>
<%--			$.ajax({--%>
<%--				url : "/admin/inqr/updatePost",--%>
<%--				type : "post",--%>
<%--				contentType : "application/json;charset=utf-8",--%>
<%--				data : JSON.stringify(db),--%>
<%--				dataType : "JSON",--%>
<%--				beforeSend:function(xhr){--%>
<%--		               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");--%>
<%--		        },--%>
<%--				success : function(result){--%>
<%--					console.log(result);--%>
<%--// 					grid.setRow(rowKey, db);--%>
<%--					grid.setPerPage(10);--%>
<%--					grid.refreshLayout()--%>
<%--					--%>
<%--// 					location.reload();--%>
<%--				}--%>
<%--			}); //ajax 끝--%>
<%--		} --%>
<%--	    grid.uncheckAll();--%>
<%--	    alert("수정이 완료되었습니다.");--%>
<%--	   }--%>
<%--   })--%>
<%-- --%>
<%--   //삭제버튼 클릭 시--%>
<%--      $(document).on("click","#deleteBtn",function(){--%>
<%--    --%>
<%--	   var datas = grid.getCheckedRows();--%>
<%--	   var count = datas.length;--%>
<%--	   console.log(count);--%>
<%--	   var data = JSON.stringify(datas);--%>
<%--	   var parsedData = JSON.parse(data);--%>
<%--	   if(confirm("삭제하시겠습니까?")){ --%>
<%--		   if(count>0){ // data가 한개이상일때만 실행--%>
<%--			   --%>
<%--			    for (let i = 0; i < count; i++) {--%>
<%--					var db = datas[i];--%>
<%--					var rowKey = parsedData[i].rowKey; --%>
<%--					--%>
<%--					$.ajax({--%>
<%--						url : "/admin/inqr/deletePost",--%>
<%--						type : "post",--%>
<%--						contentType : "application/json;charset=utf-8",--%>
<%--						data : JSON.stringify(db),--%>
<%--						dataType : "JSON",--%>
<%--						beforeSend:function(xhr){--%>
<%--				               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");--%>
<%--				            },--%>
<%--						success : function(result){--%>
<%--							console.log(result)--%>
<%--						}--%>
<%--					}); //ajax 끝--%>
<%--				}--%>
<%--			 grid.removeCheckedRows(true);--%>
<%--			 alert("삭제가 완료되었습니다.");--%>
<%--		   }--%>
<%--	   }--%>
<%--   })--%>

<%--   //등록버튼 클릭 시--%>
<%--      $(document).on("click","#registerBtn",function(){--%>
<%--    	  grid.disable(); //행 비활성화--%>
<%--	   var datas = grid.getCheckedRows();--%>
<%--	   var count = datas.length;--%>
<%--	   console.log(count);--%>
<%--	   var data = JSON.stringify(datas);--%>
<%--	   var parsedData = JSON.parse(data);--%>
<%--	   console.log(parsedData);--%>
<%--	   --%>
<%--	   if(count>0){ // data가 한개이상일때만 실행--%>
<%--	    for (let i = 0; i < count; i++) {--%>
<%--			var db = datas[i];--%>
<%--			var rowKey = parsedData[i].rowKey; --%>
<%--			--%>
<%--			$.ajax({--%>
<%--				url : "/admin/grid/EmpCreatePost",--%>
<%--				type : "post",--%>
<%--				contentType : "application/json;charset=utf-8",--%>
<%--				data : JSON.stringify(db),--%>
<%--				dataType : "JSON",--%>
<%--				beforeSend:function(xhr){--%>
<%--		               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");--%>
<%--		            },--%>
<%--				success : function(result){--%>
<%--					console.log(result)--%>
<%--					grid.setPerPage(10,result);--%>
<%--					--%>
<%--				}--%>
<%--				--%>
<%--			}); //ajax 끝--%>
<%--		} --%>
<%--	    cnt = 0;--%>
<%--	    grid.refreshLayout()--%>
<%--	    grid.uncheckAll();--%>
<%--	    grid.enable(); //행 활성화--%>
<%--		 alert("등록이 완료되었습니다.");--%>
<%--	   }--%>
<%--   })--%>
<%--   })--%>
<%--  </script>--%>

<%--</head>--%>

<style>
	.table-responsive {
		cursor: default;
		overflow-x: clip;
	}
	.dataTables_paginate{
		margin-top: 20px !important;
	}
	tbody > tr {
		cursor: pointer;
	}
</style>

<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
  <div class="card-body px-4 py-3">
    <div class="row align-items-center">
      <div class="col-9">
        <h4 class="fw-semibold mb-8">창업 상담 신청자 조회</h4>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a class="text-muted text-decoration-none" href="/admin/main">Home</a>
            </li>
            <li class="breadcrumb-item">
              <a class="text-muted text-decoration-none" href="/admin/inqr/waitList">창업 상담 관리</a>
            </li>
            <li class="breadcrumb-item" aria-current="page">상담 대기</li>
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
<%--	<div class="description">--%>
<%--		<strong>창업 상담 신청자 조회 </strong>--%>
<%--	</div>--%>
<%--	<h1 style="margin-bottom: 50px; margin-top: 50px; text-align: center">--%>
<%--	상담 대기 목록</h1>--%>
<%--	<!-- 테이블 추가 이벤트 -->--%>
<%--	<div class="btn-wrapper" style="margin-bottom: 10px;">--%>
<%--		<div class="code-html contents">--%>
<%--			<div class="btn-wrapper">--%>
<%--				<button id="appendBtn">추가</button>--%>
<%--				<button id="registerBtn">등록</button>--%>
<%--				<button id="updateBtn">수정</button>--%>
<%--				<button id="deleteBtn">삭제</button>--%>
<%--			</div>--%>

<%--			<!-- 그리드 출력 -->--%>
<%--			<div id="grid"></div>--%>
<%--			<!-- 테마 출력 -->--%>
<%--			<div id="theme"></div>--%>
<%--		</div>--%>
<%--	</div>--%>

<div class="card">
	<div class="card-body">
		<div class="table-responsive">
			<table id="adminInqrList" class="table border table-bordered text-nowrap">
				<thead>
				<tr>
					<th class="fw-semibold mb-0 text-center">순번</th>
					<th class="fw-semibold mb-0 text-center">이름</th>
					<th class="fw-semibold mb-0 text-center">희망지역</th>
					<th class="fw-semibold mb-0 text-center">예상비용</th>
					<th class="fw-semibold mb-0 text-center">상가보유</th>
					<th class="fw-semibold mb-0 text-center">창업경험</th>
					<th class="fw-semibold mb-0 text-center">신청일시</th>
					<th class="fw-semibold mb-0 text-center">처리상태</th>
				</tr>
				</thead>
				<tbody>
				<!-- start row -->
				<c:choose>
					<c:when test="${fn:length(dataList) > 0}">
						<c:forEach items="${dataList}" var="inqrVO" varStatus="stat">
							<tr onclick="location.href='/admin/inqr/detail?InqrNo=${inqrVO.inqrNo}'">
								<td class="mb-0 text-center">${stat.count}</td>
								<td class="mb-0 text-center">
									${inqrVO.inqrNm}
								</td>
								<td class="mb-0 text-center">${inqrVO.inqrRgnlHope}</td>
								<td class="mb-0 text-center">
									<c:choose>
										<c:when test="${inqrVO.inqrExpctCost == 100000000}">1억 미만</c:when>
										<c:when test="${inqrVO.inqrExpctCost == 150000000}">1.5억 미만</c:when>
										<c:when test="${inqrVO.inqrExpctCost == 200000000}">2억 미만</c:when>
										<c:when test="${inqrVO.inqrExpctCost == 250000000}">2.5억 미만</c:when>
										<c:when test="${inqrVO.inqrExpctCost == 300000000}">3억 미만</c:when>
									</c:choose>
								</td>
								<td class="mb-0 text-center">
									<c:choose>
										<c:when test="${inqrVO.inqrStoreYn == 'Y'}">
											유
										</c:when>
										<c:otherwise>
											무
										</c:otherwise>
									</c:choose>
								</td>
								<td class="mb-0 text-center">
									<c:choose>
										<c:when test="${inqrVO.inqrStrtpXp == 'Y'}">
											유
										</c:when>
										<c:otherwise>
											무
										</c:otherwise>
									</c:choose>
								</td>
								<td class="mb-0 text-center">${inqrVO.inqrReqDt}</td>
								<td class="mb-0 text-center">
									<c:choose>
										<c:when test="${inqrVO.inqrStatusYn == 'P'}">
											대기
										</c:when>
										<c:otherwise>
											처리완료
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8">
								<p>대기중인 상담 신청이 없습니다.</p>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
				<!-- end row -->
				</tbody>
			</table>
		</div>
	</div>
</div>

<script src="/resources/bootstrap/src/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script>
	$("#adminInqrList").DataTable({
		bLengthChange: false,
		info: false,
		order: []
	});
</script>