<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/memJoin.css">

<!--  ================= 회원가입 [시작] ================= -->
<section class="mainSectionJoin">
    <div class="container mt-5">
        <h2 class="mb-4">Sign up</h2>
        <form action="/mem/join" method="post" id="join-frm">
            <div class="mb-3">
                <!-- 아이디 입력 -->
                <div class="col">
                    <label for="memId-input" class="form-label">아이디</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="memId-input" name="memId" placeholder="아이디를 입력하세요"
                               maxlength="20" required>
                        <button type="button" class="btn btn-secondary" id="checkMemId">중복확인</button>
                    </div>
                    <div id="checkId-result">알파벳과 숫자를 포함하여 4~20글자</div>
                    <br>

                    <!-- 비밀번호 입력/비밀번호 확인 -->
                    <div class="mb-3 row" id="passwordarea">
                        <!-- 비밀번호 입력 -->
                        <div class="col">
                            <label for="memPw" class="form-label">비밀번호</label>
                            <input type="password" id="memPw" class="form-control" name="memPw"
                                   placeholder="비밀번호" required>
                        </div>

                        <!-- 비밀번호 확인 -->
                        <div class="col">
                            <label for="password-check" class="form-label">비밀번호 확인</label>
                            <input type="password" class="form-control" id="password-check"
                                   placeholder="비밀번호 확인" maxlength="20" required disabled>
                        </div>
                    </div>
                    <div id="password-result">영문, 숫자, 특수문자 중 2가지 이상 조합하여 8자리 이상</div>
                    <br>

                    <!-- 이름 입력 -->
                    <div class="mb-3 row">
                        <div class="col">
                            <label for="memNm" class="form-label">이름</label>
                            <input type="text" class="form-control" id="memNm" name="memNm" placeholder="이름을 입력하세요"
                                   required>
                        </div>

                        <div class="col">
                            <label for="memNick" class="form-label">닉네임</label>
                            <input type="text" class="form-control" id="memNick" name="memNick"
                                   placeholder="닉네임을 입력하세요" required>
                        </div>
                    </div>
                    <div id="memNm-result"></div>
                    <!-- 연락처 입력 -->
                    <div class="mb-3" id="memTelArea">
                        <label for="memTel" class="form-label">연락처</label>
                        <div class="input-group">
                            <input type="tel" class="form-control" name="memTel" id="memTel"
                                   placeholder="연락처를 입력하세요( - 제외)"
                                   required>
                            <button type="button" class="btn btn-secondary" id="telCodeBtn">인증번호발송</button>
                        </div>
                        <br>
                    </div>
                    <div id="memTel-result"></div>

                    <!-- 이메일 입력 -->
                    <div class="mb-3">
                        <label for="memMail" class="form-label">이메일 주소</label>
                        <input type="email" class="form-control" id="memMail" name="memMail" placeholder="이메일을 입력하세요"
                               required>
                    </div>
                    <div id="memMail-result"></div>

                    <!-- 우편번호 입력 -->
                    <div class="mb-3">
                        <label for="memZip" class="form-label">우편번호</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="memZip" name="memZip" placeholder="우편번호를 입력하세요"
                                   readonly required>
                            <button type="button" class="btn btn-secondary" id="findZipcodeBtn"
                                    onclick="openDaumPostcode()">우편번호 찾기
                            </button>
                        </div>
                    </div>

                    <!-- 기본주소/상세주소 입력 -->
                    <div class="mb-3 row">
                        <!-- 기본주소 -->
                        <div class="col">
                            <label for="memAddr" class="form-label">기본주소</label>
                            <input type="text" class="form-control" id="memAddr" name="memAddr"
                                   placeholder="기본주소를 입력하세요" readonly required>
                        </div>
                        <!-- 상세주소 -->
                        <div class="col">
                            <label for="memAddr2" class="form-label">상세주소</label>
                            <input type="text" class="form-control" id="memAddr2" name="memAddr2"
                                   placeholder="상세주소를 입력하세요" required>
                        </div>
                    </div>

                    <!-- 생년월일 입력 -->
                    <div class="mb-3">
                        <label for="memBirth" class="form-label">생년월일</label>
                        <input type="date" class="form-control" id="memBirth" name="memBirth" required>
                    </div>
                    <br>
                    <hr>
                    <div align="end">
                        <!-- 가입하기 버튼 -->
                        <button type="button" class="btn btn-dark" id="join-btn">가입하기</button>
                        <button type="button" class="btn btn-outline-dark" id="joinCancle">취소</button>
                    </div>
                </div>
            </div>
            <sec:csrfInput/>
        </form>
    </div>
</section>
<!-- 맨 위로가기(Top) -->
<a style="position:fixed; bottom:30px; right:30px;" href="#" title=Top>
<img src=/resources/image/스크롤사진.png border="0" style="width:60px; height:60px; opacity:0.7;"/>
</a>
<!-- 맨 위로가기(Top) 코드 끝-->

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

<!--  ================= 회원가입 [끝] ================= -->

<script src="/resources/js/member/memJoin.js"></script>
</html>