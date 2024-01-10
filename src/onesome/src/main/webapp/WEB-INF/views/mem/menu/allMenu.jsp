<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  ================= Menu->음료 [시작] ================= -->
    
    <div class="container-fluid">
		<div class="container breadcrumby" style="margin-left:-10px; margin-top:70px;">
        	<nav class="breadcrumb" aria-label="breadcrumb">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
						<li class="breadcrumb-item"><a href="/mem/allMenu"><b>메뉴</b></b></a></li>
						<li class="breadcrumb-item active" aria-current="page"
							style="color: #d50037"><b>전체 메뉴</b></li>
					</ol>
				</nav>
			</nav>
        </div>
		<div>
		<br>
		<h2 class="sub-tit-name" style="font-weight: bold; font-size:40px;">전체 메뉴</h2>
	    <br>
    </div>
          <hr>
          <br>
          <div class="row">
            <!-- ================= 음료 [시작] ================= -->
            <div class="col-sm-6 col-lg-4">
              <div class="card">
                <div class="card-body pt-6">
                  <span class="fw-bolder text-uppercase fs-2 d-block mb-7">Drink</span>
                  <div class="my-4">
                    <img src="/resources/image/메뉴음료.jpg" alt="" class="img-fluid" style="width:320px; height:320px;">
                  </div>
                  <div class="d-flex mb-2">
                 	 <h2 class="fw-bolder fs-8 mb-2">음료</h2>
                  </div>
                  <ul class="list-unstyled mb-7">
                    <li class="d-flex align-items-center gap-2 py-2">
                      <span class="text-dark" style="font-size:20px;">바리스타의 숙련된 기술로 취향까지 담은 음료를 경험해보세요.</span>
                    </li>
                    <li class="d-flex align-items-center gap-2 py-2">
                      <span class="text-dark">한 잔의 음료에 원하시는 취향과 원썸플레이스의 맛을 담았습니다.</span>
                    </li>
                  </ul>
                  <a href="/mem/drink">
                  <button class="btn btn-outline-dark fw-bolder rounded-2 py-6 w-100 text-capitalize">자세히보기</button>
                  </a>
                </div>
              </div>
            </div>
            <!-- ================= 음료 [끝] ================= -->
            
            <!-- ================= 푸드 [시작] ================= -->
            <div class="col-sm-6 col-lg-4">
              <div class="card">
                <div class="card-body pt-6">
                  <span class="fw-bolder text-uppercase fs-2 d-block mb-7">Food</span>
                  <div class="my-4">
                    <img src="/resources/image/메뉴푸드.jpg" alt="" class="img-fluid" style="width:320px; height:320px;">
                  </div>
                  <div class="d-flex mb-2">
                 	 <h2 class="fw-bolder fs-8 mb-2">푸드</h2>
                  </div>
                  <ul class="list-unstyled mb-7">
                    <li class="d-flex align-items-center gap-2 py-2">
                      <span class="text-dark" style="font-size:20px;">신선한 식재료로 만든 다양한 푸드를 소개합니다.</span>
                    </li>
                    <li class="d-flex align-items-center gap-2 py-2">
                      <span class="text-dark">간편하면서 영양 가득한 원썸플레이스 푸드가 당신의 완벽한 하루를 채워 드립니다.</span>
                    </li>
                  </ul>
                   <a href="/mem/food">
                  <button class="btn btn-outline-dark fw-bolder rounded-2 py-6 w-100 text-capitalize">자세히보기</button>
                  </a>
                </div>
              </div>
            </div>
            <!-- ================= 푸드 [끝] ================= -->
            
            <!-- ================= 상품 [시작] ================= -->
            <div class="col-sm-6 col-lg-4">
              <div class="card">
                <div class="card-body pt-6">
                  <span class="fw-bolder text-uppercase fs-2 d-block mb-7">Product</span>
                  <div class="my-4">
                    <img src="/resources/image/메뉴상품.jpg" alt="" class="img-fluid" style="width:320px; height:320px;">
                  </div>
                  <div class="d-flex mb-2">
                 	 <h2 class="fw-bolder fs-8 mb-2">상품</h2>
                  </div>
                  <ul class="list-unstyled mb-7">
                    <li class="d-flex align-items-center gap-2 py-2">
                      <span class="text-dark" style="font-size:20px;">다양한 스타일로 즐거움을 주는 원썸플레이스 상품을 만나보세요.</span>
                    </li>
                    <li class="d-flex align-items-center gap-2 py-2">
                      <span class="text-dark">언제나 새로운 상품으로 당신에게 특별한 선물이 됩니다.</span>
                    </li>
                  </ul>
                   <a href="/mem/product">
                  <button class="btn btn-outline-dark fw-bolder rounded-2 py-6 w-100 text-capitalize">자세히보기</button>
                  </a>
                </div>
              </div>
            </div>
            <!-- ================= 상품 [끝] ================= -->
          </div>
        </div>