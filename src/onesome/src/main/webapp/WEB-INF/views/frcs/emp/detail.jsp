<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<style>
img.rounded-circle.border {
	border-radius: 50%;
}

#emp-detail-image {
	border-radius: 50%;
}

#edit {
	margin-right: 7px;
}

#ok {
	margin-right: 7px;
}

.card-body p-4 {
	display: flex;
	justify-content: center;
}
</style>

<script type="text/javascript">
	$(function() {

		/* 이거 뭐징? */
		let streFileNm = "${data.atchFileVOList[0].streFileNm}";

		//클래스 값이 form-control인 요소를 선택하여 disabled 처리해보자
		$(".form-control").attr("disabled", "disabled");
		$(".form-control-health").attr("disabled", "disabled");
		$(".form-control-career").attr("disabled", "disabled");
		$("#spnHealth3").css("display", "none");
		$("#spnCareer2").css("display", "none");

		//$(".form-control-health").css("display", "none");

		//수정버튼 클릭 -> 수정 모드 전환
		$("#edit").on("click", function() {

			//id속성의 값이 spn1인 요소를 보이지 않도록 하고
			$("#spn1").css("display", "none");
			//id속성의 값이 spn2인 요소를 보이도록 하자
			$("#spn2").css("display", "block");
			$(".form-control-health").css("display", "block");
			//클래스 값이 form-control인 요소를 선택하여 disabled속성을 제거하자
			$(".form-control").removeAttr("disabled");
			//id속성의 값이 frm인 요소(form태그)의 action속성의 값을 /frcs/emp/update로 바꾸자
			$("#frm").attr("action", "/frcs/emp/update");
		});

		//삭제버튼 클릭
		$("#delete").on("click", function() {
			//id속성의 값이 frm인 요소(form태그)의 action속성의 값을 /frcs/emp/delete로
			$("#frm").attr("action", "/frcs/emp/delete");
			//삭제하시겠습니까? confirm 처리
			//true(1) / false(0)
			//확인 선택 시 form을 submit
			if (confirm("해당 직원 정보를 삭제하시겠습니까?")) {
				$("#frm").submit();
			} else {
				//취소 선택 시
				alert("삭제가 취소되었습니다.");
			}
		});

		//보건증 등록버튼 클릭 -> 등록 모드 전환
		$("#insertHealth").on("click", function() {
			//id 속성의 값이 spnHealth1인 요소를 보이지 않도록 하고
			$("#spnHealth1").css("display", "none");
			//id속성의 값이 spnHealth2인 요소를 보이도록
			$("#spnHealth3").css("display", "block");
			//클래스 값이 form-control-health인 요소를 선택하여 disabled속성을 제거하자
			$(".form-control-health").removeAttr("disabled");
		})

		//이력서 등록버튼 클릭 -> 등록 모드 전환
		$("#insertCareer").on("click", function() {
			//id 속성의 값이 spnCareer1인 요소를 보이지 않도록 하고
			$("#spnCareer1").css("display", "none");
			//id속성의 값이 spnCareer2인 요소를 보이도록
			$("#spnCareer2").css("display", "block");
			//클래스 값이 form-control-health인 요소를 선택하여 disabled속성을 제거하자
			$(".form-control-career").removeAttr("disabled");
		})

		//$(".bg-register-image").css({"background-image":"url(/resources/upload/"+streFileNm+")","background-position":"center","background-size":"cover"});

	});
</script>



