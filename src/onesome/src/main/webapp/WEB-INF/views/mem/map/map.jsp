<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/memMap.css">
<!--  ================= 매장관리 [시작] ================= -->
<div class="container breadcrumb" style="margin-top:70px;">
	<nav class="breadcrumb" aria-label="breadcrumb">
		<nav aria-label="breadcrumb" style="margin-left:-190px;">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
				<li class="breadcrumb-item active" aria-current="page"
					style="color: #d50037"><b>매장</b></li>
			</ol>
		</nav>
	</nav>
</div>
	<br>
	<h2 class="sub-tit-name" style="margin-left:95px; font-weight: bold; font-size:40px; margin-bottom:-50px;">매장 찾기</h2>
	<!-- 지도를 표시할 div -->
	<div class="map_wrap" style="margin-left: 80px;">
		<div id="map"></div>
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<!--                 <p>매장찾기</p> -->
					<form onsubmit="searchPlaces(); return false;">
						<input type="text" value placeholder="매장 이름을 검색해주세요" id="keyword"
							class="search_keyword">
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<div class="store_info">
				<ul id="placesList" class="item_list">
					<li onclick="goto_position('36.32437', '127.4099', '대전 오류점')">
						<div class="item">
							<div class="item_box">
								<div class="item_title">대전 오류점</div>
								<div class="item_address">대전광역시 중구 오류동 175-8</div>
								<div class="item_phone_number">042-535-1900</div>
							</div>
						</div>
					</li>
					<li onclick="goto_position('36.32517', '127.4104', '대전 용두점')">
						<div class="item">
							<div class="item_box">
								<div class="item_title">대전 용두점</div>
								<div class="item_address">대전광역시 중구 용두동 29-9</div>
								<div class="item_phone_number">042-515-7994</div>
							</div>
						</div>
					</li>
					<li onclick="goto_position('36.33481', '127.4083', '대전 목동점')">
						<div class="item">
							<div class="item_box">
								<div class="item_title">대전 목동점</div>
								<div class="item_address">대전광역시 중구 목중로19번길 70</div>
								<div class="item_phone_number">042-253-4040</div>
							</div>
						</div>
					</li>
					<li onclick="goto_position('36.32133', '127.4089', '대전 서대전점')">
						<div class="item">
							<div class="item_box">
								<div class="item_title">대전 서대전점</div>
								<div class="item_address">대전광역시 중구 계백로 1700</div>
								<div class="item_phone_number">042-522-1082</div>
							</div>
						</div>
					</li>
				</ul>
				<div id="pagination">
					<ul>
						<li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--  ================= 매장관리 [끝] ================= -->
	<script src="/resources/js/memMap.js"></script>
</html>