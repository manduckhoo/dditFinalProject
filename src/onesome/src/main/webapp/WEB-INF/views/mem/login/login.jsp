<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/memLogin.css">

<!--  ================= Login Page [시작] ================= -->
<login>
	<div class="wraaper">
		<form action="/mem/login" method="post" id="login-frm">
			<h2>Login</h2>
			<div class="input-box">
				<input type="text" placeholder="username" name="username" required>
				<i class='bx bxs-user' id="usericon"></i>
			</div>
			<div class="input-box">
				<input type="password" placeholder="password" name="password" required>
				<i class='bx bxs-lock-alt' id="passwordicon"></i>
			</div>
			<div class="remember-forgot">
				<label><input type="checkbox">아이디 저장</label>
				<label><button type="button" style="border: 0 none" id="auto-login1">회원 로그인1</button></label>
			</div>
			<button type="submit" class="btn">Login</button>
			<div class="register-link">
				<a href="#">아이디 찾기</a>
				<a href="#">비밀번호 찾기</a>
				<a href="/mem/join">회원가입</a>
			</div>
			<sec:csrfInput/>
		</form>
	</div>
</login>
<!--  ================= Login Page [끝] ================= -->

<script>
	$("#auto-login1").on("click", function () {
		$("input[name=username]").val("asdf1234");
		$("input[name=password]").val("aaa000111");
		$("#login-frm").submit();
	})
</script>

</html>