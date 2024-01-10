<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(document).on("click","#confirm",function(){
	let value =$(this).data("value");
	let a = ${inquirerVO.inqrNo};
	let data = {
			"inqrStatusYn":value,
			"inqrNo":a
	}
	
	$.ajax({
		url :"/admin/inqr/status",
		method : "post",
		contentType:"application/json;charset:utf-8;",
		data : JSON.stringify(data),
		dataType : "json",
		beforeSend:function(xhr){ 
               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}"); }
              
	}).done((rst) => {
		console.log(rst);
    	alert("승인 처리 되었습니다.")
    	location.href="/admin/inqr/list";
	}).fail((xhr)=>{
		console.log(xhr);

	})
	
})

$(document).on("click","#refuse",function(){
	let value =$(this).data("value");
	let inqrNo = ${inquirerVO.inqrNo};

	let data = {
			"inqrStatusYn":value,
			"inqrNo":inqrNo
	}
	
	$.ajax({
		url :"/admin/inqr/status",
		method : "post",
		contentType:"application/json;charset:utf-8;",
		data : JSON.stringify(data),
		dataType : "json",
		beforeSend:function(xhr){ 
               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}"); },
        success : function(rst){
        	alert("거절 처리 되었습니다.")	
        	location.href="/admin/inqr/list";
        }        
	})
	
})

$(document).on("click","#ownerCreate",function(){
		console.log("클릭")
		let result = confirm("점주를 생성하시겠습니까?");
		if(result>0){
			$("#form").attr("action","/admin/FranChiseOwner/createForm");
			$("#form").attr("method", "post");
			$("#form").submit();
		}	
	})
