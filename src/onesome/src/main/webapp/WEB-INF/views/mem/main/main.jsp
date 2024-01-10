<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/memMain2.css">
<meta charset="UTF-8">

	<!--  ================= Main Page [시작] ================= -->
	<section class="mainSection">
		<h1 id="mainText">PICK YOUR FAVORITE</h1>
	</section>
	<section class="secondText">
		<h1 class="secondText1">MENU STORY</h1>
		<h3 class="secondText2">전문가의 섬세함으로 완성한 최상의 커피</h3>
		<h4 class="secondText3">COFFEE STORY</h4>
		<img class="mugCup" src="https://www.twosome.co.kr/resources/images/main/menu_coffee1.jpg">
		<img class="mugCup2" src="https://www.twosome.co.kr/resources/images/main/menu_coffee2.jpg">
		<img class="mugCup3" src="https://www.twosome.co.kr/resources/images/main/menu_coffee3.jpg">
		<img class="mugCup4" src="https://www.twosome.co.kr/resources/images/main/menu_coffee4.jpg">
	</section>
	<section class="thirdText">
		<h1 class="thirdText1">에이리스트</h1>
		<h3 class="thirdText2">ONESOME IN YOUR MUG, A LIST</h3>
		<h4 class="thirdText3">언제 어디서나 여유롭게 즐기는 에이리스트</h4>
		<h5 class="thirdText4">
			좋은 커피를 마셔야 비로소 하루가 시작되는 느낌이라면<br> 하루에도 몇 번씩 그윽한 커피 향이 생각난다면<br>
			마음속 우선순위에 언제나 커피가 있는 당신이라면<br> 잊지 말고 챙겨야 할 단 하나의 리스트, 원썸플레이스
			에이리스트.</h5>
	</section>

<!-- 맨 위로가기(Top) -->
<a style="position:fixed; bottom:30px; right:30px;" href="#" title=Top>
<img src=/resources/image/스크롤사진.png border="0" style="width:60px; height:60px; opacity:0.7;"/>
</a>
<!-- 맨 위로가기(Top) 코드 끝-->

<!--  ================= Main Page [끝] ================= -->

<script>
	// 메인페이지 글자 애니메이션
	document.addEventListener("DOMContentLoaded", function() {
		let mainText = document.querySelector("h1");

		window.addEventListener("scroll", function() {
			let value = window.scrollY;

			if (value > 300) {
				mainText.style.animation = "disappear 1s ease-out forwards";
			} else {
				mainText.style.animation = "appear 1s ease-out";
			}
		});
	});
</script>
</html>