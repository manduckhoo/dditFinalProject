<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>

<!-- 로그인 정보에 담긴 memberVO 꺼내오기 -->
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memberVO"/>
</sec:authorize>

<div class="container-fluid">
	<div class="card-body px-4 py-4">
		<div class="row align-items-center">
			<div class="col-12">
				<nav class="breadcrumb" aria-label="breadcrumb">
					<nav aria-label="breadcrumb"
						style="margin-top: 30px; margin-left: -20px;">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
							<li class="breadcrumb-item"><a href="/mem/mypage"><b>마이페이지</b></b></a></li>
							<li class="breadcrumb-item active" aria-current="page"
								style="color: #d50037"><b>내 정보</b></li>
						</ol>
					</nav>
				</nav>
			</div>
		</div>
	</div>
	
	<!-- ----------- 내 정보 시작 ----------- -->
	<div class="card shadow-none">
		<div class="row align-items-center">
			<h2 class="sub-tit-name" style="font-weight: bold; font-size: 34px; margin-bottom: 20px;">내 정보</h2>
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active" id="pills-account"
					role="tabpanel" aria-labelledby="pills-account-tab" tabindex="0">
					<div class="row">
						<div class="col-lg-6 d-flex align-items-stretch">
							<div class="card w-100 position-relative overflow-hidden">
								<div class="card-body p-4">
									<h5 class="card-title fw-semibold">로그인 정보</h5>
									<p class="card-subtitle mb-4"></p>
									<!-- 아이디 -->
									<div class="mb-4">
										<label for="exampleInputtext"
											class="form-label fw-semibold">아이디</label>
											<span style="color:navy; margin-left:5px;">(수정불가)</span>
											<input type="text" class="form-control" id="exampleInputtext"
											value="${memberVO.memId}" readonly/>
									</div>
									<!-- 이름 -->
									<div class="mb-4">
										<label for="exampleInputtext2"
											class="form-label fw-semibold">이름</label>
											<span style="color:navy; margin-left:5px;">(수정불가)</span>
											<input type="text" class="form-control" id="exampleInputtext2"
											value="${memberVO.memNm}" readonly>
									</div>
									<!-- 닉네임 -->
									<div class="mb-4">
										<label for="exampleInputtext"
											class="form-label fw-semibold">닉네임</label> <input
											type="text" class="form-control" id="exampleInputtext"
											value="${memberVO.memNick}" />
									</div>
								</div>
							</div>
						</div>
						
						<!-- ----------- 비밀번호 변경 ----------- -->
						<div class="col-lg-6 d-flex align-items-stretch">
							<div class="card w-100 position-relative overflow-hidden">
								<div class="card-body p-4">
									<h5 class="card-title fw-semibold">비밀번호 변경</h5>
									<p class="card-subtitle mb-4"></p>
									<form>
										<div class="mb-4">
											<label for="exampleInputPassword1"
												class="form-label fw-semibold">현재 비밀번호</label>
												<input type="password" class="form-control"
												id="exampleInputPassword1" value="">
										</div>
										<div class="mb-4">
											<label for="exampleInputPassword2"
												class="form-label fw-semibold">새 비밀번호 입력</label>
											<span style="color:navy; margin-left:5px;">(영문, 숫자, 특수문자 중 2가지 이상 조합하여 8자리 이상 입력)</span>
											<input
												type="password" class="form-control"
												id="exampleInputPassword2" value="">
										</div>
										<div class="mb-4">
											<label for="exampleInputPassword3"
												class="form-label fw-semibold">새 비밀번호 확인</label> <input
												type="password" class="form-control"
												id="exampleInputPassword3" value="">
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- ----------- 세부 정보 ----------- -->
						<div class="col-12">
							<div class="card w-100 position-relative overflow-hidden mb-0">
								<div class="card-body p-4">
									<h5 class="card-title fw-semibold">세부 정보</h5>
									<p class="card-subtitle mb-4"></p>
									<form>
										<div class="row">
											<div class="col-lg-6">
												<!-- 연락처 -->
												<div class="mb-4">
													<label for="exampleInputtext3"
														class="form-label fw-semibold">연락처</label> <input
														type="text" class="form-control" id="exampleInputtext3"
														value="${memberVO.memTel}">
												</div>
												<!-- 회원가입일 -->
												<div class="mb-4">
													<label for="exampleInputtext3" class="form-label fw-semibold">회원가입일</label> 
														<span style="color:navy; margin-left:5px;">(수정불가)</span>
														<input type="text" class="form-control" id="exampleInputtext3"
														value='<fmt:formatDate value="${memberVO.memJoinDt}" pattern="yyy. MM. dd (E)"/>' readonly/>
												</div>
											</div>
											<div class="col-lg-6">
												<!-- 이메일 -->
												<div class="mb-4">
													<label for="exampleInputtext1"
														class="form-label fw-semibold">Email</label> <input
														type="email" class="form-control" id="exampleInputtext1"
														value="${memberVO.memMail}">
												</div>
												<!-- 생년월일 -->
												<div class="mb-4">
													<label for="exampleInputtext"
														class="form-label fw-semibold">생년월일</label> <input
														type="Date" class="form-control" id="exampleInputtext"
														value="${memberVO.memBirth}" />
												</div>
											</div>
												<!-- 기본 주소 -->
												<div class="col-6">
													<label for="exampleInputtext4"
														class="form-label fw-semibold">기본주소</label> <input
														type="text" class="form-control" id="memAddr"
														value="${memberVO.memAddr}">
												</div>
												<!-- 우편번호 입력 -->
												<div class="col-4">
													<label for="exampleInputtext4"
														class="form-label fw-semibold">우편번호 입력</label> <input
														type="text" class="form-control" id="memZip"
														value="${memberVO.memZip}">
												</div>
												<!-- 우편번호 찾기 버튼 -->
												<div class="col-2" style="display: flex; align-items: flex-end;">
													<button type="button" class="btn btn-dark btn" id="findZipcodeBtn" 
													onclick="openDaumPostcode()">우편번호 찾기</button>
												</div>
												
											<div class="col-12">
												<!-- 상세주소  -->
												<br>
												<div class="">
													<label for="exampleInputtext4"
														class="form-label fw-semibold">상세주소</label> <input
														type="text" class="form-control" id="memAddr2"
														value="${memberVO.memAddr2}">
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							<!-- 회원탈퇴, 저장, 취소 버튼 -->
							<div class="d-flex align-items-center justify-content-end mt-4 gap-3">
								<button type="button" class="btn btn-outline-dark btn-sm" style="margin-right: auto;">회원탈퇴</button>
								<button type="submit" class="btn btn-primary">저장</button>
								<button type="reset" class="btn bg-danger-subtle text-danger">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Daum 우편번호 서비스 스크립트 추가 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
    // 우편번호 찾기 팝업 호출 함수
    function openDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 선택한 주소를 폼에 반영
                document.getElementById('memZip').value = data.zonecode;
                document.getElementById('memAddr').value = data.address;
                document.getElementById('memAddr2').focus(); // 상세주소로 포커스 이동
            }
        }).open();
    }
</script>
</html>