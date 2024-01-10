<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%-- <p>${FranchiseOwnerVO}</p> --%>
<script type="text/javascript">
$(document).on("click","#ownerCreate",function(){
		console.log("클릭")
		let result = confirm("가맹점을 생성하시겠습니까?");
		if(result>0){
			$("#form").attr("action","/admin/frcs/createForm");
			$("#form").attr("method", "post");
			$("#form").submit();
		}	
	})
	
</script>
<body>
<%-- <p>${inquirerVO}</p> --%>
<h4>${FranchiseOwnerVO.frcsOwnrNm}님 상세페이지</h4>
<div class="row" style="display: flex; justify-content: center;">
            <div class="col-8" >
              <div class="card">
                <form action="/admin/FranChiseOwner/update" id="form" method="post">
                	<input type="hidden" name="frcsOwnrNo" value="${FranchiseOwnerVO.frcsOwnrNo}">
                  <div class="card-body border-top">
                    <div class="row m-auto">
                      <div class="col-12">
                        <div class="mb-3">
                          <label for="frcsOwnrNm" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이름</font></font></label>
                          <input type="text" class="form-control" id="frcsOwnrNm" placeholder="이름을 입력해주세요" value="${FranchiseOwnerVO.frcsOwnrNm}" name="frcsOwnrNm" readonly required>
                        </div>
                      </div>
                      <div class="col-12">
                        <div class="mb-3">
                          <label for="frcsOwnrTel" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">연락처</font></font></label>
                          <input type="text" class="form-control" id="frcsOwnrTel" placeholder="010-1111-1111 형식입니다." value="${FranchiseOwnerVO.frcsOwnrTel}" name="frcsOwnrTel" readonly required>
                        </div>
                      </div>
                      <div class="col-12">
                        <div class="mb-3">
                          <label for="frcsOwnrEmail" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이메일</font></font></label>
                          <input type="email" class="form-control" id="frcsOwnrEmail" placeholder="이메일을 입력해주세요" value="${FranchiseOwnerVO.frcsOwnrEmail}" name="frcsOwnrEmail" readonly required>
                        </div>
                      </div>
                      <div class="col-6">
                        <div class="mb-6">
                          <label for="frcsOwnrZip" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">우편 번호</font></font></label>
                          <div class="input-group">
	                          <input type="text" class="form-control" id="frcsOwnrZip" placeholder="우편번호를 입력해주세요" value="${FranchiseOwnerVO.frcsOwnrZip}" name="frcsOwnrZip" readonly required>
	                          <button type="button" class="btn btn-secondary" id="findZipcodeBtn" onclick="openDaumPostcode()" style="display:none">우편번호 찾기</button>
                           </div>
                        </div>
                      </div>
                      <div class="col-12">
                        <div class="mb-3">
                          <div class="mb-3">
                            <label for="frcsOwnrAddr" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">기본주소</font></font></label>
                            <input type="text" class="form-control" id="frcsOwnrAddr" value="${FranchiseOwnerVO.frcsOwnrAddr}" name="frcsOwnrAddr" readonly required>
                          </div>
                          <div class="mb-3">
                            <label for="frcsOwnrDtlAddr" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상세주소</font></font></label>
                            <input type="text" class="form-control" id="frcsOwnrDtlAddr" value="${FranchiseOwnerVO.frcsOwnrDtlAddr}" name="frcsOwnrDtlAddr" readonly required>
                          </div>
                        </div>
                      </div>
                      <div class="col-12">
                        <div class="mb-3">
                          <label class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">활성 유무</font></font></label>
                          <div class="form-check">
                            <div class="form-check">
								<input type="radio" class="form-check-input" id="customControlValidation2" name="enabled" value="1" readonly required <c:if test="${FranchiseOwnerVO.enabled == '1'}">checked</c:if>>
                              <label class="form-check-label" for="enabled"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">유</font></font></label>
                            </div>
                          </div>
                          <div class="form-check">
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="customControlValidation3" name="enabled" value="0" readonly required <c:if test="${FranchiseOwnerVO.enabled == '0'}">checked</c:if>>
                              <label class="form-check-label" for="customControlValidation3"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">무</font></font></label>
                            </div>
                          </div>
                         </div>

                    </div>
                  </div>
                  </div>
                  <div class="p-3 border-top">
                    <div class="d-md-flex align-items-center">
                      <div class="action-form">
                      
                      <!--수정 버튼 클릭  -> 수정모드 전환  -->
                        <div class="text-center" id="btnGroup">
                          <button type="button" id="edit" class="btn btn-info rounded-pill px-4 waves-effect waves-light"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">수정
                          </font></font></button>
                          <button type="button" onclick="location.href='/admin/FranChiseOwner/list'" class="btn btn-dark rounded-pill px-4 waves-effect waves-light"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">목록
                          </font></font></button>
                        </div>
                        <!--수정 버튼 클릭시  -->
                        <div class="text-center" id="btnGroup2" style="display:none;">
                          <button type="submit" id="update" class="btn btn-info rounded-pill px-4 waves-effect waves-light"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">확인
                          </font></font></button>
                          <button type="button" onclick="location.href='/admin/FranChiseOwner/detail?frcsOwnrNo=${FranchiseOwnerVO.frcsOwnrNo}'" class="btn btn-dark rounded-pill px-4 waves-effect waves-light"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">취소
                          </font></font></button>
                        </div>
                      </div>
                      <div class="ms-auto">
                        <div class="btn-group">
                          <button type="button" class="btn btn-info rounded-pill px-4 waves-effect waves-light" data-value="Y"  id="ownerCreate">
                            <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">가맹점 생성
                          </font></font></button>
                        </div>
                        </div>
                      </div>
                    </div>
                  <sec:csrfInput />
                </form>
                  </div>
              </div>
            </div>

<!-- Daum 우편번호 서비스 스크립트 추가 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>

//수정 클릭시 버튼 변환
$("#edit").on("click",function(){
	$("#btnGroup").css("display","none");
	$("#btnGroup2").css("display","block");
	$("#findZipcodeBtn").css("display","block");
	$("input").prop("readonly", false);
	
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
                // 선택한 주소를 폼에 반영
                document.getElementById('frcsOwnrZip').value = data.zonecode;
                document.getElementById('frcsOwnrAddr').value = data.address;
                document.getElementById('frcsOwnrDtlAddr').focus(); // 상세주소로 포커스 이동
            }
        }).open();
    }
</script>
          