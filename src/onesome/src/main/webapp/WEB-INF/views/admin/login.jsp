<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%--<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme">--%>

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/resources/bootstrap/src/assets/css/styles.css">

    <title>OnesomePlace</title>

    <link rel="shortcut icon" type="image/png"
          href="/resources/bootstrap/src/assets/images/logos/logo2.png">
</head>


<style>
    .login-bg{
        background: url("/resources/images/admin/admin_login_bg.jpg") no-repeat;
        background-size: cover;
    }
    #login-logo{
        width: 70%;
    }
    #login-btn{
        background-color: #2c1811;
        color: white;
        font-size: 13pt;
        font-weight: bold;
    }
</style>

<div id="main-wrapper">
    <div class="position-relative overflow-hidden radial-gradient min-vh-100 w-100">
        <div class="position-relative z-index-5">
            <div class="row">
                <div class="col-xl-7 col-xxl-8 login-bg"></div>
                <div class="col-xl-5 col-xxl-4">
                    <div class="authentication-login min-vh-100 bg-body row justify-content-center align-items-center p-4">
                            <img id="login-logo" src="/resources/images/admin/logo_black(B).svg" alt="로고"/>
                        <div class="col-sm-8 col-md-6 col-xl-9">
                            <button type="button" id="admin-login-btn" style="border: 0 none">어드민 로그인</button>
                            <button type="button" id="frcs-login-btn" style="border: 0 none">점주 로그인</button>
                            <hr>
                            <form action="/admin/login" method="post" id="login-frm">
                                <div class="mb-3">
                                    <label for="username" class="form-label">이메일</label>
                                    <input type="email" class="form-control" name="username" id="username">
                                </div>
                                <div class="mb-4">
                                    <label for="password" class="form-label">비밀번호</label>
                                    <input type="password" class="form-control" name="password" id="password">
                                </div>
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <div class="form-check">
                                        <input class="form-check-input primary" type="checkbox" value=""
                                               id="flexCheckChecked">
                                        <label class="form-check-label text-dark" for="flexCheckChecked">
                                            이메일 저장
                                        </label>
                                    </div>
                                    <a class="text-primary fw-medium"
                                       href="../main/authentication-forgot-password.html">비밀번호 찾기</a>
                                </div>
                                <button class="btn w-100 py-8 mb-4" id="login-btn">로그인</button>
                                <sec:csrfInput/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="dark-transparent sidebartoggler"></div>

<script src="/resources/js/jquery.min.js"></script>
<script>
    $("#admin-login-btn").on("click", function (){
        $("#username").val("admin@admin.com");
        $("#password").val("aaa000111");
        $("#login-frm").submit();
    });

    $("#frcs-login-btn").on("click", function (){
        $("#username").val("glory2@naver.com");
        $("#password").val("aaa000111");
        $("#login-frm").submit();
    });
</script>