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
<!--  ================= Menu-> 상품 상세보기 [시작] ================= -->
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
					<li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
					<li class="breadcrumb-item"><a href="/mem/allMenu"><b>메뉴</b></b></a></li>
					<li class="breadcrumb-item"><a href="/mem/product"><b>상품</b></b></a></li>
					<li class="breadcrumb-item active" aria-current="page"
						style="color: #d50037"><b>상품 상세</b></li>
				</ol>
			</nav>
		</nav>
    </div>
    <br>
	<h2 class="sub-tit-name">상품</h2>
    <br>
	<div class="menuContainer-detail">
		<div class="menuItem-detail-img">
			<img class="menu-img-big" src="<c:out value='/resources/upload/menu/${memberMenuVO.streFileNm}'/>" />
		</div>
		<div class="menuItem-detail">
			<div>
			<p class="menu_name" id="updateDisplayName"><c:out value="${memberMenuVO.menuNm}"/> </p>
			<p class="menu-detail" style="max-height: 152px; height: 152px;"><c:out value="${memberMenuVO.menuDescription}"/></p>
			<input type="hidden" id="menuSize" name="menuSize" value="${memberMenuVO.menuSize}"/>
			
			<div>
				<hr>
				<!-- 수량 증감 부분 [시작] -->
				<div class="d-flex align-items-center gap-9 pb-7 mb-7 border-bottom" style="margin-top: 30px;">
					<h6 class="mb-0 fs-4 fw-semibold" style="width: 50px;">수량 :</h6>
					<div class="input-group input-group-sm rounded">
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
                    <c:set var="totalPrice" value="${menuPrice + cart.cartCnt}" />
		            <!-- 단가 -->
					<h5 style="text-align:end; font-weight:bold; color:gray;" class="menuPrice">가격 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${memberMenuVO.menuPrice}"/>원</h5>
	            </div>
	            	<!-- 총 가격 -->
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
<!--  ================= Menu-> 상품 상세보기 [끝] ================= -->


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

<script type="text/javascript">
$(function(){
	//페이지 열리자마자 처음 합계 가격 표시
	let menuPrice = parseInt($("#menuPrice").val());
	updateDisplayPrice(menuPrice);
})
</script>

<!-- 장바구니 버튼 클릭 + 키보드 입력 함수 -->
<script type="text/javascript">
	// 장바구니 수량 증감
	let originMenuPrice = parseInt($("#menuPrice").val());
	let cartCnt = parseInt($("#cartCnt").val());
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
		
		// 합계 호출
		updateDisplayPrice(menuPrice);
	}
	
	// ■ keyboard 입력 이벤트를 통한 장바구니 수량 증감 함수
	function fnInputQty(obj){ //this로 지정한 obj를 받아옴
		let menuPrice = parseInt($("#menuPrice").val());
		
		let quantity = parseInt($(obj).val()); // 키보드로 입력한 수량을 정수로 변환
		
		if (!isNaN(quantity)){ // 숫자가 들어왔을때만 계산
			let totalPrice = menuPrice * quantity;
			updateDisplayPrice(totalPrice); //총 합계 호출(키보드 입력 가격)
            $("#cartCnt").val(quantity); // 키보드랑 마우스이벤트 cartCnt 업데이트 서로 연결하기
			cartCnt = quantity; // 전역변수 업데이트(안하면 사이즈 선택 시 NaN뜸)
		}
	}
	
	// 합계 업데이트 함수
	function updateDisplayPrice(menuPrice) {
		$(".menuPrices").text("합계 : " + menuPrice.toLocaleString() + "원");
	}

	// 장바구니 담기
	$("#addCart").on("click",function(){
		let menuNo = $("#menuNo").val();
		let cartCnt = $("#cartCnt").val();
		
		let data = {
			"menuNo" : menuNo,
			"cartCnt" : cartCnt,
			"memNo" : "${memNo}"
		};
		console.log("data : ", data);
		
		$.ajax({
			url : "/mem/cartInsert2",
			contentType:"application/json;charset=utf-8",
			data : JSON.stringify(data), // 이 data를 JSON으로 String화 시켜서 컨트롤러의 RequestBody에 보내주는듯
			type : "post",
			dataType: "text", // 그래서 요청 받은 값을 text로 받는다랄까
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(data, textStatus){
				console.log("data : " + data)
				if(data.trim()=='add_success2'){// 그래서 컨트롤러에서 작업치고 리턴한 결과를 여기 ajax로 전송함, 이미 존재하는지 성공했는지
		            $('#al-warning-alert').modal('show');
		            shoppingCartAdd(); // 장바구니 아이콘 모달을 위한 함수임 index.jsp 맨밑에 넣었음
		        } else if (data.trim()=='already_existed2'){
		            $('#al-warning-alert1').modal('show');
		        } else if (data.trim()=='update_success2'){
		            $('#al-warning-alert2').modal('show');
		            shoppingCartAdd();
		        }
			},
		});//end ajax
	});//end function
</script>
<script src="/resources/js/memMain2.js"></script>

</html>