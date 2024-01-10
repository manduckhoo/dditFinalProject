<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/memInquirer.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  // 전화번호 정규식 
 
  const autoHyphen = (target) => {
    let phoneNumber = target.value.replace(/[^0-9]/g, '');

    // 최대 11자리까지만 허용
    phoneNumber = phoneNumber.slice(0, 11);
    target.value = phoneNumber
      .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
  };
  
  function addressSum(){
	  var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	  var email_id =$("#email_id").val();
	  var email_domain =$("#email_domain").val();
	  var mail ="";
	  
		var langSelect = $("#email_domain option:selected").val();
		
		console.log(langSelect);
		//이메일 도메일 직접입력 선택시
		if(langSelect !=="change"){
		
		  if(!email_id){
		      alert("이메일을 입력해주세요");
		    $("#email_id").focus();
		    return false;
		  }
		  
		  if(!email_domain){
		      alert("도메인을 입력해주세요");
		    $("#email_domain").focus();
		    return false;
		  }
		  
		  mail = email_id+"@"+email_domain;
		  $("#inqrEmail").val(mail);  
		  
		  if(!email_rule.test(mail)){
		      alert("이메일을 형식에 맞게 입력해주세요.");
		    return false;
		  }
	
	}
	
	  //버튼클릭시 주소 + 상세주소
	  var address =$("#address").val();
	  var addressDetail = $("#detailAddress").val();
	  var inqrStoreAddr = address+addressDetail;
	  $("#inqrStoreAddr").val(inqrStoreAddr);
	  console.log(mail);
	  console.log(inqrStoreAddr);
}