<%-- ${data} --%>
<div class="container-fluid">
	<div
		class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">

	</div>

	<div class="card">

		<!--////////// 상단 탭 시작 //////////-->
		<ul class="nav nav-pills user-profile-tab" id="pills-tab"
			role="tablist">
			<li class="nav-item" role="presentation">
				<button
					class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-4 active"
					id="pills-account-tab" data-bs-toggle="pill"
					data-bs-target="#pills-account" type="button" role="tab"
					aria-controls="pills-account" aria-selected="true">
					<i class="ti ti-user-circle me-2 fs-6"></i> <span
						class="d-none d-md-block">직원정보</span>
				</button>
			</li>
			<li class="nav-item" role="presentation">
				<button
					class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-4"
					id="pills-notifications-tab" data-bs-toggle="pill"
					data-bs-target="#pills-notifications" type="button" role="tab"
					aria-controls="pills-notifications" aria-selected="false"
					tabindex="-1">
					<i class="ti ti-article me-2 fs-6"></i> <span
						class="d-none d-md-block">이력서</span>
				</button>
			</li>
			<li class="nav-item" role="presentation">
				<button
					class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-4"
					id="pills-bills-tab" data-bs-toggle="pill"
					data-bs-target="#pills-bills" type="button" role="tab"
					aria-controls="pills-bills" aria-selected="false" tabindex="-1">
					<i class="ti ti-article me-2 fs-6"></i> <span
						class="d-none d-md-block">보건증</span>
				</button>
			</li>
		</ul>
		<!--////////// 상단 탭 끝 //////////-->

		<!--////////// 직원 상세 시작 //////////-->
		<div class="card-body">
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade active show" id="pills-account"
					role="tabpanel" aria-labelledby="pills-account-tab" tabindex="0">
					<form id="frm" name="frm" class="frcsEmpCreate"
						action="/frcs/emp/create" method="post"
						enctype="multipart/form-data">
						<div class="row">
							<div class="col-lg-6 d-flex align-items-stretch">
								<div class="card w-100 position-relative overflow-hidden">
									<div class="card-body p-4">
										<h5 class="card-title fw-semibold">프로필 사진</h5>
										<div class="text-center">
											<img id="emp-detail-img"
												src="/resources/upload/frcsEmp/${data.atchFileVOList[0].streFileNm}"
												alt="" class="img-fluid rounded-circle" width="270"
												height="270">
											<div
												class="d-flex align-items-center justify-content-center my-4 gap-3">
												<button class="btn btn-outline-danger">프로필 사진 변경</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card-body p-4">
								<h6 class="card-title fw-semibold">상세정보</h6>
								<br />
								<div class="row">
									<div class="col-lg-6">
										<div class="mb-4">
											<label for="exampleInputtext" class="form-label fw-semibold">이름</label>
											<input type="text" class="form-control" name="frcsEmpNm"
												id="frcsEmpNm" value="${data.frcsEmpNm}">
										</div>
										<div class="mb-4">
											<label for="exampleInputtext" class="form-label fw-semibold">연락처</label>
											<input type="text" class="form-control" name="frcsEmpTel"
												id="frcsEmpTel" value="${data.frcsEmpTel}">
										</div>
										<div class="mb-4">
											<label for="exampleInputtext1" class="form-label fw-semibold">출근
												시간</label> <input type="time" class="form-control"
												name="frcsEmpStrTime" id="frcsEmpStrTime"
												value="${data.frcsEmpStrTime}">
										</div>

										<c:set var="frcsEmpTypeCd">
											<c:choose>
												<c:when test="${data.frcsEmpTypeCd eq 'WKTP01'}">주간</c:when>
												<c:when test="${data.frcsEmpTypeCd eq 'WKTP02'}">야간</c:when>
												<c:when test="${data.frcsEmpTypeCd eq 'WKTP03'}">주말</c:when>
												<c:otherwise>매니저</c:otherwise>
											</c:choose>
										</c:set>

										<div class="mb-4">
											<label for="exampleInputtext2" class="form-label fw-semibold">근무
												타입</label> <input type="text" class="form-control"
												name="frcsEmpTypeCd" id="frcsEmpTypeCd"
												value="${frcsEmpTypeCd}">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="mb-4">
											<label for="exampleInputtext2" class="form-label fw-semibold">소속
												가맹점</label> <input type="text" class="form-control" name="frcsNm"
												id="frcsNm" value="">
										</div>
										<div class="mb-4">
											<label for="exampleInputtext2" class="form-label fw-semibold">생년월일</label>
											<input type="date" class="form-control" name="frcsEmpBrdt"
												id="frcsEmpBrdt" value="${data.frcsEmpBrdt}">
										</div>
										<div class="mb-4">
											<label for="exampleInputtext3" class="form-label fw-semibold">퇴근
												시간</label> <input type="time" class="form-control"
												name="frcsEmpEndTime" id="frcsEmpEndTime"
												value="${data.frcsEmpEndTime}">
										</div>
										<div class="mb-4">
											<label for="exampleInputtext2" class="form-label fw-semibold">급여</label>
											<input type="number" class="form-control" name="frcsEmpSal"
												id="frcsEmpSal" value="${data.frcsEmpSal}">
										</div>
										<div class="mb-4">
											<label for="exampleInputtext2" class="form-label fw-semibold"></label>
											<input type="hidden" class="form-control" name="frcsEmpNo"
												id="frcsEmpNo" value="${data.frcsEmpNo}">
										</div>
									</div>


									<!-- 일반 모드 시작 -->
									<span id="spn1">
										<div class="col-12">
											<div class="col-12">
												<div
													class="d-flex justify-content-between align-items-center">
													<div>
														<button type="button"
															class="btn mb-1 waves-effect waves-light btn-outline-secondary">
															<a href="/frcs/emp/list">직원 목록</a>
														</button>
													</div>
													<div>
														<button type="button" class="btn btn-primary" id="edit">수정</button>
														<button type="button"
															class="btn bg-danger-subtle text-danger" id="delete">삭제</button>
													</div>
												</div>
											</div>
										</div>
									</span>
									<!-- 일반 모드 끝 -->

									<!-- 수정 모드 시작 -->
									<div class="col-12">
										<span id="spn2" style="display: none;">
											<div class="d-flex justify-content-end align-items-center">
												<button type="submit" class="btn btn-primary" id="ok">확인</button>
												<a
													href="/frcs/emp/detail?frcsEmpNo=${franchiseEmployeeVO.frcsEmpNo}"
													class="btn bg-danger-subtle text-danger">취소</a>
											</div>
										</span>
									</div>
									<!-- 수정 모드 끝 -->

								</div>
								<sec:csrfInput />
					</form>
				</div>
			</div>
		</div>



		<div class="tab-pane fade" id="pills-notifications" role="tabpanel"
			aria-labelledby="pills-notifications-tab" tabindex="0">
			<!--@@@@@@@@@@-->
			<div class="row justify-content-center">
				<div class="col-lg-9">
					<div class="card" style="width: 800px;">
						<!-- 미리보기 구현 공간 -->
						<div
							style="display: flex; justify-content: center; margin-top: 1.5rem;">
							<embed
								src="/resources/upload/frcsEmpDcmnt/${franchiseDcmntVO.atchFileVOList[0].streFileNm}"
								width="700" height="700" type="application/pdf"
								onerror="this.onerror=null; this.src='/resources/image/logo_white.png';" />
						</div>
						<div class="card-body p-4"
							style="width: 700px; text-align: right;">
							<!-- 							<h4 class="fw-semibold mb-3">이력서 미리보기</h4> -->
							<!-- @@@@@@이력서 폼 추가하기@@@@@@ -->
							<form id="frmCareer" name="frm" class="frm"
								action="/frcs/emp/insertDcmnt" method="post"
								enctype="multipart/form-data">

								<div>
									<input type="hidden" class="form-control-career" name="frcsNo"
										id="frcsNoCareer" value="${data.frcsNo}">
								</div>
								<div>
									<input type="hidden" class="form-control-career"
										name="frcsEmpNo" id="frcsEmpNoCareer"
										value="${data.frcsEmpNo}">
								</div>
								<div>
									<input type="hidden" class="form-control-career"
										name="dcmntTypeCd" id="dcmntTypeCd" value="DCMNT01">
								</div>


								<!-- 이력서 일반 모드 시작 -->
								<span id="spnCareer1">
									<button type="button" id="insertCareer"
										class="btn waves-effect waves-light bg-primary-subtle text-primary font-medium"
										style="width: 25%;">이력서 등록</button>
									<a type="button" class="btn waves-effect waves-light bg-primary-subtle text-primary font-medium"
									style="width:25%;"
									href="/download?fileName=/frcsEmpDcmnt/${franchiseDcmntVO.atchFileVOList[0].streFileNm}">다운로드</a>


								</span>
								<!-- 이력서 일반 모드 끝 -->

								<!-- 이력서 등록 모드 시작 -->
								<div class="mb-3" id="spnCareer2">
									<button type="submit"
										class="btn waves-effect waves-light bg-primary-subtle text-primary font-medium"
										style="width: 25%;">이력서 등록</button>
									<label for="atchFileNo" class="form-label"></label> <input
										type="file" class="form-control-career" id="uploadFileCareer"
										name="uploadFile" value=""> <a
										href="/frcs/emp/detail?frcsEmpNo=${franchiseEmployeeVO.frcsEmpNo}"
										style="width: 25%;"
										class="btn waves-effect waves-light bg-primary-subtle text-primary font-medium">취소</a>
								</div>
								<!-- 이력서 등록 모드 끝 -->

								<sec:csrfInput />
							</form>
							<!-- @@@@@@이력서 폼 추가하기 끝@@@@@@ -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="pills-bills" role="tabpanel"
			aria-labelledby="pills-bills-tab" tabindex="0">
			<div class="row justify-content-center">
				<div class="col-lg-9">
					<div class="card" style="width: 800px;">
						<div
							style="display: flex; justify-content: center; margin-top: 1.5rem;">
							<!-- 미리보기 띄우는 것 -->
							<embed
								src="/resources/upload/frcsEmpDcmnt/${franchiseDcmntVO2.atchFileVOList[0].streFileNm}"
								width="700" height="700" type="application/pdf" />
						</div>
						<div class="card-body p-4"
							style="width: 700px; text-align: right;">

							<!--<h4 class="fw-semibold mb-3">보건증 미리보기</h4> -->
							<!-- @@@@@@이력서 폼 추가하기@@@@@@ -->

							<form id="frmHealth" name="frm" class="frm"
								action="/frcs/emp/insertDcmnt" method="post"
								enctype="multipart/form-data">

								<div>
									<input type="hidden" class="form-control-health" name="frcsNo"
										id="frcsNoHealth" value="${data.frcsNo}">
								</div>
								<div>
									<input type="hidden" class="form-control-health"
										name="frcsEmpNo" id="frcsEmpNoHealth"
										value="${data.frcsEmpNo}">
								</div>
								<div>
									<input type="hidden" class="form-control-health"
										name="dcmntTypeCd" id="dcmntTypeCd" value="DCMNT02">
								</div>



								<!-- 보건증 일반모드 시작  -->
								<span id="spnHealth1">
									<button type="button"
										class="btn waves-effect waves-light bg-primary-subtle text-primary font-medium"
										style="width: 25%; margin-top: 7px; margin-bottom: 7px; margin-right: 7px;"
										id="insertHealth">보건증 등록</button> <a type="button"
									class="btn waves-effect waves-light bg-primary-subtle text-primary font-medium"
									style="width: 25%;"
									href="/download?fileName=/frcsEmpDcmnt/${franchiseDcmntVO2.atchFileVOList[0].streFileNm}">다운로드</a>
								</span>
								<!-- 보건증 일반모드 끝  -->

								<!-- 보건증 등록모드 시작  -->
								<span id="spnHealth3">
									<div class="mb-3">
										<label for="atchFileNo" class="form-label"></label> <input
											type="file" class="form-control-health" id="uploadFileHealth"
											name="uploadFile" value="">
									</div>
									<button type="submit"
										class="btn waves-effect waves-light bg-primary-subtle text-primary font-medium"
										style="width: 25%; margin-top: 7px; margin-bottom: 7px; margin-right: 7px;">보건증
										등록</button> <a
									href="/frcs/emp/detail?frcsEmpNo=${franchiseEmployeeVO.frcsEmpNo}"
									style="width: 25%;"
									class="btn waves-effect waves-light bg-primary-subtle text-primary font-medium">취소</a>
								</span>
								<!-- 보건증 등록모드 끝  -->
								<sec:csrfInput />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!--////////// 직원 상세 끝 //////////-->






