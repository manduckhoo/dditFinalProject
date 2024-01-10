<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid">
   <div class="card-body px-4 py-4">
      <div class="row align-items-center">
         <div class="col-9">
            <nav class="breadcrumb" aria-label="breadcrumb">
               <nav aria-label="breadcrumb" style="margin-top:30px; margin-left:-20px;">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></a></li>
                     <li class="breadcrumb-item"><a href="/mem/cartList"><b>주문</b></a></li>
                     <li class="breadcrumb-item active" aria-current="page" style="color: #d50037"><b>주문/결제</b></li>
                  </ol>
               </nav>
            </nav>
         </div>
      </div>
   </div>
   <h2 class="sub-tit-name" style="font-weight:bold; font-size:34px; margin-bottom:30px;">주문/결제</h2>
   <!-- ================ 매장 선택 [시작] ================ -->
   <div class="billing-address-content">
      <div class="row">
         <div class="col-lg-12">
            <div class="card shadow-none border">
               <div class="card-body p-4">
               <h3 style="margin-bottom:30px;">1. 매장선택</h3>
               <input type="hidden" id="menuNo" name="menuNo" value="${memberCartVO.menuNo}"/>
               <input type="hidden" id="frcsInvenCnt" name="frcsInvenCnt" value="${franchiseVO.frcsInvenCnt}"/>
               <input type="hidden" id="prdctNo" name="prdctNo" value="${productVO.prdctNo}"/>
               <c:forEach var="payId" items="${paymentMethodVOList}">
                  <input type="hidden" id="pynmMthdId" name="pynmMthdId" value="${payId.pynmMthdId}"/>
               </c:forEach>
                  <!-- 매장 선택 완료 시 나와야할 정보들 [시작] -->
                     <!-- 지점 번호 가져오기 [시작]-->
                     <div class="d-flex align-items-center">
                        <select id="frcsSelect" class="form-select product-item-sel" required onchange="onStoreSelectChange()">
                            <option disabled selected>선택해주세요</option>
                          <c:forEach var="frcs" items="${franchiseVOList}">
                              <option value="${frcs.frcsNo}" data-addr="${frcs.frcsAddr}" data-tel="${frcs.frcsTel}">${frcs.frcsNm}</option>
                          </c:forEach>
                        </select>
                     </div>
                     <br>
                                                       <%--이 div안에 정보 표시됨 --%>
                     <div class="disappearContainer" id="selectedFrcsInfo"></div>
                     <!-- 지점 번호 가져오기 [끝]-->
                  <!-- 매장 선택 완료 시 나와야할 정보들 [끝] -->
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- ================ 매장 선택 [끝] ================ -->
   
   <!-- ================ 장바구니 내역 [시작] ================ -->
   <div class="product-list" style="display: none;" id="cartSection">
      <div class="card shadow-none border" style="padding:1.5rem;">
      <h3 style="margin-bottom:30px;">2. 장바구니 내역</h3>
         <div class="card-body p-4" id="searchCart">
            <div class="d-flex justify-content-between align-items-center mb-9">
               <form class="position-relative">
                  <input type="text" class="form-control search-chat py-2 ps-5"
                     id="keyword" placeholder="단어를 입력해주세요"> 
                     <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
               </form>
                  <button class="btn btn-outline-dark btn-sm checkDelete" style="margin-left:auto; margin-right:10px" 
                  id="selectDeleteBtn" onclick="deleteMenu()"> 삭제
                  </button>
            </div>
            <div class="table-responsive border rounded">
               <table class="table align-middle text-nowrap mb-0">
                  <thead>
                     <tr>
                        <th scope="col">
                           <!-- 전체 선택 체크박스 -->
                           <div class="form-check" style="width:0px;">
                              <input class="form-check-input" type="checkbox"
                                 id="cbx_chkAll" checked="checked">
                           </div>
                        </th>
                        <th scope="col" style="width:350px;">메뉴명</th>
                        <th scope="col" style="text-align:center">옵션</th>
                        <th scope="col" style="text-align:center; width:1px;">사이즈</th>
                        <th scope="col" style="text-align:center">수량</th>
                        <th scope="col" style="text-align:center; width:1px;">가격</th>
                        <th scope="col" style="text-align:center; padding-right: 15px; width:1px;">재고 여부</th>
                        <th scope="col" style="text-align:center; width:1px;">비고</th>
                     </tr>
                  </thead>
                  <!-- 총 합계 계산을 위한 변수 선언 -->
                  <c:set var="totalPrice" value="0"/>
                  <c:forEach var="cart" items="${cartList}" varStatus="status">
                   <!-- 카테고리 상세 번호에 따라서 drinkDetail, foodDetail, productDetail로 갈지 분기처리 -->
                  <c:choose>
                    <c:when test="${cart.ctgryDetailId >= 'ctg0101' && cart.ctgryDetailId <= 'ctg0110'}">
                        <c:set var="detailLink" value="/mem/drinkDetail?menuNo=${cart.menuNo}" />
                    </c:when>
                    <c:when test="${cart.ctgryDetailId >= 'ctg0201' && cart.ctgryDetailId <= 'ctg0210'}">
                        <c:set var="detailLink" value="/mem/foodDetail?menuNo=${cart.menuNo}" />
                    </c:when>
                    <c:when test="${cart.ctgryDetailId >= 'ctg0301' && cart.ctgryDetailId <= 'ctg0310'}">
                        <c:set var="detailLink" value="/mem/productDetail?menuNo=${cart.menuNo}" />
                    </c:when>
                   </c:choose>
                  <!-- 값 변경될때 마다 값 넘겨줘야하면 히든으로 가져와야함 -->
                  <input type="hidden" id="cartSeq" value="${cart.cartSeq}"/>
                  <input type="hidden" id="memNo" value="${cart.memNo}" />
                  <input type="hidden" id="cartCnt${status.count}" name="cartCnt" value="${cart.cartCnt}" />
                  <input type="hidden" id="menuPrice${status.count}" name="menuPrice" value="${cart.menuPrice}" />
                  <input type="hidden" id="menuIceYn${status.count}" name="menuIceYn" value="${cart.menuIceYn}" />
                  <input type="hidden" id="menuSize${status.count}" name="menuSize" value="${cart.menuSize}" />
                  <input type="hidden" id="menuNo${status.count}" name="menuNo" value="${cart.menuNo}" />
                  <input type="hidden" id="menuNm${status.count}" name="menuNm" value="${cart.menuNm}" />
                  <input type="hidden" id="atchFileNo${status.count}" name="atchFileNo" value="${cart.atchFileNo}" />
                  <tbody>
                     <tr>
                        <td>
                           <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" value="${cart.cartSeq}"
                                 name="chk" data-menuNo="${cart.menuNo}" checked="checked">
                           </div>
                        </td>
                        <td>
                           <div class="d-flex align-items-center" style="width:150px;">
                              <a href="${detailLink}"><img src="<c:out value='/resources/upload/menu/${cart.streFileNm}'/>"
                                 class="rounded-circle" alt="사진" width="60" height="60"></a>
                             <c:choose>
                                <c:when test="${cart.ctgryDetailId eq 'ctg0103'}">
                                     <!-- 스무디 ctg0103 카테고리 ID 들어오면 이름에 아무것도 안붙임-->
                                    <div class="ms-3">
                                        <a href="${detailLink}"><h6 class="fw-semibold mb-0 fs-4">${cart.menuNm}</h6></a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <!-- ice면 아이스, 아니면 '' 메뉴명 출력 -->
                                    <div class="ms-3">
                                        <a href="${detailLink}"><h6 class="fw-semibold mb-0 fs-4"><c:out value="${cart.menuIceYn eq '1' ? '아이스' : ''}"/> ${cart.menuNm}</h6></a>
                                    </div>
                                </c:otherwise>
                             </c:choose>
                           </div>
                        </td>
                         
                        <!-- 옵션 1이면 ICE에 Blue Color, 옵션 0이면 HOT에 Red Color, null이면 - -->
                        <td style="text-align:center"> 
                            <h6 class="mb-0 fs-4" style="color: ${cart.menuIceYn eq '1' ? 'blue' : (cart.menuIceYn eq '0' ? 'red' : '-')}">
                                <c:out value="${cart.menuIceYn eq '1' ? 'ICE' : (cart.menuIceYn eq '0' ? 'HOT' : '-')}"/>
                            </h6>
                        </td>
                         
                         <!-- 사이즈 S면 Small(355ml), L이면 Large(500ml), 옵션 없으면 대시 표시 -->
                        <c:choose>
                           <c:when test="${cart.menuSize eq 'S'}">
                              <td>
                                 <h6 style="text-align: center;" class="mb-0 fs-4">Small<span style="font-size:small">(355ml)</span></h6>
                              </td>
                           </c:when>
                            <c:when test="${cart.menuSize eq 'L'}">
                                <td>
                                    <h6 style="text-align: center;" class="mb-0 fs-4">Large<span style="font-size:small">(500ml)</span></h6>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td>
                                    <h6 style="text-align: center;" class="mb-0 fs-4">-</h6>
                                </td>
                            </c:otherwise>
                        </c:choose>
                        
                        <!-- 수량 증감 부분 [시작] -->
                        <td>
                            <div class="d-flex align-items-center" style="place-content: center;">
                              <button style="width : 30px;"
                                 class="btn minus py-1 px-2 border-end border-dark fs-3 border-end-0 text-dark"
                              type="button" id="add1" onclick="fnCartAdd(0,'${status.count}','${cart.menuSize}')">
                                 <i class="ti ti-minus"></i>
                              </button>
                              <input type="text" style="width : 40px;" onkeyup="fnInputQty(this,'${status.count}','${cart.menuSize}')" 
                                 class="min py-1 px-1 flex-grow-0 border border-dark text-dark fs-3 fw-semibold form-control text-center qty"
                                 placeholder="" aria-label="Example text with button addon"
                                 aria-describedby="qty" value="${cart.cartCnt}">
                              <button style="width : 30px;"
                                 class="btn py-1 px-2 border border-dark fs-3 border-start-0 text-dark add"
                                 type="button" id="add2" onclick="fnCartAdd(1,'${status.count}','${cart.menuSize}')">
                                 <i class="ti ti-plus"></i>
                              </button>
                           </div>
                        </td>
                        <!-- 수량 증감 부분 [끝] -->
                        
                        <!-- 가격 부분 : 사이즈 S면 수량*단가, 사이즈 L이면 수량*단가(+500) -->
                        <td class="displayPrice" style="padding-right: 10px;">
                           <c:if test="${cart.menuSize=='S' || cart.menuSize == null}">
                              <c:set var="amt" value="${cart.cartCnt * cart.menuPrice}" />
                           </c:if>
                           <c:if test="${cart.menuSize=='L'}">
                              <c:set var="amt" value="${cart.cartCnt * (cart.menuPrice+500)}" />
                           </c:if>
                           <h6 id="displayPrice${status.count}" style="text-align: right" class="mb-0 fs-4"><fmt:formatNumber type="number" maxFractionDigits="3" value="${amt}"/>원</h6>
                        </td>
                        <!-- 재고 여부 -->
                        <td style="text-align:center;" id="td${cart.menuNo}">
                        </td>
                        
                        <!-- 개별 삭제 버튼(휴지통 아이콘) -->
                        <td style="text-align:center;">
                           <button class="btn btn-outline-dark cartDelete" data-cart="${cart.cartSeq}" style="border:0px;">
                              <i class='ti ti-trash fs-5 mb-2'></i>
                           </button>
                        </td>
                     </tr>
                  </tbody>
               <!-- 총 합계 계산을 위한 변수 선언 -->
               <!-- 사이즈 S면 메뉴프라이스 or null이면 S로, 사이즈L이면 메뉴프라이스마다 +500-->
               <c:set var="totalPrice" value="${totalPrice + cart.cartCnt * ((cart.menuSize eq 'S' or cart.menuSize == null) ? cart.menuPrice : (cart.menuPrice + 500))}" />
               </c:forEach>
               
               <!-- 히든으로 totalPrice, 수량 증감할때마다 바로 총 합계 가격 변경 -->
               <input type="hidden" id="totalPrice" value="${totalPrice}" />
               </table>
               <c:if test="${empty cartList}">
                  <br>
                  <h6 class="mb-6 fs-6" style="text-align:center"><b>장바구니에 담긴 메뉴가 없습니다.</b></h6>
               </c:if>
               <div class="col-md-12">
                  <div class="pull-right mt-4 text-end">
                     <h3 id="displayTotalPrice" style="text-align:right; margin-right: 10px; font-weight:bold;" class="mb-0 fs-4">
                           총 합계 : <fmt:formatNumber type="number" maxFractionDigits="3"
                        value="${totalPrice}" />원
                     </h3>
                  </div>
                  <br>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- ================ 장바구니 내역 [끝] ================ -->
   
   <!-- ================ 결제 수단 [시작] ================ -->
   <div class="payment-option btn-group-active card shadow-none border" style="display: none;" id="paymentSection">
      <div class="card" style="padding:1.5rem;">
      <h3 style="margin-bottom:30px;">3. 결제 수단</h3>
          <div class="row">
            <div class="col-lg-8">
              <div class="btn-group row" role="group" aria-label="Basic radio toggle button group">
                <div class="position-relative col-12 mb-3">
                  <input type="radio" class="btn-check z-1 top-50 start-0 ms-4 round-16 position-relative" name="paymentType1" id="btnradio3" autocomplete="off" checked="" value="1">
                  <label class="btn btn-outline-light mb-0 p-3 rounded ps-5 w-100" for="btnradio3">
                    <div class="d-flex align-items-center">
                      <div class="text-start ps-2">
                        <h6 class="fs-4 fw-semibold mb-0">계좌이체</h6>
                        <p class="mb-0 text-muted">무통장 입금을 지원합니다.</p>
                      </div>
                    </div>
                  </label>
                </div>
                <div class="position-relative col-12 mb-3">
                  <input type="radio" class="btn-check z-1 top-50 start-0 ms-4 round-16 position-relative" name="paymentType1" id="btnradio4" autocomplete="off" value="2">
                  <label class="btn btn-outline-light mb-0 p-3 rounded ps-5 w-100" for="btnradio4">
                    <div class="d-flex align-items-center">
                      <div class="text-start ps-2">
                        <h6 class="fs-4 fw-semibold mb-0">카드 결제</h6>
                        <p class="mb-0 text-muted">KG이니시스 카드 결제를 지원합니다.
                        </p>
                      </div>
                    </div>
                  </label>
                </div>
                <div class="position-relative col-12">
                  <input type="radio" class="btn-check z-1 top-50 start-0 ms-4 round-16 position-relative" name="paymentType1" id="btnradio5" autocomplete="off" value="3">
                  <label class="btn btn-outline-light mb-0 p-3 rounded ps-5 w-100" for="btnradio5">
                    <div class="text-start ps-2">
                      <h6 class="fs-4 fw-semibold mb-0">App 결제</h6>
                      <p class="mb-0 text-muted">카카오페이, 토스페이를 지원합니다.</p>
                    </div>
                  </label>
                </div>
              </div>
            </div>
             <div class="col-lg-4">
                <img src="/resources/image/결제.jpg" class="img-fluid" style="border-radius:50px;">
             </div>
          </div>
      <br>
      <hr>
      <br>
      <p style="text-align : center;">주문 내용을 확인하였으며, 최종 결제를 진행합니다.</p>
      <button class="btn btn-outline-dark" type="button" style="width:320px; margin: 0px auto 15px; padding: 15px 0; font-size: 24px; font-weight:bold; text-shadow: 0 1px 0 rgba(0,0,0,.2);" 
         onclick="requestPay()">결제하기</button>
         </div>
   </div>                     
   <!-- ================ 결제 수단 [끝] ================ -->
   
   <!-- form태그로 insert된 Payment 테이블의 PaymentDetail 상세내역 보내기 -->
   <form id="payDetail" action="/mem/orderDetailInsert" method="post">
         <input type="hidden" id="pynmNo" name="pynmNo">
         <input type="hidden" id="orderTotalPrice" name="orderTotalPrice"/>
         <input type="hidden" id="orderFrcsNo" name="orderFrcsNo"/>
         <sec:csrfInput/>
   </form>
   
   <!-- 결제 API 관련 값 나중에 필요하면.. -->
   <input type="hidden" id="memNm" value="${memberVO.memNm}">
   <input type="hidden" id="memTel" value="${memberVO.memTel}">
   <input type="hidden" id="memMail" value="${memberVO.memMail}">
   <input type="hidden" id="memAddr" value="${memberVO.memAddr} ${memberVO.memAddr2}">
   <input type="hidden" id="memZip" value="${memberVO.memZip}">
