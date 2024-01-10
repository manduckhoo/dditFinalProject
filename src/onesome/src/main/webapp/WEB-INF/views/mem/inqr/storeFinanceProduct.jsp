<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/memInquirer.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="col-md-8 m-auto my-3">
	<nav class="breadcrumb" aria-label="breadcrumb"
		style="margin-top: 30px;">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
				<li class="breadcrumb-item"><a href="/mem/inqr/startInfo"><b>창업문의</b></b></a></li>
				<li class="breadcrumb-item active" aria-current="page"
					style="color: #d50037"><b>가맹점 전용 금융 상품</b></li>
			</ol>
		</nav>
	</nav>
	<h1 class="display-2 my-5">
		<b>가맹점 창업 문의</b>
	</h1>
	<div class="col-md-12">
		<!-- --------------------- start Tab with Underline ---------------- -->
		<div class="my-3">
			<div>
				<ul class="nav nav-underline" id="myTab" role="tablist">
					<li class="nav-item pe-4"><a class="nav-link " id="active-tab"
						 href="/mem/inqr/startInfo" 
						> <span><b>가맹점 개설 안내</b></span>
					</a></li>
					<li class="nav-item px-4"><a class="nav-link " id="active-tab1"
						 href="/mem/inqr/startExplan" > <span><b>창업
									설명회</b></span>
					</a></li>
					<li class="nav-item px-4"><a class="nav-link"
						id="active-tab2"  href="/mem/inqr/storeStartupCounselApply" 
						> <span><b>온라인 창업 신청</b></span>
					</a></li>
					<li class="nav-item px-4"><a class="nav-link active" id="link1-tab4"
						 href="/mem/inqr/storeFinanceProduct"> <span><b>가맹점
									전용 금융 상품</b></span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
		<br>
<!--공통 부분끝  -->
    <!-- S : 본문 -->
                <div class="container">
                    <section class="section-text">
                        <div class="title-wrap">
                            <h2 class="title-h3">가맹점 전용 금융상품</h2>
                        </div>
                        <div class="table-responsive type-1">
                            <!-- S:20220512 수정 -->
                            <table class="table">
                                <caption>구분, 우리은행, 하나은행 항목의 가맹점 금융상품 표</caption>
                                <colgroup>
                                    <col>
                                    <col style="width:42%;">
                                    <col style="width:42%;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">구분</th>
                                        <th scope="col">우리은행</th>
                                        <th scope="col">하나은행</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">대출 대상</th>
                                        <td>원썸플레이스 예비 창업자 및 창업자(창업 6개월 이내)</td>
                                        <td>원썸플레이스 창업자 및 운영자</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">대출한도 및 금액</th>
                                        <td>최대 1억원</td>
                                        <td>최대 2억원</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">대출 금리</th>
                                        <td>
                                            은행기준금리 + 가산금리<br>
                                            <span class="text-small">(개인신용도, 카드 매출 대금 입금 등 우대사항 적용에 따른 차등)</span>
                                        </td>
                                        <td>
                                            은행기준 금리 + 가산금리<br>
                                            <span class="text-small">(개인신용도, 우대사항 적용에 따른 차등, 금융기관 별도 문의 필요)</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">대출 기간</th>
                                        <td>
                                            만기일시상환방식 : 1년<br>
                                            분할상환방식 : 5년 이내
                                        </td>
                                        <td>
                                             만기일시상환방식 : 1년 이내<br>
                                            분할상환방식 : 3년 이내
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">대출 문의</th>
                                        <td>우리은행 CJ금융센터 02-2266-3200 (510, 511)</td>
                                        <td>하나은행 고객센터 1599-1111</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">관련 링크</th>
                                        <td>
                                            우리은행 모바일금융몰
                                            <span class="qr"><img src="https://www.twosome.co.kr/resources/images/content/img_qr.png" alt="QR코드 이미지"></span>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!--//E:20220512 수정 -->
                        </div>
                        <ul class="dot-list is-small">
                            <li>대출한도 및 대출금리를 채무자의 신용등급에 따라 차등 적용됩니다.</li>
                            <li>대출금액에 따른 인지대등 부대비용이 발생할 수 있습니다.</li>
                            <li>대출금리 수준은 기준 금리 변동에 따라 변동될 수 있습니다.</li>
                        </ul>
                    </section>
                </div>
                
                <!-- E : 본문 -->