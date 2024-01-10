<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class>
<head>
<meta charset="UTF-8">
<!-- 파비콘  -->
<link rel="shortcut icon" type="image/png" href="/resources/bootstrap/src/assets/images/logos/logo2.png">
<link rel="stylesheet" href="/resources/bootstrap/src/assets/css/styles.css">
<link rel="stylesheet" href="/resources/css/memMain.css">
<link rel="stylesheet" href="/resources/css/memHeader.css">
<link rel="stylesheet" href="/resources/css/memFooter.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- sweetalert2 css 추가 -->
<link rel="stylesheet" href="/resources/bootstrap/src/assets/libs/sweetalert2/dist/sweetalert2.min.css">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Onesome Place</title>
</head>
<script src="/resources/js/jquery.min.js"></script>
<!-- sweetalert2 클래스 추가 -->
<body id="page-top" class="sidebar-mini sidebar-closed sidebar-collapse">
   
   <!--  ================= header.jsp [시작] ================= -->
   <tiles:insertAttribute name="header" />
   <!--  ================= header.jsp [끝] ================= -->


   <!--  ================= body.jsp [시작] ================= -->
   <div style="min-height: 1000px;" >
      <tiles:insertAttribute name="body"/>
   </div>
   <!--  ================= body.jsp [끝] ================= -->


   <!--  ================= footer.jsp [시작] ================= -->
   <tiles:insertAttribute name="footer" />
   <!--  ================= footer.jsp[끝] ================= -->
   
<!-- 장바구니 아이콘 모달을 위한 스크립트 [시작]-->
<script>
      $(function(){
         shoppingCartAdd();
      })

      function shoppingCartAdd(){
         if($.cookie('cartList') != undefined){
            let cartList = JSON.parse($.cookie('cartList'));
            if(cartList != undefined){
               $("#shoppingCartCnt").remove();
               $("#shoppingCartA").append('<span id="shoppingCartCnt" class="popup-badge rounded-pill bg-danger text-white fs-2-1">'+cartList[0].COUNT+'</span>');
               html = "";
               $(".cartli").remove();
               let total = 0
               $.each(cartList, function(i,v){
                  let menuPrice = v.MENU_PRICE*v.CART_CNT;
                  total += v.MENU_PRICE*v.CART_CNT;
                  html +=   '<li class="pb-7 cartli" data-price="'+v.MENU_PRICE+'">';
                  html +=   '   <div class="d-flex align-items-center">';
                  html +=   '      <img src="/resources/upload/menu/'+v.STRE_FILE_NM+'" width="95" height="75" class="rounded-1 me-9 flex-shrink-0" alt="" />';
                  html +=   '      <div>';
                  html +=   '         <h6 class="mb-1">'+v.MENU_NM+'</h6>';
                  html +=   '         <div class="d-flex align-items-center mt-2">';
                  html +=   '            <h6 class="fs-2 fw-semibold mb-0 text-muted">'+menuPrice.toLocaleString()+'원</h6>';
                  html +=   '            <div class="input-group input-group-sm" style="width: 70px; margin-left: 40px;">';
                  html +=   '               <button class="btn border-0 round-20 minus p-0 bg-success-subtle text-success" type="button" id="add1" onclick="fnPriceUpdate(this,0,'+v.MENU_PRICE+')"> - </button>';
                  html +=   '               <input type="text" disabled class="form-control round-20 bg-transparent text-muted fs-2 border-0 text-center qty" placeholder="" aria-label="Example text with button addon" aria-describedby="add1" value="'+v.CART_CNT+'" data-value="'+v.CART_CNT+'"/>';
                  html +=   '               <button class="btn text-success bg-success-subtle p-0 round-20 border-0 add" type="button" id="addo2"  onclick="fnPriceUpdate(this,1,'+v.MENU_PRICE+')">  +  </button>';
                  html +=   '            </div>';
                  html +=   '         </div>';
                  html +=   '      </div>';
                  html +=   '   </div>';
                  html +=   '</li>';
               })
               $("#shoppingCart").append(html);
               $("#sideTotalPrice").html(total.toLocaleString()+'원');
            }
         }
      }

      function fnPriceUpdate(obj,i,p){
         let quantity = i == 1 ? parseInt($(obj).prev('input').val())+1 : parseInt($(obj).next('input').val())-1;
         let price = parseInt(p);
         let totalPrice;
         if(quantity > 0){
            totalPrice = quantity * price;
            $(obj).parent().children('.bg-transparent').data('value',quantity);
         }
         $(obj).parent().prev().text(totalPrice.toLocaleString() + "원");

         updateCartTotal();
      }

      function updateCartTotal(){
         let cartTotal = 0;
         $('.cartli').each(function() {
            let price = parseInt($(this).data('price'));
            let quantity = parseInt($(this).find('.bg-transparent').data('value'));
            cartTotal += price * quantity;
         });
         $('#sideTotalPrice').text(cartTotal.toLocaleString() + "원");
      }
   </script>
<!-- 장바구니 아이콘 모달을 위한 스크립트 [끝] -->


<!-- Import Js Files -->
<script src="/resources/bootstrap/src/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="/resources/bootstrap/src/assets/js/app.min.js"></script>
<script src="/resources/bootstrap/src/assets/js/app.init.js"></script>
<script src="/resources/bootstrap/src/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/bootstrap/src/assets/libs/simplebar/dist/simplebar.min.js"></script>
<script src="/resources/bootstrap/src/assets/js/sidebarmenu.js"></script>
<script src="/resources/bootstrap/src/assets/js/theme.js"></script>

<script src="/resources/bootstrap/src/assets/libs/owl.carousel/dist/owl.carousel.min.js"></script>
<script src="/resources/bootstrap/src/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="/resources/bootstrap/src/assets/js/dashboards/dashboard.js"></script>
<!-- sweetalert2 js 추가 -->
<script type="text/javascript" src="/resources/bootstrap/src/assets/libs/sweetalert2/dist/sweetalert2.all.min.js"></script>
<!-- 장바구니 아이콘 모달을 위한 js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 결제 API위한 js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</body>
</html>