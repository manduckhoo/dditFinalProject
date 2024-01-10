<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 장바구니 아이콘 추가 -->
<li class="nav-item">
   <a id = "shoppingCartA"
      class="nav-link position-relative nav-icon-hover"
      href="javascript:void(0)"
      data-bs-toggle="offcanvas"
      data-bs-target="#offcanvasRight"
      aria-controls="offcanvasRight">
      <i class="ti ti-basket"></i>
   </a>
</li>

<!-- start notification Dropdown -->
<li class="nav-item dropdown"><a class="nav-link nav-icon-hover"
	href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
	aria-expanded="false"> <i class="ti ti-bell-ringing"></i>
		<div class="notification bg-primary rounded-circle"></div>
</a>
	<div
		class="dropdown-menu content-dd dropdown-menu-end dropdown-menu-animate-up"
		aria-labelledby="drop2" data-bs-popper="static">
		<div
			class="d-flex align-items-center justify-content-between py-3 px-7">
			<h5 class="mb-0 fs-5 fw-semibold">알림</h5>
			<span class="badge text-bg-primary rounded-4 px-3 py-1 lh-sm">5 new</span>
		</div>
		<div class="message-body simplebar-scrollable-y" data-simplebar="init">
			<div class="simplebar-wrapper" style="margin: 0px;">
				<div class="simplebar-height-auto-observer-wrapper">
					<div class="simplebar-height-auto-observer"></div>
				</div>
				<div class="simplebar-mask">
					<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
						<div class="simplebar-content-wrapper" tabindex="0" role="region"
							aria-label="scrollable content"
							style="height: auto; overflow: hidden scroll;">
							
							<%-- 알림 들어갈 공간 --%>
							<div id="alarmArea" class="simplebar-content" style="padding: 0px;">
								<!-- for문으로 a태그를 돌려야하나?? -->
								
							</div>
							<%-- 알림 들어갈 공간 end--%>
							
						</div>
					</div>
				</div>
				<div class="simplebar-placeholder"
					style="width: 360px; height: 432px;"></div>
			</div>
			<div class="simplebar-track simplebar-horizontal"
				style="visibility: hidden;">
				<div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
			</div>
			<div class="simplebar-track simplebar-vertical"
				style="visibility: visible;">
				<div class="simplebar-scrollbar"
					style="height: 300px; display: block; transform: translate3d(0px, 0px, 0px);"></div>
			</div>
		</div>
		<div class="py-6 px-7 mb-1">
			<button class="btn btn-outline-primary w-100">See All Notifications</button>
		</div>

	</div></li>
<!-- ------------------------------- -->
<!-- end notification Dropdown -->
<!-- ------------------------------- -->

<!-- 로그인 정보에 담긴 memberVO 꺼내오기 -->
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memberVO"/>
</sec:authorize>

<!-- 마이페이지 드롭다운 -->
<li class="nav-item dropdown"><a class="nav-link pe-0"
	href="javascript:void(0)" id="drop1" data-bs-toggle="dropdown"
	aria-expanded="false">
		<div class="d-flex align-items-center">
			<div class="user-profile-img">
		        <span class="rounded-circle" style="width: 33px; height: 33px; display: inline-flex; align-items: center; justify-content: center; background-color: #E32; color: white; font-weight: bold; font-size:small;">MY</span>
			</div>
		</div>
</a>
	<div
		class="dropdown-menu content-dd dropdown-menu-end dropdown-menu-animate-up"
		aria-labelledby="drop1" data-bs-popper="static">
		<div class="profile-dropdown position-relative" data-simplebar="init">
			<div class="simplebar-wrapper" style="margin: 0px;">
				<div class="simplebar-height-auto-observer-wrapper">
					<div class="simplebar-height-auto-observer"></div>
				</div>
				<div class="simplebar-mask">
					<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
						<div class="simplebar-content-wrapper" tabindex="0" role="region"
							aria-label="scrollable content"
							style="height: auto; overflow: hidden;">
							<div class="simplebar-content" style="padding: 0px;">
								<div class="py-3 px-7 pb-0">
									<h5 class="mb-0 fs-5 fw-semibold">마이페이지</h5>
								</div>
								<div class="d-flex align-items-center py-9 mx-7 border-bottom">
									<img src="/resources/image/하트.png"
										class="rounded-circle" width="80" height="80" alt="">
									<div class="ms-3">
										<h5 class="mb-1 fs-3">${memberVO.memNm}</h5>
										<span class="mb-1 d-block">${memberVO.memNick}</span>
										<p class="mb-1 d-flex align-items-center gap-2">${memberVO.memMail}</p>
									</div>
								</div>
								<div class="message-body">
									<!-- 내 정보 -->
									<a href="/mem/mypage"
										class="py-8 px-7 mt-8 d-flex align-items-center"> <span
										class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-6">
											<img src="/resources/bootstrap/src/assets/images/svgs/icon-account.svg" alt=""
											width="24" height="24">
									</span>
										<div class="w-75 d-inline-block v-middle ps-3">
											<h6 class="mb-1 fs-3 fw-semibold lh-base">내 정보</h6>
											<span class="fs-2 d-block text-body-secondary">My Profile</span>
										</div>
									</a>
									<!-- 주문내역 -->
									<a href="/mem/myOrderList"
										class="py-8 px-7 d-flex align-items-center"> <span
										class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-6">
											<img src="/resources/bootstrap/src/assets/images/svgs/icon-cart.svg" alt=""
											width="24" height="24">
									</span>
										<div class="w-75 d-inline-block v-middle ps-3">
											<h6 class="mb-1 fs-3 fw-semibold lh-base">주문내역</h6>
											<span class="fs-2 d-block text-body-secondary">Order Details</span>
										</div>
									</a>
									<!-- 내 문의내역 -->
									<a href="/mem/inquiry/list"
										class="py-8 px-7 d-flex align-items-center"> <span
										class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-6">
											<img src="/resources/bootstrap/src/assets/images/svgs/icon-dd-chat.svg" alt=""
											width="24" height="24">
									</span>
										<div class="w-75 d-inline-block v-middle ps-3">
											<h6 class="mb-1 fs-3 fw-semibold lh-base">내 문의내역</h6>
											<span class="fs-2 d-block text-body-secondary">My Inquiry Details</span>
										</div>
									</a>
									<!-- 위시리스트 -->
									<a href="/mem/wishList"
										class="py-8 px-7 d-flex align-items-center"> <span
										class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-6">
											<img src="/resources/bootstrap/src/assets/images/svgs/icon-star.svg" alt=""
											width="24" height="24">
									</span>
										<div class="w-75 d-inline-block v-middle ps-3">
											<h6 class="mb-1 fs-3 fw-semibold lh-base">위시리스트</h6>
											<span class="fs-2 d-block text-body-secondary">WishList</span>
										</div>
									</a>
								</div>
								<!-- 로그아웃 -->
								<div class="d-grid py-4 px-7 pt-8">
									<form action="/mem/logout" method="post">
										<button type="submit" class="btn btn-outline-dark" style="width:100%;">로그아웃</button>
										<sec:csrfInput />
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="simplebar-placeholder"
					style="width: 370px; height: 500px;"></div>
			</div>
			<div class="simplebar-track simplebar-horizontal"
				style="visibility: hidden;">
				<div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
			</div>
			<div class="simplebar-track simplebar-vertical"
				style="visibility: hidden;">
				<div class="simplebar-scrollbar" style="height: 0px; display: none;"></div>
			</div>
		</div>

	</div></li>