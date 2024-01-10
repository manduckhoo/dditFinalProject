<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/memMenu.css">
<!-- Core Css -->
<link rel="stylesheet" href="/resources/bootstrap/src/assets/css/styles.css" />

<!-- principal : CustomUser.java -->
<sec:authorize access="isAuthenticated()"><!-- 로그인 했으면 이 안에 sec:authentication 코드가 실행된다.-->
	<sec:authentication property="principal.memberVO.memNo" var="memNo" />
</sec:authorize>
<!--  ================= Menu-> 음료 상세보기 [시작] ================= -->
	<section>
	<!-- ============== 메뉴VO를 위한 인풋 히든 [시작] ============== -->
	<!-- 히든으로 menuNo 가져가야 null값 안나옴-->
	<input type="hidden" id="memNo" name="memNo" value="${memNo}" />
	<input type="hidden" id="menuNo" name="menuNo" value="${memberMenuVO.menuNo}" />
	<!-- 히든으로 cartCnt 가져와서 장바구니에 제품 수량 증감하기 -->
	<input type="hidden" id="cartCnt" name="cartCnt" value="1" />
	<!-- 히든으로 menuPrice 가져와서 장바구니에 제품 수량 증감할때 바로바로 가격 변경해주기 -->
	<input type="hidden" id="menuPrice" name="menuPrice" value="${memberMenuVO.menuPrice}" />
	<!-- ============== 메뉴VO를 위한 인풋 히든 [끝] ============== -->
	<div class="container breadcrumb" style="margin-left:5px;">
	    <nav class="breadcrumb" aria-label="breadcrumb">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></a></li>
					<li class="breadcrumb-item"><a href="/mem/allMenu"><b>메뉴</b></a></li>
					<li class="breadcrumb-item"><a href="/mem/drink"><b>음료</b></a></li>
					<li class="breadcrumb-item active" aria-current="page"
						style="color: #d50037"><b>음료 상세</b></li>
				</ol>
			</nav>
		</nav>
    </div>
    <br>
	<h2 class="sub-tit-name">커피&음료</h2>
    <br>
	<div class="menuContainer-detail">
		<div class="menuItem-detail-img">
			<img class="menu-img-big" src="<c:out value='/resources/upload/menu/${memberMenuVO.streFileNm}'/>" />
		</div>
		<div class="menuItem-detail">
			<div>
			<p class="menu_name" id="updateDisplayName"><c:out value="${memberMenuVO.menuNm}"/> </p>
			<p class="menu-detail"><c:out value="${memberMenuVO.menuDescription}"/></p>
			
			<!-- 아코디언 메뉴[시작] -->
			<input type="hidden" id="menuSize" name="menuSize" value="${memberMenuVO.menuSize}"/>
			<!-- 스몰/라지 누르면 제품 영양정보 사이즈, ml 바뀌는 부분 -->
			<div class="accordion">
				<div id="menuInfoSmall" style="display:none;">제품 영양 정보
					<span class="accordion-standard">Small(스몰) / 355ml (12 fl oz) </span>
				</div>
				<div id="menuInfoLarge" style="display:none;">제품 영양 정보
					<span class="accordion-standard">Large(라지) / 500ml (17 fl oz) </span>
				</div>
				<button style="border:0px;">
					<span class="seeMore">+</span>
				</button>
			</div>
			
			<!-- 스몰/라지 누르면 아코디언 내부 내역도 바뀌는 부분 [시작] -->
			<div class="panel">
				<div class="inner-box1">
					<div id="smallInfo" class="menuNtrInfo" style="display:none;">
						<div>1회 제공량<p ><c:out value="${memberMenuVO.calories}"/></p>(kcal)</div>
						<div>당류<p><c:out value="${memberMenuVO.sugar}"/></p>(g)</div>
						<div>나트륨<p><c:out value="${memberMenuVO.sodium}"/></p>(mg)</div>
						<div>단백질<p><c:out value="${memberMenuVO.protein}"/></p>(g)</div>
						<div>포화지방<p><c:out value="${memberMenuVO.saturatedFat}"/></p>(g)</div>
						<div>카페인<p><c:out value="${memberMenuVO.caffeine}"/></p>(mg)</div>
					</div>
					<div id="largeInfo" class="menuNtrInfo" style="display:none;">
						<div>1회 제공량<p><c:out value="${fn:replace((memberMenuVO.calories * 1.4), '.0', '')}" /></p>(kcal)</div>
						<div>당류<p><c:out value="${fn:replace((memberMenuVO.sugar * 1.4), '.0', '')}"/></p>(g)</div>
						<div>나트륨<p><c:out value="${fn:replace((memberMenuVO.sodium * 1.4), '.0', '')}"/></p>(mg)</div>
						<div>단백질<p><c:out value="${fn:replace((memberMenuVO.protein * 1.4), '.0', '')}"/></p>(g)</div>
						<div>포화지방<p><c:out value="${fn:replace((memberMenuVO.saturatedFat * 1.4), '.0', '')}"/></p>(g)</div>
						<div>카페인<p><c:out value="${fn:replace((memberMenuVO.caffeine * 1.4), '.0', '')}"/></p>(mg)</div>
					</div>
				</div>
			</div>
			<!-- 스몰/라지 누르면 아코디언 내부 내역 바뀌는 부분 [끝] -->
			<!-- 아코디언 메뉴[끝] -->
			
			<div>
				<!-- 얼음 유무 / 사이즈 선택 [시작] -->
				<hr>
				<!-- 메뉴에 따라 아이스만 판매되는 경우 -->
				<c:forEach var="menu" items="${menuCtgList}">
					<div class="d-flex align-items-center pb-2 mb-3">
					<h6 class="mb-0 fs-4 fw-semibold" style="width: 100px;">얼음 유무 : </h6>
					<c:choose>
			            <c:when test="${menu.ctgryDetailId eq 'ctg0103'}">
