<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/resources/css/memMenu.css">
<link rel="stylesheet" href="/resources/css/memNoticeList.css">

<section>
   <h2 class="sub-tit-name">공지사항</h2>
   <div class="title-wrap">
      <h3 class="title-h3">${memNoticeVO.ntcTitle}</h3>
      <div class="list-date">
         <fmt:formatDate value="${memNoticeVO.ntcWrtDt}" pattern="yyyy-MM-dd" />
      </div>
   </div>
   <div class="noticeDetailContainer">
      <div class="notice-con">${memNoticeVO.ntcConts}</div>
   </div>
   
   <!-- 첨부파일이 존재 할 떄 첨부파일 다운로드 제목? 뜸 -->
      <div class="notice-FileDl">
         <c:if test="${fn:length(memNoticeVO.atchFileVOList) > 0}">
            <div class="btn-FileDl">첨부파일 다운로드</div>
         </c:if>
         <!--  memNoticeVO.atchFileVOList : List<AtchFileVO> -->
         <c:forEach var="atchFileVO" items="${memNoticeVO.atchFileVOList}"
            varStatus="stat">
            <a href="/download?fileName=/${atchFileVO.streFileNm}">
               ${atchFileVO.orignlFileNm} </a>
         </c:forEach>
      </div>
   
   <div class="btn-Nlist">
      <a href="/mem/notice/memList">목록으로</a>
   </div>
   
   <!-- 여기부터 이전글 다음글 리스트 부분 -->
   <div class="list-nav">
      <!-- 이전글 -->   
      <c:choose >
         <c:when test="${memNoticeVO2.next != 9999}">
            <div class="nav-prev">
            <button type="button" class="btn-prev" onclick="href='/mem/notice/memDetail?ntcNo=${memNoticeVO2.next}'">
               이전글
            </button>
            <a href="/mem/notice/memDetail?ntcNo=${memNoticeVO2.next}">
               <div class="list-title">${memNoticeVO2.nextTitle}</div> 
               <div class="list-date"><fmt:formatDate value="${memNoticeVO2.nextDay}" pattern="yyyy-MM-dd" /></div>
            </a>
            </div>
         </c:when>
         <c:when test="${memNoticeVO2.next == 9999}">
            <div class="nav-prev">
               <button type="button" class="btn-prev" onclick="href='/mem/notice/memDetail?ntcNo=${memNoticeVO2.next}'">
                  이전글
               </button>
               <button type="button" class="btn-none-list" disabled>이전글이 없습니다</button>
            </div>
         </c:when>
      </c:choose>
      
      <!-- 다음글 -->
      <c:choose>
         <c:when test="${memNoticeVO2.last != 9999}">
            <div class="nav-next">
            <button type="button" class="btn-next" onclick="href='/mem/notice/memDetail?ntcNo=${memNoticeVO2.last}'">
               다음글
            </button>
            <a href="/mem/notice/memDetail?ntcNo=${memNoticeVO2.last}"> 
               <div class="list-title">${memNoticeVO2.lastTitle}</div>
               <div class="next-date"><fmt:formatDate value="${memNoticeVO2.lastDay}" pattern="yyyy-MM-dd" /></div>
            </a>
            </div>
         </c:when>
         <c:when test="${memNoticeVO2.last == 9999}">
            <div class="nav-next">
               <button type="button" class="btn-prev" onclick="href='/mem/notice/memDetail?ntcNo=${memNoticeVO2.next}'">
                  이전글
               </button>
               <button type="button" class="btn-none-list" disabled>다음글이 없습니다</button>
            </div>
         </c:when>
      </c:choose>
   </div>
</section>

<!-- 첨부파일 로니콜먼만 주구장창 있는거 맞는지 한번 확인 해보기 -->