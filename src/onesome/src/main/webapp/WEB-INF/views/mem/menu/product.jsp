<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/memMenu.css">

<!--  ================= Menu->음료 [시작] ================= -->
<section id="searchCart">
		<div class="container breadcrumby" style="margin-left:-5px;">
        	<nav class="breadcrumb" aria-label="breadcrumb">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
						<li class="breadcrumb-item"><a href="/mem/allMenu"><b>메뉴</b></b></a></li>
						<li class="breadcrumb-item active" aria-current="page"
							style="color: #d50037"><b>상품</b></li>
					</ol>
				</nav>
			</nav>
        </div>
		<div>
		<br>
		<h2 class="sub-tit-name">상품</h2>
	    <br>
    </div>
    <div class="d-flex justify-content-end align-items-center mb-9">
		<form class="position-relative">
	    	<input type="text" class="form-control search-chat py-2 ps-5" id="keyword" placeholder="단어를 입력해주세요"> 
			<i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
		</form>
	</div>
	<div class="menuContainer">
		<c:forEach var="menu" items="${menuList}">
			<div class="menuItem">
				<a href="<c:out value='/mem/productDetail?menuNo=${menu.menuNo}'/>">
				<img class="menu-img" src="<c:out value='/resources/upload/menu/${menu.streFileNm}'/>" /></a>
				<p class="menu-name" style="text-align: center;"><c:out value="${menu.menuNm}"/> </p>
				<p class="menu-detail"><c:out value="${menu.menuDescription}"/></p>
			</div>
		</c:forEach>
	</div>
</section>
<!--  ================= Menu->음료 [끝] ================= -->

<!-- 검색 기능 구현 -->
<script type="text/javascript">
$(document).on('keyup', "#keyword", function() { //keyup은 키를 눌렀다 떼는 순간 이벤트가 발생되는 기능, 뭔가 잘 안먹혀서 keyup, keyword 둘다 넣음
	var keywordInput = $(this).val(); // 내가 입력한 요소(this)의 값을 읽어옴, 만약 영어도 섞여있다면 .toLowerCase()를 붙여서 입력한 검색어를 소문자로 변환시키면 됨
    var menuItems = $(".menuItem"); // menuItem클래스 선택
		
	menuItems.each(function(){
   		var menuItemText = $(this).find(".menu-name").text(); // 메뉴아이템 클래스 내에 있는 매뉴네임 클래스(메뉴명)의 글자를 찾음
   		
   		if (menuItemText.indexOf(keywordInput)!== -1){ // 텍스트에 검색어가 포함되 어있으면 보이고 아니면 감춤
   			$(this).show();
   		} else {
   			$(this).hide();
  			}
   	});
});
</script>