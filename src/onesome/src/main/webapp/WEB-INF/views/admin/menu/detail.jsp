<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet" href="/resources/css/adminMenu.css">

<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">메뉴 상세</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/main">Main</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/menu/list">List</a>
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
        <div class="admin-menu-boby">
            <form action="/admin/menu/modify" method="post" enctype="multipart/form-data" id="menu-detail-frm">
                <div id="menu-basic-info-area">
                    <div class="row">
                        <div class="col">
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        메뉴사진
                                    </strong>
                                </div>
                                <div class="col-sm-8 menu-img-area" style="min-height: 400px">
                                    <img class="menu-img" src="/resources/upload/menu/${menuVO.atchFileVO.streFileNm}"/>
                                </div>
                            </div>
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        사진등록
                                    </strong>
                                </div>
                                <div class="col-sm-8">
                                    <input type="file" class="form-control" id="uploadFile" name="uploadFile" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        메뉴유형
                                    </strong>
                                </div>
                                <div class="col-sm-8">
                                    <strong class="menu-tit-bundle" id="menu-ctgry"></strong>
                                </div>
                            </div>
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        메뉴명
                                    </strong>
                                </div>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="menuNm" name="menuNm"
                                           value="${menuVO.menuNm}" required disabled>
                                </div>
                            </div>
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        판매가
                                    </strong>
                                </div>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" name="menuPrice"
                                           value="${menuVO.menuPrice}" required disabled>
                                </div>
                            </div>
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        출시일
                                    </strong>
                                </div>
                                <div class="col-sm-8">
                                    <input type="date" class="form-control" name="menuStrtDt"
                                           value="<fmt:formatDate value="${menuVO.menuStrtDt}" pattern="yyyy-MM-dd"/>"
                                           required disabled>
                                </div>
                            </div>
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        판매종료일
                                    </strong>
                                </div>
                                <div class="col-sm-8">
                                    <input type="date" class="form-control" name="menuEndDt"
                                           value="<fmt:formatDate value="${menuVO.menuEndDt}" pattern="yyyy-MM-dd"/>"
                                           disabled>
                                </div>
                            </div>
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        메뉴설명
                                    </strong>
                                </div>
                                <div class="col-sm-8">
                            <textarea class="menu-textarea form-control" name="menuDescription" id="menuDescription"
                                      required disabled>${menuVO.menuDescription}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${menuVO.calories > 0}">
                    <div id="menu-nutrition-info-area">
                        <h4 class="menu-subtitle text-center">제품 영양 정보</h4>
                        <hr>
                        <div class="row admin-menu-row">
                            <div class="col-sm-1">
                                <strong class="menu-tit-nutrition">
                                    칼로리(kcal)
                                </strong>
                            </div>
                            <div class="col-sm-3 nutri-input">
                                <input type="number" class="form-control" name="calories" step="0.01"
                                       value="${menuVO.calories}" disabled required>
                            </div>
                            <div class="col-sm-1">
                                <strong class="menu-tit-nutrition">
                                    당류(g)
                                </strong>
                            </div>
                            <div class="col-sm-3 nutri-input">
                                <input type="number" class="form-control" name="sugar" step="0.01"
                                       value="${menuVO.sugar}" disabled required>
                            </div>
                            <div class="col-sm-1">
                                <strong class="menu-tit-nutrition">
                                    나트륨(mg)
                                </strong>
                            </div>
                            <div class="col-sm-3 nutri-input">
                                <input type="number" class="form-control" name="sodium" step="0.01"
                                       value="${menuVO.sodium}" disabled required>
                            </div>
                        </div>
                        <div class="row admin-menu-row">
                            <div class="col-sm-1">
                                <strong class="menu-tit-nutrition">
                                    단백질(g)
                                </strong>
                            </div>
                            <div class="col-sm-3 nutri-input">
                                <input type="number" class="form-control" name="protein" step="0.01"
                                       value="${menuVO.protein}" disabled required>
                            </div>
                            <div class="col-sm-1">
                                <strong class="menu-tit-nutrition">
                                    포화지방(g)
                                </strong>
                            </div>
                            <div class="col-sm-3 nutri-input">
                                <input type="number" class="form-control" name="saturatedFat" step="0.01"
                                       value="${menuVO.saturatedFat}" disabled required>
                            </div>
                            <div class="col-sm-1">
                                <strong class="menu-tit-nutrition">
                                    카페인(mg)
                                </strong>
                            </div>
                            <div class="col-sm-3 nutri-input">
                                <input type="number" class="form-control" name="caffeine" step="0.01"
                                       value="${menuVO.caffeine}" disabled required>
                            </div>
                        </div>
                    </div>
                </c:if>
                <div id="menu-recipe-area">
                    <h4 class="menu-subtitle text-center">소모 물품</h4>
                    <hr>
                    <div class="col" id="insert-btn-area">
                        <button type="button" id="addProdRow" class="btn btn-primary" disabled>추가</button>
                    </div>
                    <table class="table border text-nowrap customize-table mb-0 align-middle">
                        <thead class="text-dark fs-4">
                        <tr>
                            <th>
                                <h6 class="fs-4 fw-semibold mb-0">번호</h6>
                            </th>
                            <th>
                                <h6 class="fs-4 fw-semibold mb-0">물품유형</h6>
                            </th>
                            <th>
                                <h6 class="fs-4 fw-semibold mb-0">물품명</h6>
                            </th>
                            <th>
                                <h6 class="fs-4 fw-semibold mb-0">수량</h6>
                            </th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody id="prod-tbody">
                        <c:forEach items="${menuVO.recipeVOList}" var="recipeVO" varStatus="stat">
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center row-cnt">
                                            ${stat.count}
                                    </div>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <select class="form-select product-cd-sel"
                                                data-init-seled="${recipeVO.prdctClsfCd}" required disabled>
                                        </select>
                                    </div>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <select class="form-select product-item-sel"
                                                data-init-seled="${recipeVO.prdctNo}"
                                                name="recipeVOList[${stat.index}].prdctNo" required disabled>
                                        </select>
                                    </div>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="form-group">
                                            <input type="number" value="${recipeVO.recQy}"
                                                   name="recipeVOList[${stat.index}].recQy"
                                                   class="form-control recQy" required disabled/>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger row-del-btn" disabled><i
                                            class='bx bxs-trash'></i>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="menu-foot-btns row">
                    <button type="button" class="btn btn-danger" id="menu-delete-btn">삭제</button>
                    <button type="button" class="btn btn-info" id="menu-modify-btn">수정</button>
                    <button type="button" class="btn btn-outline-dark" id="menu-list-btn"
                            onclick="location.href='/admin/menu/list'">목록
                    </button>
                </div>

                <input type="hidden" name="menuNo" value="${menuVO.menuNo}">
                <input type="hidden" name="atchFileNo" value="${menuVO.atchFileNo}">
                <sec:csrfInput/>
            </form>
        </div>
    </div>