function DaumPostcode(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
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
                
                } else {
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
    
function changeSelect(){
	//이메일 도메인 값을 받아옴
	var langSelect = $("#email_domain option:selected").val();
	
	var email = $("#email");
	console.log("호잇")
	console.log(langSelect);
	if(langSelect=="change"){
		email.css("display", "block");
			
	}else{
		email.css("display", "none");
	}	
}

$(document).ready(function () {
	$(".store").on("change", function (){
	    var address = $("#addr");
	    console.log("Selected value:", $(this).val());
	
	    if ($(this).val() === "N"){
	    	console.log("N다");
	    	address.css("display", "none");
	    } else {
	    	console.log("Y다");
	    	address.css("display", "block");
	    }
	})
});

	//초기화 버튼 클릭시 실행함수
	function fn_cancel(){
		var form = document.getElementById('counselApplyF');
		
		if(confirm("초기화 하시겠습니까?")){
			form.reset();
			location.reload();
		}
	}
	
	// 확인 버튼 클릭시 실행함수
	function fn_submit(){
		var form = document.getElementById('counselApplyF');
		var checkbox = document.getElementById('check01');
	
		if(!checkbox.checked){
			alert("약관에 동의해주세요")
		}else{
			if(confirm("창업 문의을 신청하시겠습니까?")){
				addressSum();
				form.submit();
				alert("신청이 완료되었습니다.")
			}
		}
	}
	
	//연락처 인증 함수
	function telCodeBtn(){
		alert("왔다")
		var tel = document.getElementById('inqrTel').value;
		
		console.log("연락처",tel);
	    
		var data = {
	    		recipientNumber : tel
	    }
	    var jsonData = JSON.stringify(data);
		console.log(jsonData);
		
		$.ajax({
	   	 	url: "/mem/inqr/phone",
	        type: "post",
	        dataType: "json",
	        data: jsonData,
	        beforeSend:function(xhr){
	            xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	       },
	        contentType: "application/json"
	    }).done((rst) => {
	        if (rst.stat === "ok") {
	            console.log("발송 성공");
	        }
	    }).fail((request, status, error) => {
	        alert("에러발생" + error);
	    });
	}

</script>
<div class="col-md-8 m-auto my-3">
	<nav class="breadcrumb" aria-label="breadcrumb"
		style="margin-top: 30px;">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
				<li class="breadcrumb-item"><a href="/mem/inqr/startInfo"><b>창업문의</b></b></a></li>
				<li class="breadcrumb-item active" aria-current="page"
					style="color: #d50037"><b>온라인 창업 신청</b></li>
			</ol>
		</nav>
	</nav>
	<h1 class="display-2 my-5">
		<b>가맹점 창업 문의</b>
	</h1>
	<div class="col-md-12">
		<!-- --------------------- start Tab with Underline ---------------- -->
		<div class="my-3">
			<div>
				<ul class="nav nav-underline" id="myTab" role="tablist">
					<li class="nav-item pe-4"><a class="nav-link " id="active-tab"
						 href="/mem/inqr/startInfo" 
						> <span><b>가맹점 개설 안내</b></span>
					</a></li>
					<li class="nav-item px-4"><a class="nav-link " id="active-tab1"
						 href="/mem/inqr/startExplan" > <span><b>창업
									설명회</b></span>
					</a></li>
					<li class="nav-item px-4"><a class="nav-link active"
						id="active-tab2"  href="/mem/inqr/storeStartupCounselApply" 
						> <span><b>온라인 창업 신청</b></span>
					</a></li>
					<li class="nav-item px-4"><a class="nav-link" id="link1-tab4"
						 href="/mem/inqr/storeFinanceProduct"> <span><b>가맹점
									전용 금융 상품</b></span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<br>
			<div>
				<!-- S : 본문 -->
				<div class="container">
					<form action="/inqr/createPost" method="post" id="counselApplyF"
						name="counselApplyF">
						<!-- S : 개인정보 수집동의 -->
						<fieldset>
							<section class="section-text mb120">
								<div class="title-wrap">
									<h2 class="title-h3" style="padding-top: 10px;">
										<strong>온라인창업상담신청 개인정보 수집동의</strong>
									</h2>
								</div>
								<div class="box-border box-border-terms p-4"
									style="border: 1px solid black">
									<dl>
										<dt>
											<strong>개인정보의 수집 및 이용 목적</strong>
										</dt>
										<dd>
											<ul class="dash-list m-1">
												<li>-가맹점 개설에 관한 상담 서비스 이용을 위한 본인 식별</li>
												<li>-상담내용전달, 점포오픈 관련 정보 안내, 의사 소통 경로 확보</li>
												<li>-기타 원활한 양질의 서비스 제공 등</li>
											</ul>
										</dd>
										<dt>
											<strong>수집하는 개인 정보 항목</strong>
										</dt>
										<dd class="m-1">-이름, 전화번호, 휴대폰번호, 주소, 창업예정지역, 점포 보유여부,
											창업보유자금, 창업설명회 참석일자</dd>
									</dl>
								</div>
								<div class="checkbox mb-5">
									<input type="checkbox" id="check01" name="check01">
									<label for="check01"><strong>약관에 동의합니다.</strong></label>
								</div>
							</section>
						</fieldset>
						<!-- E : 개인정보 수집동의 -->

						<!-- S : 창업 희망자 정보 -->
						<fieldset>
							<section class="section-text section-form section-mb">
								<div class="title-wrap mt-4 ">
									<h2 class="title-h3">
										<strong>창업 희망자 정보</strong>
									</h2>
								</div>
								<div class="mem-inquiry-boby">
									<div class="d-grid gap-1">
										<div class="p-2 underline">
											<div>
												<div class="row my-3">
													<div class="col-sm-2 strong">
														<strong class="inquiry-tit-bundle strong"> 이름 <i
															class='bx bx-health inquiry-required'></i>
														</strong>
													</div>
													<div class="col-sm-5 form-group ">
														<input type="text" class="form-css" id="inqrNm"
															name="inqrNm" required placeholder="홍길동">
													</div>
												</div>
											</div>
										</div>
										<div class="p-2 underline">
											<div>
												<div class="row mem-inquiry-row ">
													<div class="col-sm-2 ">
														<strong class="inquiry-tit-bundle strong"> 연락처 <i
															class='bx bx-health inquiry-required'></i>
														</strong>
													</div>
													<div class="col-sm-5 form-group " style=" display: flex;">
														<input type="tel" class="form-css" id="inqrTel"
															name="inqrTel" oninput="autoHyphen(this)"
															placeholder="010-0000-0000" required> 
													</div>
												</div>
											</div>
										</div>
										<div class="p-2 underline">
											<div>
												<div class="row mem-inquiry-row ">
													<div class="col-sm-2 ">
														<strong class="inquiry-tit-bundle strong"> 이메일 <i
															class='bx bx-health inquiry-required'></i>
														</strong>
													</div>
													<div class="col-sm-5"
														style="display: flex; align-items: center;" id="change">
														<input class="form-css2 me-2" type="text" id="email_id"
															value="" title="이메일 아이디" placeholder="이메일" maxlength="18"
															required /> @ <select
															class="select form-css2 ms-2 inputCss"
															title="이메일 도메인 주소 선택" id="email_domain"
															name="email_domain" title="이메일 도메인"
															onchange="changeSelect()" required>
															<option value="">선택</option>
															<option value="naver.com">naver.com</option>
															<option value="gmail.com">gmail.com</option>
															<option value="hanmail.net">hanmail.net</option>
															<option value="hotmail.com">hotmail.com</option>
															<option value="korea.com">korea.com</option>
															<option value="nate.com">nate.com</option>
															<option value="yahoo.com">yahoo.com</option>
															<option value="change">직접 입력</option>
														</select>
														<!--직접 입력시 보이는 부분  -->
														<div class="col-sm-12 " style="display:none" id="email">
															<input class="form-css" type="email" id="inqrEmail" name="inqrEmail">
														<div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
						</fieldset>
						<!-- E : 창업 희망자 정보 -->

						<!-- S : 가맹점 후보지 정보 -->
						<fieldset>
							<section class="section-text section-form section-mb" style="padding-top: 50px;">
								<div class="title-wrap mt-4 ">
									<h2 class="title-h3">
										<strong>가맹점 후보지 정보</strong>
									</h2>
								</div>
								<div class="mem-inquiry-boby">
									<div class="d-grid gap-1">
										<div class="p-2 underline">
											<div>
												<div class="row mem-inquiry-row ">
													<div class="col-sm-2 strong">
														<strong class="inquiry-tit-bundle strong"> 희망 지역
															<i class='bx bx-health inquiry-required'></i>
														</strong>
													</div>
													<div class="col-sm-5 ">
														<select class="select  ms-2 inputCss"
															id="region" name="inqrRgnlHope" required>
															<option value="" disabled selected>희망 지역</option>
															<option value="서울">서울</option>
															<option value="인천">인천</option>
															<option value="경기도">경기도</option>
															<option value="충청도">충청도</option>
															<option value="전라도">전라도</option>
															<option value="경상도#">경상도</option>
															<option value="강원/제주">강원/제주</option>
															<option value="해외">해외</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="p-2 underline">
											<div>
												<div class="row mem-inquiry-row ">
													<div class="col-sm-2 ">
														<strong class="inquiry-tit-bundle strong"> 창업 예상
															비용 <i class='bx bx-health inquiry-required'></i>
														</strong>
													</div>
													<div class="col-sm-5 form-group ">
														<select class="select  ms-2 inputCss"
															id="count" name="inqrExpctCost" required>
															<option value="" disabled selected>예상 비용</option>
															<option value="100000000">1억원 미만</option>
															<option value="150000000">1억 5천만원 미만</option>
															<option value="200000000">2억원 미만</option>
															<option value="250000000">2.5억원 미만</option>
															<option value="300000000">3억 이상</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="p-2 underline">
											<div>
												<div class="row mem-inquiry-row ">
													<div class="col-sm-2 ">
														<strong class="inquiry-tit-bundle strong" style="  margin-top: 5px;">
														 상가 보유	유무 
														 <i class='bx bx-health inquiry-required'></i>
														</strong>
													</div>
													<div class="col-md-8 form-group radio">
														<div class="form-check form-check-inline">
															<input class="form-check-input primary store"
																type="radio" name="inqrStoreYn" id="primary-radio"
																value="Y" checked> <label
																class="form-check-label" for="primary-radio">보유</label>
														</div>
														<div class="form-check form-check-inline">
															<input class="form-check-input primary store"
																type="radio" name="inqrStoreYn" id="primary2-radio"
																value="N"> <label class="form-check-label"
																for="primary2-radio">미보유</label>
														</div>
													</div>

												</div>
											</div>
										</div>

										<div class="p-2 underline inquiry-sel-store" id="addr"
											style="display: flex;">
											<div style="display: flex; gap: 0px 100px;" class="my-2">
												<div style="width: 120px;">
													<strong class="inquiry-tit-bundle strong"> 상가 주소 <i
														class='bx bx-health inquiry-required'></i>
													</strong>
												</div>
												<div
													style="display: flex;align-items: baseline;flex-direction: column;align-content: flex-start;"
													id="change">
													<div style="display: flex;">
														<input type="hidden" name="inqrStoreAddr"
															id="inqrStoreAddr"> <input type="text"
															id="postcode" placeholder="우편번호"> <input
															type="button" class="addrBtn is-black"
															onclick="DaumPostcode()" value="우편번호 찾기">
													</div>
													<div class="mt-3" style="display: flex; width: 600px;">
														<input class=" me-3" type="text" id="address"
															placeholder="주소"><br> <input type="text"
															id="detailAddress" placeholder="상세주소">
													</div>
												</div>
											</div>
										</div>
										<div class="p-2 underline">
											<div>
												<div class="row mem-inquiry-row ">
													<div class="col-sm-2 ">
														<strong class="inquiry-tit-bundle strong" style="  margin-top: 5px;"> 창업 경험
															유무 <i class='bx bx-health inquiry-required'></i>
														</strong>
													</div>
													<div class="col-md-8 form-group radio">
														<div class="form-check form-check-inline">
															<input class="form-check-input primary" type="radio"
																name="inqrStrtpXp" id="primary-radio3" value="Y" checked>
															<label class="form-check-label" for="primary-radio3">보유</label>
														</div>
														<div class="form-check form-check-inline">
															<input class="form-check-input primary" type="radio"
																name="inqrStrtpXp" id="primary2-radio4" value="N">
															<label class="form-check-label" for="primary2-radio4">미보유</label>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
							<sec:csrfInput />
						</fieldset>
						<!-- E : 가맹점 후보지 정보 -->


						<div class="buttons is-center mobile-layout2"
							style="padding-top: 40px; padding-bottom: 100px;">
							<button type="button" class="button is-cmd is-light is-large cc"
								onclick="fn_cancel();">초기화</button>
							<button type="button" class="button is-cmd is-large aa"
								style="border: 2px solid #333;" onclick="fn_submit();">확인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<!-- E : 본문 -->