</div>

<!-- ====================================================================== 구 ===================================================================== -->
<!-- ====================================================================== 분 ===================================================================== -->
<!-- ====================================================================== 선 ===================================================================== -->
<!-- ====================================================================== 구 ===================================================================== -->
<!-- ====================================================================== 분 ===================================================================== -->
<!-- ====================================================================== 선 ===================================================================== -->

<!-- 매장 선택하면 세부내역들 나타내기 -->
<script>
function onStoreSelectChange(){
    // 2번의 장바구니 내역과 3번의 결제수단  나타내기
    $("#cartSection, #paymentSection").slideDown('slow');
}
</script>

<!-- 지점 선택 시 선택한 지점 정보와 재고 가져오기, 재고없으면 체크 막고 줄 긋기 -->
<script>
// 셀렉 박스에서 선택한 값 추출
$("#frcsSelect").on("change", function () {
    var selectedOption = $(this).find(":selected");
    var frcsNo = selectedOption.val();
    var addr = selectedOption.data("addr");
    var tel = selectedOption.data("tel");
    console.log("selectedOption",selectedOption);
    console.log("frcsNo",frcsNo);
    console.log("addr",addr);
    console.log("tel",tel);
    
    // 전화번호에 하이픈 추가하는 함수
    var formattedTel = tel.substring(0, 3) + '-' + tel.substring(3, 7) + '-' + tel.substring(7);
    
    // 선택한 지점의 정보를 표시
    $("#selectedFrcsInfo").html(
        '<h6 class="mb-3 fs-4 fw-semibold">픽업장소 : ' + selectedOption.text() + '</h6>' +
        '<p class="mb-1 fs-3">주소 : ' + addr + '</p>' +
        '<h6 class="d-flex align-items-center gap-2 my-4 fw-semibold fs-4">' +
        '<i class="ti ti-device-mobile fs-7"></i>번호 : ' + formattedTel  + '</h6>');
    
    // 선택한 지점의 정보가 표시되도록 엘리먼트를 보이게 변경
    $("#selectedFrcsinfoDiv").show();
    
    let data = {
       "frcsNo" : frcsNo,
       "memNo":$("#memNo").val()
    }
    console.log("data : ", data);
    
    // 재고 체크하는 ajax
    $.ajax({
       url : "/mem/cartStockCheck",
       contentType : "application/json;charset=UTF-8",
       data : JSON.stringify(data),
       type : "POST",
       dataType : "JSON",
         beforeSend : function(xhr) {
         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      },
      success : function(result) {
         console.log("result : ", result);
         
         // 재고 유무 표시, 체크박스 막고 줄 긋기
         $.each(result, function(idx, memberCartVO){
             console.log("memberCartVO.stockYn : " + memberCartVO.stockYn);
            
             let total = $("input[name=chk]").length;   //개별체크 하나라도 빠져있으면 전체체크 풀기위한 전역변수
             let checked = $("input[name=chk]:checked").length;
            
             if(memberCartVO.stockYn=="TRUE"){
                $("#td"+memberCartVO.menuNo).html('<span class="badge rounded-pill bg-success">가능</span>');
                $("input[data-menuNo='" + memberCartVO.menuNo + "']").prop("checked", true); // 이 메뉴번호에 해당하는 체크박스 풀기, 위에 코드 input 체크박스에 (data-menuNo=메뉴번호 넣어놨음)
                $("input[data-menuNo='" + memberCartVO.menuNo + "']").removeAttr("disabled"); // 체크박스 disabled한 속성 지우기
                $("input[data-menuNo='" + memberCartVO.menuNo + "']").parents('td').next().find("h6").css("text-decoration",""); // 선택된 요소에서 부모요소인 td를 찾고, 그 다음에오는 형제 요소의  h6태그를 찾아서 텍스트에 선 긋기
                updateDisplayTotalPrice(); //현재 체크되어있는 메뉴 합계 표시
             }else{
                $("#td"+memberCartVO.menuNo).html('<span class="badge rounded-pill bg-danger">불가</span>');
                $("input[data-menuNo='" + memberCartVO.menuNo + "']").prop("checked", false); // 불가에 해당하는 메뉴는 체크박스 풀기
                $("input[data-menuNo='" + memberCartVO.menuNo + "']").prop("disabled", "disabled"); //체크박스 못누르게 막음
				$("input[data-menuNo='" + memberCartVO.menuNo + "']").parents('td').next().find("h6").css("text-decoration","line-through");

                if(total != checked){ //개별체크 하나라도 빠져있으면 전체체크 풀어
                   $("#cbx_chkAll").prop("checked", false);
                }
                updateDisplayTotalPrice(); //현재 체크되어있는 메뉴 합계 표시
             }
         });
      }
    })
});
</script>

