<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
.bg-info-subtle {
    background: linear-gradient(45deg, #eae1f4, #e5e3ff)!important;
}

.ms-auto {
    margin-left: 0 !important;
}

.card > hr {
    margin: 0px;
    margin-bottom: 24px;
}

/* 글쓰기 수정 버튼  */
#btnUpdate {
    height: 37.133340000000004px;
}

.button-group {
    margin-bottom: 24px;
   display: flex;
    flex-direction: row;
    justify-content: flex-end;
    gap: 0 8px;
    padding : 0 30px;
}
.button-group .btn {
    margin: 0px !important;
}

/* 첨부파일 다운로드 부분 */
p.fileupload {
    color: #2a3547;
    text-align: right;
    margin-bottom: 0px;
}


/* 첨부파일 다운로드 영역 */
.fb-FileDl a:hover {
   text-decoration: underline;
}
.btn-FileDl {
    font-size: 16px;
    font-weight: bold;
    color: #2a3547;
    padding-top: 24px;
}
  
/* --------모달 부분--------- */
.modal {
       --bs-modal-width: 800px;
}

/* --------댓글 부분--------- */
.commentDate {
   color: #5a6a85;
}

.rounded-2 {
    border-radius: var(--bs-border-radius) !important;
}
.p-4 .d-flex.align-items-center.gap-3 {
   display: flex !important;
    justify-content: space-between;
}

#btnGroup {
    display: flex;
    justify-content: flex-end;
}
.btnEdit {
    display: flex;
    gap: 0px 8px;
}
/* 댓글 수정을 눌렀을때 버튼 그룹 */
#updateBtnGroup {
    display: flex;
    justify-content: flex-end;
}
.btnEdit #register {
	height: 36.777778px;
}
.txtArea {
    height: 50px;
}
</style>
 
<div class="container-fluid">
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
  <div class="card-body px-4 py-3">
    <div class="row align-items-center">
      <div class="col-9">
        <h4 class="fw-semibold mb-8">자유 게시판</h4>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a class="text-muted text-decoration-none" href="/frcs/main">Home</a>
            </li>
            <li class="breadcrumb-item" aria-current="page">
               <a class="text-muted text-decoration-none" href="/frcs/freeboard/list">Board</a>
            </li>
          </ol>
        </nav>
      </div>
      <div class="col-3">
        <div class="text-center mb-n5">
          <img src="../../../resources/bootstrap/src/assets/images/breadcrumb/ChatBc.png" alt="" class="img-fluid mb-n4">
        </div>
      </div>
    </div>
  </div>
</div>

          <div class="card rounded-2 overflow-hidden">
            
            <div class="card-body p-4">
              <span class="badge text-bg-light fs-2 rounded-4 py-1 px-2 lh-sm  mt-3"><fmt:formatDate value="${freeBoardVODetail.freeBoardWrtDt}" pattern="yyyy-MM-dd" /></span>
              <h2 class="fs-9 fw-semibold my-4">${freeBoardVODetail.freeBoardTitle}</h2>
              <div class="d-flex align-items-center gap-4">
                <div class="d-flex align-items-center gap-2"><i class="ti ti-eye text-dark fs-5"></i>${freeBoardVODetail.freeBoardView}</div>
                <div class="d-flex align-items-center gap-2" id="commentCountContainer"><i class="ti ti-message-2 text-dark fs-5"></i><span id="commentCount"><span></div>
                
              </div>
            </div>
            <div class="card-body border-top p-4">
<!--               <h2 class="fs-8 fw-semibold mb-3">Title of the paragraph</h2> -->
              <p class="mb-3">
                 ${freeBoardVODetail.freeBoardConts}
              </p>

              <!-- 첨부파일 다운로드(첨부파일이 있을때만 보임) -->
            <div class="fb-FileDl">
               <c:if test="${freeBoardVODetail.atchFileVOList[0].atchFileNo > 0}">
                  <div class="btn-FileDl">첨부파일 다운로드</div>
               </c:if>
               <!--  freeBoardVODetail.atchFileVOList : List<AtchFileVO>?? -->
               <c:forEach var="atchFileVO" items="${freeBoardVODetail.atchFileVOList}"
                  varStatus="stat">
                  <a href="/download?fileName=/freeBoard/${atchFileVO.streFileNm}">
                     ${atchFileVO.orignlFileNm} </a>
               </c:forEach>
            </div>
            
            </div>
            
            <hr/>
            <div class="button-group">
                  <input type="hidden" name="freeBoardNo" value="${freeBoardVODetail.freeBoardNo}">
                    <button type="submit" class="btn waves-effect waves-light btn-primary createModal" id="btnUpdate">
                         수정
                    </button>
                    <form action="/frcs/freeboard/delete" method="post">
                    <input type="hidden" name="freeBoardNo" value="${freeBoardVODetail.freeBoardNo}">
                    <button type="submit" class="btn waves-effect waves-light btn-danger">
                         삭제
                    </button>
                    <sec:csrfInput />
                    </form>
            </div>
            
            <!-- 글쓰기(수정) 모달 시작 -->
