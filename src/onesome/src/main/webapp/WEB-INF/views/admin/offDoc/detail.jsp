<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
#bgSubtle {
    background: linear-gradient(45deg, #eae1f4, #e5e3ff)!important;
}

.ms-auto {
    margin-left: 0 !important;
}

.card > hr {
    margin: 0px;
    margin-bottom: 24px;
}

button.btn.waves-effect.waves-light.btn-primary {
    width: fit-content;
    margin: auto;
    margin-bottom: 24px;
}

.toFrcs {
	color: #2a3547;
/*     font-weight: bold; */
}
</style>
<!-- 공문 발신함 디테일 -->
<div class="container-fluid">
<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4" id="bgSubtle">
  <div class="card-body px-4 py-3">
    <div class="row align-items-center">
      <div class="col-9">
        <h4 class="fw-semibold mb-8">공문 발신함</h4>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a class="text-muted text-decoration-none" href="/admin/main">Home</a>
            </li>
            <li class="breadcrumb-item" aria-current="page">
               <a class="text-muted text-decoration-none" href="/admin/offDoc/list">공문 발신함</a>
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
              <span class="badge text-bg-light fs-2 rounded-4 py-1 px-2 lh-sm  mt-3"><fmt:formatDate value="${offDocFromDetail.offDocFwdDt}" pattern="yyyy-MM-dd" /></span>
              <h2 class="fs-9 fw-semibold my-4">${offDocFromDetail.offDocTitle}</h2>
              <div class="d-flex align-items-center gap-4">
	              <div class="d-flex align-items-center gap-2">
	              	<span class="toFrcs">수신 가맹점</span>
	              	<span class="hide-menu badge rounded-pill border border-primary text-primary fs-2 py-1 px-2">${offDocFromDetail.offDocToNm}</span>
				  </div>
              </div>
            </div>
            <div class="card-body border-top p-4">
              <p class="mb-3">
                 ${offDocFromDetail.offDocConts}
              </p>
            </div>
            
            <hr/>
            <button type="button" class="btn waves-effect waves-light btn-primary createModal" id="btnList">
                         목록으로</button>
          </div>
         
        


<script type="text/javascript">
// 목록으로 버튼 클릭 시 이동
document.getElementById('btnList').addEventListener('click', function() {
    window.location.href = '/admin/offDoc/list';
});
</script>