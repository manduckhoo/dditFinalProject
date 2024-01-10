<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Purple_Theme" data-layout="vertical"
      data-boxed-layout="full" data-card="shadow">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>Onesome Place</title>
    <link rel="shortcut icon" type="image/png"
          href="/resources/bootstrap/src/assets/images/logos/logo2.png">
    <link rel="stylesheet" href="/resources/bootstrap/src/assets/css/styles.css">
    <link rel="stylesheet" href="/resources/css/adminAside.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="/resources/bootstrap/src/assets/libs/sweetalert2/dist/sweetalert2.min.css">

</head>



<script type="text/javascript" src="/resources/grid/jquery.js"></script>
<script type="text/javascript" src="/resources/grid/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>

<body data-slidebartype="full" id="page-top" class="sidebar-mini sidebar-closed sidebar-collapse">
<div id="main-wrapper" style="background-color: #EEEEEE;" class="show-sidebar">
    <!--  Body Wrapper -->
    <%--<div class="page-wrapper" data-layout="vertical"
         data-navbarbg="skin6" data-sidebartype="full"
         data-sidebar-position="fixed" data-header-position="fixed">--%>



    <!-- aside 타일즈 추가 -->
    <tiles:insertAttribute name="aside"/>

    <!--  Main wrapper -->
    <div class="page-wrapper" style="margin-left: 270px;">
        <!-- header 타일즈 추가 -->
        <tiles:insertAttribute name="header"/>
        <div class="body-wrapper">
            <div class="container-fluid mw-100">
                <!--  Row 1 -->
                <!-- body 타일즈 추가 -->
                <tiles:insertAttribute name="body"/>
            </div>

        </div>

    </div>

</div>
<script src="/resources/bootstrap/src/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="/resources/bootstrap/src/assets/libs/owl.carousel/dist/owl.carousel.min.js"></script>
<script src="/resources/bootstrap/src/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/bootstrap/src/assets/js/sidebarmenu.js"></script>
<!-- <script src="/resources/bootstrap/src/assets/libs/apexcharts/dist/apexcharts.min.js"></script> -->
<script src="/resources/bootstrap/src/assets/libs/simplebar/dist/simplebar.min.js"></script>
<!-- <script src="/resources/bootstrap/src/assets/js/dashboards/dashboard.js"></script> -->

<!--추가 -->
<script src="/resources/bootstrap/src/assets/js/theme.js"></script>
<script src="/resources/bootstrap/src/assets/libs/fullcalendar/index.global.min.js"></script>
<script src="/resources/bootstrap/src/assets/js/apps/jquery.PrintArea.js"></script>

<script type="text/javascript" src="/resources/bootstrap/src/assets/libs/sweetalert2/dist/sweetalert2.all.min.js"></script>

</body>



</html>