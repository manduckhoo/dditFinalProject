<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/memJoin.css">

<!-- 로그인 정보에 담긴 memberVO 꺼내오기 -->
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memberVO"/>
</sec:authorize>

<!--  ================= 회원가입 환영 [시작] ================= -->
<div id="join-welcome-wrapper" class="text-center">
	<img src="/resources/image/회원가입환영배경제거.jpg">
	<h2>환영합니다!</h2>
	<br>
	<br>
	<p>마이페이지에서 기념일, 주소 등 추가 정보를 입력해주세요.</p>
	<p>추가 정보 미 입력 시 쿠폰, 이벤트 등 제공되는 사항이 제한될 수 있습니다.</p>
	<br>
	<br>
	<a href="/mem/main"><button type="button" class="btn btn-dark btn">시작하기</button></a>
	<br>
	<br>
</div>
<!--  ================= 회원가입 환영 [끝] ================= -->

<script src="/resources/js/member/memJoin.js"></script>
</html>