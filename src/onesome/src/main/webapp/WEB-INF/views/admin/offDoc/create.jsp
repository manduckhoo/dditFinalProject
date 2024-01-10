<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/bootstrap/src/assets/libs/owl.carousel/dist/assets/owl.carousel.min.css">
<style>
/* 체크박스 */
.mb-2.all {/* 전체선택 부분 */
    border-bottom: 1px solid #dfe5ef;
    padding-bottom: 5px;
}
.ckgroup {
    display: flex;
    gap: 8px;
    flex-wrap: wrap;
    justify-content: space-between;
}
.ckgroupinner {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 0px 2px;
    width: 32%;
}
.ckgroupinner:last-child {
	margin-right: auto;/* 마지막꺼 왼정렬 */
}

/* ck에디터 부분  */



/* 첨부파일 svg 아이콘 */
#fileIcon {
    color: #2a3547;
}
.attachment {
	color:#2a3547;
}
</style>
<!-- 헤더 영역 -->
<p>관리자 이름 : ${adminNm}</p>
<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">공문작성</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/main">Main</a>
                        </li>
                        <li class="breadcrumb-item text-muted" aria-current="page">공문 작성 링크 걸어</li>
                    </ol>
                </nav>
            </div>
            <div class="col-3">
                <div class="text-center mb-n5">
                    <img src="/resources/bootstrap/src/assets/images/breadcrumb/ChatBc.png" alt=""
                         class="img-fluid mb-n4">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 헤더 끝 -->

<div class="card">
            <div class="card-body">
              <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade active show" id="pills-notifications" role="tabpanel" aria-labelledby="pills-notifications-tab" tabindex="0">
                  <div class="row justify-content-center">
                    <div class="col-lg-9">
                      <div class="card">
                        <div class="card-body p-4">
                          <h4 class="fw-semibold mb-3">공문 작성</h4>
                          <p style="text-align: right;">
                          	작성자 <b>${adminNm}</b>
                          </p>
                          <form class="mb-7">
                          	<!-- 수신인? 수신점? -->
                          	<div class="form-label fw-semibold">수신인</div>
                          	<div class="mb-2 all">
                        		<input type="checkbox" id="selectALl"/>
                            	<label for="selectALl"> 전체선택</label>
                          	</div>
                          	<fieldset><!-- 가맹점 체크박스리스트 -->
                          		<div class="mb-4 ckgroup">
                          			<c:forEach var="frcs" items="${frcsList}">
                          				<div class="ckgroupinner">
		                          			<input type="checkbox" id="frcs${frcs.frcsNo}" name="frcsNmCheck" value="${frcs.frcsNo}"/>
				                            <label for="frcs${frcs.frcsNo}">${frcs.frcsNm}</label>
                          				</div>
                          			</c:forEach>
                          		</div>
                          	</fieldset>
							<!-- 제목 인풋박스 -->
                            <label for="offDocTitle" class="form-label fw-semibold">제목</label>
                            <input type="text" class="form-control mb-4" id="exampleInputtext5" placeholder="" required="">
                            <label for="offDocConts" class="form-label fw-semibold" id="">내용(ck에디터......)</label>
                            <!-- 내용 인풋박스ck에디터 출력 -->
                            <textarea rows="15" cols="50" id="offDocConts" name="offDocConts" style="overflow:hidden; display:none;"></textarea>
                            <textarea rows="15" cols="50" id="offDocContsHidden" name="offDocContsHidden" style="overflow:hidden; display:none;"></textarea>
                            <!-- <input type="text" class="form-control mb-4" id="exampleInputtext5" placeholder="" required=""> -->
                          </form>
                      	</div>
                    </div>
<!--                       <div class="card"> -->
<!--                         <div class="card-body p-4"> -->
<!--                           <h4 class="fs-4 fw-semibold mb-3">첨부파일 다운로드</h4> -->
<!--                           <p>Time zones and calendar display settings.</p> -->
<!--                           <div class="d-flex align-items-center justify-content-between mt-7"> -->
<!--                             <div class="d-flex align-items-center gap-2"> -->
<!-- 									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16" id="fileIcon"> -->
<!-- 									  <path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/> -->
<!-- 									  <path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5L9.5 0zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z"/> -->
<!-- 									</svg> -->
<!--                                 <p class="mb-0 attachment">여기에 첨부파일이 있을 때  파일명이 나오는 부분</p> -->
<!--                               </div> -->
<!-- 								<a class="text-dark fs-6 d-flex align-items-center justify-content-center bg-transparent p-2 fs-4 rounded-circle" href="javascript:void(0)" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Download"> -->
<!-- 	                              <i class="ti ti-download"></i> -->
<!-- 	                            </a> -->
<!--                             </div> -->
                            
