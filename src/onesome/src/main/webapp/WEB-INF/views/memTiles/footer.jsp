<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
	<!--  ================= 일반회원 footer [시작] ================= -->
	<footer class="onesome-footer">
		<div class="footer-bottom-menu">
			<a href="#">이용약관</a> <a href="#" class="footer-bottom-personal">개인정보처리방침</a>
			<a href="#">위치기반서비스 이용약관</a> <a href="#">이메일 무단수집거부</a> <a href="#">법적고지</a>
			<a href="#">사업자정보확인</a>
		</div>

		<div class="onesome-footer-info">
			<p>대표이사 : 원종찬 | 개인정보보호책임자 : 김형민 | 사업자등록번호 : 405-06-01117</p>
			<p>통신판매업종신고증 : 제 2023-대전중구-405호 | 대표 이메일 : helpglory@onesome.co.kr</p>
		</div>
		<div class="copyright">
			<p>&copy; 2023 Onesome Place. All rights reserved.</p>
		</div>
	</footer>
	<!--  ================= 일반회원 footer [끝] ================= -->

<!-- ================== 장바구니 사이드에 모달 띄우기 [시작] ================== -->
<div
      class="offcanvas offcanvas-end shopping-cart"
      tabindex="-1"
      id="offcanvasRight"
      aria-labelledby="offcanvasRightLabel"
>
   <div class="offcanvas-header py-4">
      <h5 class="offcanvas-title fs-5 fw-semibold" id="offcanvasRightLabel">
         장바구니
      </h5>
   </div>
   <div class="offcanvas-body h-100 px-4 pt-0" data-simplebar>
      <ul class="mb-0" id="shoppingCart">

      </ul>
      <div class="align-bottom">
         <div class="d-flex align-items-center pb-7">
            <span class="text-dark fs-3">Total</span>
            <div class="ms-auto">
               <span class="text-dark fw-semibold fs-3" id="sideTotalPrice"></span>
            </div>
         </div>
         <a href="/mem/cartList" class="btn btn-outline-primary w-100"
         >주문하기</a
         >
      </div>
   </div>
</div>
<!-- ================== 장바구니 사이드에 모달 띄우기 [끝] ================== -->