<!-- 체크박스 전체선택, 개별선택 및 가격 업데이트  [시작]-->
<script type="text/javascript">
   $(document).ready(function() {
      //전체 체크박스
      $("#cbx_chkAll").click(function() {
         if($("#cbx_chkAll").is(":checked")){
             $("input[name=chk]").each(function(){ //개별체크박스 돌려서 속성이 disabled가 아닌것들은 check인 상태로 두고 disalbed인 애들은 체크 안되게 체크풀어
                 if(!$(this).prop("disabled")){
                     $(this).prop("checked", true);
                 }else{
                     $(this).prop("checked", false);
                 }
             });
             updateDisplayTotalPrice();  // 체크 됐을 때 총 합계 가격 업데이트 호출
         } else {
            $("input[name=chk]").prop("checked", false);
            noCheckZeroPrice(); //전체 체크 다 풀렸을때 0원 업데이트 호출
         }
      });
      //개별 선택 체크박스
      $("input[name=chk]").click(function() {
         let total = $("input[name=chk]").length;
         let checked = $("input[name=chk]:checked").length;
         if(total === checked) {
            $("#cbx_chkAll").prop("checked", true);
            updateDisplayTotalPrice(); // 총 합계 가격 업데이트 호출
         } else if(total != checked){
            $("#cbx_chkAll").prop("checked", false);
            updateDisplayTotalPrice(); // 전체 체크박스 풀고 현재 체크된 부분들만 총 합계 가격 업데이트 호출
         } else if(checked === 0){
            noCheckZeroPrice(); //전체 체크 다 풀렸을때 0원 업데이트 호출
         }
      })
   });