<!--                           </div> -->
<!--                         </div> -->
                      </div>
                    <div class="col-12">
                      <div class="d-flex align-items-center justify-content-end gap-3">
                        <button class="btn btn-primary" id="btnaddForm">저장</button>
                        <button class="btn bg-danger-subtle text-danger" id="btnList">취소</button>
                      </div>
                    </div>
                  </div>
                </div>
                
                <!-- 여기다 아마 다른 페이지들? 형식?? 넣으면되는거 아닐까?? -->
              </div>
            </div>
          </div>
          
<!-- 자바스크립트 시작 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> <!-- 제이쿼리를 쓰기 위해 필요함 -->
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script> <!-- ck에디터 -->
<script type="text/javascript">
//목록으로 버튼 클릭 시 이동
document.getElementById('btnList').addEventListener('click', function() {
    window.location.href = '/admin/offDoc/list';
});

/* 체크박스 부분 */
$(document).ready(function() {
	/* ck에디터 */
	ClassicEditor
        .create(document.querySelector('#offDocConts'), {
            // 여기에 구성 옵션 추가
            toolbar: {
                // 툴바 옵션, 필요에 따라 설정
            },
            // 편집기의 높이 설정
            height: '500px', // 원하는 높이로 설정
            // 기타 구성 옵션
        })
        .then(createdEditor => {
            editor = createdEditor; // 전역 변수에 할당
        })
        .catch(error => {
            console.error(error);
        });
	
	//submit 시 잠시 거쳐가는 곳
	function copyContent(){
		   //textarea에 div 내용값을 넣어줌
		   document.getElementById('offDocContsHidden').value = window.editor.getData();

		   return true;
		}
    // 전체선택 체크박스 클릭 시
    $("#selectALl").click(function() {
        // 모든 체크박스의 상태를 전체선택 체크박스와 동일하게 설정
        $(".ckgroupinner input[type='checkbox']").prop('checked', $(this).prop('checked'));
    });

    // 개별 체크박스 클릭 시
    $(".ckgroupinner input[type='checkbox']").click(function() {
        // 모든 체크박스가 체크되었는지 확인
        var allChecked = $(".ckgroupinner input[type='checkbox']").length === $(".ckgroupinner input[type='checkbox']:checked").length;

        // 전체선택 체크박스의 상태를 변경
        $("#selectALl").prop('checked', allChecked);
    });

    // 저장 버튼 클릭 시
    $("#btnaddForm").click(function() {
        // 선택된 가맹점 정보를 배열에 저장? 배열로 자장
    	var selectedFrcs = [];
        
        // 선택된 체크박스의 값을 가져올 수 있음
        $(".ckgroupinner input[type='checkbox']:checked").each(function() {
        	var frcsNo = $(this).val();
        	selectedFrcs.push(frcsNo);
        });
        copyContent();
        // 입력된 제목과 내용을 가져온다
        var title = $("#exampleInputtext5").val();
        var content = $("#offDocContsHidden").val();

        // 이후에 서버로 데이터를 전송하거나 다른 작업을 수행할 수 있습니다.
        
        // 콘솔에 출력해서 확인해보기
        console.log("Selected Frcs ----> : ", selectedFrcs);
        console.log("Title ----> : ", title);
        console.log("Content ----> : ", content);
        // db에 넣을 데이터 처리
        let data = {
        		frcsNmCheck: selectedFrcs,
        		offDocTitle: title,
        		offDocConts: content
        		}
        //서버로 데이터 보내주기
        $.ajax({
            url: '/admin/offDoc/createPost', // 실제 서버 엔드포인트로 변경해야 합니다.
            type: 'POST',
            contentType: 'application/json; UTF-8',
            data: JSON.stringify(data),
            beforeSend:function(xhr){
                xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
             },
            success: function (response) {
                console.log('서버로 데이터 넘기기 성공!');
                // 서버 응답후 아래경로로 이동
                location.href="/admin/offDoc/list"
            },
            error: function (error) {
                console.error('슬프지만...에러!!!', error);
            }
        });//아작스 끝
    });
});

</script>