<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/resources/bootstrap/src/assets/js/apps/invoice.js"></script>
<%-- <p>${data}</p> --%>
<style>
.w-25 {
    width: 18% !important;
}
</style>
<div class="container-fluid">	
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
  <div class="card-body px-4 py-3">
    <div class="row align-items-center">
      <div class="col-9">
        <h4 class="fw-semibold mb-8">개점 준비</h4>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a class="text-muted text-decoration-none" href="../main/index.html">가맹점</a>
            </li>
            <li class="breadcrumb-item" aria-current="page">개점 준비</li>
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
                    <input type="search" class="form-control search-invoice ps-5" id="text-srh" placeholder="Search Invoice">
                    <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
                  </form>
                </div>
                <div class="app-invoice">
                  <ul class="overflow-auto invoice-users" style="height: calc(100vh - 262px)" data-simplebar="init"><div class="simplebar-wrapper" style="margin: 0px;"><div class="simplebar-height-auto-observer-wrapper"><div class="simplebar-height-auto-observer"></div></div><div class="simplebar-mask"><div class="simplebar-offset" style="right: 0px; bottom: 0px;"><div class="simplebar-content-wrapper" tabindex="0" role="region" aria-label="scrollable content" style="height: 100%; overflow: hidden;"><div class="simplebar-content" style="padding: 0px;">
                  
                  <!-- 가맹점 list for문 출력 시작-->
                  <c:forEach var="FranchiseVO" items="${data}" varStatus="stat">
                    <li>
                      <a href="javascript:void(0)" class="p-3 bg-hover-light-black border-bottom d-flex align-items-start invoice-user listing-user clsListClick" id="invoice-${data[stat.index].rnum}" data-invoice-id="${data[stat.index].frcsNo}" />
                        <div class="btn btn-primary round rounded-circle d-flex align-items-center justify-content-center">
                          <i class="ti ti-user fs-6"></i>
                        </div>
                        <div class="ms-3 d-inline-block w-75">
                          <h6 class="fs-3 invoice-id text-truncate thisName">${FranchiseVO.frcsNm}</h6>

                          <span class="fs-3 invoice-id text-truncate text-body-color d-block w-85">코드 : ${FranchiseVO.frcsNo}</span>
                          <span class="fs-3 invoice-date text-nowrap text-body-color d-block">계약일 : <fmt:formatDate value="${FranchiseVO.frcsCtrtCnclsDt}" pattern="yyyy-MM-dd" /></span>
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
                      <h4 class="mb-0 invoice-customer frcsNm">${data[0].frcsNm}</h4>
                      <div class="ms-auto">
                        <h4 class="invoice-number">#${data[0].frcsNo}</h4>
                      </div>
                    </div>
                    <div class="p-3" id="custom-invoice">
                     <c:forEach var="frcsVO" items="${data}" varStatus="stat">
                      <div class="invoice-${frcsVO.rnum}" id="printableArea" style="display: none;">
                        <div class="row pt-3">
                          <div class="col-md-12">
                            <div id="start">
                         <!--캘린더 시작 -->
			                  
              			<!--캘린더 끝  -->
                          </div>
                         </div>
                         </div>
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
        


