<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

  //버튼클릭시 주소 + 상세주소
  var address =$("#address").val();
  var addressDetail = $("#detailAddress").val();
  var inqrStoreAddr = address+addressDetail;
  $("#inqrStoreAddr").val(inqrStoreAddr);
  console.log(mail);
  console.log(inqrStoreAddr);
}

  //메일 주소 입력시 값이 들어가기
    window.setEmailDomain = function (domain) {
      $("#email_domain").val(domain);
    };



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
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>

	<form id="inquirer" method="post" 
		action="/inqr/createPost">
		<table>
			<tr>
				<th scope="row">이름 *</th>
				<td><input type="text" name="inqrNm" id="inqrNm" required /></td>
			</tr>
			<tr>
				<th scope="row">연락처 <span class="em_red">*</th>
				<td><input type="tel" id="inqrTel" name="inqrTel"
					oninput="autoHyphen(this)" required /></td>
			</tr>
			<tr>
				<th scope="row">이메일 <span class="em_red">*</th>
				<td><input type="hidden" id="inqrEmail" name="inqrEmail">
					<input type="text" id="email_id" value="" title="이메일 아이디"
					placeholder="이메일" maxlength="18" /> @ <input type="text"
					id="email_domain" value="" title="이메일 도메인" placeholder="이메일 도메인"
					maxlength="18" /> <select class="select" title="이메일 도메인 주소 선택"
					onchange="setEmailDomain(this.value);">
						<option value="">직접 입력</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="korea.com">korea.com</option>
						<option value="nate.com">nate.com</option>
						<option value="yahoo.com">yahoo.com</option>
				</select></td>
			</tr>
			<tr>

				<th scope="row">창업 문의 경로 <span class="em_red">*</th>
				<td class="default_radio">
					<div>
						<input required="" type="radio" name="inqrPath" id="special_11_01"
							value="매장방문" checked> <label for="special_11_01">매장방문</label>
					</div>
					<div>
						<input required="" type="radio" name="inqrPath" id="special_11_02"
							value="인터넷검색"> <label for="special_11_02">인터넷검색</label>
					</div>
					<div>
						<input required="" type="radio" name="inqrPath" id="special_11_03"
							value="지인추천(소개)"> <label for="special_11_03">지인추천(소개)</label>
					</div>
					<div>
						<input required="" type="radio" name="inqrPath" id="special_11_04"
							value="SNS(인스타그램 광고)"> <label for="special_11_04">SNS(인스타그램
							광고)</label>
					</div>
					<div>
						<input required="" type="radio" name="inqrPath" id="special_11_08"
							value="기타"> <label for="special_11_08">기타</label> <label
							class="direct_input"> <input type="text" name="inqrPath"
							placeholder="직접 입력">
						</label>
				</td>
				</div>
			</tr>
			<tr>
				<th scope="row">창업 희망 지역 <span class="em_red">*</th>
				<td><label for="lang"></label> <select name="inqrRgnlHope"
					id="lang">
						<option value="서울" selected>서울</option>
						<option value="인천">인천</option>
						<option value="경기도">경기도</option>
						<option value="충청도">충청도</option>
						<option value="전라도">전라도</option>
						<option value="경상도#">경상도</option>
						<option value="강원/제주">강원/제주</option>
						<option value="해외">해외</option>
				</select></td>
			</tr>
			<tr>
				<th scope="row">창업 예상 비용 <span class="em_red">*</th>
				<td><label for="count"></label> <select name="inqrExpctCost"
					id="count">
						<option value="100000000" selected>1억원 미만</option>
						<option value="150000000">1억 5천만원 미만</option>
						<option value="200000000">2억원</option>
						<option value="250000000">2억 5천만원</option>
						<option value="300000000">3억 이상</option>
				</select></td>
			</tr>
			<tr>
				<th scope="row">상가 보유 유무 <span class="em_red">*</th>
				<td><input type="radio" id="yes" name="inqrStoreYn" value="Y"
					checked /> <label for="yes">유</label> <input type="radio" id="no"
					name="inqrStoreYn" value="N" /> <label for="no">무</label></td>
			</tr>
			<tr>
				<th scope="row">상가 주소 <span class="em_red">*</th>
				<td><input type="hidden" name="inqrStoreAddr"
					id="inqrStoreAddr"> <input type="text" id="postcode"
					placeholder="우편번호"> <input type="button"
					onclick="DaumPostcode()" value="우편번호 찾기"><br> <input
					type="text" id="address" placeholder="주소"><br> <input
					type="text" id="detailAddress" placeholder="상세주소"> <input
					type="text" id="extraAddress" placeholder="참고항목"></td>
			</tr>

			<tr>
				<th scope="row">창업 경험 <span class="em_red">*</th>
				<td><input type="radio" id="yes1" name="inqrStrtpXp" value="Y"
					checked /> <label for="yes1">유</label> <input type="radio"
					id="no1" name="inqrStrtpXp" value="N" /> <label for="no1">무</label>
				</td>
			</tr>

		</table>
		<button type="submit" onclick="addressSum()">신청 하기</button>
		<sec:csrfInput />
	</form>

</body>
</html>