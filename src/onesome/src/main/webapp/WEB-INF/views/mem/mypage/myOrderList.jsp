<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.Calendar"%>

<div class="container-fluid">
   <div class="card-body px-4 py-4">
      <div class="row align-items-center">
         <div class="col-9">
            <nav class="breadcrumb" aria-label="breadcrumb">
               <nav aria-label="breadcrumb"
                  style="margin-top: 30px; margin-left: -20px;">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
                     <li class="breadcrumb-item"><a href="/mem/mypage"><b>마이페이지</b></b></a></li>
                     <li class="breadcrumb-item active" aria-current="page"
                        style="color: #d50037"><b>주문내역</b></li>
                  </ol>
               </nav>
            </nav>
         </div>
      </div>
   </div>

   <input type="hidden" id="menuNo" name="menuNo" value="${paymentDetailVO.menuNo}" />

<!-- ================ 주문내역 확인 [시작] ================ -->
   <h2 class="sub-tit-name" style="font-weight: bold; font-size: 34px; margin-bottom: 30px;">주문내역</h2>
   <div class="product-list">
      <div class="card shadow-none border" style="padding: 1.5rem;">
         <h3 style="margin-bottom: 30px;">주문 상세</h3>

         <!-- 총액 구하는법
                 1. c:set은 포이치문 외부에서 var 변수의 초기값을 0으로 설정해주고
                 2. 포이치문 반복을 통해 각 항목의 menuPrice를 더해서 var 변수에 누적함, 그 c:set은 포문 끝나기 딱 전에 코드 넣어주고
                 3. 그 값 밖에서 var 이름으로 쓰면 됨(이미 var 변수에 누적됐음) -->
         <c:set var="orderAmt" value="0" />

         <!-- 이전 주문번호 세팅-->
         <c:set var="prevOrderNo" value="" />
         
         <!-- ================ 주문 내역 [시작] ================ -->
         <div class="table-responsive border rounded">
            <table class="table align-middle text-nowrap mb-0">
               <thead>
                  <tr style="border-bottom : 4px double black;">
                     <th scope="col" style="text-align: center; width: 0px;">주문번호</th>
                     <th scope="col">메뉴명</th>
                     <th scope="col" style="text-align: center">결제일자</th>
                     <th scope="col" style="text-align: center">주문 지점</th>
                     <th scope="col" style="text-align: center">결제금액</th>
                     <th scope="col" style="text-align: center">비고</th>
                  </tr>
               </thead>
               
               <!-- 같은 tbody안에서 tr행 추가로 주문번호 같으면 병합처럼 보이게 처리 -->
               <tbody>
                  <c:forEach var="list" items="${list}" varStatus="status">
                     <tr class="cls${list.pynmNo} cls" onclick="show('${list.pynmNo}')" style="<c:if test="${list.pynmNo eq prevOrderNo}">border-top: 3px solid white; display:none;</c:if>">
                        <!-- 주문번호 -->
                        <td style="text-align: center; width: 0px;">
                           <!-- 만약 주문번호가 이전번호랑 != 다를때만 
				                                딱 한번 주문번호 뽑아, 
				                                그리고 나머지 같은번호들은 포문 돌면서 그냥 빈칸만 나옴(이미 주문번호 있으니까) -->
                           <c:if test="${list.pynmNo ne prevOrderNo}">
                           	  <c:set var="cnt" value="0" />
                              <!-- 주문번호 -->
                              <h6 class="mb-0 fs-4">${list.pynmNo}</h6>
                              <!-- 메뉴개수 추가 -->
									    <span class="badge text-bg-primary rounded-4 fs-2 fw-semibold menu-count" id="menuCountDisplay_${list.pynmNo}"></span>
                           </c:if>
                        </td>

                        <!-- 메뉴명 -->
                        <td>
                           <div class="d-flex align-items-center" style="width: 300px;">
                              <a href="/mem/drinkDetail?menuNo=${list.menuNo}"> <img
                                 src="<c:out value='/resources/upload/menu/${list.streFileNm}'/>"
                                 class="rounded-circle" alt="사진" width="60" height="60">
                              </a>
                              <div class="ms-3">
                                 <!-- ice면 아이스, 아니면 '' 메뉴명 출력 -->
                                 <a href="/mem/drinkDetail?menuNo=${list.menuNo}">
                                    <h6 class="fw-semibold mb-0 fs-4">
                                       <c:out value="${list.menuIceYn eq '1' ? '아이스 ' : ''}" />${list.menuNm}
                                    </h6>
                                 </a>
                              </div>
                           </div>
                        </td>

                        <!-- 결제일자 -->
                        <td>
                           <h6 style="text-align: center; margin-top:19px;" class="mb-0 fs-4">
                              <fmt:formatDate value="${list.pynmDt}"
                                 pattern="yyyy. MM. dd(E) HH:mm:ss" />
                           </h6><br/>
                        </td>

                        <!-- 주문 지점 -->
                        <td>
                           <h6 style="text-align: center" class="mb-0 fs-4">${list.frcsNm}</h6>
                        </td>

                        <!-- 결제금액 -->
                        <td>
                           <h6 style="text-align: right; margin-right: 10px;"
                              class="mb-0 fs-4">
                              <fmt:formatNumber type="number" maxFractionDigits="3"
                                 value="${list.menuPrice}" />원
                           </h6>
                        </td>
                        
                        <!-- 개별 삭제 버튼(휴지통 아이콘) -->
                         <td style="text-align:center;">
                            <button class="btn btn-outline-dark orderListCancel" data-pynm-no="${list.pynmNo}" style="border:0px;">
                               <i class='ti ti-trash fs-5 mb-2'></i>
                            </button>
                         </td>
                     </tr>
                     
                      <!-- 주문번호가 이전번호랑 같은 행 합계 처리 -->
				      <c:if test="${list.pynmNo eq prevOrderNo}">
				      	 <!-- 주문 번호 같은애들만 따로 합계 구함 -->
				         <tr id="smallAmt${list.pynmNo}" class="borderNone" style="display:none; border-top: 3px solid white;">
				            <td colspan="6" style="border-style:none;">
				               <div class="d-flex justify-content-end" style="margin-right: 10px;">
                                  <span class="fw-semibold fs-4"> 합계 : </span>
                                  <!-- 개별 합계 가격 찍어내는곳 -->
				                  <span class="fw-semibold fs-4" style="margin-right: 93px;" id="smallAmtText${list.pynmNo}" ></span>
				               </div>
				            </td>
				         </tr>
                     </c:if>
				      
                     <!-- orderAmt 변수에 각 항목의 menuPrice를 더하여 누적 -->
                     <c:set var="orderAmt" value="${orderAmt + list.menuPrice}" />
                     <!-- 이전 주문번호 업데이트 -->
                     <c:set var="prevOrderNo" value="${list.pynmNo}" />
                  </c:forEach>
               </tbody>
            </table>
            
            <c:if test="${empty list}">
                <br>
                <h6 class="mb-4 fs-6" style="text-align:center">
                    <b>주문하신 내역이 없습니다.</b>
                </h6>
            </c:if>
            
            <!-- 전체 총 결제 금액 -->
            <div class="col-md-12" style="border-top : 4px double black;">
               <div class="pull-right mt-4 text-end">
                  <h3 id="displayTotalPrice" style="text-align: right; margin-right: 10px; font-weight: bold;" class="mb-0 fs-4">
                   	 총 결제 금액 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${orderAmt}" />원
                  </h3>
               </div>
               <br>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- ================ 주문내역 확인 [끝] ================ -->