</div>

<script src="/resources/js/menuRegistration.js"></script>
<script>

    //메뉴 저장버튼 클릭시
    $(document).on("click", "#menu-save-btn", function () {
        Swal.fire({
            title: '메뉴를 수정 하시겠습니까?',
            icon: 'warning',

            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
            confirmButtonColor: '#01c0c8', // confrim 버튼 색깔 지정
            cancelButtonColor: '#ff5757', // cancel 버튼 색깔 지정
            confirmButtonText: '저장', // confirm 버튼 텍스트 지정
            cancelButtonText: '취소', // cancel 버튼 텍스트 지정

        }).then(result => {
            // 만약 Promise리턴을 받으면,
            if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면

                let Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 1500,
                });

                let allInput = true;

                $("#menu-detail-frm :input[required], #menu-detail-frm select[required]").each(function () {
                    console.log($(this))
                    if ($(this).is("select")) {

                        if ($("option:selected", this).val() === "") {
                            $(this).css("border", "2px solid red");
                            allInput = false;
                        } else {
                            $(this).css("border", "");
                        }
                    } else {
                        if ($(this).val() === "") {
                            $(this).css("border", "2px solid red");
                            allInput = false;
                        } else {
                            $(this).css("border", "");
                        }
                    }
                });

                if (allInput) {
                    Swal.fire({
                        title: '저장완료',
                        icon: 'success',
                        showCancelButton: false,
                        confirmButtonColor: '#01c0c8',
                        confirmButtonText: '승인',

                    }).then((result) => {
                        if (result.isConfirmed) {
                            $("#menu-detail-frm").submit();
                        }
                    })
                } else {
                    Toast.fire({
                        icon: 'error', //출력할 아이콘 종류(success, warning, error, info, quesition)
                        title: '필수 입력값이 비었습니다.' //출력할 메세지 내용
                    });
                }
            }
        });
    });

    //메뉴 수정버튼 클릭시
    $("#menu-modify-btn").on("click", function () {
        const btnsStr = `
            <button type="button" class="btn btn-danger" onclick="location.reload()">취소</button>
            <button type="button" class="btn btn-info" id="menu-save-btn">저장</button>
        `

        $(".menu-foot-btns").html(btnsStr);

        let inputArr = $("[disabled]");

        $.each(inputArr, function (idx, input) {
            $(input).removeAttr("disabled");
        })
    });

    //메뉴 삭제버튼 클릭시
    $("#menu-delete-btn").on("click", () => {
        Swal.fire({
            title: '메뉴를 삭제 하시겠습니까?',
            text: '다시 되돌릴 수 없습니다.',
            icon: 'warning',

            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
            confirmButtonColor: '#ff5757', // confrim 버튼 색깔 지정
            cancelButtonColor: '#01c0c8', // cancel 버튼 색깔 지정
            confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
            cancelButtonText: '취소', // cancel 버튼 텍스트 지정

        }).then(result => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '삭제완료',
                    icon: 'success',

                    showCancelButton: false,
                    confirmButtonColor: '#01c0c8', // confrim 버튼 색깔 지정
                    confirmButtonText: '확인' // confirm 버튼 텍스트 지정

                }).then(result => {
                    if (result.isConfirmed) {
                        let frm = $("#menu-detail-frm");
                        frm.attr("action", "/admin/menu/delete");
                        frm.submit();
                    }
                })
            }
        })
    });

    //메뉴종류 코드에 맞게 메뉴유형 값을 입력해줌
    let ctgryDetailId = "${menuVO.ctgryDetailId}";
    $.each(ctgryDetArr, function (idx, ctgryDet) {
        if (ctgryDet.ctgryDetailId === ctgryDetailId) {
            $("#menu-ctgry").html(ctgryDet.ctgryDetailNm);
            return false;
        }
    });

    //소모물품 목록의 물품유형 셀렉트의 옵션들중 db에 저장된 값과 비교해서
    //selected 부여
    let productCdSelArr = $(".product-cd-sel");
    $.each(productCdSelArr, function (idx, productCdSel) {
        let opts = $(productCdSel).find("option");
        let currPcCd = $(productCdSel).data("initSeled");

        $.each(opts, function (idx, opt) {
            if ($(opt).val() === currPcCd) {
                $(opt).attr("selected", "selected");
            }
        });
    });

    //소모물품 목록의 물품명 셀렉트의 옵션들중 db에 저장된 값과 비교해서
    //selected 부여
    let productItemSelArr = $(".product-item-sel");
    $.each(productItemSelArr, function (idx, productItemSel) {

        let currPcItem = $(productItemSel).data("initSeled");
        let pt = $(productItemSel).closest('tr').find('.product-cd-sel').data("initSeled");
        let str = "";

        $.each(prctDetcdArr, function (idx, prctDetcd) {
            if (prctDetcd.prdctNo !== currPcItem) {
                if (pt === prctDetcd.prdctClsfCd) {
                    str += `<option value="\${prctDetcd.prdctNo}">\${prctDetcd.prdctNm}</option>`;
                }
            } else {
                str += `<option value="\${prctDetcd.prdctNo}" selected>\${prctDetcd.prdctNm}</option>`;
            }
        });

        $(productItemSel).append(str);

    });
</script>