<div class="modal fade" id="create-modal" tabindex="-1"
   aria-labelledby="addProduct" style="display: none;" aria-hidden="true">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header d-flex align-items-center"
            style="padding-bottom: 0px;">
            <h3 class="modal-title">게시글 수정</h3>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
               aria-label="Close"></button>
         </div>
         <div class="modal-body px-4">
            <form action="/frcs/freeboard/update" method="post" id="frm" enctype="multipart/form-data" onsubmit="copyContent()">
            <input type="hidden" name="freeBoardNo" value="${freeBoardVODetail.freeBoardNo}">
               <div class="card-body border-top" id="addBoard">
                  <div class="row">
                     <div class="col-12">
                        <div class="mb-3">
                           <label for="ojtTitle" class="control-label col-form-label">제목</label>
                           <input type="text" class="form-control" id="ojtTitle" name="freeBoardTitle" required> 
                           <label id="validationCheckArea"></label>
                        </div>
                     </div>
                  </div>
                  
                  <div class="row">
                     <div class="col-12">
                        <div class="mb-3"
                           style="display: grid; grid-template-rows: auto auto;">
                           <label for=freeBoardConts class="control-label col-form-label">내용</label>
                           <div id="temp"></div>
                           <textarea rows="15" cols="50" id="freeBoardConts" name="freeBoardConts"style="overflow: hidden; display:none;" value="${commentsVOList.cmntsSn}"></textarea>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <div class="custom-file">
               <!-- 기존 첨부 파일 목록 표시 및 수정할 첨부 파일 선택 -->
               <div id="fileInputs">
                   <c:forEach var="atchFileVO" items="${freeBoardVODetail.atchFileVOList}" varStatus="stat">
                       <div class="custom-file">
                           <input type="file" class="form-control" id="upload${stat.index}" name="uploadFile" style="display: none;" multiple>
                           <label class="custom-file-label" for="upload${stat.index}">${atchFileVO.orignlFileNm}</label>
                           <button type="button" onclick="removeFileInput('upload${stat.index}')">삭제</button>
                       </div>
                   </c:forEach>
               </div>
               
               <!-- 새로운 파일 추가 버튼 -->
               <button type="button" onclick="addFileInput()">새 파일 추가</button>
               
               <script>
               // 새로운 파일 입력란 추가
               function addFileInput() {
                   var fileInputs = document.getElementById("fileInputs");
                   $("input[name='uploadFile']").css("display","block");
               
//                    var newInput = document.createElement("div");
//                    newInput.innerHTML = `
//                        <div class="custom-file">
//                            <input type="file" class="form-control" name="uploadFile" multiple />
//                            <label class="custom-file-label" for="upload">파일 선택</label>
//                            <button type="button" onclick="removeFileInput(this)">삭제</button>
//                        </div>
//                    `;
               
//                    fileInputs.appendChild(newInput);
               }
               
               // 파일 입력란 삭제
               function removeFileInput(inputId) {
                   var fileInputs = document.getElementById("fileInputs");
                   var inputToRemove = document.getElementById(inputId).parentNode;
                   fileInputs.removeChild(inputToRemove);
               }
               </script>

                        </div>
                     </div>
                  </div>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn bg-warning-subtle font-medium"
                     data-bs-dismiss="modal" id="btnCancel">취소</button>
                  <!-- 동기로 바꿔서 하는게 낫대...수정해 -->
                  <button type="submit" class="btn btn-primary" id="btnaddForm">등록</button>
               </div>
               <sec:csrfInput />
            </form>
         </div> 
      </div>
   </div>
</div>
<!-- 글쓰기(수정) 모달 끝 -->
            
          </div>
         
          <!-- 댓글 -->
          <div class="card">
            <div class="card-body">
              <h4 class="mb-4 fw-semibold">Post Comments</h4>
              <form method="post" action="/frcs/freeboard/detail">
                <textarea id="cmntsConts" class="form-control mb-4" rows="5" name="cmntsConts"></textarea>
                <button type="button" id="btnComments" class="btn btn-primary">Post Comment</button>
              </form>
              
              
              <div class="position-relative" id="commentList"><!-- 여기부터 댓글 리스트 불러옴 -->
                
              </div>
            </div>
          </div>
        </div>
        
          <!-- Import Js Files -->

