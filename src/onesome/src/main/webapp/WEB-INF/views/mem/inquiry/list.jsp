<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="/resources/css/memInquiry.css">
<link rel="stylesheet" href="/resources/bootstrap/src/assets/css/styles.css">

<div class="col-md-8 m-auto">
	<div class="container breadcrumb " style="margin-top:70px;">
       	<nav class="breadcrumb" aria-label="breadcrumb">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
					<li class="breadcrumb-item"><a href="/mem/mypage"><b>마이페이지</b></b></a></li>
					<li class="breadcrumb-item active" aria-current="page"
						style="color: #d50037"><b>내 문의내역</b></li>
				</ol>
			</nav>
		</nav>
    </div>
    <h2 class="mem-inquiry-tit">내 문의내역</h2>
    <div class="mem-inquiry-boby" style="min-height: 800px">
        <table class="table text-nowrap customize-table mb-0 align-middle mem-inquiry-table">
            <thead class="text-dark fs-4 mem-inquiry-thead">
            <tr>
                <th>순번</th>
                <th>제목</th>
                <th>종류</th>
                <th>작성일자</th>
                <th>처리상태</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${fn:length(inquiryVOList) > 0}">
                    <c:forEach items="${inquiryVOList}" var="inquiryVO" varStatus="stat">
                        <tr class="inquiryRow" data-inq-no="${inquiryVO.inqNo}">
                            <td>${stat.count}</td>
                            <td>${inquiryVO.inqTitle}</td>
                            <td>${inquiryVO.comDetCodeInfoVO.comDetCodeNm}</td>
                            <td><fmt:formatDate value="${inquiryVO.inqWrtDt}" pattern="yyyy-MM-dd HH:mm"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${inquiryVO.ansTitle != null}">
                                        답변완료
                                    </c:when>
                                    <c:otherwise>
                                        답변대기중
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5" align="center">
                            <strong>문의 내역이 없습니다.</strong>
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
</div>

<script>
    $(".inquiryRow").on("click", function () {
        let inqNo = $(this).data("inqNo");

        location.href = "/mem/inquiry/detail?inqNo=" + inqNo;
    })
</script>