<!-- 			        		<button class="btn btn-outline-primary" id="iceOnlyButton" name="menuIceYn" value="1" style="display: none;">ICE ONLY</button> -->
			        		<input type="radio" class="btn-check" name="menuIceYn" id="iceOnlyButton" value="1" checked style="display: none;">
							<label class="btn btn-outline-primary" for="iceOnlyButton">ICE ONLY</label>
			            </c:when>
			            <c:otherwise>
							<div id="hotAndIce" class="btn-group" role="group" aria-label="Basic radio toggle button group" style="display: none;">
								<input type="radio" class="btn-check" name="menuIceYn" id="menuHot" value="0" checked onclick="fnIceYn(0)">
								<label class="btn btn-outline-danger" for="menuHot">HOT</label>
								<input type="radio" class="btn-check" name="menuIceYn" id="menuIce" value="1" onclick="fnIceYn(1)">
								<label class="btn btn-outline-primary" for="menuIce">ICE</label>
							</div>
			            </c:otherwise>
					</c:choose>
					</div>
				</c:forEach>
				<div class="d-flex align-items-center pb-2 mb-3"><h6 class="mb-0 fs-4 fw-semibold" style="width: 100px;">사이즈 : </h6>
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
						<input type="radio" class="btn-check" name="menuSize" id="menuSize1" value="S" checked onclick="fnSize(0)">
						<label class="btn btn-outline-dark" for="menuSize1">Small</label>
						
						<input type="radio" class="btn-check" name="menuSize" id="menuSize2" value="L" onclick="fnSize(1)">
						<label class="btn btn-outline-dark" for="menuSize2">Large</label>
					</div>
				</div>
				<!-- 얼음 유무 / 사이즈 선택 [끝] -->
				
				<!-- 수량 증감 부분 [시작] -->
				<div class="d-flex align-items-center gap-9 pb-4 mb-4 border-bottom">
					<h6 class="mb-0 fs-4 fw-semibold" style="width: 50px;">수량 :</h6>
					<div class="input-group input-group-sm rounded" style="margin-left:40px;">
						<button
							class="btn minus min-width-40 py-0 border-end border-dark fs-5 border-end-0 text-dark"
							type="button" id="add1" onclick="fnCartAdd(0)">
							<i class="ti ti-minus"></i>
						</button>
						<input type="text" style="width : 50px;" onkeyup="fnInputQty(this)"
							class="min-width-40 flex-grow-0 border border-dark text-dark fs-4 fw-semibold form-control text-center qty"
							placeholder="" aria-label="Example text with button addon"
							aria-describedby="qty" value="1">
						<button
							class="btn min-width-40 py-0 border border-dark fs-5 border-start-0 text-dark add"
							type="button" id="add2" onclick="fnCartAdd(1)">
							<i class="ti ti-plus"></i>
						</button>
					</div>
				</div>
				<!-- 수량 증감 부분 [끝] -->
				
				<div class="menu-container" style="display:flex; height : 30px; justify-content: space-between;">
						<p>	 <!-- 데이터를 문자열로 바꾸어서 보여주는 역할이 씨 아웃, 3항 연산자로 위시리스트에 없으면 빈 화면, 있으면 색깔 화면 -->
							<button type="button" class="btn <c:out value='${result eq 1 ? "mb-1 btn-danger" : "bg-danger-subtle"}'/> btn-circle" id="addWish" style="margin-top: 6px;">
		                      <i class="fs-5 ti ti-heart <c:out value='${result eq 1 ? "" : "text-outline-dark"}'/>"></i>
		                    </button>
			            </p>
                    <!-- 수량 증감에 따른 토탈프라이스 -->
                    <c:set var="totalPrice" value="${menuPrice + cart.cartCnt * ((cart.menuSize eq 'S' or cart.menuSize == null) ? cart.menuPrice : (cart.menuPrice + 500))}" />
					<!-- 단가 -->
					<h5 style="text-align:end; font-weight:bold; color:gray;" class="menuPrice">가격 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${memberMenuVO.menuPrice}"/>원</h5>
	           		<!-- 총 가격 -->
	            </div>
	           		<h5 style="text-align:end; font-weight:bold;" class="menuPrices"></h5>
				
				<!-- 장바구니, 주문하기 버튼 -->
				<div class="order-btn-containter">
					<button class="btn btn-outline-dark flex-shrink-0" type="button" id="addCart" style="width:100%; margin-top: 10px;">
		            	<i class="bi-cart-fill me-1"></i>장바구니 담기</button>
				</div>
			</div>
		</div>
		</div>
	</div>
	
