<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- socket CDN -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<!-- ================= 일반회원 header [시작] ================= -->
<header id="headerNav">
	<div class="logo">
		<a href="/mem/main"><img src="/resources/image/logo_black.png"
			alt="" width="200" height="30"></a>
	</div>
	<nav id="headerNav1">
		<ul>
			<li><a href="/mem/bi">브랜드</a></li>
			<li><a href="/mem/allMenu">메뉴</a>
				<ul class="submenu">
					<li><a href="/mem/drink" class="textCenter">음료</a></li>
					<li><a href="/mem/food" class="textCenter">푸드</a></li>
					<li><a href="/mem/product" class="textCenter">상품</a></li>
				</ul></li>
			<li><a href="/mem/cartList">주문</a></li>
			<li><a href="/mem/map">매장</a></li>
			<li><a href="/mem/faq">고객센터</a>
				<ul class="submenu">
					<li><a href="/mem/faq" class="textCenter">FAQ</a></li>
					<li><a href="/mem/inquiry/write" class="textCenter">1:1문의</a></li>
					<li><a href="/mem/notice/memList" class="textCenter">공지사항</a></li>
				</ul></li>
			<li><a href="/mem/inqr/startInfo" id="margin-inquirer">창업문의</a>
				<ul class="submenu">
					<li><a href="/mem/inqr/startInfo" class="textCenter">개설 안내</a></li>
					<li><a href="/mem/inqr/startExplan" class="textCenter">창업
							설명회</a></li>
					<li><a href="/mem/inqr/storeStartupCounselApply"
						class="textCenter">창업 신청</a></li>
					<li><a href="/mem/inqr/storeFinanceProduct" class="textCenter">금융상품</a></li>
				</ul></li>

			<sec:authorize access="isAnonymous()">
				<button type="button" id="loginBtn"
					class="btn btn-outline-dark btn-lg"
					onclick="window.location.href='/mem/login'">로그인</button>
				<button type="button" id="joinBtn" class="btn btn-dark btn-lg"
					onclick="window.location.href='/mem/joinTerms'">회원가입</button>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.memberVO" var="memberVO" />
				<!-- 일반회원 아이콘(장바구니, 알람, 내정보) -->
				<jsp:include page="memalarmIcon.jsp" />
			</sec:authorize>
		</ul>
	</nav>
	<div id="magStack"></div>
</header>
<!-- ================= 일반회원 header [끝] ================= -->

<!-- websocket -->
<script type="text/javascript">

var socket = null; // 소켓 전역변수 선언

$(document).ready(function() {
<sec:authorize access="isAuthenticated()">
connectWS();
</sec:authorize>
});

// 웹소켓 연결 함수
function connectWS() {
	var ws = new SockJS("/echo"); // 소켓 객체 생성
	socket = ws;
	
	console.log("웹소켓: ", socket);
	
	ws.onopen = onOpen;
	ws.onmessage = onMessage;
	ws.onclose = onClose;
	ws.onerror = onError;
}

// 웹소켓에 연결 되었을 때 호출될 함수
function onOpen() {
	console.log("소켓 연결 (onopen)");
	// socket.send("원종찬");
};

// 메시지 수신
function onMessage(evt) {
	console.log("onMessage 함수: ", evt.data);
	
// 	let alarmArea = $("#alarmArea");
// 	console.log("alarmArea: ", alarmArea);
	
	let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
    toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
    toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
    toast += "<span aria-hidden='true'>&times;</span></button>";
    toast += "</div> <div class='toast-body'>" + data + "</div></div>";
    $("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
    $(".toast").toast({"animation": true, "autohide": false});
    $('.toast').toast('show');
	
// 	let toast = 
// 	`
// 		<a href="javascript:void(0)"
// 			class="py-6 px-7 d-flex align-items-center dropdown-item">
// 			<span class="me-3"> <img
// 				src="./assets/images/profile/user-1.jpg" alt="user"
// 				class="rounded-circle" width="48" height="48">
// 		</span>
// 			<div class="w-75 d-inline-block v-middle">
		
// 				<span class="fs-2 d-block text-body-secondary">Congratulate him</span>
// 			</div>
// 		</a>
// 	`;

};

function onClose() {
	console.log("소켓 종료 (onclose)");
};

function onError() {
	console.log("소켓 에러 (onerror)");
};
</script>