<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
    .allFaq {
        display: block
    }

    .memFaq {
        display: none
    }

    .frcsFaq {
        display: none
    }

    option {
        background-color: white;
        color: black;
    }
</style>

<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">FAQ</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/main">Main</a>
                        </li>
                        <li class="breadcrumb-item text-muted" aria-current="page">FAQ</li>
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

<div class="card">
    <%-- FAQ 카테고리 버튼 --%>
    <ul class="nav nav-pills p-3 mb-3 rounded align-items-center card flex-row">
        <li class="nav-item">
            <a href="javascript:allFc()"
               class="nav-link note-link d-flex align-items-center justify-content-center px-3 px-md-3 me-0 me-md-2 text-body-color active"
               id="allBtn">
                <i class="ti ti-list fill-white me-0 me-md-1"></i>
                <span class="d-none d-md-block font-weight-medium">전체</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="javascript:memFc()"
               class="nav-link note-link d-flex align-items-center justify-content-center px-3 px-md-3 me-0 me-md-2 text-body-color "
               id="memBtn">
                <i class="ti ti-list fill-white me-0 me-md-1"></i>
                <span class="d-none d-md-block font-weight-medium">일반 FAQ</span>
            </a>
        </li>

        <li class="nav-item">
            <a href="javascript:frcsFc()"
               class="nav-link note-link d-flex align-items-center justify-content-center px-3 px-md-3 me-0 me-md-2 text-body-color"
               id="frcsBtn">
                <i class="ti ti-list fill-white me-0 me-md-1"></i>
                <span class="d-none d-md-block font-weight-medium">가맹 FAQ</span>
            </a>
        </li>

        <li class="nav-item ms-auto">
            <button type="button" class="btn bg-primary-subtle d-flex align-items-center px-3" data-bs-toggle="modal"
                    data-bs-target="#addFaq-modal" data-bs-whatever="@getbootstrap">
                <i class="ti ti-file me-0 me-md-1 fs-4"></i>
                <span class="d-none d-md-block font-weight-medium fs-3">FAQ 추가</span>
            </button>
        </li>
    </ul>

    <%-- 전체FAQ --%>
    <div class="accordion accordion-flush mb-5 card position-relative overflow-hidden allFaq"
         id="accordionFlushExample1">
        <div class="accordion-item">
            <c:forEach var="faqVO" items="${faqVOList}" varStatus="stat">
                <h2 class="accordion-header" id="flush-headingOne">
                    <button class="accordion-button collapsed fs-4 fw-semibold shadow-none" type="button"
                            data-bs-toggle="collapse" data-bs-target="#allContent-${stat.count}" aria-expanded="false"
                            aria-controls="flush-collapseOne">
                        <strong>${faqVO.faqTitle}</strong>
                    </button>
                </h2>
                <div id="allContent-${stat.count}" class="accordion-collapse collapse"
                     aria-labelledby="flush-headingOne"
                     data-bs-parent="#accordionFlushExample1">
                    <div class="accordion-body fw-normal d-flex align-items-center justify-content-between">
                        <p class="col-10">${faqVO.faqConts}</p>
                        <span class="btn-group mx-4" role="group" aria-label="First group">
                        <button type="button" class="btn waves-effect waves-light bg-secondary-subtle text-secondary modifyModal" value="${faqVO.faqNo}">
                            <i class="ti ti-pencil-minus fs-4"></i>
                        </button>
                        <button type="button" class="btn waves-effect waves-light bg-danger-subtle text-danger deleteModal" value="${faqVO.faqNo}">
                            <i class="ti ti-trash fs-4"></i>
                        </button>
                    </span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <%-- 일반 FAQ --%>
    <div class="accordion accordion-flush mb-5 card position-relative overflow-hidden memFaq"
         id="accordionFlushExample2">
        <div class="accordion-item">
            <c:forEach var="faqVO" items="${faqVOList}" varStatus="stat">
                <c:if test="${faqVO.faqTypeCd=='FAQ01'}">
                    <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button collapsed fs-4 fw-semibold shadow-none" type="button"
                                data-bs-toggle="collapse" data-bs-target="#memContent-${stat.count}"
                                aria-expanded="false"
                                aria-controls="flush-collapseOne">
                            <strong>${faqVO.faqTitle}</strong>
                        </button>
                    </h2>
                    <div id="memContent-${stat.count}" class="accordion-collapse collapse"
                         aria-labelledby="flush-headingOne"
                         data-bs-parent="#accordionFlushExample2">
                        <div class="accordion-body fw-normal">
                            <p>${faqVO.faqConts}</p>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>

    <%-- 가맹 FAQ --%>
    <div class="accordion accordion-flush mb-5 card position-relative overflow-hidden frcsFaq"
         id="accordionFlushExample3">
        <div class="accordion-item">
            <c:forEach var="faqVO" items="${faqVOList}" varStatus="stat">
                <c:if test="${faqVO.faqTypeCd=='FAQ02'}">
                    <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button collapsed fs-4 fw-semibold shadow-none" type="button"
                                data-bs-toggle="collapse" data-bs-target="#frcsContent-${stat.count}"
                                aria-expanded="false"
                                aria-controls="flush-collapseOne">
                            <strong>${faqVO.faqTitle}</strong>
                        </button>
                    </h2>
                    <div id="frcsContent-${stat.count}" class="accordion-collapse collapse"
                         aria-labelledby="flush-headingOne"
                         data-bs-parent="#accordionFlushExample3">
                        <div class="accordion-body fw-normal">
                            <p>${faqVO.faqConts}</p>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>

