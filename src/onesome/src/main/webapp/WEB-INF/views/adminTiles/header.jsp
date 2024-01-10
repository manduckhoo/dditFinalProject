<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- socket CDN -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>


<header class="topbar">
    <div class="with-vertical">
        <nav class="navbar navbar-expand-lg px-3">
            <div class="collapse navbar-collapse justify-content-end"
                 id="navbarNav">
                <div class="d-flex align-items-center justify-content-between">
                    <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-center">
                    	<!-- 채팅창 아이콘 -->
<!--                     	<li class="nav-item"> -->
<!-- 						    <a href="#" class="nav-link position-relative nav-icon-hover" data-bs-toggle="modal" data-bs-target="#chatModal"> -->
<!-- 						        <i class="ti ti-message-dots"></i> -->
<!-- 						    </a> -->
<!-- 						</li> -->
                    	<!-- 종 아이콘 -->
						<jsp:include page="adminalarmIcon.jsp"></jsp:include>
                        <!-- 스케줄(달력) 아이콘 -->
<!--                         <li class="nav-item"> -->
<!--                             <a href=# -->
<!--                                class="nav-link position-relative nav-icon-hover"> -->
<!--                                 <i class="ti ti-calendar"></i> -->
<!--                             </a> -->
<!--                         </li> -->

                        <%--TODO 어드민 로그인 정보 및 로그아웃 버튼영역 추후 디자인 수정--%>
                        <sec:authentication property="principal.adminVO" var="adminVO"/>
                        <span>${adminVO.adminNm}님 </span>
                        <form action="/admin/logout" method="post"
                              style="display: inline-block; margin: 10px">
                            <button type="submit" class="btn btn-outline-danger btn-sm">로그아웃</button>
                            <sec:csrfInput/>
                        </form>

                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>

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

// 소켓 연결
function onOpen() {
console.log("소켓 연결 (onopen)");
// socket.send("원종찬");
};

// 메시지 수신
function onMessage(evt) {
console.log("onMessage 함수: ", evt.data);

};

// 소켓 종료
function onClose() {
console.log("소켓 종료 (onclose)");
};

// 소켓 에러
function onError() {
console.log("소켓 에러 (onerror)");
};
</script>