<!-- =============== 장바구니 모달 창 [시작] ============== -->
	<!-- 장바구니에 "담겼을때" 모달 창 띄우기 -->
	<div class="modal fade" id="al-warning-alert" tabindex="-1"
		aria-labelledby="vertical-center-modal" style="display: none;"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content modal-filled bg-light-warning">
				<div class="modal-body p-4">
					<div class="text-center text-warning">
						<i class='bx bxs-cart-add fs-9 mb-2'></i>
						<h4 class="mt-2 mb-3">장바구니에 추가되었습니다.</h4>
						<button type="button" class="btn btn-light my-2"
							data-bs-dismiss="modal" style=" margin-right: 10px;">계속 쇼핑하기</button>
						<a href="/mem/cartList"><button type="button" class="btn btn-light my-2"
							data-bs-dismiss="modal">장바구니 보기</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 장바구니에 "이미 담긴 상품일때" 모달 창 띄우기 -->
	<div class="modal fade" id="al-warning-alert1" tabindex="-1"
		aria-labelledby="vertical-center-modal" style="display: none;"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content modal-filled bg-light-warning">
				<div class="modal-body p-4">
					<div class="text-center text-warning">
						<i class='bx bx-error-alt fs-9 mb-2'></i>
						<h4 class="mt-2 mb-3">이미 장바구니에<br>담겨있는 상품입니다.</h4>
						<button type="button" class="btn btn-light my-2"
							data-bs-dismiss="modal" style=" margin-right: 10px;">계속 쇼핑하기</button>
						<a href="/mem/cartList"><button type="button" class="btn btn-light my-2"
							data-bs-dismiss="modal">장바구니 보기</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 장바구니 "수량 변경해서 담을때" 모달 창 띄우기 -->
	<div class="modal fade" id="al-warning-alert2" tabindex="-1"
		aria-labelledby="vertical-center-modal" style="display: none;"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content modal-filled bg-light-warning">
				<div class="modal-body p-4">
					<div class="text-center text-warning">
						<i class='bx bx-revision fs-9 mb-2'></i>
						<h4 class="mt-2 mb-3">장바구니 수량이<br>변경되었습니다.</h4>
						<button type="button" class="btn btn-light my-2"
							data-bs-dismiss="modal" style=" margin-right: 10px;">계속 쇼핑하기</button>
						<a href="/mem/cartList"><button type="button" class="btn btn-light my-2"
							data-bs-dismiss="modal">장바구니 보기</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- =============== 장바구니 모달 창 [끝] ============== -->

