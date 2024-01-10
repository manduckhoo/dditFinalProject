<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="/resources/bootstrap/src/assets/libs/datatables.net-bs5/css/dataTables.bootstrap5.min.css">

<%-- 배너 사진 --%>
<div class="card bg-success-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">제품/재고 관리</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/main">Main</a>
                        </li>
                        <li class="breadcrumb-item text-muted" aria-current="page">제품/재고 관리</li>
                    </ol>
                </nav>
            </div>
            <div class="col-3">
                <div class="text-center mb-n5">
                    <img src="/resources/image/배너(누끼)_재고6.png" alt=""
                         class="img-fluid mb-n1" style="width: 50%;">
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 상품등록 모달 시작 -->
<div class="modal fade" id="addProduct-modal" tabindex="-1" aria-labelledby="addProduct" style="display: none;"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header d-flex align-items-center" style="padding-bottom: 0px;">
                <h3 class="modal-title">
                    제품 등록
                </h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body px-4">
                <form action="/admin/product/addProd" method="post" id="addForm" enctype="multipart/form-data">
<!--                 	<input type="hidden" name="prdctNo"> -->
                    <div class="card-body border-top" id="addProduct">
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-3">
                                    <label for="prdctNm" class="control-label col-form-label">제품명</label>
                                    <input type="text" class="form-control" id="prdctNm" name="prdctNm" required>
<!--                                     <label id="validationCheckArea"></label> -->
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-4">
                                <div class="mb-3">
                                    <label for="prdctRcvnAmt" class="control-label col-form-label">입고단가</label>
                                    <input type="number" min={0} max={1000000000000} class="form-control" id="prdctRcvnAmt" name="prdctRcvnAmt"
                                           required>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                                <div class="mb-3">
                                    <label for="prdctClsfCd" class="control-label col-form-label">카테고리</label>
                                    <select class="form-select" id="prdctClsfCd" name="prdctClsfCd" required>
                                        <option value="select" selected disabled hidden>선택</option>
                                        <option value="PRCT01" id="PRCT01">원두류</option>
                                        <option value="PRCT02" id="PRCT02">제과류</option>
                                        <option value="PRCT03" id="PRCT03">식기류</option>
                                        <option value="PRCT04" id="PRCT04">시럽</option>
                                        <option value="PRCT05" id="PRCT05">소모품</option>
                                        <option value="PRCT06" id="PRCT06">상품</option>
                                        <option value="PRCT07" id="PRCT07">유제품</option>
                                        <option value="PRCT08" id="PRCT08">음료류</option>
                                        <option value="PRCT09" id="PRCT09">청과류</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                            	<div class="mb-3">
	                            	<label for="prdctClsfCd" class="control-label col-form-label">거래처</label>
				                    <select class="form-select" id="acntNo" name="acntNo" required>
				                        <option value="" disabled selected hidden="">거래처선택</option>
				                        <c:forEach var="acnt" items="${acntVOList}">
				                            <option value="${acnt.acntNo}">${acnt.acntNm}</option>
				                        </c:forEach>
				                    </select>
			                    </div>
	                		</div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-4">
                                <div class="mb-3">
                                    <label for="hqInvenCnt" class="control-label col-form-label">본사재고수량</label>
                                    <input type="number" class="form-control" id="hqInvenCnt" name="hqInvenCnt" required>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="hqInvenProperCnt" class="control-label col-form-label">본사적정수량</label>
                                    <input type="number" class="form-control" id="hqInvenProperCnt" name="hqInvenProperCnt" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="prdctPrchsStrtDt" class="control-label col-form-label">구매 시작일</label>
                                    <input type="date" class="form-control" id="prdctPrchsStrtDt" name="prdctPrchsStrtDt" required>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="prdctPrchsEndDt" class="control-label col-form-label">구매 종료일</label>
                                    <input type="date" class="form-control" id="prdctPrchsEndDt" name="prdctPrchsEndDt" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <div class="mb-3">
                                    <label for="allergensYn" class="control-label col-form-label">알레르기 유발 유무</label>
                                    <select class="form-select" id="allergensYn" name="allergensYn" required>
                                        <option selected disabled hidden>선택</option>
                                        <option>Y</option>
                                        <option>N</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                 <div class="mb-3">
                                    <label for="prdctDscnYn" class="control-label col-form-label">단종 유무</label>
                                    <select class="form-select" id="prdctDscnYn" name="prdctDscnYn" required>
                                        <option selected disabled hidden>선택</option>
                                        <option>Y</option>
                                        <option>N</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-3" style=" display: grid;grid-template-rows: auto auto;">
                                    <label for=prdctExpln class="control-label col-form-label">제품설명</label>
                                    <textarea rows="15" cols="50" id="prdctExpln" name="prdctExpln" style="overflow: hidden;"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="custom-file">
									<input type="file" class="form-control" id="upload" name="uploadFile" multiple>
								</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn bg-warning-subtle font-medium" data-bs-dismiss="modal">
                            취소
                        </button>
                        <button type="button" class="btn btn-primary" id="btnRegistPrdct">
                            등록
                        </button>
                    </div>
                    <sec:csrfInput/>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 상품등록 모달 끝 -->

