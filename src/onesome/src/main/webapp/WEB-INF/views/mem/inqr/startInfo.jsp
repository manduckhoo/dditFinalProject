<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/memInquirer.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
/*점포 보유 여부 부분*/
ul.box-list.type-3.__layout2 {
    display: flex;
}

/* .container ul li {
width : 400px;
} */

.box-list.__layout3>li {
    /* width: calc(100% / 3 - 35px); */
    width : 320px;
}

.section-text .box3 ul {
    display: flex;
    justify-content: space-between;
}

/*창업절차부분 */

</style>
<div class="col-md-8 m-auto my-3">
	<nav class="breadcrumb" aria-label="breadcrumb"
		style="margin-top: 70px; margin-left: 10px;">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
				<li class="breadcrumb-item"><a href="/mem/inqr/startInfo"><b>창업문의</b></b></a></li>
				<li class="breadcrumb-item active" aria-current="page"
					style="color: #d50037"><b>가맹점 개설 안내</b></li>
			</ol>
		</nav>
	</nav>
	<h1 class="display-2 my-4 mb-5">
		<b>가맹점 창업 문의</b>
	</h1>
	<div class="col-md-12">
		<!-- --------------------- start Tab with Underline ---------------- -->
		<div class="my-3">
			<div>
				<ul class="nav nav-underline" id="myTab" role="tablist">
					<li class="nav-item pe-4"><a class="nav-link active" id="active-tab"
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
					<li class="nav-item px-4"><a class="nav-link" id="link1-tab4"
						 href="/mem/inqr/storeFinanceProduct"> <span><b>가맹점
									전용 금융 상품</b></span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
	