<!-- 주문번호, 메뉴개수 표시 및 삭제 -->
<script type="text/javascript">
   $(function() {
   // 최초 로딩될때 제품번호들의 메뉴 개수가 몇갠지 포문돌려서 가져옴
	   $("table tbody tr").each(function () {
	        var currentOrderNo = $(this).find('td:eq(0) h6').text();

	        if (currentOrderNo) {
	            $(this).find('td').css("border-top", "3px solid black");
	            // 주문번호에 해당하는 행 선택
	            var orderRow = $(".cls" + currentOrderNo);
	            var menuCountDisplay = orderRow.find('.menu-count');

	            // 해당 행 내부의 메뉴 개수 세기
	            var menuCount = orderRow.find('td:eq(1) > div').length;

	            // 메뉴 개수가 1이면 감춤
	            if (menuCount === 1) {
	                menuCountDisplay.hide();
	            } else {
	                menuCountDisplay.text("+" + menuCount);
	            }
	        }
	    });
});
   
    // 주문번호 클릭하면 펼쳐짐
    function show(pynmNo) {
	    var smallAmt = 0; // 주문번호 같은애들만 합계 구하기위해서 최초 0원 설정
	   
        $(".cls" + pynmNo).each(function(i,v) { // 주문번호에 해당하는 클래스 포문 돌려서 display가 none인 같은 주문번호들, 누르면 보여주게함
   	        // 주문번호가 같은애들의 합계 가격을 잘라옴
            smallAmt += parseInt($(this).find('td:eq(4) h6').text().slice(0, -1).replace(/[^0-9]/g, ''));
        	console.log("smallAmt", smallAmt);
   	        // 잘라온 가격을 스트링으로 바꾸고 그 span태그 자리의 id에 해당하는 주문번호에 찍어냄
            $("#smallAmtText"+pynmNo).text(smallAmt.toLocaleString()+"원");

            if($(this).css("display") == "none") {
            	$(this).show();
            } else {
            	if(i > 0){
            		$(this).hide();
          	    }
            }
        });
    }
   
	// 총 결제 금액 전역변수로 세팅해주는데 콤마때문에 text 잘라서 가져와서 선언해주고
	let orderAmt = parseInt($("#displayTotalPrice").text().replace(/[^0-9]/g, ''));
	console.log("최초 총 결제 금액 : ", orderAmt);
	// 주문취소 => 같은 주문번호에 해당하는 주문내역 전체 삭제
    $(".orderListCancel").on("click", function(){
       let clickedButton = $(this);
       let pynmNo = clickedButton.data("pynm-no");
      
       let data = {
           "pynmNo" : pynmNo,
      	   "orderAmt" : orderAmt
       }
      
       console.log("data : ", data);
      
       $.ajax({
          url : "/mem/orderListCancel",
          contentType : "application/json;charset=utf-8",
          data : JSON.stringify(data),
          type : "post",
          dataType : "json",
          beforeSend : function(xhr) {
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
          },
          success : function(result) {
             console.log("result:", result);

         	 // 해당 주문번호에 해당하는 모든 행 선택
		     let orderRows = $(".cls" + pynmNo);
			 
			 // 그 행 들 포문 돌려서 다 삭제함
		     orderRows.each(function() {
		         $(this).remove();
		     });
		     
             let cancelOrderAmt = 0; // 주문취소 변수 선언
             // 포문 돌려서 내가 삭제하는 행들 가격 가져옴
             orderRows.each(function() {
                 let cancelOrderAmtText = $(this).find('td:eq(4) h6').text().replace(/[^0-9]/g, '');
             
              	// 주문취소 금액을 반영할 최신 총 결제 금액 변수를 선언하고 가져옴
                 let currentOrderAmt = parseInt(cancelOrderAmtText);
                 console.log("currentOrderAmt:", currentOrderAmt);
             
                 cancelOrderAmt += currentOrderAmt; // cancelOrderAmt를 각 행의 주문 금액을 더한 값으로 업데이트
             });
		     
        	 // 각 행의 주문 금액을 빼줌
             orderAmt -= cancelOrderAmt;

             // 삭제 후 현재 합계금액 표시
             $("#displayTotalPrice").text("총 결제 금액 : " + orderAmt.toLocaleString() + "원");
             console.log("삭제한 금액 빼준 뒤 총 결제 금액 :", orderAmt);
                 
             var Toast = Swal.mixin({
                      toast : true,
                      position : 'top-end',
                      showConfirmButton : false, // ok버튼 숨김
                      timer : 1000 //1초 동안 표시됨
                 });
                 Toast.fire({
                   icon : 'success', //출력할 아이콘 종류(success, warning, error, info, quesition)
                   title : '삭제하였습니다.' //출력할 메세지 내용
                 });
          },
          error : function(err) {
                var Toast = Swal.mixin({
                   toast : true,
                   position : 'top-end',
                   timer : 1000,
                   timerProgressBar : true
                });
                Toast.fire({
                   icon : 'error',
                   title : '에러가 발생하였습니다 .'
                });
             }
        });
   });
</script>