<div class="datatables">
    <div class="row">
        <div class="col-12">
            <!-- --------------------- dataTable 시작 ---------------- -->
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <div id="zero_config_wrapper" class="dataTables_wrapper">
                        	<!-- 검색 -->
<!--                         	<form id="frm"> -->
<!-- 			                    <div class="input-group" style="width: 300px;"> -->
<!-- 			                        <input type="text" class="form-control" placeholder="메뉴명" name="keyword" aria-label="" aria-describedby="basic-addon1"> -->
<!-- 			                        <button class="btn bg-info-subtle text-info font-medium" type="submit"><i class='bx bx-search-alt-2'></i></button> -->
<!-- 			                    </div> -->
<!-- 			                </form> -->
			                
                        	<form action="/admin/hqOrderDetail" method="post">
                        	<div class="d-flex justify-content-end">
                                <button type="submit" id="hqOrderBtn" class="btn mb-1 waves-effect waves-light bg-success-subtle text-success mx-3" >
                                    <i class="ti ti-box-seam" style="margin-right: 5px;"></i> 발주 신청
                                </button>
                        
								<button type="button" id="btnAdd" class="btn btn-primary btn-rounded mb-1 addProductModal" data-bs-toggle="modal" >
									<i class="ti ti-plus" style="margin-right: 5px;"></i> 제품 등록
								</button>
			                </div>
                            <table id="zero_config"
                                   class="table border table-bordered display text-nowrap dataTable"
                                   style="width: 100%;" aria-describedby="zero_config_info">
                                <thead>
                                <!-- start row -->
                                <tr>
                                    <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1" style="text-align: center;"
                                        colspan="1" aria-label="select: activate to sort column ascending">선택
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1" style="text-align: center; width: 250px;"
                                        colspan="1" aria-label="prdctNm: activate to sort column ascending">제품명
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1" style="text-align: center;"
                                        colspan="1" aria-label="acntNm: activate to sort column ascending">거래처
                                    </th>
<!--                                     <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1" style="text-align: center;" -->
<!--                                         colspan="1" aria-label="prdctPrchsStrtDt: activate to sort column ascending">구매 시작일 -->
<!--                                     </th> -->
                                    <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1" style="text-align: center; width: 100px"
                                        colspan="1" aria-label="hqInvenCnt: activate to sort column ascending">본사 재고량
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1" style="text-align: center; width: 100px"
                                        colspan="1" aria-label="prdctRcvnAmt: activate to sort column ascending">입고 단가
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1" style="text-align: center; max-width: 50px;"
                                        colspan="1" aria-label="allergensYn: activate to sort column ascending">단종 여부
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="default_order" rowspan="1" style="text-align: center;"
                                        colspan="1" aria-label="comDetCodeNm: activate to sort column ascending">분류
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="productVOCnt" value="${fn:length(productVOList)}" />
                                <c:forEach var="productVO" items="${productVOList}" varStatus="stat">
                                    <tr>
                                        <td class="text-center"><input type="checkbox" class="form-check-input" name="productCheckBox" value="${productVO.prdctNo}"></td>
                                        <td onclick="location.href='/admin/product/detail?prdctNo=${productVO.prdctNo}'" style="cursor: pointer;">
<%--                                         	<img src="/resources/upload/product/${productVO.atchFileVOList.streFileNm}" class="rounded-circle" alt="${stat.count}" width="45" height="45"> --%>
                                        	${productVO.prdctNm}
                                        </td>
                                        <td>${productVO.acntVO.acntNm}</td>
<%--                                         <td style="text-align: center;"><fmt:formatDate value="${productVO.prdctPrchsStrtDt}" /></td> --%>
<%--                                        <td style="text-align: right;">${productVO.hqInvenCnt}</td>--%>
                                        <td style="text-align: right;">
                                            <p class="hqInvenCnt mb-0"><fmt:formatNumber value="${productVO.hqInvenCnt}"/></p>
                                            <p class="hqInvenProperCnt mb-0 text-muted fs-2 mt-1 d-none"><fmt:formatNumber value="${productVO.hqInvenProperCnt}"/></p>
                                        </td>
                                        <td style="text-align: right;"><fmt:formatNumber value="${productVO.prdctRcvnAmt}"/></td>
                                        <c:choose>
                                        <c:when test="${productVO.prdctDscnYn == 'N'}">
                                        	<td style="text-align: center;">-</td>
                                        </c:when>
                                        <c:otherwise><td style="text-align: center; color: red">단종</td></c:otherwise>
                                        </c:choose>
                                        <td style="text-align: center;">${productVO.comDetCodeInfoVO.comDetCodeNm}</td>
                                    </tr>
                                </c:forEach>


                                </tbody>

                            </table>
                                <sec:csrfInput/>
							</form>
                        </div>
