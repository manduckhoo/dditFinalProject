<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<p>${inquirerVO}</p>
<div class="row">
            <div class="col-lg-12"  style="display: flex; justify-content: center;">
              <!-- ---------------------
                                                  start Person Info
                                              ---------------- -->
              <div class="card col-md-8">
                <div class="card-header text-bg-primary">
                  <h4 class="mb-0 text-white">가맹점주 생성</h4>
                  
                </div>
                <form action="/admin/FranChiseOwner/create" method="post" id="frm">
                  <div>
                    <div class="card-body" >
                      <h4>${inquirerVO.inqrNm}님</h4>
                      <br>
                  	  <input type="hidden" id="frcsOwnrNm" name="frcsOwnrNm" value="${inquirerVO.inqrNm}" />
                      <div class="row pt-">
                        <div class="col-md-10">
                          <div class="mb-3">
                            <label for="frcsOwnrEmail" class="control-label">이메일</label>
                            <input type="text" id="frcsOwnrEmail" name="frcsOwnrEmail" class="form-control" placeholder="이메일" value="${inquirerVO.inqrEmail}" readonly>
                            <small class="form-control-feedback">
                            </small>
                          </div>
                        </div>
                      </div>
                      <div class="row pt-">
                        <div class="col-md-10">
                          <div class="mb-3">
                            <label class="control-label">연락처</label>
                            <input type="text" class="form-control" id="frcsOwnrTel" name="frcsOwnrTel" placeholder="연락처" value="${inquirerVO.inqrTel}" readonly>
                            <small class="form-control-feedback">
                            </small>
                          </div>
                        </div>
                      </div>
                      <!--/row-->
                      <div class="row">
                        <div class="col-md-10">
                          <div class="mb-3">
                            <label for="frcsOwnrBrdt" class="control-label">생년 월일</label>
                            <input type="date" name ="frcsOwnrBrdt" id="frcsOwnrBrdt" class="form-control" required>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-5">
                          <div class="mb-3">
                            <label for="frcsOwnrZip" class="form-label">우편번호</label>
                            <div class="input-group">
                            <input type="text" class="form-control" id="frcsOwnrZip" name="frcsOwnrZip" placeholder="우편번호를 입력하세요"
                                   readonly required>
                            <button type="button" class="btn btn-secondary" id="findZipcodeBtn"
                                    onclick="openDaumPostcode()">우편번호 찾기
                            </button>
                       		 </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-10">
                          <div class="mb-6">
                           <label for="frcsOwnrAddr" class="form-label">기본주소</label>
                            <input type="text" class="form-control" id="frcsOwnrAddr" name="frcsOwnrAddr"
                                   placeholder="기본주소를 입력하세요" readonly required>
                          </div>
                        </div>
                        </div>
                      <div class="row">
                        <div class="col-md-5">
                          <div class="mb-3">
                            <label for="frcsOwnrDtlAddr" class="form-label">상세주소</label>
                            <input type="text" class="form-control" id="frcsOwnrDtlAddr" name="frcsOwnrDtlAddr"
                                   placeholder="상세주소를 입력하세요" required>
                          </div>
                        </div>
                        <div class="col-md-5">
                          <div class="mb-3">
                            <label for="ownerAddr3" class="form-label">참고 항목</label>
                            <input type="text" class="form-control" id="ownerAddr3">
                          </div>
                        </div>
                       </div>
                        <!--/span-->
                      </div>
                    <div class="form-actions" >
                      <div class="card-body border-top" id="submitDiv">
                        <button type="submit" class="btn btn-success rounded-pill px-4" id="submitBtn">
                          <div class="d-flex align-items-center" >
                            <i class="ti ti-device-floppy me-1 fs-4"></i>
                            저장
                          </div>
                        </button>
                        <button type="button" class="btn btn-danger rounded-pill px-4 ms-2 text-white">
                          취소
                        </button>
                      </div>
                    </div>
                  </div>
                  <sec:csrfInput />
                </form>
              </div>
 </div>
 </div>
<!-- 맨 위로가기(Top) -->
<a style="display:scroll; position:fixed; bottom:15px; right:15px;" href="#" title=Top>
<img src=/resources/image/스크롤사진.png border="0" style="width:40px; height:40px"/>
</a>
<!-- 맨 위로가기(Top) 코드 끝-->

<!-- Daum 우편번호 서비스 스크립트 추가 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>

$("#submitBtn").on("click", () => {

    $("#frm").submit();

    $("#submitDiv").html(
        `
    <button class="btn btn-primary" type="submit" disabled>
        <span class="spinner-border spinner-border-sm" aria-hidden="true"></span>
        <span role="status">Loading...</span>
    </button>
    `
    )
})
    // 우편번호 찾기 팝업 호출 함수
    function openDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
            	var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                	document.getElementById('ownerAddr3').value = extraAddr;
                
                } else {
                    document.getElementById("ownerAddr3").value = '';
                }
                // 선택한 주소를 폼에 반영
                document.getElementById('frcsOwnrZip').value = data.zonecode;
                document.getElementById('frcsOwnrAddr').value = data.address;
                document.getElementById('frcsOwnrDtlAddr').focus(); // 상세주소로 포커스 이동
            }
        }).open();
    }
</script>