</script>
<body>
<%-- <p>${inquirerVO}</p> --%>
<div class="row" style="display: flex; justify-content: center;">
            <div class="col-8" >
              <!-- ---------------------
                                  start Event Registration
                              ---------------- -->
              <div class="card">
                <form action="/admin/inqr/update" method="post" id="form">
                	<input type="hidden" name="inqrNo" value="${inquirerVO.inqrNo}">
                	<input type="hidden" name="inqrStatusYn" value="${inquirerVO.inqrStatusYn}">
                  <div class="card-body border-top">
                    <div class="row m-auto">
                      <div class="col-12">
                        <div class="mb-3">
                          <label for="fname3" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이름</font></font></label>
                          <input type="text" class="form-control" id="fname3" placeholder="성명은 여기에" value="${inquirerVO.inqrNm}" name="inqrNm">
                        </div>
                      </div>
                      <div class="col-12">
                        <div class="mb-3">
                          <label for="title2" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">연락처</font></font></label>
                          <input type="text" class="form-control" id="title2" placeholder="010-1111-1111" value="${inquirerVO.inqrTel}" name="inqrTel">
                        </div>
                      </div>
                      <div class="col-12">
                        <div class="mb-3">
                          <label for="comname1" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">신청 일시</font></font></label>
                          <input type="text" class="form-control" id="comname1" placeholder="신청 시간" value="${inquirerVO.inqrReqDt}" name="inqrReqDt"/>
                        </div>
                      </div>
                      <div class="col-12">
                        <div class="mb-3">
                          <div class="mb-3">
                            <label for="email4" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이메일</font></font></label>
                            <input type="email" class="form-control" id="email4" placeholder="여기로 이메일을 보내세요" value="${inquirerVO.inqrEmail}" name="inqrEmail"/>
                          </div>
                        </div>
                      </div>
                       <div class="col-sm-12 ">
                        <div class="mb-3">
                          <label class="control-label col-form-label">창업 희망 지역</label>
                         <select class="form-select" name="inqrRgnlHope" >
						    <c:forEach var="region" items="${regions}">
						       <option value="${region}" <c:if test="${region eq inquirerVO.inqrRgnlHope}">selected</c:if>>${region}</option>
						   </c:forEach>
						</select>
                        </div>
                      </div>
                       <div class="col-12">
                        <div class="mb-3">
                          <label class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상가 유무</font></font></label>
                          <div class="form-check">
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="customControlValidation5" name="inqrStoreYn" value="Y"<c:if test="${inquirerVO.inqrStoreYn == 'Y'}">checked</c:if>>
                              <label class="form-check-label" for="customControlValidation5"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">유</font></font></label>
                            </div>
                          </div>
                          <div class="form-check">
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="customControlValidation4" name="inqrStoreYn" value="N"<c:if test="${inquirerVO.inqrStoreYn == 'N'}">checked</c:if>>
                              <label class="form-check-label" for="customControlValidation4"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">무</font></font></label>
                            </div>
                          </div>
                         </div>
                         </div>
                      <div class="col-12">
                        <div class="mb-3">
                          <div class="mb-3">
                            <label for="conno2" class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상가 주소</font></font></label>
                            <input type="text" class="form-control" id="conno2" placeholder="여기에 연락하지 마세요" value="${inquirerVO.inqrStoreAddr}" name="inqrStoreAddr">
                          </div>
                        </div>
                      </div>
  	                  <div class="col-sm-12 ">
                        <div class="mb-3">
                          <label class="control-label col-form-label">희망 금액</label>
							<select class="form-select" name="inqrExpctCost">
							    <c:forEach var="cost" items="${cnt}">
							      <option value="${cost}" <c:if test="${cost eq inquirerVO.inqrExpctCost}">selected</c:if>>${cost}</option>
							  </c:forEach>
							  <c:choose>
							      <c:when test="${inquirerVO.inqrExpctCost eq '100000000'}">
							          <option value="100000000" selected>1억</option>
							      </c:when>
							      <c:when test="${inquirerVO.inqrExpctCost eq '150000000'}">
							          <option value="150000000" selected>1.5억</option>
							      </c:when>
							      <c:when test="${inquirerVO.inqrExpctCost eq '200000000'}">
							          <option value="200000000" selected>2억</option>
							      </c:when>
							      <c:when test="${inquirerVO.inqrExpctCost eq '250000000'}">
							          <option value="250000000" selected>2.5억</option>
							      </c:when>
							      <c:when test="${inquirerVO.inqrExpctCost eq '300000000'}">
							          <option value="300000000" selected>3억</option>
							      </c:when>
							  </c:choose>
							</select>
                        </div>
                      </div>

                      <div class="col-12">
                        <div class="mb-3">
                          <label class="control-label col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">창업 경험 유무</font></font></label>
                          <div class="form-check">
                            <div class="form-check">
								<input type="radio" class="form-check-input" id="customControlValidation2" name="inqrStrtpXp" value="Y" <c:if test="${inquirerVO.inqrStrtpXp == 'Y'}">checked</c:if>>
                              <label class="form-check-label" for="customControlValidation2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">유</font></font></label>
                            </div>
                          </div>
                          <div class="form-check">
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="customControlValidation3" name="inqrStrtpXp" value="N" <c:if test="${inquirerVO.inqrStrtpXp == 'N'}">checked</c:if>>
                              <label class="form-check-label" for="customControlValidation3"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">무</font></font></label>
                            </div>
                          </div>
                         </div>
                         </div>
                          <div class="col-12">
                       
                      </div>
                        <div class="mb-3">
                          <label class="control-label col-form-label">비고</label>
                          <textarea class="form-control" id="exampleTextarea1" rows="2" placeholder="Comments Here" name = "inqrRm">${inquirerVO.inqrRm}</textarea>
                        </div>
                      
                    </div>
                  </div>
                  <div class="p-3 border-top">
                    <div class="d-md-flex align-items-center">
                      <div class="action-form">
                        <div class="text-center">
                          <button type="submit" class="btn btn-info rounded-pill px-4 waves-effect waves-light"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">저장
                          </font></font></button>
                          <button type="button" onclick="location.href='/admin/inqr/list'" class="btn btn-dark rounded-pill px-4 waves-effect waves-light"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">취소
                          </font></font></button>
                        </div>
                      </div>
                      <div class="ms-auto">
                      
                        <div class="btn-group">
                          <button type="button" class="btn btn-info dropdown-toggle" data-value="Y"  id="confirm">
                            <i class="ti ti-download fs-4"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">승인
                          </font></font></button>
                        </div>
                        <div class="btn-group">
<!--                           <input type="submit" value="생성" formaction="/admin/franchiseOwner/createForm"> -->
                          <button type="button" id="ownerCreate">생성</button>
                          <button type="button" class="btn btn-danger dropdown-toggle" data-value="N"  id="refuse">
                            <i class="ti ti-transition-right me-1 fs-4"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거절
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
</body>
</html>