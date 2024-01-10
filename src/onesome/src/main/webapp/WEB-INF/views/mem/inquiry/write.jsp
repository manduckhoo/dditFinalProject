<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/memInquiry.css">

<div class="col-md-8 m-auto">
<div class="container breadcrumb" style="margin-top:70px;">
       	<nav class="breadcrumb" aria-label="breadcrumb">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
					<li class="breadcrumb-item"><a href="/mem/faq"><b>고객센터</b></b></a></li>
					<li class="breadcrumb-item" aria-current="page"
						style="color: #d50037"><b>1:1 문의</b></li>
				</ol>
			</nav>
		</nav>
    </div>
    <h2 class="mem-inquiry-tit" style="margin-top:-10px;">1:1 문의</h2>
    <form class="form-group" id="inquiry-frm" action="/mem/inquiry/write" method="post" enctype="multipart/form-data">
        <div class="mem-inquiry-boby">
            <div class="row mem-inquiry-row">
                <div class="col-sm-2">
                    <strong class="inquiry-tit-bundle">
                        문의유형
                        <i class='bx bx-health inquiry-required'></i>
                    </strong>
                </div>
                <div class="col-sm-5">
                    <select class="form-select" id="inqTypeCd" name="inqTypeCd" required>
                        <option value="" disabled selected>선택해주세요</option>
                        <c:forEach var="inquiryType" items="${inquiryTypeList}">
                                <option value="${inquiryType.comDetCode}">${inquiryType.comDetCodeNm}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-sm-5">
                    <select class="form-select inquiry-sel-store" id="frcsNo" name="frcsNo">
                        <option value="" disabled selected>지점선택</option>
                        <c:forEach var="franchies" items="${franchiseList}">
                            <option value="${franchies.frcsNo}">${franchies.frcsNm}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="row mem-inquiry-row">
                <div class="col-sm-2">
                    <strong class="inquiry-tit-bundle">
                        문의제목
                        <i class='bx bx-health inquiry-required'></i>
                    </strong>
                </div>
                <div class="col-sm-10 form-group">
                    <input type="text" class="form-control" id="inqTitle" name="inqTitle" required>
                </div>
            </div>
            <div class="row mem-inquiry-row">
                <div class="col-sm-2">
                    <strong class="inquiry-tit-bundle">
                        문의내용
                        <i class='bx bx-health inquiry-required'></i>
                    </strong>
                </div>
                <div class="col-sm-10 form-group">
                    <textarea class="inquiry-textarea form-control" name="inqConts" id="inqConts" required></textarea>
                </div>
            </div>
            <div class="row mem-inquiry-row">
                <div class="col-sm-2">
                    <strong class="inquiry-tit-bundle">
                        첨부파일
                    </strong>
                </div>
                <div class="col-sm-6 form-group">
                    <input type="file" class="form-control" id="uploadFile" name="uploadFile" multiple>
                </div>
                <div class="col-sm-4">
                    <p class="inquiry-atch-desc">
                        파일은 최대 10MB까지 첨부가능합니다.
                    </p>
                </div>
            </div>
        </div>
        <div class="inquiry-submit-area">
            <button type="submit" class="inquiry-submit-btn">문의접수</button>
        </div>
        <sec:csrfInput/>
    </form>
</div>

<script>
    $("#inqTypeCd").on("change", function (){
        const frcsNoSel = $("#frcsNo");

        if ($(this).val() === "INQTP04"){
            frcsNoSel.removeClass("inquiry-sel-store").removeAttr("disabled");
        }else {
            frcsNoSel.addClass("inquiry-sel-store").attr("disabled", "disabled");
        }
    })

    //파일 업로드의 용량제한
    $("#uploadFile").on("change", function () {
        let totalSize = 0;
        let maxSize = 10 * 1024 * 1024; //10MB

        //파일들의 용량 합 구하기
        $.each($(this)[0].files, function (idx, file) {
            totalSize += file.size;
        });

        if (totalSize > maxSize){
            alert("파일 크기가 10MB를 초과합니다.");
            $(this).val(null);
        }
    })
</script>