<%-- FAQ 추가하는 모달 시작 --%>
<div class="modal fade" id="addFaq-modal" tabindex="-1" aria-labelledby="createFaq" style="display: none;"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header d-flex align-items-center">
                <h4 class="modal-title" id="createFaq">
                    FAQ 추가
                </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/admin/createFaq" method="post">
                    <div class="mb-3">
                        <label for="newFaqName" class="control-label mb-1">제목(질문)</label>
                        <div class="d-flex justify-content-between">
                            <input type="text" class="form-control" id="newFaqName" name="faqTitle" style="width: 70%;" required>
                            <select class="select2 btn btn-outline-primary control-label mx-4"
                                    style=" text-align: left;" name="faqTypeCd">
                                <option value="FAQ01">일반</option>
                                <option value="FAQ02">창업</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="newFaqContent" class="control-label mb-1">답변</label>
                        <textarea class="form-control" id="newFaqContent" name="faqConts" required></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn bg-secondary-subtle font-medium" data-bs-dismiss="modal">
                            취소
                        </button>
                        <button type="submit" class="btn btn-primary">
                            등록
                        </button>
                    </div>
                    <sec:csrfInput/>
                </form>

            </div>
        </div>
    </div>
</div>
<%-- FAQ 추가하는 모달 끝 --%>

<%-- FAQ 수정하는 모달 시작 --%>
<div class="modal fade" id="modifyFaq-modal" tabindex="-1" aria-labelledby="modifyFaq" style="display: none;"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header d-flex align-items-center">
                <h4 class="modal-title" id="modifyFaq">
                    FAQ 수정
                </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/admin/modifyFaq" method="post">
                    <div class="mb-3">
                        <input type="hidden" id="faqNo" name="faqNo">
                        <label for="modifyFaqTitle" class="control-label mb-1">제목(질문)</label>
                        <div class="d-flex justify-content-between">
                            <input type="text" class="form-control" id="modifyFaqTitle" name="faqTitle" style="width: 70%;" required>
                            <label for="faqTypeCd" style="display: none"></label>
                            <select class="select2 btn btn-outline-primary control-label mx-4"
                                    style=" text-align: left;" id="faqTypeCd" name="faqTypeCd">
                                <option value="FAQ01" id="FAQ01">일반</option>
                                <option value="FAQ02" id="FAQ02">창업</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="modifyFaqContent" class="control-label mb-1">답변</label>
                        <textarea class="form-control" id="modifyFaqContent" name="faqConts" placeholder="dddd" required></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn bg-secondary-subtle font-medium" data-bs-dismiss="modal">
                            취소
                        </button>
                        <button type="submit" class="btn btn-primary">
                            등록
                        </button>
                    </div>
                    <sec:csrfInput/>
                </form>
            </div>
        </div>
    </div>
</div>
<%-- FAQ 수정하는 모달 끝 --%>

<script>
    /* 전역변수 */
    let all = document.getElementsByClassName("allFaq")[0];
    let mem = document.getElementsByClassName("memFaq")[0];
    let frcs = document.getElementsByClassName("frcsFaq")[0];
    let allBtn = document.getElementById("allBtn");
    let memBtn = document.getElementById("memBtn");
    let frcsBtn = document.getElementById("frcsBtn");

    /* 전체FAQ 버튼 활성화 */
    function allFc() {
        allBtn.classList.add("active");
        memBtn.classList.remove("active");
        frcsBtn.classList.remove("active");
        all.style.display = "block";
        mem.style.display = "none";
        frcs.style.display = "none";
    }

    /* 일반FAQ 버튼 활성화 */
    function memFc() {
        allBtn.classList.remove("active");
        memBtn.classList.add("active");
        frcsBtn.classList.remove("active");
        all.style.display = "none";
        mem.style.display = "block";
        frcs.style.display = "none";
    }

    /* 창업FAQ 버튼 활성화 */
    function frcsFc() {
        allBtn.classList.remove("active");
        memBtn.classList.remove("active");
        frcsBtn.classList.add("active");
        all.style.display = "none";
        mem.style.display = "none";
        frcs.style.display = "block";
    }

    /* 수정하는 모달 띄우기 위한 Ajax */
    $(document).on("click", ".modifyModal" , function (){

        let data = {"faqNo":$(this).val()}
        console.log(data)

        $.ajax({
            url:"/admin/selectAjax",
            type:"post",
            dataType:"json",
            data:JSON.stringify(data),
            contentType:"application/json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
            },
            success:function (result){
                console.log(result)

                $("#faqNo").val(result.faqNo);
                $("#modifyFaqTitle").val(result.faqTitle);
                $("#modifyFaqContent").val(result.faqConts);

                /* 기존에 selected했던 내용 지움 */
                $("#FAQ01").removeAttr("selected");
                $("#FAQ02").removeAttr("selected");

                if(result.faqTypeCd=='FAQ01') {
                    $("#FAQ01").attr("selected","selected");
                } else {
                    $("#FAQ02").attr("selected","selected");
                }
            }
        })

        $("#modifyFaq-modal").modal("show");
    });

    //FAQ를 삭제하는 Ajax
    $(document).on("click", ".deleteModal", function (){
        let data = {"faqNo":$(this).val()}
        console.log(data)

        $.ajax({
            url:"/admin/deleteFaq",
            type:"post",
            dataType:"json",
            data:JSON.stringify(data),
            contentType:"application/json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
            },
            success:function (result){
                console.log(result)

                if(result.result === "okay") {
                    alert("삭제에 성공했습니다.");

                    location.href = "/admin/faq";

                } else {
                    alert("삭제에 실패했습니다.");
                }

            }
        })

    });

</script>