<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- principal: CustomUser.java -->
<sec:authorize access="isAuthenticated()">
    <!-- 로그인 했으면 이 안에 sec:authentication 코드가 실행된다. -->
    <sec:authentication property="principal.memberVO.memNo" var="memNo" />
</sec:authorize>

<!DOCTYPE html>
<html>
<div class="container-fluid" style="max-width:1500px; margin:0 auto;">
    <div class="container breadcrumb" style="margin-top:70px;">
        <nav class="breadcrumb" aria-label="breadcrumb">
            <nav aria-label="breadcrumb" style="margin-left:67px;">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
                    <li class="breadcrumb-item"><a href="/mem/mypage"><b>마이페이지</b></b></a></li>
                    <li class="breadcrumb-item active" aria-current="page" style="color: #d50037"><b>위시리스트</b></li>
                </ol>
            </nav>
        </nav>
    </div>
    <div class="card-body px-4 py-4" style="margin-left: 119px;">
        <div class="row align-items-center">
            <div class="col-9">
                <h2 class="sub-tit-name" style="font-weight:bold; font-size:40px; margin-bottom:20px;">위시리스트</h2>
            </div>
        </div>
    </div>
    <div class="row" style="place-content:start; margin-left: 130px;">
   		<!-- 카테고리 상세 번호에 따라서 drinkDetail, foodDetail, productDetail로 갈지 분기처리 -->
        <c:forEach var="wish" items="${wishList}">
            <c:choose>
                <c:when test="${wish.ctgryDetailId >= 'ctg0101' && wish.ctgryDetailId <= 'ctg0110'}">
                    <c:set var="detailLink" value="/mem/drinkDetail?menuNo=${wish.menuNo}" />
                </c:when>
                <c:when test="${wish.ctgryDetailId >= 'ctg0201' && wish.ctgryDetailId <= 'ctg0210'}">
                    <c:set var="detailLink" value="/mem/foodDetail?menuNo=${wish.menuNo}" />
                </c:when>
                <c:when test="${wish.ctgryDetailId >= 'ctg0301' && wish.ctgryDetailId <= 'ctg0310'}">
                    <c:set var="detailLink" value="/mem/productDetail?menuNo=${wish.menuNo}" />
                </c:when>
            </c:choose>
            <div class="col-md-6 col-lg-3" style="width: 300px;">
                <div class="card rounded-2 overflow-hidden">
                    <div class="position-relative">
                        <a href="${detailLink}">
                            <img class="menu-img-big" src="/resources/upload/menu/${wish.streFileNm}" style="width:100%; height:100vh; max-height:300px;" />
                        </a>
                        <div class="btn btn-dark rounded-circle p-2 d-flex align-items-center justify-content-center position-absolute bottom-0 end-0 me-3 mb-n3 wishDelete" data-menu="${wish.menuNo}">
                            <i class='bx bx-trash'></i>
                        </div>
                    </div>
                    <div class="card-body p-4" style="text-wrap: nowrap;">
                        <a href="${detailLink}" class="text-muted text-decoration-none">
                            <h5 class="fw-semibold fs-4 mb-2">${wish.menuNm}</h5>
                        </a>
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="d-flex align-items-center gap-2">
                                <h5 class="fw-regular fs-3 mb-0">
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${wish.menuPrice}"/>원
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:if test="${empty wishList}">
            <br>
            <h6 class="mb-6 fs-6" style="text-align:center">
                <b>위시리스트에 담긴 메뉴가 없습니다.</b>
            </h6>
        </c:if>
    </div>
</div>

<!-- 위시리스트 삭제 에이잭스 -->
<script type="text/javascript">
$(".wishDelete").on("click", function(){
	let memNo = $("#memNo").val();
	let menuNo = $(this).data("menu");
	console.log("menuNo",menuNo);
	
	let data = {
		"memNo" : memNo,
		"menuNo" : menuNo
	}
	console.log("data : ", data);
	
	$.ajax({
		url : "/mem/wishListDelete",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data),
		type : "post",
		dataType : "json",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			console.log("result : ", result);
			if(result > 0) {
				$(".wishDelete").remove();
				var Toast = Swal.mixin({
					toast : true,
					position : 'top-end',
					showConfirmButton : false, //true면 ok버튼이 뜸
					timer : 700, //0.7초 동안 표시됨
				    timerProgressBar: true // true하면 타임게이지 나옴
				});
				Toast.fire({
					icon : 'success', //출력할 아이콘 종류(success, warning, error, info, quesition)
					title : '삭제하였습니다.' //출력할 메세지 내용
				});
				setTimeout(function(){
				    location.reload();
				}, 700); //0.7초 이후 자동 새로고침
			}
		}, error : function(err) {
			var Toast = Swal.mixin({
				toast : true,
				position : 'top-end',
				showConfirmButton : false, //true면 ok버튼이 뜸
				timer : 700, //0.7초 떠있다는것 같음
			    timerProgressBar: true // true하면 타임게이지 나옴
			});
			Toast.fire({
				icon : 'error', //출력할 아이콘 종류(success, warning, error, info, quesition)
				title : '에러가 발생하였습니다 .' //출력할 메세지 내용
			});
		}
	});
});

</script>