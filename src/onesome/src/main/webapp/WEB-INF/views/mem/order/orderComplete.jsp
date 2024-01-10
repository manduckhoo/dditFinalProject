<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.Calendar" %>

<!-- 이 페이지 그냥 살려뒀다가 나중에 결제하기 App 결제 다 끝나고 결제 완료됐다는 화면으로 만들거임, 여기서 홈이랑 주문내역 확인하기 버튼으로 넘어감-->

<div class="container-fluid">
	<div class="card-body px-4 py-4">
		<div class="row align-items-center">
			<div class="col-9">
				<nav class="breadcrumb" aria-label="breadcrumb">
					<nav aria-label="breadcrumb"
						style="margin-top: 30px; margin-left: -20px;">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
							<li class="breadcrumb-item"><a href="/mem/cartList"><b>주문</b></b></a></li>
							<li class="breadcrumb-item"><a href="/mem/cartList"><b>주문/결제</b></b></a></li>
							<li class="breadcrumb-item active" aria-current="page"
								style="color: #d50037"><b>완료</b></li>
						</ol>
					</nav>
				</nav>
			</div>
		</div>
	</div>
	
	<!-- ================ 주문 상세 [시작] ================ -->
	<div class="product-list">
		<div class="card shadow-none border" style="padding:1.5rem;">
		<h3 style="margin-bottom:40px; font-weight: bold;">주문 상세</h3>
			<!-- ================ 주문 매장 [시작] ================ -->
			<h4 style="margin-bottom:20px;">주문매장</h4>
			<div class="card shadow-none border">
				<div class="card-body">
					<h5 class="fw-semibold mb-3" style="margin-bottom:10px;"><c:out value="${franchiseVO.frcsNm}"/></h5>
					<hr>
					<ul class="list-unstyled mb-0">
						<li class="d-flex align-items-center gap-2 mb-4"><i
							class="ti ti-map-pin text-dark fs-6"></i>
							<h6 class="fs-4 fw-semibold mb-0">주소 :</h6><p style="margin-bottom:-2px;"><c:out value="${franchiseVO.frcsAddr}"/> </p></li>
						<li class="d-flex align-items-center gap-2 mb-4"><i
							class="ti ti-square-number-0 text-dark fs-6"></i>
							<h6 class="fs-4 fw-semibold mb-0">주문번호 :</h6><p style="margin-bottom:-2px;"><c:out value="${paymentVO.pynmNo}"/></p></li>
						<li class="d-flex align-items-center gap-2 mb-4"><i
							class="ti ti-clock text-dark fs-6"></i>
							<h6 class="fs-4 fw-semibold mb-0">주문일시 :</h6><p style="margin-bottom:-1px;"><fmt:formatDate value="${paymentVO.pynmDt}" pattern="yyyy. MM. dd(E) HH:mm:ss"/></p></li>
						<li class="d-flex align-items-center gap-2 mb-0"><i
							class="ti ti-battery-2 text-dark fs-6"></i>
							<h6 class="fs-4 fw-semibold mb-0">주문상태 :</h6><p style="margin-bottom:-2px;"><c:out value="${paymentVO.setupMenuYn eq 'N' ? '준비중' : '완료'}"/></p></li>
					</ul>
				</div>
			</div>
			<!-- ================ 주문 매장 [끝] ================ -->
			
				<br>
				<!-- ================ 주문 내역 [시작] ================ -->
				<h4 style="margin-bottom:20px;">주문내역 확인</h4>
				<div class="table-responsive border rounded">
					<table class="table align-middle text-nowrap mb-0">
						<thead>
							<tr>
								<th scope="col" style="text-align:center">No.</th>
								<th scope="col">메뉴명</th>
								<th scope="col" style="text-align:center">옵션</th>
								<th scope="col" style="text-align:center;">사이즈</th>
								<th scope="col" style="text-align:center">수량</th>
								<th scope="col" style="text-align:center">가격</th>
							</tr>
						</thead>
					<c:forEach var="list" items="${list}" varStatus="status">
						<tbody>
							<tr>
								<td>
									<div style="text-align:center">
										<label for="cartSeq${status.count}">${status.count}</label>
									</div>
								</td>
								<td>
									<div class="d-flex align-items-center" style="width:150px;">
										<a href="/mem/drinkDetail?menuNo=${list.menuNo}"><img src="<c:out value='/resources/upload/menu/${list.streFileNm}'/>"
											class="rounded-circle" alt="사진" width="60" height="60"></a>
											<div class="ms-3">
												<!-- ice면 아이스, 아니면 '' 메뉴명 출력 -->
												<a href="/mem/drinkDetail?menuNo=${list.menuNo}"><h6 class="fw-semibold mb-0 fs-4"><c:out value="${list.menuIceYn eq '1' ? '아이스' : ''}"/> ${list.menuNm}</h6></a>
											</div>
									</div>
								</td>
 								
 								<!-- 옵션 1이면 ICE에 Blue Color, 옵션 0이면 HOT에 Red Color, null이면 - -->
								<td style="text-align:center"> 
								    <h6 class="mb-0 fs-4" style="color: ${list.menuIceYn eq '1' ? 'blue' : (list.menuIceYn eq '0' ? 'red' : '-')}">
								        <c:out value="${list.menuIceYn eq '1' ? 'ICE' : (list.menuIceYn eq '0' ? 'HOT' : '-')}"/>
								    </h6>
								</td>
 								
 								<!-- 사이즈 S면 Small(355ml), L이면 Large(500ml), 다 아니면 - 대시 표시 -->
								<c:choose>
									<c:when test="${list.menuSize eq 'S'}">
										<td>
											<h6 style="text-align: center;" class="mb-0 fs-4">Small<span style="font-size:small">(355ml)</span></h6>
										</td>
									</c:when>
									 <c:when test="${list.menuSize eq 'L'}">
								        <td>
								            <h6 style="text-align: center;" class="mb-0 fs-4">Large<span style="font-size:small">(500ml)</span></h6>
								        </td>
								    </c:when>
								    <c:otherwise>
								        <td>
								            <h6 style="text-align: center;" class="mb-0 fs-4">-</h6>
								        </td>
								    </c:otherwise>
								</c:choose>
								
								<td style="text-align:center;"> ${list.pynmCnt}개 </td>
								
								<td style="padding-right: 10px;">
									<h6 style="text-align: center" class="mb-0 fs-4"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.menuPrice}"/>원</h6>
								</td>
							</tr>
						</tbody>
					</c:forEach>
					</table>
					<div class="col-md-12">
						<div class="pull-right mt-4 text-end">
							<h3 style="text-align:right; margin-right: 10px; font-weight:bold;" class="mb-0 fs-4">
								총 결제 금액 : <fmt:formatNumber type="number" maxFractionDigits="3"
								value="${paymentVO.pynmTotalAmt}" />원
							</h3>
						</div>
						<br>
					</div>
				</div>
				<!-- ================ 주문 내역 [끝] ================ -->
				<br>
				<br>
				<div class="col-12">
	           		<a href="/mem/myOrderList" class="btn btn-dark" style="float: inline-end;">주문내역 보러가기</a>
					<a href="/mem/main" class="btn btn-info" style="float: inline-end; margin-right:5px">메인화면</a>
				</div>
			</div>
		</div>
	</div>
	<!-- ================ 주문 상세 [끝] ================ -->
	