<script src="/resources/bootstrap/src/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/bootstrap/src/assets/libs/simplebar/dist/simplebar.min.js"></script>

<script src="/resources/bootstrap/src/assets/js/sidebarmenu.js"></script>
<script src="/resources/bootstrap/src/assets/js/theme.js"></script>

<script src="/resources/bootstrap/src/assets/libs/prismjs/prism.js"></script>
<script src="/resources/bootstrap/src/assets/js/widget/ui-card-init.js"></script>

<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript">

ClassicEditor.create( document.querySelector('#temp'),{ckfinder:{uploadUrl:'/image/upload?${_csrf.parameterName}=${_csrf.token}'}})
.then(editor=>{window.editor=editor;})
.catch(err=>{console.error(err.stack);});


//submit 시 잠시 거쳐가는 곳
function copyContent(){
   //textarea에 div 내용값을 넣어줌
   $("#freeBoardConts").html(window.editor.getData());
   return true;
}


// 모달 닫기 함수
function closeModal() {
    $("#create-modal").modal("hide");
}

//모달
$(".createModal").on("click", function() {
   window.editor.setData('${freeBoardVODetail.freeBoardConts}');
   // input 값 지우기
   $("#addBoard").find('input[type=text]').each(function () {
        $(this).val('${freeBoardVODetail.freeBoardTitle}');
    });
    $("#addBoard").find('input[type=uploadFile]').each(function () {
        $(this).val('${atchFileVO.orignlFileNm}');
    });
    /* $("#frm").find('select[class=form-select]').each(function () {
        $(this).val('');
    }); */
    $("#create-modal").modal("show");
});


//데이타 찍어보기, 댓글 리스트 불러오기
$(function() { //문서가 로드된 후 바로?실행되는것들
   list();
});

function list(){
   let data = {
         "freeBoardNo":${freeBoardVODetail.freeBoardNo}
   };
		   
   console.log("왔음");
          $.ajax({
             url : "/frcs/freeboard/commentsList",
             method : "post",
             data : JSON.stringify(data),
             dataType : "JSON",
             contentType : "application/json;charset=UTF-8",
             beforeSend:function(xhr){
                      xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
                   },
             success : function(result) {
                
            	 console.log("갯수",result.length);
            	 var cmt = result.length
            	 
				$("#commentCount").html(cmt);            	 
                console.log("result : ", result); 
                //여기다 댓글 부분 html 작성 하면 되는듯!
                let str =`
                   <div class="d-flex align-items-center gap-3 mb-4 mt-7 pt-8">
                    <h4 class="mb-0 fw-semibold">Comments</h4>
                    <span class="badge bg-primary-subtle text-primary fs-4 fw-semibold px-6 py-8 rounded">\${cmt}</span>
                     </div>
                   `
                   ;
                
        
        
               $.each(result, function(index, commentsVO){
        console.log("작성자 이름",commentsVO.cmntsWrtr);
                 
        str +=`
                   <div class="p-4 rounded-2 text-bg-light mb-3" id="form\${commentsVO.cmntsSn}">
                    <div class="d-flex align-items-center gap-3">
                      <h6 class="fw-semibold mb-0 fs-4">\${commentsVO.cmntsWrtr}</h6>
                      <span class="commentDate">\${commentsVO.cmntsWrtDt}</span>
                    </div>
                    <p class="my-3" id="\${commentsVO.cmntsSn}"> <!--인풋이나 텍스트 에어리어로다가 리드온리 주고 풀고 하는 방식으로 바꿔도 됨!-->
                       \${commentsVO.cmntsConts}
                    </p>
                    <div class="d-flex align-items-center gap-2" id="btnGroup">
                    `
                    
                    
                    if( commentsVO.cmntsWrtr === '${frcsOwnerNm}' ){
                    	str+=`
	                    <div class="btnEdit">
	                    	<button type="button" class="btn waves-effect waves-light btn-primary createModal btnUpdateForm" data-no="\${commentsVO.cmntsSn}">수정</button>
	                    	<button class="btnDelete" onclick="deleteComment(\${commentsVO.cmntsSn})">삭제</button>
	                    </div>
	                    `;
                    }
                    
                    
                    str +=
                       `
                    </div>
                  </div>
                  `
               }); 
            $("#commentList").html(str);
             },
             error : function(xhr) {
                 alert("상태 : " + xhr.status);
             }
     }); //ajax 끝
}