<!-- =============== 위시리스트 모달 창 [시작] ============== -->
	<!-- 위시리스트 담을때 모달창 띄우기 -->
	<div class="modal fade" id="al-danger-alert" tabindex="-1"
		aria-labelledby="vertical-center-modal" style="display: none;"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content modal-filled bg-light-danger">
				<div class="modal-body p-4">
					<div class="text-center text-danger">
						<i class='bx bx-bookmark-heart fs-9 mb-2'></i>
						<h4 class="mt-2 mb-3">위시리스트에<br>추가되었습니다.</h4>
						<button type="button" class="btn btn-light my-2"
							data-bs-dismiss="modal" style=" margin-right: 5px;">계속 쇼핑하기</button>
						<a href="/mem/wishList"><button type="button" class="btn btn-light my-2"
							data-bs-dismiss="modal">위시리스트 보기</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 위시리스트 "이미 담겨있을때" 모달창 띄우기 -->
	<div class="modal fade" id="al-danger-alert2" tabindex="-1"
		aria-labelledby="vertical-center-modal" style="display: none;"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content modal-filled bg-light-danger">
				<div class="modal-body p-4">
					<div class="text-center text-danger">
						<i class='bx bx-error-alt fs-9 mb-2'></i>
						<h4 class="mt-2 mb-3">이미 위시리스트에<br>담겨있는 상품입니다.</h4>
						<button type="button" class="btn btn-light my-2"
							data-bs-dismiss="modal" style=" margin-right: 5px;">계속 쇼핑하기</button>
						<a href="/mem/wishList"><button type="button" class="btn btn-light my-2"
							data-bs-dismiss="modal">위시리스트 보기</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- =============== 위시리스트 모달 창 [끝] ============== -->
</section>
<!--  ================= Menu-> 음료 상세보기 [끝] ================= -->

<!-- 장바구니 버튼 클릭 함수 -->
<script type="text/javascript">
$(function(){
	// 페이지 열리자마자 처음 합계 가격 표시
    let menuPrice = parseInt($("#menuPrice").val());
    updateDisplayPrice(menuPrice);
	
	// 페이지 열리자마자 히든으로 가져온 메뉴사이즈 가져오기
	// 밸류가 S면 스몰 보여주기 (현재 영양정보 display:none으로 가려놨으니 보이게 해주는 부분)
	// 페이지 로드 시 초기화
	if(true){
		$("#menuInfoSmall").show();
		$("#smallInfo").show();
	} else {
		$("#menuInfoLarge").show();
		$("#largeInfo").show();
	}
	
	// 장바구니 담기
	$("#addCart").on("click",function(){
		let menuNo = $("#menuNo").val();
		let cartCnt = $("#cartCnt").val();
		let menuIceYn = $("input[name='menuIceYn']:checked").val();
		let menuSize = $("input[name='menuSize']:checked").val();
		console.log("얼음유무 : ", menuIceYn); // 0 : HOT / 1 : ICE
		console.log("사이즈 : ", menuSize);   // S : Small / L : Large
		
		let data = {
			"menuNo" : menuNo,
			"cartCnt" : cartCnt,
			"memNo" : "${memNo}",
			"menuIceYn" : menuIceYn,
			"menuSize" : menuSize
		};
		console.log("data : ", data);
		
		$.ajax({
			url : "/mem/cartInsert",
			contentType:"application/json;charset=utf-8",
			data : JSON.stringify(data), // 이 data를 JSON으로 String화 시켜서 컨트롤러의 RequestBody에 보내주는듯
			type : "post",
			dataType: "text", // 그래서 요청 받은 값을 text로 받는다랄까
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(data, textStatus){
				console.log("data : " + data)
				if(data.trim()=='add_success'){// 그래서 컨트롤러에서 작업치고 리턴한 결과를 여기 ajax로 전송함, 이미 존재하는지 성공했는지
		            $('#al-warning-alert').modal('show');
		            shoppingCartAdd(); // 장바구니 아이콘 모달을 위한 함수임 index.jsp 맨밑에 넣었음
		        } else if (data.trim()=='already_existed'){
		            $('#al-warning-alert1').modal('show');
		        } else if (data.trim()=='update_success'){
		            $('#al-warning-alert2').modal('show');
		            shoppingCartAdd();
		        }
				
			},
		});//end ajax
	});
});//end function
</script>

