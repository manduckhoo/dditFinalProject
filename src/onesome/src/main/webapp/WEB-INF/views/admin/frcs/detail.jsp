<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <p>${FranchiseVO}</p> --%>
<script type="text/javascript">
$(document).on("click","#ownerCreate",function(){
		console.log("클릭")
		let result = confirm("점주를 생성하시겠습니까?");
		if(result>0){
			$("#form").attr("action","/admin/frcs/createForm");
			$("#form").attr("method", "post");
			$("#form").submit();
		}	
	})
	
</script>
<body>
<p>${FranchiseVO}</p>
<br>
<p>${comdetVO}</p>
<h4>${FranchiseVO.frcsNm} 가맹점 상세페이지</h4>
<div class="row" style="display: flex; justify-content: center;">
            <div class="col-8" >
              <div class="card">
                <form action="/admin/frcs/detailUpdate" id="form" method="post">
                	<input type="hidden" name="frcsNo" value="${FranchiseVO.frcsNo}">
                  <div class="card-body border-top">
                    <div class="row m-auto">
                      <div class="col-12">
                        <div class="mb-3">
                          <label for="frcsNm" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이름</font></font></label>
                          <input type="text" class="form-control" id="frcsNm" placeholder="가맹점 이름을 입력해주세요" value="${FranchiseVO.frcsNm}" name="frcsNm" readonly required>
                        </div>
                      </div>
                      <div class="col-12">
                        <div class="mb-3">
                          <label for="frcsOwnrNm" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">점주</font></font></label>
                          <input type="text" class="form-control" id="frcsOwnrNm" value="${FranchiseVO.franchiseOwnerVO.frcsOwnrNm}" name="franchiseOwnerVO.frcsOwnrNm" readonly required>
                        </div>
                      </div>
                      <div class="col-12">
                        <div class="mb-3">
                          <label for="frcsTel" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">가맹점 전화번호</font></font></label>
                          <input type="text" class="form-control" id="frcsTel" value="${FranchiseVO.frcsTel}" name="frcsTel" readonly required>
                        </div>
                      </div>
                      <div class="col-7">
                        <div class="mb-6">
                          <label for="frcsOwnrZip" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">우편 번호</font></font></label>
                          <div class="input-group">
	                          <input type="text" class="form-control" id="frcsPostNo" placeholder="우편번호를 입력해주세요" value="${FranchiseVO.frcsPostNo}" name="frcsPostNo" readonly required>
	                          <button type="button" class="btn btn-secondary" id="findZipcodeBtn" onclick="openDaumPostcode()" style="display:none">우편번호 찾기</button>
                           </div>
                        </div>
                      </div>
                      <br>
                      <div class="col-12">
                        <div class="mb-12">
                          <div class="mb-3">
                            <label for="frcsAddr" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">기본주소</font></font></label>
                            <input type="text" class="form-control" id="frcsAddr" value="${FranchiseVO.frcsAddr}" name="frcsAddr" readonly required>
                          </div>
                          <div class="mb-3">
                            <label for="frcsDtlAddr" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상세주소</font></font></label>
                            <input type="text" class="form-control" id="frcsDtlAddr" value="${FranchiseVO.frcsDtlAddr}" name="frcsDtlAddr" readonly required>
                          </div>
                        </div>
                      </div>
                       <div class="col-12">
                        <div class="mb-3">
                          <label for="frcsBsnsStrtTm" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">영업 시작 시간</font></font></label>
                          <input type="time" class="form-control" id="frcsBsnsStrtTm" value="${FranchiseVO.frcsBsnsStrtTm}" name="frcsBsnsStrtTm" readonly required>
                        </div>
                      </div>
                       <div class="col-12">
                        <div class="mb-3">
                          <label for="frcsBsnsEndTm" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">영업 종료 시간</font></font></label>
                          <input type="time" class="form-control" id="frcsBsnsEndTm" value="${FranchiseVO.frcsBsnsEndTm}" name="frcsBsnsEndTm" readonly required>
                        </div>
                      </div>
                       <div class="col-12">
                        <div class="mb-3">
                          <label for="frcsCpctPsn" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">가맹점 수용 인원</font></font></label>
                          <input type="text" class="form-control" id="frcsCpctPsn" value="${FranchiseVO.frcsCpctPsn}" name="frcsCpctPsn" readonly required>
                        </div>
                      </div>
                       <div class="col-12">
                        <div class="mb-3">
                          <label for="frcsCtrtCnclsDt" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">계약 체결 일자</font></font></label>
                          <input type="date" class="form-control" id="frcsCtrtCnclsDt" value='<fmt:formatDate value="${FranchiseVO.frcsCtrtCnclsDt}" pattern="yyyy-MM-dd"/>' name="frcsCtrtCnclsDt" readonly required>
                        </div>
                      </div>
                       <div class="col-12">
                        <div class="mb-3">
                          <label for="frcsEndDt" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">계약 만료 일자</font></font></label>
                          <input type="date" class="form-control" id="frcsEndDt" value='<fmt:formatDate value="${FranchiseVO.frcsEndDt}" pattern="yyyy-MM-dd"/>' name="frcsEndDt" readonly >
                        </div>
                      </div>
                       <div class="col-12">
                        <div class="mb-3">
                          <label for="frcsExptCmplDt" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">예상 완공일</font></font></label>
                          <input type="date" class="form-control" id="frcsExptCmplDt" value='<fmt:formatDate value="${FranchiseVO.frcsExptCmplDt}" pattern="yyyy-MM-dd"/>'  name="frcsExptCmplDt" readonly >
                        </div>
                      </div>
                       <div class="col-12">
                        <div class="mb-3">
                          <label for="frcsFnlInspDt" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">최종 점검일자</font></font></label>
                          <input type="date" class="form-control" id="frcsFnlInspDt"  value='<fmt:formatDate value="${FranchiseVO.frcsFnlInspDt}" pattern="yyyy-MM-dd"/>'  name="frcsFnlInspDt" readonly >
                        </div>
                      </div>
                       <div class="col-12">
                        <div class="mb-3">
                          <label for="frcsOpngDt" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">개점 일자</font></font></label>
                          <input type="date" class="form-control" id="frcsOpngDt"  value='<fmt:formatDate value="${FranchiseVO.frcsOpngDt}" pattern="yyyy-MM-dd"/>'  name="frcsOpngDt" readonly >
                        </div>
                      </div>
                       <div class="col-12">
                        <div class="mb-3">
                          <label for="frcsStsCd" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">운영 상태</font></font></label>
                          <select class="form-select" name="frcsStsCd" id="frcsStsCd" disabled required>
							    <c:forEach var="comDetVO" items="${comDetVO}">
							      <option value="${comDetVO.comDetCode}" <c:if test="${comDetVO.comDetCode eq FranchiseVO.frcsStsCd}">selected</c:if>>${comDetVO.comDetCodeNm}</option>
							  </c:forEach>
							</select>
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
                          <button type="button" onclick="location.href='/admin/frcs/list'" class="btn btn-dark rounded-pill px-4 waves-effect waves-light"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">목록
                          </font></font></button>
                        </div>
                        <!--수정 버튼 클릭시  -->
                        <div class="text-center" id="btnGroup2" style="display:none;">
                          <button type="submit" id="update" class="btn btn-info rounded-pill px-4 waves-effect waves-light"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">확인
                          </font></font></button>
                          <button type="button" onclick="location.href='/admin/frcs/detail?frcsNo=${FranchiseVO.frcsNo}'" class="btn btn-dark rounded-pill px-4 waves-effect waves-light"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">취소
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
	$("select").prop("disabled", false);
	
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
          