//수정폼 바꾸기
// 수정된 부분
$(document).on("click", ".btnUpdateForm", function () {
    console.log("왔다")
    let cmntsSn = $(this).data("no");
    let cmntsConts = $("#" + cmntsSn).text();
    
    console.log("cmntsSnㅁㅁㅁㅁㅁㅁㅁㅁ : ", cmntsSn);
    console.log("cmntsContsㅁㄴㅇㅁㄴㅇㅅㅅ : ", cmntsConts);

    let form =
        `
            <div class="d-flex align-items-center gap-3">
                <h6 class="fw-semibold mb-0 fs-4"></h6>
                <span class="commentDate"></span>
            </div>
            <textarea class="form-control mb-4" rows="5" name="cmntsConts" id="text\${cmntsSn}" >\${cmntsConts}</textarea>
            <div class="d-flex align-items-center gap-2">
                <div class="btnEdit">
                    <button type="button" class="btn waves-effect waves-light btn-primary createModal btnUpdate" data-no="\${cmntsSn}">등록</button>
                    <button type="button" class="btn mb-1 waves-effect waves-light btn-light" id="cancel">취소</button>
                </div>
            </div>

        `;
        
        console.log(document.querySelector("#form" + cmntsSn));
    //URL매개변수로 데이터 전송
    $("#form" + cmntsSn).html(form);
});

//수정등록------------------------------------------------------------------------------------------------------------------------------
// $(document).on("click",".btnUpdate",function(){
//    let cmntsSn = $(this).data("no");
//    let cmntsConts = $("#"+cmntsSn).text();
   
//    console.log("댓글번호 ", cmntsSn);
//    console.log("댓글내용", cmntsConts);
   
//    let data = {
//             "cmntsSn":cmntsSn,
//             "cmntsConts":cmntsConts
//       };
   
// });

//수정 취소(수정하기에서 취소 버튼을 눌렀을 때 수정 모드?가 취소됨)
$(document).on("click", "#cancel", function () {
    // 여기에 취소 버튼을 눌렀을 때 다시 보기만 가능하게?
   list();
});


// 댓글 삭제기능 (댓글 삭제 기능을 위한 새로운 함수 추가)
function deleteComment(cmntsSn) {
    if (confirm("정말로 이 댓글을 삭제하시겠습니까?")) {
       let data = {
              "cmntsSn": cmntsSn
          };

          $.ajax({
              url: "/frcs/freeboard/deleteComments",
              method: "post",
              data: JSON.stringify(data),
              contentType: "application/json;charset=UTF-8",
              beforeSend: function (xhr) {
                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
              },
              success: function (result) {
                  // 댓글이 성공적으로 삭제되면 댓글 목록 가져와
                  if (result > 0) {
                      list(); // 댓글 목록 가져오기
                  } else {
                      alert("댓글 삭제에 실패했습니다.");
                  }
              },
              error: function (xhr) {
                  alert("댓글 삭제 중 오류 발생: " + xhr.status);
              }
          });
    }
}




// -------------------- 여기부터 댓글등록 ----------------------
//댓글 등록
$("#btnComments").on("click", function() {
   console.log("안들어와?");
   let freeBoardNo = "${freeBoardVODetail.freeBoardNo}";
   let cmntsConts = $("#cmntsConts").val();
   let cmntsWrtr = "${frcsOwnerNm}";
   
   console.log("로그인유져", cmntsWrtr);
   console.log("cmntsConts: ", cmntsConts);
   console.log("freeboardNo: ", freeBoardNo);
   
//    댓글 내용이 비어있는 경우
   if (cmntsConts.trim() === "") {
       alert("댓글 내용을 입력하세요.");
       return;
   }
   
   let data = {
      "freeBoardNo":freeBoardNo,//아작스에서 데이터로 넘길때 파라미터값의 이름과 그 값
      "cmntsWrtr":cmntsWrtr,
      "cmntsConts":cmntsConts
   }
    // 데이터를 서버에 전송
    $.ajax({
        url: "/frcs/freeboard/createComments",
        method: "post",
        data: JSON.stringify(data),
        dataType : "JSON",
        contentType : "application/json;charset=UTF-8",
        beforeSend : function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        },
        success: function (result) {
            // 성공적으로 댓글을 서버에 전송한 경우
            // 여기서 필요한 경우 댓글 리스트를 갱신하는 함수를 호출
           if(result > 0) {
              console.log("success");
              //댓글 입력에 성공했을때, 위에서 동기로 만들어둔 댓글 리스트를 불러와야 댓글등록 성공후 디비에 들어간 댓글 리스트를 새로고침 안해도 불러옴!
              list();
              //댓글 쓰고 등록 후 초기화 부분 :  textArea 의 아이디값에 "" 를 넣어줘서 입력란을 초기화 해준다
              $("#cmntsConts").val("");
           } else {
              console.log("fail");
           }
        },
        error: function (xhr) {
            alert("댓글 전송 중 오류 발생: " + xhr.status);
        }
    });
});