<%--                     	<div id="pagingArea">${articlePage.getPagingArea()}</div> --%>
                    </div>
                </div>
            </div>
            <!-- --------------------- dataTable 끝 ---------------- -->
        </div>
    </div>
</div>

<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/bootstrap/src/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/resources/bootstrap/src/assets/js/datatable/datatable-basic.init.js"></script>
<script type="text/javascript">
// // CKEditor
// CKEDITOR.replace('prdctExpln', {
// 	language: 'ko',
// 	filebrowserUploadUrl: '/admin/ckeditor/imgUpload',
// 	font_defaultLabel: '맑은 고딕/Malgun Gothic',
// 	fontSize_defaultLabel: '12',
// 	skin: 'office2013',
//     width:'600'
       
// });

// 제품추가 모달
$("#btnAdd").on("click", function () {
	console.log("제품추가 모달 들어왔냐");
	
    // 기존에 작성 했던 내용 지움
	$("#validationCheckArea").val('');
    
    $("#addProduct").find('input[type=text]').each(function () {
        $(this).val('');
    });
    $("#addProduct").find('input[type=number]').each(function () {
        $(this).val('');
    });
    $("#addProduct").find('input[type=number]').each(function () {
        $(this).val('');
    });
    $("#frm").find('select[class=form-select]').each(function () {
        $(this).val('');
    });
    
    //모달 열기
    $("#addProduct-modal").modal("show");
});

/* 제품 추가 모달안에서 등록버튼 */
$("#btnRegistPrdct").on("click", function() {
	let form = $("#addForm")[0];
	let formData = new FormData(form);
	
	$.ajax({
		url:"/admin/product/addProd",
		data:formData,
		type:"post",
		enctype:"multipart/form-data",
		contentType:false,
		processData:false,
		beforeSend:function(xhr){
        	xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        },
        success:function(result) {
        	console.log(result);
        	if(result == "success") {
        		var Toast = Swal.mixin({
					toast : true,
					position : 'top-end',
					showConfirmButton : false, //true면 ok버튼이 뜸
					timer : 1000, // 1초 동안 표시됨
					timerProgressBar : true
				// true하면 타임게이지 나옴
				});
				Toast.fire({
					icon : 'success', //출력할 아이콘 종류(success, warning, error, info, quesition)
					title : '상품 등록이 완료되었습니다.' //출력할 메세지 내용
				});
				setTimeout(function() {
					location.reload();
				}, 800); //0.8초 이후 자동 새로고침
        	}
        },
        error:function(err) {
        	console.log(err);
        }
	});
});

//발주 신청 버튼을 클릭할 때, 데이터 존재 여부 확인
document.getElementById("hqOrderBtn").addEventListener("click", function() {
    var checkboxes = document.querySelectorAll('input[name=productCheckBox]:checked');

    if (checkboxes.length === 0) {
        alert("체크된 항목이 없습니다.");
        event.preventDefault(); // 이벤트의 기본 동작을 중지
    } else {
        document.getElementById("hqOrderBtn").submit();
    }
});

//본사재고량이 권장보유수량보다 적으면 빨간글씨
console.log("productVOCnt(product의 갯수) : ", ${productVOCnt});
const productVOCnt = ${productVOCnt};

for(let i=0; i<productVOCnt; i++){
    let hqInvenCnt = document.getElementsByClassName("hqInvenCnt")[i].innerText;
    let hqInvenProperCnt = document.getElementsByClassName("hqInvenProperCnt")[i].innerText;

    //innerText로 가져온 문자열에서 ',' 빼고(replace) 숫자형으로 변환
    let numericHhqInvenCnt = parseInt(hqInvenCnt.replace(/[^\d]/g, ''));
    let numericHqInvenProperCnt = parseInt(hqInvenProperCnt.replace(/[^\d]/g, ''));

   /* console.log(hqInvenCnt);
    console.log(hqInvenProperCnt);
    //아래는 숫자형
    console.log(numericHhqInvenCnt);
    console.log(numericHqInvenProperCnt);*/

    if (numericHhqInvenCnt < numericHqInvenProperCnt) {
        document.getElementsByClassName("hqInvenCnt")[i].style.color = "red";
    }
}


</script>