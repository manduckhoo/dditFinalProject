<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	.table-responsive {
		cursor: default;
		overflow-x: clip;
	}
	.dataTables_paginate{
		margin-top: 20px !important;
	}
	tbody > tr {
		cursor: pointer;
	}
</style>

<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
  <div class="card-body px-4 py-3">
    <div class="row align-items-center">
      <div class="col-9">
        <h4 class="fw-semibold mb-8">상담 완료 목록</h4>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
            </li>
            <li class="breadcrumb-item" aria-current="page">창업 상담 관리</li>
          </ol>
        </nav>
      </div>
      <div class="col-3">
        <div class="text-center mb-n5">
          <img src="../assets/images/breadcrumb/ChatBc.png" alt="" class="img-fluid mb-n4">
        </div>
      </div>
    </div>
  </div>
</div>

<div class="card">
	<div class="card-body">
		<div class="table-responsive">
			<table id="adminInqrList" class="table border table-bordered text-nowrap">
				<thead>
				<tr>
					<th class="fw-semibold mb-0 text-center">순번</th>
					<th class="fw-semibold mb-0 text-center">이름</th>
					<th class="fw-semibold mb-0 text-center">희망지역</th>
					<th class="fw-semibold mb-0 text-center">예상비용</th>
					<th class="fw-semibold mb-0 text-center">상가보유</th>
					<th class="fw-semibold mb-0 text-center">창업경험</th>
					<th class="fw-semibold mb-0 text-center">신청일시</th>
					<th class="fw-semibold mb-0 text-center">처리상태</th>
				</tr>
				</thead>
				<tbody>
				<!-- start row -->
				<c:choose>
					<c:when test="${fn:length(dataList) > 0}">
						<c:forEach items="${dataList}" var="inqrVO" varStatus="stat">
							<tr onclick="location.href='/admin/inqr/detail?InqrNo=${inqrVO.inqrNo}'">
								<td class="mb-0 text-center">${stat.count}</td>
								<td class="mb-0 text-center">
										${inqrVO.inqrNm}
								</td>
								<td class="mb-0 text-center">${inqrVO.inqrRgnlHope}</td>
								<td class="mb-0 text-center">
									<c:choose>
										<c:when test="${inqrVO.inqrExpctCost == 100000000}">1억 미만</c:when>
										<c:when test="${inqrVO.inqrExpctCost == 150000000}">1.5억 미만</c:when>
										<c:when test="${inqrVO.inqrExpctCost == 200000000}">2억 미만</c:when>
										<c:when test="${inqrVO.inqrExpctCost == 250000000}">2.5억 미만</c:when>
										<c:when test="${inqrVO.inqrExpctCost == 300000000}">3억 미만</c:when>
									</c:choose>
								</td>
								<td class="mb-0 text-center">
									<c:choose>
										<c:when test="${inqrVO.inqrStoreYn == 'Y'}">
											유
										</c:when>
										<c:otherwise>
											무
										</c:otherwise>
									</c:choose>
								</td>
								<td class="mb-0 text-center">
									<c:choose>
										<c:when test="${inqrVO.inqrStrtpXp == 'Y'}">
											유
										</c:when>
										<c:otherwise>
											무
										</c:otherwise>
									</c:choose>
								</td>
								<td class="mb-0 text-center">${inqrVO.inqrReqDt}</td>
								<td class="mb-0 text-center">
									<c:choose>
										<c:when test="${inqrVO.inqrStatusYn == 'P'}">
											대기
										</c:when>
										<c:when test="${inqrVO.inqrStatusYn == 'Y'}">
											승인
										</c:when>
										<c:otherwise>
											거절
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8">
								<p>대기중인 상담 신청이 없습니다.</p>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
				<!-- end row -->
				</tbody>
			</table>
		</div>
	</div>
</div>

<script src="/resources/bootstrap/src/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script>
	$("#adminInqrList").DataTable({
		bLengthChange: false,
		info: false,
		order: []
	});
</script>
