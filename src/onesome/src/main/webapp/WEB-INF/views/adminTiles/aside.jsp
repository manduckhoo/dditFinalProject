<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Sidebar Start -->
<aside class="left-sidebar with-vertical">
    <!-- Sidebar scroll-->
    <div>
        <%-- 브랜드 로고 --%>
        <div
                class="brand-logo">
            <a href="/admin/main" class="logo-img"> <img
                    src="/resources/bootstrap/src/assets/images/logos/logo1.png"
                    width="220" alt="brand-logo">
            </a>
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

                                <ul id="sidebarnav" style="height: auto; padding-bottom: 50px;">
                                    <li class="nav-small-cap">
                                        <span class="main-menu">Dashboard</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link active" href="/admin/main" aria-expanded="false">
                                            <span> <i class="ti ti-layout-dashboard"></i> </span>
                                            <span class="hide-menu">HOME</span>
                                        </a>
                                    </li>

                                    <%-----------------SAMPLE------------------%>
                                    <%--<li class="nav-small-cap">
                                        <span class="main-menu">Title</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">Bootstrap Table</span>
                                        </a>
                                        <ul aria-expanded="false" class="collapse first-level">
                                            <li class="sidebar-item">
                                                <a href="#" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">Basic Table</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="#" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">Dark Basic Table</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>--%>
                                    <%-----------------SAMPLE------------------%>
									
									<%------- 본사 관리 시작 -------%>
                                    <li class="nav-small-cap">
                                        <%--<i class="ti ti-home"></i>--%>
                                        <span class="main-menu">Main</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">매출 관리</span>
                                        </a>
                                        <ul aria-expanded="false" class="collapse first-level">
                                            <li class="sidebar-item">
                                                <a href="/admin/hqSales/main" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">매출</span>
                                                </a>
                                            </li>
                                               <li class="sidebar-item">
                                                <a href="/admin/hqSales/region" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">지역 관리</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/admin/hqSales/category" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">카테고리 관리</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/admin/hqSales/menu" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">메뉴 관리</span>
                                                </a>
                                            </li>
                                         
                                        </ul>
                                    </li>
                                    <%------- 본사 관리 끝 -------%>
                                    
                                    <%------- 창업상담관리 시작 -------%>
                                    <li class="nav-small-cap">
                                        <%--<i class="ti ti-home"></i>--%>
                                        <span class="main-menu">Partnership</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">창업상담관리</span>
                                        </a>
                                        <ul aria-expanded="false" class="collapse first-level">
                                            <li class="sidebar-item">
                                                <a href="/admin/inqr/waitList" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">상담 대기</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/admin/inqr/list" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle" style="width: 16px; height: 16px;"></i>
                                                    </div>
                                                    <span class="hide-menu">상담 완료</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <%------- 창업상담관리 끝 -------%>
                                    
                                    <%------- 개점 관리 시작 -------%>
                                    <%--<li class="nav-small-cap">
                                        &lt;%&ndash;<i class="ti ti-home"></i>&ndash;%&gt;
                                        <span class="main-menu">New Store</span>
                                    </li>--%>
                                    <li class="nav-small-cap">
                                        <span class="main-menu">Inventory</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link" href="/admin/frcs/openList"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">개점 관리</span>
                                        </a>
                                    </li>
                                    
                                    
                                    <%------- 개점 관리 끝 -------%>

                                    <%------- 매장 관리 시작 -------%>
                                    <li class="nav-small-cap">
                                        <%--<i class="ti ti-home"></i>--%>
                                        <span class="main-menu">Franchisee</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">가맹점 관리</span>
                                        </a>
                                        <ul aria-expanded="false" class="collapse first-level">
                                            <li class="sidebar-item">
                                                <a href="/admin/FranChiseOwner/list" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">점주 관리</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/admin/frcs/list" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">가맹점 조회</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/admin/frcs/salesAnalysis" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">매출 관리</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="#" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">공문 관리</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/admin/royalty/list" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">가맹비 관리</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/admin/sanitation/list" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">위생 관리</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <%------- 매장 관리 끝 -------%>

                                    <%------- 주문/거래 관리 시작 -------%>
                                    <li class="nav-small-cap">
                                        <%--<i class="ti ti-home"></i>--%>
                                        <span class="main-menu">Transaction</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link" href="/admin/frcsOrder"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">가맹점 주문 관리</span>
                                        </a>
                                    </li>
                                    <%------- 주문/거래 관리 끝 -------%>

                                    <%------- 제품/ 물류 관리 시작 -------%>
                                    <li class="nav-small-cap">
                                        <%--<i class="ti ti-home"></i>--%>
                                        <span class="main-menu">Stock / Distribution</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">제품 관리</span>
                                        </a>
                                        <ul aria-expanded="false" class="collapse first-level">
                                            <li class="sidebar-item">
                                                <a href="/admin/product/product" class="sidebar-link">

                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">제품 / 재고 관리</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/admin/hqOrder" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">발주 내역</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/admin/acnt" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">거래처 관리</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <%------- 제품/물류 관리 끝 -------%>

                                    <%------- 조직 관리 시작 -------%>
                                    <li class="nav-small-cap">
                                        <%--<i class="ti ti-home"></i>--%>
                                        <span class="main-menu">organization</span>
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
                                                <a href="/admin/hqemp/list" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">직원 관리</span>
                                                </a>
                                            </li>