$(document).on("click", ".btnUpdate", function(e) {
	
	/*
		name 이 cmntsConts 인 애의 값을 가져온다.
		
		let data {
			"cmntsConts" : cmntsConts
		}
		
		아작스 위에 있는거 복사 붙여넣기 한다
		아작스 데이터에 let data 선언해준거 넣어준다.
		url: "/frcs/freeboard/createComments",		아작스에 있는 컨트롤러에 url 맞춘다.
		
		컨트롤러에서 cmntsConts 를 받아서. map 이든 String 이든 넣어줘라.
		그래서 서비스 -> 서비스임플 -> mapper -> SQL 해서
		update 문 태운다.
		
		그리고 아작스 success에 뭐 해야되냐 모르겠따.
		암튼 끝이다.
	
	*/
	// 클릭된 요소에서 cmntsConts 값을 가져온다.
	
	let cmntsSn = $(this).data("no");
	let cmntsConts = $("#text"+cmntsSn).val();
	
	console.log("댓글번호 ", cmntsSn);
	console.log("댓글내용", cmntsConts);
	
	let data = {
	         "cmntsSn":cmntsSn,
	         "cmntsConts":cmntsConts
	   };
	 
//     let cmntsConts = $(this).attr("name");
// 	let data = {
// 		"cmntsConts" : cmntsConts,
// 		"cmntsSn": cmntsSn
		
// 	};
	console.log("데이타 안에 번호 있는지 확인! : ", data);
	$.ajax({
	    url: "/frcs/freeboard/updateComments",
	    method: "post",
	    data: JSON.stringify(data),
	    dataType: "JSON",
	    contentType: "application/json;charset=UTF-8",
	    beforeSend: function(xhr){
	        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	    },
	    success: function (result) {
	        // 성공적으로 댓글을 서버에 전송한 경우
	        // 여기서 필요한 경우 댓글 리스트를 갱신하는 함수를 호출
	        if(result > 0) {
	            console.log("success");
	            // 댓글 입력에 성공했을 때, 위에서 동기로 만들어둔 댓글 리스트를 불러와야 댓글 등록 성공 후 디비에 들어간 댓글 리스트를 새로고침 안해도 불러옴!
	            list();
	            // 댓글 쓰고 등록 후 초기화 부분 :  textArea 의 아이디값에 "" 를 넣어줘서 입력란을 초기화 해준다
	            $("#cmntsConts").val("");
	        } else {
	            console.log("fail");
	        }
	    },
	    error: function (xhr) {
	        alert("댓글 전송 중 오류 발생: " + xhr.status);
	    }
	});
		
	console.log("웃 ㅣㄱ이가 남긴 로그 : ", e.target);
	
});

//게시물에 달린 댓글 수 가져오기
// function getCommentCount() {
// 	let freeBoardNo = "${freeBoardVODetail.freeBoardNo}";
//     $.ajax({
//         url: "/frcs/freeboard/commentCount",
//         method: "post",
//         data: JSON.stringify({ freeBoardNo: freeBoardNo }),
//         dataType: "JSON",
//         contentType: "application/json;charset=UTF-8",
//         beforeSend: function(xhr) {
//             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
//         },
//         success: function(result) {
// //             updateCommentCount(result);
//             console.log(" *****  댓글 몇개 있는지 나오라고 .....ㅠㅠ : ***** ", result);
//         },
//         error: function(xhr) {
//             console.error("댓글 수를 가져오는 중 오류 발생!!!!제발 이거 뜨지마!ㅠㅠ: " + xhr.status);
//         }
//     });
// }

// //페이지 로드 시 댓글 수 초기화
// getCommentCount();

// 댓글 추가 및 삭제 시 댓글 수 업데이트
// function updateCommentCount(count) {
//     $("#commentCount").text(count);
// }
</script>