<!--공통 부분끝  -->
 <!-- S : 본문 -->
                <div class="container">
                    <!-- S : 점포보유 여부 -->
                    <section class="section-text section-mb">
                        <div class="title-wrap">
                            <h2 class="title-h3">
                                점포보유 여부
                            </h2>
                        </div>
                        <ul class="box-list type-3 __layout2">
                            <li style="height: 369px;">
                                <i class="icon-fran-store"></i>
                                <strong class="title">
                                    점포 보유 시
                                </strong>
                                <p class="desc">
                                    담당자에게 점포 위치와 연락처를 알려주시면 현장에서 상권 및 시장조사를 통하여 창업여부를 상담해드립니다.
                                </p>
                            </li>
                            <li style="height: 369px;">
                                <i class="icon-fran-nostore"></i>
                                <strong class="title">
                                    점포 미 보유 시
                                </strong>
                                <p class="desc">
                                    담당자에게 신청서를 작성하여 창업상담을 받으실 수 있으며, 점포 물색에 도움을 드립니다. 
                                </p>
                            </li>
                        </ul>
                    </section>
                    <!-- E : 점포보유 여부 -->
                </div>

                <div class="container">
                    <!-- S : 창업절차 -->
                    <section class="section-text section-mb">
                        <div class="title-wrap mb0">
                            <h2 class="title-h3">
                                창업절차
                            </h2>
                        </div>
                        <ul class="box-list type-2 __layout3">
                            <li style="height: 325px;">
                                <em class="title">
                                    STEP 01
                                </em>
                                <p class="desc">
                                    가맹점 창업 문의
                                </p>
                                <p class="desc-type1">
                                    본사 홈페이지 또는 전화 (080-723-2323)신청 및 접수
                                </p>
                            </li>
                            <li style="height: 325px;">
                                <em class="title">
                                    STEP 02
                                </em>
                                <p class="desc">
                                    접수 및 담당자 개별 상담
                                </p>
                                <p class="desc-type1">
                                    회사소개, 투썸플레이스 프랜차이즈 사업 설명
                                </p>
                            </li>
                            <li style="height: 325px;">
                                <em class="title">
                                    STEP 03
                                </em>
                                <p class="desc">
                                    후보지 선정, 상권분석, 본사 개설 승인
                                </p>
                                <ul class="dot-list">
                                    <li>사업타당성 분석</li>
                                    <li>가맹신청서 접수 / 정보공개서 제공</li>
                                </ul>
                            </li>
                            <li style="height: 325px;">
                                <em class="title">
                                    STEP 04
                                </em>
                                <p class="desc">
                                    가맹계약 체결
                                </p>
                                <ul class="dot-list">
                                    <li>계약 기간 3년 계약 만료 후 1년 단위 재계약</li>
                                    <li>추가 비용 없음</li>
                                </ul>
                            </li>
                            <li style="height: 325px;">
                                <em class="title">
                                    STEP 05
                                </em>
                                <p class="desc">
                                    가맹금/보증금/교육비 입금 
                                </p>
                                <ul class="dot-list">
                                    <li>가맹금 : 2,000만원</li>
                                    <li>보증금 : 1,000만원</li>
                                    <li>교육비 : 150만원</li>
                                </ul>
                            </li>
                            <li style="height: 325px;">
                                <em class="title">
                                    STEP 06
                                </em>
                                <p class="desc">
                                    시공 : 점포실측, 디자인 결정 후 공사 진행 
                                </p>
                                <ul class="dot-list">
                                    <li>실측 후 설계도면 작성, 점주님과 최종 협의</li>
                                    <li>시공업체 선정(입찰), 공사 계약</li>
                                    <li>공사 기간 약 25일 ~ 35일 예상</li>
                                </ul>
                            </li>
                            <li style="height: 325px;">
                                <em class="title">
                                    STEP 07
                                </em>
                                <p class="desc">
                                    직원채용 및 교육
                                </p>
                                <ul class="dot-list">
                                    <li>본사와 점주님 협의 후 직원 면접 채용</li>
                                    <li>점주님 및 직원 교육<br>
                                        (10일 : 이론, 실습 교육)</li>
                                </ul>
                            </li>
                            <li style="height: 325px;">
                                <em class="title">
                                    STEP 08
                                </em>
                                <p class="desc">
                                    인/허가 및 영업 준비
                                </p>
                                <ul class="dot-list">
                                    <li>각종 인/허가 증명서 발급</li>
                                    <li>카드 승인 및 영업 관련 모든 사항 점검</li>
                                    <li>OPEN 준비(리허설)</li>
                                </ul>
                            </li>
                            <li style="height: 325px;">
                                <em class="title">
                                    STEP 09
                                </em>
                                <p class="desc">
                                    점포오픈
                                </p>
                                <ul class="dot-list">
                                    <li>오픈 프로모션 진행</li>
                                    <li>투썸플레이스 영업 시작</li>
                                </ul>
                            </li>
                        </ul>
                    </section>
                    <!-- E : 창업절차 -->
                </div>

                <div class="container">
                    <!-- S : 창업조건 -->
                    <section class="section-text section-mb">
                        <div class="title-wrap">
                            <h2 class="title-h3">
                                창업 조건
                            </h2>
                        </div>
                        <div class="box3">
                        <ul class="box-list __layout3">
                            <li style="height: 369px;">
                                <i class="icon-fran-start1"></i>
                                <strong class="title">
                                    창업 가능 상권
                                </strong>
                                <p class="desc">
                                    상업지, 오피스, 역세권, 대학가, 대형 집객시설물 등
                                </p>
                            </li>
                            <li style="height: 369px;">
                                <i class="icon-fran-start2"></i>
                                <strong class="title">
                                    창업 기준 면적
                                </strong>
                                <p class="desc">
                                    1층 : 148.7(45평)<br>
                                    전면 8M 이상
                                </p>
                            </li>
                            <li style="height: 369px;">
                                <i class="icon-fran-start3"></i>
                                <strong class="title">
                                    기본 시설 사항
                                </strong>
                                <p class="desc">
                                    전기 : 70Kw 이상<br>
                                    용도 : 근린생활시설 1종 또는 2종<br>
                                    기타 : 급, 배수 / 급, 배기 가능
                                </p>
                            </li>
                        </ul>
                        </div>
                    </section>
                    <!-- E : 창업조건 -->
                </div>

                <div class="container">
                    <!-- S : 예상 투자비용 -->
                    <section class="section-text">
                        <div class="title-wrap">
                            <h2 class="title-h3">
                                예상 투자비용
                            </h2>
                            <span class="unit is-mobile-hide">
                                (단위:천원 / VAT별도)
                            </span>
                        </div>
                        <!-- Desktop, tablet 에서만 노출 -->
                        <div class="table-responsive" style="margin-bottom: 0px;">
                            <table class="table table-vcenter type-1">
                                <caption>
                                    구분, 내용, 투자비(춴원)
                                </caption>
                                <colgroup>
                                    <col style="width:140px">
                                    <col >
                                    <col style="width:280px">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">
                                            구분
                                        </th>
                                        <th scope="col">
                                            내용
                                        </th>
                                        <th scope="col">
                                            투자비(천원)
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="table-row-mobile">
                                        <th scope="row" rowspan="3">
                                            <strong>가맹비</strong>
                                            <span class="unit is-mobile-show">(단위:천원 / VAT별도)</span>
                                        </th>
                                        <td>
                                            <dl class="table-dl-list">
                                                <dt>가맹비</dt>
                                                <dd>소멸성(영업표지의 사용 및 영업관리 등의 대가)</dd>
                                            </dl>
                                        </td>
                                        <td class="text-right">20,000</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dl class="table-dl-list">
                                                <dt>보증금</dt>
                                                <dd>계약 종료 시 반환(VAT 없음)</dd>
                                            </dl>
                                        </td>
                                        <td class="text-right">10,000</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dl class="table-dl-list">
                                                <dt>교육비</dt>
                                                <dd>이론, 실습 교육(10일)</dd>
                                            </dl>
                                        </td>
                                        <td class="text-right">1,500</td>
                                    </tr>
                                    <tr class="table-row-mobile">
                                        <th scope="row" rowspan="5">
                                            <strong>인테리어</strong>
                                            <span class="unit is-mobile-show">(단위:천원 / VAT별도)</span>
                                        </th>
                                        <td>
                                            <dl class="table-dl-list">
                                                <dt>기획관리비</dt>
                                                <dd>인테리어 설계비</dd>
                                            </dl>
                                        </td>
                                        <td class="text-right">5,000</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dl class="table-dl-list">
                                                <dt>인테리어</dt>
                                                <dd>45평 기준(192만원/평 ~ 219만원/평)</dd>
                                            </dl>
                                        </td>
                                        <td class="text-right">86,500 ~ 98,400</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dl class="table-dl-list">
                                                <dt>간판/사인물</dt>
                                                <dd>전면 15m 점포 기준(기준면 초과 시 비용 발생)</dd>
                                            </dl>
                                        </td>
                                        <td class="text-right">7,900 ~ 13,200 </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dl class="table-dl-list">
                                                <dt>가구</dt>
                                                <dd>의자, 테이블 등</dd>
                                            </dl>
                                        </td>
                                        <td class="text-right">36,500 ~ 43,200 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dl class="table-dl-list">
                                                <dt>장비/설치류</dt>
                                                <dd>커피 머신, 케익 쇼케이스, 냉장고 등</dd>
                                            </dl>
                                        </td>
                                        <td class="text-right">75,900 ~ 83,800 
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot class="table-summary">
                                    <tr>
                                        <th scope="row">
                                            <strong class="is-mobile-hide">계</strong>
                                            <strong class="is-mobile-show">합계</strong>
                                        </th>
                                        <td>
                                            45평, 전면 15M 점포 기준
                                        </td>
                                        <td class="text-right">
                                            243,300 ~ 275,100
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>

                        <!-- mobile 에서만 노출 -->
                        <div class="is-mobile-show">

                        </div>
                        <ul class="dot-list is-small">
                            <li>별도공사 : 냉 · 난방기 별도 (냉 · 난방기 본사 거래 선택시 520만~670만원/설치비별도)</li>
                            <li>점주(자체)공사 시 SI관리비 평당 15만원/평 (최대 1,000만원 이하) </li>
                            <li>최초 오픈비 2,300만원~2,800만원 별도 (초도물품비, 비품비, 오픈판촉비, 오픈인력교육비 등) </li>
                            <li>상기 투자비는 매장형태 및 상황에 따라 변동될 수 있습니다.</li>
                        </ul>
                    </section>
                    <!-- E : 예상 투자비용 -->
                </div>

                <!-- E : 본문 -->
    