<!--                                             <li class="sidebar-item"> -->
<!--                                                 <a href="/admin/hqemp/calendarList" class="sidebar-link"> -->
<!--                                                     <div class="  round-16 "> -->
<!--                                                         <i class="ti ti-circle"></i> -->
<!--                                                     </div> -->
<!--                                                     <span class="hide-menu">근태 관리</span> -->
<!--                                                 </a> -->
<!--                                             </li> -->
                                            <li class="sidebar-item">
                                                <a href="/admin/edu/list" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">교육 관리</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <%------- 조직 관리 끝 -------%>

                                    <%------- 메뉴 관리 시작 -------%>
                                    <li class="nav-small-cap">
                                        <%--<i class="ti ti-home"></i>--%>
                                        <span class="main-menu">Menu</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link" href="/admin/menu/list"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">메뉴 관리</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item">
                                    	 <a class="sidebar-link" href="/admin/menu/uploadExcel"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">메뉴 업로드</span>
                                        </a>
                                    </li>
                                    <%------- 메뉴 관리 끝 -------%>

                                    <%------- 공문 관리 시작 -------%>
                                    <li class="nav-small-cap">
                                        <%--<i class="ti ti-home"></i>--%>
                                        <span class="main-menu">Official Letter</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">공문 관리</span>
                                        </a>
                                        <ul aria-expanded="false" class="collapse first-level">
                                            <li class="sidebar-item">
                                                <a href="/admin/offDoc/create" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">공문 작성</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/admin/offDoc/list" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">공문 발신함</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <%------- 공문 관리 끝 -------%>

                                    <%------- 게시판 관리 시작 -------%>
                                    <li class="nav-small-cap">
                                        <%--<i class="ti ti-home"></i>--%>
                                        <span class="main-menu">Board</span>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                           aria-expanded="false">
											<span class="d-flex">
											  <i class="ti ti-layout-sidebar"></i>
											</span>
                                            <span class="hide-menu">게시판 관리</span>
                                        </a>
                                        <ul aria-expanded="false" class="collapse first-level">
                                            <li class="sidebar-item">
                                                <a href="/admin/notice/list" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">공지사항</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/admin/faq" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">FAQ</span>
                                                </a>
                                            </li>
                                            <li class="sidebar-item">
                                                <a href="/admin/inquiry/list" class="sidebar-link">
                                                    <div class="  round-16 ">
                                                        <i class="ti ti-circle"></i>
                                                    </div>
                                                    <span class="hide-menu">1:1 문의</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <%------- 게시판 관리 끝 -------%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="simplebar-placeholder"
                     style="width: auto; height: 888px;"></div>
            </div>
            <div class="simplebar-track simplebar-horizontal"
                 style="visibility: hidden;">
                <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
            </div>
            <div class="simplebar-track simplebar-vertical"
                 style="visibility: visible;">
                <div class="simplebar-scrollbar"
                     style="height: 514px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
            </div>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
<!-- Sidebar End -->