<!-- 위시리스트에 담고 모달 띄우는 이벤트 -->
<script type="text/javascript">
$("#addWish").on("click",function(){
	let memNo = $("#memNo").val();
	let menuNo = $("#menuNo").val();
	
	let data = {
		"memNo" : memNo,
		"menuNo" : menuNo
	}
	console.log("data : ", data);
	
	$.ajax({
		url : "/mem/wishListInsert",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data),
		type : "post",
		dataType : "text", //dataType : 받는타입 String의 경우 특별히 text
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			console.log("result : " + result);
			if(result=="success"){
				$("#addWish").toggleClass("btn-danger bg-danger-subtle"); //인설트 성공하면 위시리스트 색깔 바꿈
			    $("i", "#addWish").toggleClass("text-outline-dark");	  //인설트 성공하면 위시리스트 색깔 바꿈
		    	$('#al-danger-alert').modal('show');
			}else{
		    	$('#al-danger-alert2').modal('show');
			}
		},
	});
});
</script>

<!-- 장바구니 마우스+키보드 수량 증감 / small/large 사이즈 변경 시 가격 변동 반영-->
<script type="text/javascript">
	let originMenuPrice = parseInt($("#menuPrice").val());
	let cartCnt = parseInt($("#cartCnt").val());
	//수량 증감 함수
	function fnCartAdd(i){
	let menuPrice = parseInt($("#menuPrice").val());
		
		if(i > 0){
			$("#cartCnt").val(cartCnt+1);
			cartCnt = cartCnt+1;
			menuPrice = (cartCnt*menuPrice)
		} else {
			if(cartCnt > 1){
				$("#cartCnt").val(cartCnt-1);
				cartCnt = cartCnt-1;
				menuPrice = (cartCnt*menuPrice)
			}
		}
		console.log("cartCnt : ", cartCnt);
		console.log("menuPrice : ", menuPrice);
		
		//총 합계 호출(마우스 클릭 가격)
		updateDisplayPrice(menuPrice); 
	
	}
	
	// ■ keyboard 입력 이벤트를 통한 장바구니 수량 증감 함수
	function fnInputQty(obj){ //this로 지정한 obj를 받아옴
		let menuPrice = parseInt($("#menuPrice").val());
		
		if (menuSize == "L"){
			menuPrice += 500; //메뉴 사이즈에 따른 변경
		}
		
		let quantity = parseInt($(obj).val()); // 키보드로 입력한 수량을 정수로 변환
		
		if (!isNaN(quantity)){ // 숫자가 들어왔을때만 계산
			let totalPrice = menuPrice * quantity;
			updateDisplayPrice(totalPrice); //총 합계 호출(키보드 입력 가격)
            $("#cartCnt").val(quantity); // 키보드랑 마우스이벤트 cartCnt 업데이트 서로 연결하기
			cartCnt = quantity; // 전역변수 업데이트(안하면 사이즈 선택 시 NaN뜸)
		}
	}
	
	//사이즈 변경 함수
	function fnSize(i) {
		let small = $("#menuSize1").text();
		let Large = $("#menuSize2").text();
		let menuPrice = originMenuPrice;

		if (i > 0) {
			console.log("Large : ", Large);
			menuPrice = (originMenuPrice + 500);
			console.log("menuPrice : ", menuPrice);

			// 제품영양정보 Large 클릭시 표시
			$("#menuInfoSmall").hide();
			$("#menuInfoLarge").show();

			// 제품영양정보 세부내역 표시
			$("#smallInfo").hide();
			$("#largeInfo").show();

			//라지 가격 업데이트 호출
			updateDisplayPriceLarge(menuPrice);
		} else {
			console.log("small : ", small);
			console.log("originMenuPrice : ", originMenuPrice);

			// 제품영양정보 small 클릭시 표시
			$("#menuInfoLarge").hide();
			$("#menuInfoSmall").show();
			// 제품영양정보 세부내역 표시
			$("#largeInfo").hide();
			$("#smallInfo").show();

			//스몰 가격 업데이트 호출
			updateDisplayPriceSmall(originMenuPrice);
		}
		// 나중을 위해 업데이트된 menuPrice 저장
		$("#menuPrice").val(menuPrice);
	}

	//총 합계 업데이트
	function updateDisplayPrice(menuPrice){
	    $(".menuPrices").text("합계 : " + menuPrice.toLocaleString() + "원");
	};
	
	//라지 가격 업데이트 함수
	function updateDisplayPriceLarge(menuPrice) {
		$(".menuPrice").text("가격 : " + menuPrice.toLocaleString() + "원");
		menuPrice = (menuPrice * cartCnt);
		$(".menuPrices").text("합계 : " + menuPrice.toLocaleString() + "원");
	}

	//스몰 가격 업데이트 함수
	function updateDisplayPriceSmall(originMenuPrice) {
		$(".menuPrice").text("가격 : " + originMenuPrice.toLocaleString() + "원");
		originMenuPrice = (originMenuPrice * cartCnt);
		$(".menuPrices").text("합계 : " + originMenuPrice.toLocaleString() + "원");
	}
