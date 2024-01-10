<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- 브레드 크럼 시작  -->
<div
	class="card bg-success-subtle shadow-none position-relative overflow-hidden mb-4">
	<div class="card-body px-4 py-3">
		<div class="row align-items-center">
			<div class="col-9">
				<h4 class="fw-semibold mb-8">조직 관리</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							class="text-muted text-decoration-none" href="/frcs/main">Main</a>
						</li>
						<li class="breadcrumb-item text-muted" aria-current="page">직원 관리</li>
						<li class="breadcrumb-item text-muted" aria-current="page">직원 등록</li>
					</ol>
				</nav>
			</div>
			<div class="col-3">
				<div class="text-center mb-n5">
					<img
						src="/resources/bootstrap/src/assets/images/breadcrumb/ChatBc.png"
						alt="" class="img-fluid mb-n4">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 브레드 크럼 끝  -->

<div class="card">
	<div class="card-body">
		<h5 class="card-title fw-semibold mb-4">가맹점 신규 직원 등록</h5>
		<div class="card">
			<div class="emp-insert-card-body">
				<form id="frm" name="frm" class="frcsEmpCreate" action="/frcs/emp/create" method="post" enctype="multipart/form-data">
					<div class="col-md-3">
						<label for="frcsEmpName" class="form-label">직원명</label>
						<input type="text" class="form-control"
							id="frcsEmpNm" name="frcsEmpNm" value="">
							
					</div>
					<div class="col-md-3">
					<select id="frcsNo" name="frcsNo" class="select-col-md-3">
						<option value="" selected>가맹점을 선택해주세요</option>
						<c:forEach var="franchiseVO" items="${franchiseVOList}">
							<option value="${franchiseVO.frcsNo}">${franchiseVO.frcsNm}</option>
						</c:forEach>
					</select>
					</div>
					
					<div class="col-md-3">
					<select id="frcsEmpWkstCd" name="frcsEmpWkstCd" class="select-col-md-3">
						<option value="" selected>근무 상태 정보</option>
						<c:forEach var="comDetCodeInfoVO" items="${comDetCodeInfoVOList}">
							<option value="${comDetCodeInfoVO.comDetCode}">${comDetCodeInfoVO.comDetCodeNm}</option>
						</c:forEach>
					</select>
					</div>
					
					<div class="col-md-3">
					<select id="frcsEmpTypeCd" name="frcsEmpTypeCd" class="select-col-md-3">
					
						<option value="" selected>근무 타입 정보</option>
						<c:forEach var="comDetCodeInfoVO" items="${comDetCodeInfoVOList2}">
							<option value="${comDetCodeInfoVO.comDetCode}">${comDetCodeInfoVO.comDetCodeNm}</option>
						</c:forEach>
					</select>
					</div>
					
					<div class="col-md-3">
						<label for="frcsEmpBrdt" class="form-label">생일</label>
						<input type="date" class="form-control"
							id="frcsEmpBrdt" name="frcsEmpBrdt" value="">
					</div>
					
					<div class="col-md-3">
						<label for="frcsEmpTel" class="form-label">연락처</label>
						<input type="text" class="form-control"
							id="frcsEmpTel" name="frcsEmpTel" value="">
					</div>
					
					<div class="col-md-3">
						<label for="frcsEmpSal" class="form-label">급여</label>
						<input type="number" class="form-control"
							id="frcsEmpSal" name="frcsEmpSal" value="">
					</div>
					
					<div class="time-mb-3">
					<div class="col-md-3">
						<label for="frcsEmpStrTime" class="form-label">출근 시간</label>
						<input type="time" class="form-control" id="frcsEmpStrTime" name="frcsEmpStrTime" value="">
					</div>
					
					<div class="col-md-3">
						<label for="frcsEmpEndTime" class="form-label">퇴근 시간</label>
						<input type="time" class="form-control" id="frcsEmpEndTime" name="frcsEmpEndTime" value="">
					</div>
					</div>
					
<!-- 					<div class="mb-3"> -->
						
<!-- 					</div> -->
					
					<div class="mb-3">
						<label for="atchFileNo" class="form-label">프로필 사진</label>
						<input type="file" class="form-control"
							id="uploadFile" name="uploadFile" value="">
					</div>
					
<!-- 					<div class="mb-3"> -->
					<button type="submit" class="btn btn-primary" style="width:25%;">등록</button>
<!-- 					</div> -->
				<sec:csrfInput/>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
// 	$(function() {	
// 		//파일 다운로드 시작////////////////////////
// 		$("#atchFileId").on("click",function(){
// 			let streFileNm = "${entRelorStandVO.atchFileDetailVOList[0].streFileNm}";
			
// 			console.log("streFileNm : " + streFileNm);
			
// 			//<iframe id="ifrm" src="" style="display:none;"></iframe>
// 			$("#ifrm").attr("src","/download?fileName=/"+streFileNm);
// 		});
// 		//파일 다운로드 끝////////////////////////
		
// 		//이미지 미리보기 시작 //////////////////////
// 		$("#uploadFile").on("change", fileSelected);

// 		//e : onchange 이벤트 객체
// 		function fileSelected(e) {
// 			let files = e.target.files;
// 			//이미지 오브젝트 배열
// 			let fileArr = Array.prototype.slice.call(files);

// 			//fileArr : 파일들 -> f : 파일
// 			fileArr.forEach(function(f) {
// 				if (!f.type.match("image.*")) {
// 					alert("이미지 확장자만 가능합니다.");
// 					return;
// 				}

// 				let reader = new FileReader();
// 				//e : 리더가 이미지 읽을 때 이벤트
// 				reader.onload = function(e) {
// 					$("#atchFileId").attr("src", e.target.result);
// 				}
// 				reader.readAsDataURL(f);
// 			});
// 		}
// 		//이미지 미리보기 끝 //////////////////////
// 	});
</script>




















