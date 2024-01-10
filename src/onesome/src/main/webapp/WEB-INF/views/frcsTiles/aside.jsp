<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.ownerVO" var="franchiseOwnerVO"/>
</sec:authorize>

<!-- Sidebar Start -->
<aside class="left-sidebar">
	<!-- Sidebar scroll-->
	<div>
		<div
			class="brand-logo d-flex align-items-center justify-content-between"><a href="/frcs/main">
			<img src="/resources/bootstrap/src/assets/images/logos/logo1.png" width="220" alt="">
			</a>
			<div
				class="close-btn d-xl-none d-block sidebartoggler cursor-pointer"
				id="sidebarCollapse">
			</div>
		</div>
		<!-- Sidebar navigation-->
		<nav class="sidebar-nav scroll-sidebar" data-simplebar="init">
			<div class="simplebar-wrapper selected" style="margin: 0px -24px;">
				<div class="simplebar-height-auto-observer-wrapper">
					<div class="simplebar-height-auto-observer"></div>
				</div>
				<div class="simplebar-mask selected">
					<div class="simplebar-offset selected"
						style="right: 0px; bottom: 0px;">
						<div class="simplebar-content-wrapper selected" tabindex="0"
							role="region" aria-label="scrollable content"
							style="height: 100%; overflow: hidden scroll;">
							<div class="simplebar-content selected"
								style="padding: 0px 24px;">
								<br /> <br />
								<ul id="sidebarnav">
									<li class="sidebar-item"><a class="sidebar-link" href="/frcs/main"
										aria-expanded="false"> <span> <i
												class="ti ti-layout-dashboard"></i>
										</span> <span class="hide-menu">HOME(가맹점)</span>
									</a></li>
									
									<!--////////////////// 매장관리 시작 //////////////////-->
									<li class="nav-small-cap">
                                        <span class="main-menu">Store</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">매장 관리</span>
                                        </a>
                                        <ul aria-expanded="false" class="collapse first-level">
                                            <li class="sidebar-item">
                                                <a href="/frcs/publicdues/main" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">공과금</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/frcs/royalty/main" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle" style="width: 16px; height: 16px;"></i>
                                                    </div>
                                                    <span class="hide-menu">본사 청구액</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/frcs/sanitation/list" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle" style="width: 16px; height: 16px;"></i>
                                                    </div>
                                                    <span class="hide-menu">매장 위생 관리</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
									<!--////////////////// 매장관리 끝 //////////////////-->
									
									<!--////////////////// 재고관리 시작 //////////////////-->
									<li class="nav-small-cap">
                                        <span class="main-menu">Inventory</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link" href="/frcs/inventory/list"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">재고 관리</span>
                                        </a>
                                    </li>
									<!--////////////////// 재고관리 끝 //////////////////-->
									
									<!--////////////////// 발주관리 시작 //////////////////-->
									<li class="nav-small-cap">
                                        <span class="main-menu">Order</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link" href="/frcs/order/list"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">발주 관리</span>
                                        </a>
                                    </li>
									<!--////////////////// 발주관리 끝 //////////////////-->
									
									<!--////////////////// 조직관리 시작 //////////////////-->
									<li class="nav-small-cap">
                                        <span class="main-menu">Group</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">조직 관리</span>
                                        </a>
                                        <ul aria-expanded="false" class="collapse first-level">
                                            <li class="sidebar-item">
                                                <a href="/frcs/emp/list<%-- ?frcsNo=${franchiseOwnerVO.franchiseVOList[1].frcsNo} --%>" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">직원 관리</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/frcs/emp/frcsCalendar" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">근태 관리</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
									<!--////////////////// 조직관리 끝 //////////////////-->
									
									<!--////////////////// 가맹점 정보 관리 시작 //////////////////-->
									<li class="nav-small-cap">
                                        <span class="main-menu">Information</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">가맹점 정보 관리</span>
                                        </a>
                                        <ul aria-expanded="false" class="collapse first-level">
                                            <li class="sidebar-item">
                                                <a href="/frcs/menu/list" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">메뉴 관리</span>
                                                </a>
                                            </li>
<!--                                             <li class="sidebar-item"> -->
<!--                                                 <a href="#" class="sidebar-link"> -->
<!--                                                     <div class="  round-16 "> -->
<!--                                                         <i class="ti ti-circle"></i> -->
<!--                                                     </div> -->
<!--                                                     <span class="hide-menu">영업일 관리</span> -->
<!--                                                 </a> -->
<!--                                             </li> -->
                                            <li class="sidebar-item">
                                                <a href="/frcs/info/frcsInfo?frcsNo=${franchiseOwnerVO.franchiseVOList[0].frcsNo}" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">가맹점 정보 조회</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
									<!--////////////////// 가맹점 정보 관리 끝 //////////////////-->

									<!--////////////////// 매입/매출 분석 시작 //////////////////-->
									<li class="nav-small-cap">
                                        <span class="main-menu">Sales</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">매입/매출 분석</span>
                                        </a>
                                        <ul aria-expanded="false" class="collapse first-level">
                                            <li class="sidebar-item">
                                                <a href="/frcs/salespurchase/dayss" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">일일 매출 분석</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/frcs/salespurchase/grossProfit" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">매출 총이익 분석</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/frcs/salespurchase/operatingProfit" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">영업 이익 분석</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/frcs/salespurchase/purchaseAnalysis" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">매입 분석</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
									<!--////////////////// 매입/매출 분석 끝 //////////////////-->
									
									<!--////////////////// 공문 조회 시작 //////////////////-->
									<li class="nav-small-cap">
                                        <span class="main-menu">Notice</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">공문 조회</span>
                                        </a>
                                        <ul aria-expanded="false" class="collapse first-level">
                                            <li class="sidebar-item">
                                                <a href="/frcs/offDoc/list" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">공문 수신함</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
									<!--////////////////// 공문 조회 끝 //////////////////-->
									
									<!--////////////////// 게시판 시작 //////////////////-->
									<li class="nav-small-cap">
                                        <span class="main-menu">Board</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">게시판</span>
                                        </a>
                                        <ul aria-expanded="false" class="collapse first-level">
<!--                                             <li class="sidebar-item"> -->
<!--                                                 <a href="#" class="sidebar-link"> -->
<!--                                                     <div class="  round-16 "> -->
<!--                                                         <i class="ti ti-circle"></i> -->
<!--                                                     </div> -->
<!--                                                     <span class="hide-menu">공지사항</span> -->
<!--                                                 </a> -->
<!--                                             </li> -->
                                            <li class="sidebar-item">
                                                <a href="/frcs/freeboard/list" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">자유게시판</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
									<!--////////////////// 게시판 끝 //////////////////-->
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="simplebar-placeholder"
					style="width: auto; height: 888px;"></div>
			</div>
			
			<!-- 간격조정? -->
<!-- 			<div class="simplebar-track simplebar-horizontal" -->
<!--                  style="visibility: hidden;"> -->
<!--                 <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div> -->
<!--             </div> -->
<!--             <div class="simplebar-track simplebar-vertical" -->
<!--                  style="visibility: visible;"> -->
<!--                 <div class="simplebar-scrollbar" -->
<!--                      style="height: 514px; transform: translate3d(0px, 0px, 0px); display: block;"></div> -->
<!--             </div> -->
			<!-- 간격조정? -->
			
		</nav>
		<!-- End Sidebar navigation -->
	</div>
	<!-- End Sidebar scroll-->
</aside>
<!--  Sidebar End -->