</script>

<!-- 얼음 유무 클릭 시 메뉴명 변경 함수 -->
<script type="text/javascript">
	const originMenuNm = $(".menu_name").text();
	function fnIceYn(i){
		let menuNm = $(".menu_name").text();
		
		if(i > 0){
			updateDisplayNameIce(menuNm); // 1 들어오면 아이스 이름 호출
		} else {
			updateDisplayNameHot(); // 0 들어오면 기본 이름으로 다시 호출
		}
	}
	
	// 아이스 이름 호출
	function updateDisplayNameIce(menuNm){
		if(menuNm === originMenuNm){
			$("#updateDisplayName").text("아이스 " + menuNm);
		}
		console.log(" menuNm : ", menuNm);
	}
	
	// 기본 이름 호출
	function updateDisplayNameHot(){
		$("#updateDisplayName").text(originMenuNm);
		console.log("originMenuNm : ", originMenuNm);
	}
	
	// 메뉴에 따라서 HOT/ICE 버튼 또는 ICE ONLY를 표시
	$(document).ready(function() {
		if (isIceOnlyMenu()) {
	        $("#hotAndIce").hide();
	        $("#iceOnlyButton").val("1");
	        $("#iceOnlyButton").show();
	    } else {
	        $("#hotAndIce").show();
	        $("#iceOnlyButton").hide();
	    }
	});

	// 메뉴 카테고리에 따라 아이스만 판매되는지 여부를 확인하는 함수
    function isIceOnlyMenu() {
        return $("#iceOnlyButton").val() === "1";
    }
</script>
<script src="/resources/js/memMain2.js"></script>
<!-- 여기   theme의 // increment & decrement 부분 수량이 0까지 내려가서 1로 수정했음 -->
<!-- <script src="/resources/bootstrap/src/assets/js/theme.js"></script> -->
</html>