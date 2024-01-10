<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
label {
    display: flex;
   padding: 5px 12px;
   align-items: center;
   gap: 10px;
   border-radius: 8px;
   border: 0px solid var(--ci-01, #0ABAB5);
   background: var(--ci-01, #0ABAB5) !important;
   color: var(--white, #FFF);
   font-family: 'Pretendard5';
   font-style: normal;
   line-height: 160%; /* 22.4px */
   border: 0px;
   height: 38px;
}

input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

#createNurSchedule {
   display: flex;
    gap: 8px;
}
#createNurScheduleBtn {
    display: flex;
    width: 100px;
    justify-content: center;
    font-weight: bolder;
}

.btnBox {
	display: flex;
    justify-content: flex-end;
    flex-direction: row;
    gap: 8px;
}
</style>

<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">메뉴 업 다운</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/main">Main</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/menu/list">메뉴관리</a>
                        </li>
                    </ol>
                </nav>
            </div>
            <div class="col-3">
                <div class="text-center mb-n5">
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card">
	
    <div class="card-body">
        <div id="up-table-group" class="row">
            <div class="col-sm-3">
                <form id="frm">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="메뉴명" name="keyword" aria-label="" aria-describedby="basic-addon1">
                        <button class="btn bg-info-subtle text-info font-medium" type="submit"><i class='bx bx-search-alt-2'></i>검색</button>
                    </div>
                </form>
            </div>
            <div class="btnBox">
	            <div id="insert-btn-area">
	            </div>
				<form enctype="multipart/form-data" method="post">
					<!-- 		<input id="excelUpload" type="file" name="excelFile"/> -->
					<!-- 		<input type="button" value="엑셀 업로드"/> -->
					<input type="file" class="upload-name" id="excelUpload" name="excelUpload" value="첨부파일" placeholder="첨부파일">
					<label for="excelUpload" id="createNurScheduleBtn">파일선택</label> 
				</form>
            </div>
        </div>
        <table class="table border text-nowrap customize-table mb-0 align-middle">
            <thead class="text-dark fs-4">
            <tr>
            	<th>
            		<input type="checkbox" id="checkAll" onchange="checkAll(this)" style="zoom:1.3;"/>
            	</th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">번호</h6>
                </th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">메뉴명</h6>
                </th>
<!--                 <th> -->
<!--                     <h6 class="fs-4 fw-semibold mb-0 text-center">카테고리</h6> -->
<!--                 </th> -->
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">가격</h6>
                </th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">출시일</h6>
                </th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">판매종료일</h6>
                </th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0 text-center">판매상태</h6>
                </th>
                <th>
                    <h6 class="fs-4 fw-semibold mb-0"></h6>
                </th>
            </tr>
            </thead>
            <tbody id="menuListTbody">
            
            </tbody>
        </table>
        <div id="list-paging-area">
            ${menuList.getPagingArea()}
        </div>
        
        <!-- 엑셀 다운로드 -->
        <form id="frm" name="frm" action="/admin/menu/download" method="post">
        	<input type="hidden" id="menuNo" name="menuNo" value="" />
        	<input type="submit" id="smt" style="display: none;"/>
        	<sec:csrfInput/>
        </form>
        
    </div>
</div>


<script type="text/javascript">
$(function(){
	getMenuList();
});

/* 페이지 로드 될때 getMenuList() 불러오기 */
$("#excelUpload").on("change", function() {
	
    const formData = new FormData();
	
    formData.append("file", $("#excelUpload")[0].files[0]);
    
    $.ajax({
	    url: "/admin/menu/excelUpload",
	    type: "post",
	    encType:"multipart/form-data",
	    contentType: false,
	    processData: false,
	    data: formData,
	    beforeSend: function (xhr) {
	      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	    },
	    success: res => {
			if (res < 0) {
			  alertError("확장자가 .xlsx인 엑셀 파일을 첨부해주세요.")
			} else {
				var Toast = Swal.mixin({
					toast : true,
					position : 'top-end',
					showConfirmButton : false, //true면 ok버튼이 뜸
					timer : 1000, // 1초 동안 표시됨
					timerProgressBar : true
				// true하면 타임게이지 나옴
				});
				Toast.fire({
					icon : 'success', //출력할 아이콘 종류(success, warning, error, info, quesition)
					title : '메뉴 등록이 완료되었습니다.' //출력할 메세지 내용
				});
				setTimeout(function() {
					getMenuList();
					location.reload();
				}, 800); //0.8초 이후 자동 새로고침
			}
	    },
	    error: xhr => {
	      console.log(xhr);
	      
	    }
    });
  });
  
function getMenuList() {
	$.ajax({
		url:"/admin/menu/excelList",
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		type:"post",
		beforeSend: function (xhr) {
		     xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success:function(result) {
			
			console.log(result);
			let downloadForm = "";
			let str ="";
//             let menuEndDate = menuEndDt?menuEndDt:'-';
//             let menuNo = "";
//             $.each(result, function(idx) {
//             	menuNo = result[idx].menuNo;
//             });
// 			console.log("menuNo: ", menuNo);
			$.each(result, function(idx){
				str += `
					 <tr>
                    <td>
                        <div class="text-center">
                        	<input type="checkbox" class="box" onchange="checkData(this)" value="\${result[idx].menuNo}" name="menuNo" style="zoom:1.3;"/>
                        </div>
                    </td>
                    <td>
                        <div class="text-center">
                            \${result[idx].menuNo}
                        </div>
                    </td>
                    <td>
                        <div class="text-center">
							\${result[idx].menuNm}
                        </div>
                    </td>
                    <td>
                        <div class="d-flex align-items-center">
                            \${result[idx].menuPrice.toLocaleString('ko-KR')}원
                        </div>
                    </td>
                    <td>
                    	<div class="d-flex align-items-baseline justify-content-end">
                            \${result[idx].menuStrtDt}
                        </div>
                    </td>
                    <td>`;
                    
                    let now = new Date();
                    let menuEndDt1 = result[idx].menuEndDt;
                    
         			let menuStrtDt = new Date(result[idx].menuStrtDt);
                    let menuEndDt = new Date(result[idx].menuEndDt);
                    
                    if(menuEndDt1 == null) {
                    	 str += `<div class="d-flex align-items-center">
		                             <span>-</span>
		                         </div>
		                     </td>
		                     <td>`;
                    } else {
                    	str += `<div class="d-flex align-items-center">
		                            \${result[idx].menuEndDt}
		                        </div>
		                    </td>
		                    <td>`;
                    }
                    
		             	if(menuStrtDt > now){
		             		str += `<span class="badge bg-Warning-subtle text-Warning fw-semibold fs-2">판매준비중</span>`;
		             	} else if(menuStrtDt < now && (menuEndDt > now || menuEndDt == null)) {
		             		str += `<span class="badge bg-success-subtle text-success fw-semibold fs-2">판매중</span>`;
		             	} else {
		             		str += `<span class="badge bg-Dark-subtle fw-semibold fs-2">단종</span>`;
		             	}
                    str += `</td>
                    <td>
                        <a class="btn btn-primary" href="/admin/menu/detail?menuNo=\${result[idx].menuNo}">상세보기</a>
                    </td>
                </tr>
				`;
				
			});
				
				downloadForm += `<form action="/admin/menu/download">
				                	<a type="button" class="btn btn-primary" id="excelDown">다운로드</a>
				                </form>`;
			$('#menuListTbody').html("");
			$('#menuListTbody').append(str);
			$('#insert-btn-area').append(downloadForm);
		}
	});
}

/* 체크된 데이터, all check */
var checkedData = "";
function checkData(obj){
	var checked = obj.checked;
	
	if(checked){
		checkedData += "," + obj.value;
	}else{
		document.querySelector("#checkAll").checked = checked;
		checkedData = checkedData.replace((","+obj.value),"");
	}
}

function checkAll(checkAllBox){
	var checkBoxes = document.querySelectorAll(".box");
	checkedData = "";

	checkBoxes.forEach((checkbox) => {
		checkbox.checked = checkAllBox.checked;
		if(checkAllBox.checked){
			checkedData += "," + checkbox.value;
		}
	})
}

$(document).on("click", "#excelDown", function() {
	console.log("여기 들어오냐??? 다운로드");
	
// 	location.href="/excels";
	
	if(checkedData == ""){
		swal("체크박스", "선택된 항목이 없습니다", "warning");
		return false;
	}
	
	var checkedMenuNo = [];
	
	let menuNo = "";
	
	$(".box:checked").each(function() {
		checkedMenuNo.push($(this).val());
		menuNo += $(this).val() + ",";
	});
	
	$("#menuNo").val(menuNo);
	
	$("#smt").click();
	
	
// 	$.ajax({
// 		url:"/admin/menu/download",
// 		data:JSON.stringify({
// 			checkedMenuNo : checkedMenuNo
// 		}),
// 		type:"post",
// 		contentType:"application/json;charset=utf-8",
// 		dataType:"json",
// 		beforeSend: function (xhr) {
// 		     xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
// 		},
// 		success:function(result) {
// 			console.log("result: ", result);
// 		},
// 		error:function(err) {
// 			console.log(err);
// 		}
// 	});
	
})

</script>