<script type="text/javascript">	
	$(document).ready(function(){
	    listClick('${data[0].frcsNo}');
	});

	$(".clsListClick").on("click",function(){
		let frcsNo = $(this).data("invoiceId");
		listClick(frcsNo);
	});
	
	function listClick(frcsNo){
// 		let frcsNo = $(event.currentTarget).data("invoice-id")
		let data = {
			"frcsNo":frcsNo
		}
		console.log(frcsNo);
		
		$.ajax({
			url:"/admin/frcs/detail",
			type:"post",
			contentType : "application/json; charset=utf-8", 
			data:JSON.stringify(data),
			dataType:"json",
			beforeSend:function(xhr){
	               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	          },
	        success : function(result){
	        	
	            //null처리를 위해 위에서 따로 선언
	        	let frcsCtrtCnclsDt = result.frcsCtrtCnclsDt ? result.frcsCtrtCnclsDt : '-'; // 계약체결일자
	        	let frcsOpngDt = result.frcsOpngDt ? result.frcsOpngDt : '-'; // 개점일자
	        	let frcsFnlInspDt = result.frcsFnlInspDt ? result.frcsFnlInspDt : '-'; // 최종점검일자
	        	let frcsExptCmplDt = result.frcsExptCmplDt ? result.frcsExptCmplDt : '-'; // 예상 완공일자
	        	
	        	
	        	let frcsCpctPsn = result.frcsCpctPsn ? result.frcsCpctPsn : '-'; // 가맹점 수용 인원
	        	let frcsTel = result.frcsTel ? result.frcsTel : '-'; // 가맹점 전화번호
	        	let frcsBsnsStrtTm = result.frcsBsnsStrtTm ? result.frcsBsnsStrtTm : '-'; // 영업 시작 시간
	        	let frcsBsnsEndTm = result.frcsBsnsEndTm ? result.frcsBsnsEndTm : '-'; // 영업 종료 시간
	        	
	        	console.log("result : " + JSON.stringify(result));
	  	
	         let str = `
       	    	<div class="p-4 calender-sidebar app-calendar">
                 <div id="calendar"></div>
               </div>
		       <div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
		         <div class="modal-dialog modal-dialog-scrollable modal-lg">
		           <div class="modal-content">
		             <div class="modal-header">
		               <h5 class="modal-title" id="eventModalLabel">
		                	 가맹점 일정
		               </h5>
		               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		             </div>
		             <div class="modal-body">
		               <div class="row">
		                 <div class="col-md-12 mt-4">
		                   <div><label class="form-label">일정 종류</label></div>
		                   <div class="d-flex">
		                     <div class="n-chk">
		                       <div class="form-check form-check-primary form-check-inline">
		                         <input class="form-check-input" type="radio" name="event-level" value="계약 체결 일자" data-type="Danger"
		                           id="modalDanger" required />
		                         <label class="form-check-label" for="modalDanger">계약 체결 일자</label>
		                       </div>
		                     </div>
		                     <div class="n-chk">
		                       <div class="form-check form-check-warning form-check-inline">
		                         <input class="form-check-input" type="radio" name="event-level" value="예상 완공 일자" data-type="Success" required
		                           id="modalSuccess" />
		                         <label class="form-check-label" for="modalSuccess">예상 완공일자</label> 
		                       </div>
		                     </div>
		                     <div class="n-chk">
		                       <div class="form-check form-check-success form-check-inline">
		                         <input class="form-check-input" type="radio" name="event-level" value="최종 점검 일자" data-type="Primary" required
		                           id="modalPrimary" />
		                         <label class="form-check-label" for="modalPrimary">최종 점검 일자</label>
		                       </div>
		                     </div>
		                     <div class="n-chk">
		                       <div class="form-check form-check-success form-check-inline">
		                         <input class="form-check-input" type="radio" name="event-level" value="개점 일자" data-type="Warning" required
		                           id="modalPrimary" />
		                         <label class="form-check-label" for="modalPrimary">개점 일자</label>
		                       </div>
		                     </div>
		                     <div class="n-chk">
		                       <div class="form-check form-check-danger form-check-inline">
		                         <input class="form-check-input" type="radio" name="event-level" value="교육 일정" data-type="Education" required
		                           id="modalEducation" />
		                         <label class="form-check-label" for="modalEducation">교육 일정</label>
		                       </div>
		                     </div>
		                   </div>
		                 </div>
		
		                 <div class="col-md-12 d-none">
		                   <div class="">
		                     <label class="form-label">Enter Start Date</label>
		                     <input id="event-start-date" type="text" class="form-control" />
		                   </div>
		                 </div>
		
		                 <div class="col-md-12 d-none">
		                   <div class="">
		                     <label class="form-label">Enter End Date</label>
		                     <input id="event-end-date" type="text" class="form-control" />
		                   </div>
		                 </div>
		               </div>
		             </div>
		             <div class="modal-footer">
		               <button type="button" class="btn" data-bs-dismiss="modal">
		                 Close
		               </button>
		               <button type="button" class="btn btn-success btn-update-event" data-fc-event-public-id="">
		                 	수정
		               </button>
		               <button type="button" class="btn btn-success btn-delete-event" data-fc-event-public-id="">
		                 	삭제
		               </button>
		               <button type="button" class="btn btn-primary btn-add-event">
		                 	추가
		               </button>
		             </div>
		           </div>
		         </div>
		       </div>
		       <div class="col-md-12">
               <div class="table-responsive mt-5" style="clear: both">
               <h3>오픈 일정</h3>
                 <table class="table table-hover">
                   <thead>
                     <!-- start row -->
                     <tr>
                       <th class="text-center">#</th>
                       <th class="text-center">Description</th>
                       <th colspan="3" class="text-center">Value</th>
                     </tr>
                     <!-- end row -->
                   </thead>
                   <tbody>
                     <!-- start row -->
                     <tr>
                       <td class="text-center">1</td>
                       <td class="text-center">계약 체결 일자</td>    
                       <td colspan="3" class="text-center">  \${frcsCtrtCnclsDt}</td>
                     </tr>
                     <!-- end row -->
                     <!-- start row -->
                     <tr>
                       <td class="text-center">2</td>
                       <td class="text-center">예상 완공일자</td>
                       <td colspan="3" class="text-center">\${frcsExptCmplDt}</td>
                     </tr>
                     <!-- end row -->
                     <!-- start row -->
                     <tr>
                       <td class="text-center">3</td>
                       <td class="text-center">최종 점검 일자</td>
                       <td colspan="3" class="text-center">\${frcsFnlInspDt}</td>
                     </tr>
                     <!-- end row -->
                     <!-- start row -->
                     <tr>
                       <td class="text-center">4</td>
                       <td class="text-center">개점 일자</td>
                       <td colspan="3" class="text-center">\${frcsOpngDt}</td>
                     </tr>
                     <!-- end row -->
                     <!-- start row -->

                    `;
                    
                     //교육일정 있을시
                   let ojtList = `\${result.franchiseOwnerVO.frcsOwnerOjtList}`;
                   console.log(ojtList);
                     if (ojtList && ojtList.ojtStrTime !== null) {
                         str += `
                             <tr>
                                 <td class="text-center">5</td>
                                 <td class="text-center">점주 교육 일정</td>
                                 <td colspan="3" class="text-center">\${result.franchiseOwnerVO.frcsOwnerOjtList[0].ojtStrTime}  ~  \${result.franchiseOwnerVO.frcsOwnerOjtList[0].ojtEndTime}</td>
                             </tr>
                            `;
                     }else{
                    	 str += `
                             <tr>
                                 <td class="text-center">5</td>
                                 <td class="text-center">점주 교육 일정</td>
                                 <td colspan="3" class="text-center"> - </td>
                             </tr>
                            `;
                     }
                     
                     str += `
                     <!-- end row -->
                   </tbody>
                 </table>
               </div>
             </div>
             <div class="col-md-12">
	            <div class="table-responsive mt-5" style="clear: both">
	               <h3>가맹점 상세 정보</h3>
	               <table class="table table-hover">
	               <tr>
		               <td class="text-center">1</td>
		               <td class="text-center">가맹점 수용 인원</td>
		               <td colspan="3" class="text-center">\${frcsCpctPsn}</td>
	               </tr>
	               <tr>
		               <td class="text-center">2</td>
		               <td class="text-center">가맹점 전화번호</td>
		               <td colspan="3" class="text-center">\${frcsTel}</td>
	               </tr>
	                <tr>
		               <td class="text-center">3</td>
		               <td class="text-center">영업 시작 시간</td>
		               <td colspan="3" class="text-center"><input type="time" value="\${result.frcsBsnsStrtTm}" readonly style="border:none;padding-left:40"/></td>
	                </tr>
	                <tr>
		               <td class="text-center">4</td>
		               <td class="text-center">영업 종료 시간</td>
		               <td colspan="3" class="text-center"><input type="time" value="\${result.frcsBsnsEndTm}" readonly style="border:none;padding-left:40"/></td>
	                </tr>
	             </table>
	               </div>
	               <div class="text-end">
	               <button type="button" class="btn mb-1 bg-primary-subtle text-primary btn-lg px-4 fs-4 font-medium" data-bs-toggle="modal" data-bs-target="#pop-tool-modal">
	               상세정보 입력
                 </button>

	               </div>
             </div>
           </div>
         </div>
         
         
         <!-- Vertically centered modal -->
         <div class="modal fade" id="pop-tool-modal" tabindex="-1" aria-labelledby="vertical-center-modal"
           aria-hidden="true">
           <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	          <div class="modal-content"  style="width: 60%;">
	           <div class="modal-header d-flex align-items-center">
	             <h4 class="modal-title" id="exampleModalLabel1" style="width: 100%; text-align:center;">
	               가맹점 상세정보 입력
	             </h4>
	             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="margin-left: 0px;"></button>
	           </div>
	           <div class="modal-body">
	             <form id="form" action="">
	               <div class="mb-3">
	                 <label for="frcsCpctPsn" class="control-label">가맹점 수용 인원</label>
	                 <input type="number" class="form-control" id="frcsCpctPsn" name="frcsCpctPsn" value="\${result.frcsCpctPsn}"/>
	               </div>
	               <div class="mb-3">
	                 <label for="frcsTel" class="control-label">가맹점 전화번호</label>
	                 <input type="tel" class="form-control" id="frcsTel" name="frcsTel" value="\${result.frcsTel}" placeholder="02-1111-1111"/>
	               </div>
	               <div class="mb-3">
	                 <label for="frcsBsnsStrtTm" class="control-label">영업 시작 시간</label>
	                 <input type="time" class="form-control" id="frcsBsnsStrtTm" name="frcsBsnsStrtTm" value="\${frcsBsnsStrtTm}" />
	               </div>
	               <div class="mb-3">
	                 <label for="frcsBsnsEndTm" class="control-label">영업 종료 시간</label>
	                 <input type="time" class="form-control" id="frcsBsnsEndTm" name="frcsBsnsEndTm"  value="\${frcsBsnsEndTm}" />
	               </div>
	             </form>
	           </div>
	           <div class="modal-footer">
	             <button type="button" class="btn bg-danger-subtle text-danger font-medium"
	               data-bs-dismiss="modal" id="closeBtn">
			       	    닫기
	             </button>
	             <button type="button" fomr="form" class="btn btn-success" id="frscUpdateButton">
		       	           입력
	             </button>
	           </div>
	         </div>
           </div>
         </div>
	         `;
	         

	         
	         	
	     
	      
	         
	         
	         /* 캘린더 */
	         
	         
	         var frcsNo = result.frcsNo;
	         console.log(frcsNo);
	        $("#custom-invoice").html(str);
	         $(".frcsNm").text(result.frcsNm);
	         
	         /*========Calender Js=========*/
	         /*==========================*/

	         $(function() {

	        
		 	        /*상세정보 입력 모달  */
		 	    $("#frscUpdateButton").on("click",function(){
		 	    	 
	 	        	let data = {};
	 	    			data.frcsCpctPsn  = $("#frcsCpctPsn").val()
	 	    			data.frcsTel = $("#frcsTel").val();
	 	    			data.frcsBsnsStrtTm = $("#frcsBsnsStrtTm").val();
	 	    			data.frcsBsnsEndTm  =  $("#frcsBsnsEndTm").val();
	 	    			data.frcsNo = `\${result.frcsNo}`;
	 	        	
	 	        	$.ajax({
	 	        		url:"/admin/frcs/update",
	 	        		type:"post",
	 	        		data:JSON.stringify(data),
	 	        		dataType:"json",
	 	        		beforeSend:function(xhr){
	 	  	               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	 	  	          },
	 	                 contentType: "application/json"
	 	             }).done((rst) => {
	 	                 if (rst.stat === "ok") {
	 	                	 //일정 삭제 완료!!!!!!!
	 	                     console.log("초기화 완료");
	 	                 }
	 	             }).fail((request, status, error) => {
	 	                 alert("에러발생" + error);
	 	             });
	 	        	$("#closeBtn").trigger("click");
	 	        	listClick(`\${result.frcsNo}`);
	 	        });
       	     
		         
	        	
	            	 
		 	  
	         
	 	 
	        	 
	             /*=================*/
	             //  Calender Date variable
	             /*=================*/	
	             var newDate = new Date();
	             function getDynamicMonth() {
	                 getMonthValue = newDate.getMonth();
	                 _getUpdatedMonthValue = getMonthValue + 1;
	                 if (_getUpdatedMonthValue < 10) {
	                     return `0\${_getUpdatedMonthValue}`;
	                 } else {
	                     return `\${_getUpdatedMonthValue}`;
	                 }
	             }
	             /*=================*/
	             // Calender Modal Elements
	             /*=================*/
// 	             var getModalTitleEl = document.querySelector("#event-title");
	             var getModalStartDateEl = document.querySelector("#event-start-date");
	             var getModalEndDateEl = document.querySelector("#event-end-date");
	             var getModalAddBtnEl = document.querySelector(".btn-add-event");
	             var getModalDeleteBtnEl = document.querySelector(".btn-delete-event");
	             var getModalUpdateBtnEl = document.querySelector(".btn-update-event");
	             var calendarsEvents = {
	                 Danger: "Danger",
	                 Success: "Success",
	                 Primary: "Primary",
	                 Warning: "Warning",
	             };
	             /*=====================*/
	             // Calendar Elements and options
	             /*=====================*/
	             var calendarEl = document.querySelector("#calendar");
	             var checkWidowWidth = function () {
	                 if (window.innerWidth <= 1199) {
	                     return true;
	                 } else {
	                     return false;
	                 }
	             };
	             var calendarHeaderToolbar = {
	                 left: "prev",
	                 center: "title",
	                 right: "next",
	             };
	             var calendarEventsList = [
	                 {
	                     id: 1,
	                     title: "계약 체결 일자",
	                     start: `\${result.frcsCtrtCnclsDt}`,
	                     extendedProps: { calendar: "Danger",
	                    	 			  name : "계약 체결 일자",
	                    	 			  day : `\${result.frcsCtrtCnclsDt}`
                	 	 },
	                 },
	                 {
	                     id: 2,
	                     title: "최종 점검 일자",
	                     start: `\${result.frcsFnlInspDt}`,
	                     extendedProps: { calendar: "Success" ,
	                    	 			  name : "최종 점검 일자",
	                    	 			  day : `\${result.frcsFnlInspDt}`
	                     },
	                 },
	                 {
	                     id: 3,
	                     title: "예상 완공 일자",
	                     start: `\${result.frcsExptCmplDt}`,
	                     extendedProps: { calendar: "Warning",
	                    				  name : "예상 완공 일자",
	                    	 			  day : `\${result.frcsExptCmplDt}`	 
	                     },
	                 },
	                 {
	                     id: 4,
	                     title: "개점 일자",
	                     start: `\${result.frcsOpngDt}`,
	                     extendedProps: { calendar: "Primary",
	                    	 			  name : "개점 일자",
	                    	 			  day : `\${result.frcsOpngDt}`	 
	                     },
	                 }
	             ];
	             
	            
	             /*=====================*/
	             // Calendar Select fn.
	             /*=====================*/
	             var calendarSelect = function (info) {
	            	 
	            	 console.log("빈 공간 클릭시 data",info);
	                 getModalAddBtnEl.style.display = "block";
	                 getModalUpdateBtnEl.style.display = "none";
	                 getModalDeleteBtnEl.style.display = "none";
	                 myModal.show();
	                 getModalStartDateEl.value = info.startStr;
	                 getModalEndDateEl.value = info.endStr;
	             };
	             /*=====================*/
	             // Calendar AddEvent fn.
	             /*=====================*/
	             var calendarAddEvent = function () {
	                 var currentDate = new Date();
	                 var dd = String(currentDate.getDate()).padStart(2, "0");
	                 var mm = String(currentDate.getMonth() + 1).padStart(2, "0"); //January is 0!
	                 var yyyy = currentDate.getFullYear();
	                 var combineDate = `\${yyyy}-\${mm}-\${dd}T00:00:00`;
	                 getModalAddBtnEl.style.display = "block";
	                 getModalUpdateBtnEl.style.display = "none";
	                 getModalDeleteBtnEl.style.display = "none";
	                 myModal.show();
	                 getModalStartDateEl.value = combineDate;
	             };

	             /*=====================*/
	             // Calender Event Function
	             /*=====================*/
	             var getModalEventLevel;
	             var getModalCheckedRadioBtnEl;
	             var calendarEventClick = function (info) {
	            	 console.log("클릭시 info ",info)
	                 var eventObj = info.event;
						console.log("eventObj : ",eventObj);
	                 
	                 if (eventObj.url) {
	                     window.open(eventObj.url);

	                     info.jsEvent.preventDefault();
	                 } else {
	                     var getModalEventId = eventObj._def.publicId;
	                     getModalEventLevel = eventObj._def.extendedProps["name"];
	                     
	                     getModalCheckedRadioBtnEl = document.querySelector(
	                         `input[value="\${getModalEventLevel}"]`
	                     );
						 console.log("이거지",getModalCheckedRadioBtnEl.value);
// 	                     getModalTitleEl.value = eventObj.title;
	                     getModalCheckedRadioBtnEl.checked = true;
	                     
	                     ojtStrTime = changeDay(eventObj._instance.range.start);
		            	 ojtEndTime = changeDay(eventObj._instance.range.end);
	                     
		            	 
	                     //수정시 날짜 변환 
	                     var getDate = eventObj._def.extendedProps["day"]
	                     console.log("교육일정 클릭 day :", getDate);
	                     
	                     var dateObj = new Date(getDate);
	                     dateObj.setDate(dateObj.getDate() + 1);	
	                     var updatedDateString = dateObj.toISOString().split('T')[0];
	                     
	                     getModalStartDateEl.value = eventObj._instance.range.start;
		                 getModalEndDateEl.value = updatedDateString
		                 
	                     getModalUpdateBtnEl.setAttribute(
	                         "data-fc-event-public-id",
	                         getModalEventId
	                     );
	                     getModalAddBtnEl.style.display = "none";
	                     getModalUpdateBtnEl.style.display = "block";
	                     getModalDeleteBtnEl.style.display = "block";
	                     myModal.show();
	                 }
	             };

	             
	             /*=====================*/
	             // Active Calender
	             /*=====================*/
	             var calendar = new FullCalendar.Calendar(calendarEl, {
	                 selectable: true,
	                 contentHeight: 700,
	                 initialView: checkWidowWidth() ? "listWeek" : "dayGridMonth",
	                 initialDate: `\${newDate.getFullYear()}-\${getDynamicMonth()}-07`,
	                 headerToolbar: calendarHeaderToolbar,
	                 events: calendarEventsList,
	                 select: calendarSelect,
	                 droppable: true,
	                 navLinks: true,
                     editable: true,
                     selectable: true,
	                 unselect: function () {
	                     console.log("unselected");
	                 },
	                 customButtons: {
	                     addEventButton: {
	                         text: "Add Event",
	                         click: calendarAddEvent,
	                     },
	                 },
	                 eventClassNames: function ({ event: calendarEvent }) {
	                     const getColorValue =
	                         calendarsEvents[calendarEvent._def.extendedProps.calendar];
	                     return [
	                         "event-fc-color fc-bg-" + getColorValue,
	                     ];
	                 },
	                 eventDrop: (event) => {
	                        console.log("drop log :",event);
	                        eventDrop(event);
	                        
	                    },
	                 eventClick: calendarEventClick,
	                 windowResize: function (arg) {
	                     if (checkWidowWidth()) {
	                         calendar.changeView("listWeek");
	                         calendar.setOption("height", 900);
	                     } else {
	                         calendar.changeView("dayGridMonth");
	                         calendar.setOption("height", 1052);
	                     }
	                 },
	             });
					
	             //가맹점주 교육일정이 존재할때만 출력 및 선언
	            var ojtStrTime = result.franchiseOwnerVO.frcsOwnerOjtList[0]?.ojtStrTime;
				var ojtEndTime = result.franchiseOwnerVO.frcsOwnerOjtList[0]?.ojtEndTime;
				
				if (ojtStrTime && ojtStrTime.trim() !== "") {
				    calendar.addEvent({
				        id: 5,
				        title: "교육 일정",
				        start: ojtStrTime,
				        end: ojtEndTime,
				        extendedProps: {
				            calendar: "Primary",
				            name: "교육 일정",
				            strday: ojtStrTime,
				            endday: ojtEndTime,
				            day : ojtEndTime
				        }
				    });
				}
	             
				//숫자 변환을 위한 함수 및 변수 선언
				 var changeValue;
	             function changeDay(day){
	            	 var dateObj = new Date(day);
	            	     dateObj.setDate(dateObj.getDate());
	            	    changeValue = dateObj.toISOString().split('T')[0];

	            	 console.log(changeValue); 
	            	 return changeValue;
	             }
				
				//drop시 실행 데이터 
	             function eventDrop(info){
	            		console.log("drop 이벤트 로그 : ",info);
	            		
	            		var eventObj = info.event;
	            		ojtStrTime = changeDay(eventObj._instance.range.start);
	            		ojtEndTime = changeDay(eventObj._instance.range.end);
	            		console.log(eventObj._instance.range.start);
	            		console.log("ojtStrTime",ojtStrTime);
	            		eventObj._def.extendedProps["name"];
	            		let data = {};
	            			data.type  = eventObj._def.title;
	            			data.start = ojtStrTime
	            			data.end = ojtEndTime
	            			data.frcsNo = `\${result.frcsNo}`;
	            			data.frcsOwnrNo =`\${result.frcsOwnrNo}`;
	            		console.log("drop data: ",data);
	            		
	            		if (data.type=="교육 일정") {
			           		data.ojtNo = `\${result.franchiseOwnerVO.frcsOwnerOjtList[0].ojtNo}`;
			           		
			           		console.log("최종 data ",data);
			           		updateOtj(data);
			           		alert("수정해버림");
						}else{
					          addEventAjax(data);
						}	
	             }
	             
	             
	             //클릭 모달에서 수정버튼 클릭시
	             /*=====================*/
	             // Update Calender Event
	             /*=====================*/
	             getModalUpdateBtnEl.addEventListener("click", function () {
	            	 if(getModalEventLevel !== getModalCheckedRadioBtnEl){
		            	 resetEvent();
		            	 console.log("버튼값 :", getModalCheckedRadioBtnEl.value)
		            	 if(getModalCheckedRadioBtnEl.value=="교육 일정"){
		            		 let data = {};
				            	 data.type = getModalEventLevel;
				            	 data.frcsNo = `\${result.frcsNo}`;
				            	 data.end = ojtStrTime;
				            	 data.start = ojtEndTime;
				            	 data.frcsOwnrNo =`\${result.frcsOwnrNo}`;
			            	 updateOtj(data)
		            	 }else{
		                	 addEvent(); 
		            	 }
	            	 }
	            	 myModal.hide();
	            	 listClick(`\${result.frcsNo}`);
	             });
	             
	             function resetEvent() {
	            	 console.log("값 :",getModalEventLevel);
	            	 let data = {};
		            	 data.type = getModalEventLevel;
		            	 data.frcsNo = `\${result.frcsNo}`;
		            	 data.end = "";
		            	 data.start = "";
		            	 data.frcsOwnrNo =`\${result.frcsOwnrNo}`;
		            	 data.reset="reset";
		            //기존값을 초기화하는 로직
		           	console.log("resetData :", data);
		           	if (data.type=="교육 일정") {
		           		data.ojtNo = `\${result.franchiseOwnerVO.frcsOwnerOjtList[0].ojtNo}`;
		           		
		           		updateOtj(data);
					}else{
				          addEventAjax(data);
					}
		           	
	             }
	             
	             function updateOtj(data){
	                 console.log(data);  
	            	 let jsonData = JSON.stringify(data);
	                   
		                 $.ajax({
		                	 url: "/frcs/ojt/update",
	                         type: "post",
	                         dataType: "json",
	                         data: jsonData,
	                         beforeSend:function(xhr){
	          	               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	          	          },
	                         contentType: "application/json"
		                 }).done((rst) => {
	                         if (rst.stat === "ok") {
	                        	 //일정 삭제 완료!!!!!!!
	                             console.log("초기화 완료");
	                         }
	                     }).fail((request, status, error) => {
	                         alert("에러발생" + error);
	                     });
		                 myModal.hide();
		                 
		             };
	             
	             
	             /*=====================*/
	             // Calendar Delete
	             /*=====================*/
	               getModalDeleteBtnEl.addEventListener("click", function () {
					
	            	   if(confirm("삭제하시겠습니까?")){
	            		   resetEvent();
	            		   listClick(`\${result.frcsNo}`);
	            	   }
	            	   
	            	   // 	            	   let data = {};
// 		                  data.type = getModalCheckedRadioBtnEl.value;
// 	                	  data.frcsNo = `\${result.frcsNo}`;
// 		                  data.end = " ";
// 			              data.start = " ";
// 		               console.log("data : ",data);
		               
// 		               if(confirm("삭제하시겠습니까")){
		            	   
// 		               addEventAjax(data);
// 		               alert("삭제 완료");
// 		               }
	             });
	             
	             
	             /*=====================*/
	             // Add Calender Event
	             /*=====================*/
	             getModalAddBtnEl.addEventListener("click", addEvent);
	             function addEvent() {
	                  getModalCheckedRadioBtnEl = document.querySelector(
	                     'input[name="event-level"]:checked'
	                 );

// 	                 var getTitleValue = getModalTitleEl.value;
	                 var setModalStartDateValue = getModalStartDateEl.value;
	                 var setModalEndDateValue = getModalEndDateEl.value;
	                 var getModalCheckedRadioBtnValue;
					
	                 
	                 if (getModalCheckedRadioBtnEl !== null) {
	                     getModalCheckedRadioBtnValue = getModalCheckedRadioBtnEl.value;
	                 } else {
	                     alert("종류를 선택해주세요");
	                     // 선택된 값이 없을 경우에 대한 추가 로직을 여기에 추가할 수 있습니다.
	                 }
	                
	             	var setCalendar;
	             	switch(getModalCheckedRadioBtnValue){
		             	case "계약 체결 일자" :
		             		setCalendar="Danger"
		             		break;
		             	case "최종 점검 일자" :
		             		setCalendar="Success"
		             		break;
		             	case "예상 완공 일자" :
		             		setCalendar="Warning"
		             		break;
		             	case "개점 일자" :
		             		setCalendar="Primary"
		             		break;
		             	case "교육 일정" :
		             		setCalendar="교육 일정"
		             		break;
	             	}
	   				console.log(setCalendar);
	                 calendar.addEvent({
	                     title: getModalCheckedRadioBtnValue,
	                     start: setModalStartDateValue,
	                     end: setModalEndDateValue,
	                     allDay: true,
	                     extendedProps: { calendar: setCalendar,
	                    	 			  name : getModalCheckedRadioBtnValue},
	                 });
	                 
	                 let data = {};
	                 
	                 data.type = getModalCheckedRadioBtnValue;
	                 data.start = setModalStartDateValue;
	                 data.end = setModalEndDateValue;
	                 data.frcsNo = `\${result.frcsNo}`;
	                 data.extendedProps = setCalendar;
	                 data.frcsOwnrNo =`\${result.frcsOwnrNo}`;
	                 console.log("data : ",data);
	                 let jsonData = JSON.stringify(data);
	              
	                 addEventAjax(data);
	                 alert("일정 추가 완료");
	             }
	             	
	                 function addEventAjax(data){
	                   let jsonData = JSON.stringify(data);
	                   
		                 $.ajax({
		                	 url: "/admin/frcs/addEvent",
	                         type: "post",
	                         dataType: "json",
	                         data: jsonData,
	                         beforeSend:function(xhr){
	          	               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	          	          },
	                         contentType: "application/json"
		                 }).done((rst) => {
	                         if (rst.stat === "ok") {
	                             console.log("일정 추가 완료");
	                             listClick(`\${result.frcsNo}`);
	                         }
	                     }).fail((request, status, error) => {
	                         alert("에러발생" + error);
	                     });
		                 
		                 myModal.hide();
		                 listClick(`\${result.frcsNo}`);
		             };
	             	
		             
	             
	             /*=====================*/
	             // Calendar Init
	             /*=====================*/
	             calendar.render();
	             var myModal = new bootstrap.Modal(document.getElementById("eventModal"));
	             var modalToggle = document.querySelector(".fc-addEventButton-button ");
	             document
	                 .getElementById("eventModal")
	                 .addEventListener("hidden.bs.modal", function (event) {
// 	                     getModalTitleEl.value = "";
	                     getModalStartDateEl.value = "";
	                     getModalEndDateEl.value = "";
	                     var getModalIfCheckedRadioBtnEl = document.querySelector(
	                         'input[name="event-level"]:checked'
	                     );
	                     if (getModalIfCheckedRadioBtnEl !== null) {
	                         getModalIfCheckedRadioBtnEl.checked = false;
	                     }
	                 });
	         });

	        }
	        });
	}//end listClick()
</script>
