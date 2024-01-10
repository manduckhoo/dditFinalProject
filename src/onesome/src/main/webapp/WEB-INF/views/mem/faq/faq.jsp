<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- memFaq.css --%>
<link rel="stylesheet" href="/resources/css/memFaq.css">
<%-- 부트스트랩 CDN --%>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" -->
<!--       integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous"> -->

<div class="mx-auto" style="width: 60%; min-height: 60vh;">
	<div class="container breadcrumb" style="margin-top:70px;">
       	<nav class="breadcrumb" aria-label="breadcrumb">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
					<li class="breadcrumb-item"><a href="/mem/faq"><b>고객센터</b></b></a></li>
					<li class="breadcrumb-item" aria-current="page"
						style="color: #d50037"><b>FAQ</b></li>
				</ol>
			</nav>
		</nav>
    </div>
    <h1 id="faqTitle" style="margin-top:30px;">FAQ</h1>

    <div style="margin-top:50px;">
        <div class="listContainer">
            <div class="card-body">
                <ul class="list-group list-group-flush"
                    style="flex-direction: row ; display: flex; justify-content: space-around;">
                    <button type="button" class="myButton faqBtnActive" id="allBtn" onclick="allBtn()" >전체 FAQ</button>
                    <button type="button" class="myButton" id="memberBtn" onclick="memBtn()">일반 FAQ</button>
                    <button type="button" class="myButton" id="frcsBtn" onclick="frBtn()">가맹 FAQ</button>

                </ul>
            </div>
        </div>

        <hr style="margin-top: 0px !important;">

        <%-- 전체FAQ --%>
        <div id="allFaq" style="display: block">
            <c:forEach var="faqVO" items="${faqVOList}" varStatus="stat">
                <button type="button" class="collapsible" onclick="collapse(this);">
                    <strong>${faqVO.faqTitle}</strong>
                </button>
                <div class="content">
                    <p>${faqVO.faqConts}</p>
                </div>
            </c:forEach>
        </div>

        <%-- 일반FAQ --%>
        <div id="memFaq" style="display: none;">
            <c:forEach var="faqVO" items="${faqVOList}" varStatus="stat">
                <c:if test="${faqVO.faqTypeCd=='FAQ01'}">
                    <button type="button" class="collapsible" onclick="collapse(this);">
                        <strong>${faqVO.faqTitle}</strong>
                    </button>
                    <div class="content">
                        <p>${faqVO.faqConts}</p>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <%-- 창업FAQ --%>
        <div id="frcsFaq" style="display: none;">
            <c:forEach var="faqVO" items="${faqVOList}" varStatus="stat">
                <c:if test="${faqVO.faqTypeCd=='FAQ02'}">
                    <button type="button" class="collapsible" onclick="collapse(this);">
                        <strong>${faqVO.faqTitle}</strong>
                    </button>
                    <div class="content">
                        <p>${faqVO.faqConts}</p>
                    </div>
                </c:if>
            </c:forEach>
        </div>

    </div>
</div>

<script>
    //아코디언 작동 위한 자바스크립트
    function collapse(element) {
        var before = document.getElementsByClassName("active")[0]               // 기존에 활성화된 버튼
        if (before && document.getElementsByClassName("active")[0] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
            before.nextElementSibling.style.maxHeight = null;   // 기존에 펼쳐진 내용 접고
            before.classList.remove("active");                  // 버튼 비활성화
        }
        element.classList.toggle("active");         // 활성화 여부 toggle

        var content = element.nextElementSibling;
        if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
            content.style.maxHeight = null;         // 접기
        } else {
            content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
        }
    }

    /* 전체FAQ 버튼 활성화 */
    function allBtn() {
        let all = document.getElementById("allFaq");
        let mem = document.getElementById("memFaq");
        let frcs = document.getElementById("frcsFaq");
        let allFont = document.getElementById("allBtn");
        let memFont = document.getElementById("memberBtn");
        let frcsFont = document.getElementById("frcsBtn");
        if (all.style.display == 'none') {
            allFont.classList.add('faqBtnActive');
            memFont.classList.remove('faqBtnActive');
            frcsFont.classList.remove('faqBtnActive');
            all.style.display = 'block';
            mem.style.display = 'none';
            frcs.style.display = 'none';
        }
    }

    /* 일반FAQ 버튼 활성화 */
    function memBtn() {
        let all = document.getElementById("allFaq");
        let mem = document.getElementById("memFaq");
        let frcs = document.getElementById("frcsFaq");
        let allFont = document.getElementById("allBtn");
        let memFont = document.getElementById("memberBtn");
        let frcsFont = document.getElementById("frcsBtn");
        if (mem.style.display == 'none') {
            allFont.classList.remove('faqBtnActive');
            memFont.classList.add('faqBtnActive');
            frcsFont.classList.remove('faqBtnActive');
            all.style.display = 'none';
            mem.style.display = 'block';
            frcs.style.display = 'none';

        }
    }

    /* 창업FAQ 버튼 활성화 */
    function frBtn() {
        let all = document.getElementById("allFaq");
        let mem = document.getElementById("memFaq");
        let frcs = document.getElementById("frcsFaq");
        let allFont = document.getElementById("allBtn");
        let memFont = document.getElementById("memberBtn");
        let frcsFont = document.getElementById("frcsBtn");
        if (frcs.style.display == 'none') {
            allFont.classList.remove('faqBtnActive');
            memFont.classList.remove('faqBtnActive');
            frcsFont.classList.add('faqBtnActive');
            all.style.display = 'none';
            mem.style.display = 'none';
            frcs.style.display = 'block';
        }
    }
</script>