// ■ 체크박스를 통한 삭제
   function deleteMenu(){
      var selectValue = [];
      $("input[name=chk]:checked").each(function(){
         selectValue.push($(this).val());
      });
      console.log("선택된 checkbox의 메뉴번호 : ", selectValue);
      
      let data = {
         "cartSeqs" : selectValue
      }
      
      $.ajax({
         url:"/mem/cartListDelete",
         contentType : "application/json;charset=utf-8",
         data : JSON.stringify(data),
         type : "post",
         dataType : "json",
         beforeSend : function(xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
         success : function(result) {
            console.log("result : ", result);
            if (result > 0) {
            	// 클라이언트 측에서 삭제한 항목을 화면에서 즉시 제거
                $("input[name=chk]:checked").closest('tr').remove();
                updateDisplayTotalPrice(); //현재 체크되어있는 메뉴 합계 표시

               var Toast = Swal.mixin({
                  toast : true,
                  position : 'top-end',
                  showConfirmButton : false, //true 시 ok 버튼 뜸1
                  timer : 1000, //1초 동안 표시
                  timerProgressBar : true // true 시 타임게이지 나옴
               });
               Toast.fire({
                  icon : 'success', //출력할 아이콘 종류(success, warning, error, info, quesition)
                  title : '삭제하였습니다.' //출력할 메세지 내용
               });
            }
         },
         error : function(err) {
            var Toast = Swal.mixin({
               toast : true,
               position : 'top-end',
               showConfirmButton : false,
               timer : 1000,
               timerProgressBar : true
            });
            Toast.fire({
               icon : 'error',
               title : '에러가 발생하였습니다 .'
            });
         }
      });
   }
</script>
<!-- 체크박스 전체선택, 개별선택 및 가격 업데이트  [끝]-->


<!-- 장바구니 내역 "아이콘" 삭제 버튼 ajax [시작]-->
<script type="text/javascript">
   $(".cartDelete").on("click", function() {
	  let clickedButton = $(this);
      let cartSeq = clickedButton.data("cart");

      let data = {
         "cartSeq" : cartSeq
      }
      console.log("data : ", data);
   
      $.ajax({
         url : "/mem/cartListDelete",
         contentType : "application/json;charset=utf-8",
         data : JSON.stringify(data),
         type : "post",
         dataType : "json",
         beforeSend : function(xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
         success : function(result) {
            console.log("result : ", result);
            if (result > 0) {
               // 클라이언트 측에서 삭제한 항목을 화면에서 즉시 제거
               clickedButton.closest('tr').remove();
               updateDisplayTotalPrice(); //현재 체크되어있는 메뉴 합계 표시
               var Toast = Swal.mixin({
                  toast : true,
                  position : 'top-end',
                  showConfirmButton : false, //true 시 버튼 뜸
                  timer : 1000, //1초 동안 표시됨
                  timerProgressBar : true // true 시 타임게이지 나옴
               });
               Toast.fire({
                  icon : 'success', //출력할 아이콘 종류(success, warning, error, info, quesition)
                  title : '삭제하였습니다.' //출력할 메세지 내용
               });
            }
         },
         error : function(err) {
            var Toast = Swal.mixin({
               toast : true,
               position : 'top-end',
               showConfirmButton : false,
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
<!-- 장바구니 내역 "아이콘" 삭제 버튼 ajax [끝]-->

<!-- mouse, keyboard 이벤트를 통한 장바구니 수량 증감 함수 [시작] -->
<script type="text/javascript">
   let totalPrice = parseInt($("#totalPrice").val()); // 전역변수
   function fnCartAdd(i, status, menuSize){
      console.log("해당 제품의 순번 : ", status);
      let cartCnt = parseInt($("#cartCnt"+status).val());
      let menuPrice = parseInt($("#menuPrice"+status).val());
      
      if(menuSize=="L"){
         menuPrice += 500;
      }
      
      if(i > 0){
         $("#cartCnt"+status).val(cartCnt+1);
         cartCnt = cartCnt+1;
         menuPrice = (cartCnt*menuPrice)
      } else {
         if(cartCnt > 1){
            $("#cartCnt"+status).val(cartCnt-1);
            cartCnt = cartCnt-1;
            menuPrice = (cartCnt*menuPrice)
         }
      }
        // 개별 가격 업데이트 호출
        updateDisplayPrice(menuPrice, status);
         console.log("해당 제품의 수량 : ", cartCnt);
         console.log("해당 제품의 총 가격 : ", menuPrice);
   
      // 총 합계 가격 업데이트 호출
      updateDisplayTotalPrice();
   };
   
   // ■ keyboard 입력 이벤트를 통한 장바구니 수량 증감 함수
   function fnInputQty(obj, status, menuSize){ //this로 지정한 obj를 통해 $(obj).val()로 해당 keyboard 입력요소의 값을 가져온다.
      let menuPrice = parseInt($('#menuPrice' + status).val()); //메뉴 단가 가져옴
       
       if (menuSize == "L") {
           menuPrice += 500; //메뉴 사이즈가 L면 단가에 500원 더함
       }
   
       let quantity = parseInt($(obj).val()); //내가 입력한 수량을 정수로 변환해서 quantity 함수에 담음
   
       if (!isNaN(quantity)) { // 입력이 숫자인 경우에만 계산
           let totalPrice = menuPrice * quantity; //합계에 메뉴랑 수량 곱해
           $('#displayPrice' + status).text(totalPrice.toLocaleString() + "원");
           $("#cartCnt" + status).val(quantity);
         
           updateDisplayTotalPrice(); // 총 합계 가격 업데이트 호출
       }
   }
      
   // ■ 개별 가격 업데이트 함수(텍스트 변환)
   function updateDisplayPrice(menuPrice, status) {
       $("#displayPrice"+status).text(menuPrice.toLocaleString() + "원");
   };
   
   // ■ 총 합계 가격 업데이트 함수(텍스트 변환)
   function updateDisplayTotalPrice(){
      let totalPrice = 0;
      
      // 개별체크박스의 인덱스와 밸류를 포문 돌린다.
      $("input[name=chk]").each(function (i, v) {
           let isChecked = $(this).is(':checked'); // 내가 누른(this)가 체크된 상태
           let displayPriceText = $(this).parents('tr').children('.displayPrice').children().text().slice(0, -1).replace(/,/g, '');
         ////총합계금액(totalPrice)변수에 this(누른거).모든 조상요소 tr태그의 자식인 displayPrice(개별금액의 자식인 텍스트인데 문제는 5,900원이라 잘라와야함.
           if (isChecked) { // 체크된 상태면 그 가격을 누적해줌
               totalPrice += parseInt(displayPriceText);
           }
       });

       $("#displayTotalPrice").text("총 합계 : " + totalPrice.toLocaleString() + "원"); //다 가져온 숫자들을 텍스트화 시킴
       $("#totalPrice").val(totalPrice);
   };
   
   // 체크 다 풀리면 0원 표시
   function noCheckZeroPrice(){
      var totalPrice = 0;
      $("#displayTotalPrice").text("총 합계 : " + totalPrice.toLocaleString() + "원"); //다 가져온 숫자들을 텍스트화 시킴
   }
</script>
<!-- mouse, keyboard 이벤트를 통한 장바구니 수량 증감 함수 [끝] -->

<!-- 검색 기능 [시작] -->
<script type="text/javascript">
$(document).ready(function() {
   $("#keyword").keyup(function() { // keyup은 키를 눌렀다 떼는 순간 이벤트가 발생되는 기능
      var keywordInput = $(this).val(); // 내가 입력한 요소(this)의 값을 읽어옴, 만약 영어도 섞여있다면 .toLowerCase()를 붙여서 입력한 검색어를 소문자로 변환시키면 됨
        var rows = $("#searchCart tbody tr"); // "searchCart" 테이블의 모든 행을 선택
      
        rows.each(function(){
          var tdText = $(this).find("td").text(); // 모든 열(td)에 있는 텍스트를 찾아냄
          if (tdText.indexOf(keywordInput)!== -1){ // 텍스트에 검색어가 포함되어 있으면 show 아니면 hide
             $(this).show();
          } else {
             $(this).hide();
          }
       });
   });
});
</script>
<!-- 검색 기능 [끝] -->

<!-- 장바구니에서 결제 확정 후 주문상세 넘기기 [시작] -->
<script type="text/javascript">
function requestPay(type){
   $("#bg-info-header-modal").modal('hide');
   
   // 매장 선택 안하면 결제 막기
   if($("#frcsSelect").val() == null){
      alert("주문하실 매장을 선택해주세요");
      return;
   }
   
   let paymentType = $("input[name=paymentType1]:checked").val(); // 네임값이 다 같은 이유는 radio 버튼이라서 그럼, 라디오의 경우 네임값이 다르면 중복 선택됨. 라디오는 하나만 선택이라 네임값 똑같이 맞춰줘야함
   console.log("선택한 결제수단 번호 : ", paymentType);
   let payMethod,
       pg,
       pynmMthdNm;
   if(paymentType == "1"){
      payMethod = "trans";
      pg = "html5_inicis";
      pynmMthdNm = "계좌이체";
   }else if (paymentType == "2"){
      payMethod = "card";
      pg = "html5_inicis";
      pynmMthdNm = "카드";
   }else{
      if(type == 'kakao'){
         payMethod = "card";
         pg = "kakaopay.TC0ONETIME";
         pynmMthdNm = "카카오페이";
      }else if(type == 'toss'){
         payMethod = "card";
         pg = "tosspay.tosstest";
         pynmMthdNm = "토스페이";
      }else{
         $("#bg-info-header-modal").modal('show');
         return false;
      }
   }
   // 체크한 내역들 필요한 값 가져오기
   let memNo = $("#memNo").val();
   let totalPrice = $("#totalPrice").val();
   
   let menuNos = [], //값 가져오려면 1:1은 밸류로 가져올 수 있다해도, 1:N은 배열을 사용해야함
      cartCnts = [],
      menuPrices = [],
      menuSizes = [],
      menuIceYns = [],
      menuNms = [],
      atchFileNos = [];
   
   let memNm = $("#memNm").val();
   let memMail = $("#memMail").val();
   let memTel = $("#memTel").val();
   let memAddr = $("#mamAddr").val();
   let memZip = $("#memZip").val();
   
   // 체크박스 이름에 chk가 들어가 있는 모든 문자중에서 체크되어 있는 모든 문자를 선택자로 포이치문 돌림
   $('[name*=chk]:checked').each(function(i){
      menuNos.push($("#menuNo"+(i+1)).val()); // 각 개별 체크박스의 순번을 고르려고 var status count를 썼기 때문에 (i+1)을하는거임, 그냥 인덱스면 i로 했음(0이니까) 
      menuNms.push($("#menuNm"+(i+1)).val());
      menuIceYns.push($("#menuIceYn"+(i+1)).val());
      menuSizes.push($("#menuSize"+(i+1)).val());
      cartCnts.push($("#cartCnt"+(i+1)).val());
      menuPrices.push($("#displayPrice"+(i+1)).text().slice(0,-1).replace(/,/g , '')); // 총합계 표시 부분이 텍스트에 ,콤마 있어서 값 빼내려면 잘라서 가져와야함
      atchFileNos.push($("#atchFileNo"+(i+1)).val());
   });

   let data = {
      "memNo" : memNo,                  // 회원 아이디
      "menuNos" : menuNos,               // 메뉴 번호들
      "menuNms" : menuNms,               // 메뉴 이름들
      "menuIceYns" : menuIceYns,         // 메뉴 얼음 유무들
      "menuSizes" : menuSizes,            // 메뉴 사이즈들
      "cartCnts" : cartCnts,            // 카트 수량들
      "menuPrices" : menuPrices,         // 메뉴 가격들
      "totalPrice" : totalPrice,         // 메뉴 총 가격
      "frcsNo" : $("#frcsSelect").val(),    // 셀렉트 박스에서 현재 선택된 지점의 번호
      "pynmMthdId" : $("#pynmMthdId").val(),// 현재 선택한 결제 수단
      "pynmMthdNm" : pynmMthdNm,         // 현재 선택한 결제명
      "pynmTotalAmt" : totalPrice,         // 상세로 보낼 전체 총 합계 금액(장바구니 총 가격이랑은 다름, 체크박스 선택한 애들만 보낼거라)
      "atchFileNos" : atchFileNos         // 해당 메뉴의 파일번호들
   }
   console.log("data : ", data);

   //결제 API
   var IMP = window.IMP;
   IMP.init("");
      IMP.request_pay(
            {
               pg: pg,                     		   // pg파라미터 값(이니시스(계좌이체,카드), 카카오, 토스)
               pay_method: payMethod,              // 결제 방법(trans, card)
               merchant_uid: new Date().getTime(), // 주문번호(왜 new Data만해도 현재시간을 구할수있는데 .getTime메소드까지 썼냐면... date타입은 object고 data내부의 getTime은 number라서..)
               name:'음료',                         // 상품명
               amount: totalPrice,                 // 금액
               buyer_email: memMail,               // 밑에는 구매자 정보들
               buyer_name: memNm,
               buyer_tel: memTel,
               buyer_addr: memAddr,
               buyer_postcode: memZip
            },
            function (rsp) {
               if (rsp.success) {
                  //서버 검증 요청 부분
                  alert('결제완료');
                  $.ajax({
                     url : "/mem/orderInsert",
                     contentType : "application/json;charset=utf-8",
                     data : JSON.stringify(data),
                     type : "POST",
                     dataType : "json",
                     beforeSend : function(xhr) {
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                     },
                     success : function(result) {
                        console.log("result : "+ result);
                        if(result.result === "success"){ // 이게 맵.put써서 result.result로 한거임...
							
                        	// 소켓 send 부분
                        	socketSend(result);
                        	
                            $("#pynmNo").val(result.pynmNo); // result맵에서 put한애들의 값을 서브밋해줌
                            $("#orderTotalPrice").val(result.orderTotalPrice);
                    	    $("#orderFrcsNo").val(result.frcsNo);                  
                            $("#payDetail").submit(); // 폼태그에 서브밋
                        } else {
                           alert("fail");
                        }
                     },
                     error: function(error){
                        console.log("error : " + error);
                     }
                  })
               } else {
                  alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
               }
            }
      );
}

// 주문 완료 시 소켓전송
function socketSend(result) {
	// 받는 사람 (가맹점) - 가맹점 번호로 가맹점
	console.log("result(카트리스트)", result.frcsNo);
	let alarmData = {
		"alarmRcverId":result.frcsNo,
		"alarmChecked":"N",
		"movUrl":"localhost:/frcs/main"
	};
	socket.send(alarmData.alarmRcverId + "," + alarmData.alarmChecked + "," + alarmData.movUrl);
	console.log("alaramData: ", alarmData);
	$.ajax({
		url:"/alarm/saveAlarm",
		type:"post",
		data:JSON.stringify(alarmData),
		beforeSend : function(xhr) {
	        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	     },
	     success:function(result) {
	    	 console.log(result);
	     }
	});
	
}

</script>
<!-- 장바구니에서 결제 확정 후 주문상세 넘기기 [끝] -->

<!-- 카카오페이, 토스페이 앱 결제 띄우는 모달 -->
<div id="bg-info-header-modal" class="modal fade" tabindex="-1"
    aria-labelledby="info-header-modalLabel" aria-hidden="true">
   <div class="modal-dialog modal-dialog-scrollable modal-lg">
      <div class="modal-content modal-filled bg-dark" style="width: 520px">
         <div class="modal-header modal-colored-header text-white">
            <h4 class="modal-title" id="dark-header-modalLabel" style="color: white;">
               App 결제
            </h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
            <div class="row">
               <div class="col-6" style="text-align: center;">
                  <a href="javacsript:void(0);" onclick="requestPay('kakao')"><img src="/resources/image/kakaoPay.png" alt="" class="rounded-2 img-fluid mb-9" style="height: 150px; width: 180px;"></a>
               </div>
               <div class="col-6" style="text-align: center;">
                  <a href="javacsript:void(0);" onclick="requestPay('toss')"><img src="/resources/image/tossPay.jpg" alt="" class="rounded-2 img-fluid mb-9" style="height: 150px; width: 180px;"></a>
               </div>
            </div>
         </div>
      </div>
      <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
</div>