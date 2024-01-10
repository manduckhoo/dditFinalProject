const token = $("meta[name='_csrf']").attr("content");
const header = $("meta[name='_csrf_header']").attr("content");

let ctgryData;    //카테고리 정보 리스트
let ctgryDetArr;  //카테고리 상세 리스트
let prctcdArr;    //재료 종류 리스트
let prctDetcdArr; //재료 상세 리스트

const ctgrySel = $("#ctgry-sel");
let prodCdSel = $(".product-cd-sel");

$("#uploadFile").on("change", (e) => {

    let files = e.target.files;
    let fileArr = Array.prototype.slice.call(files);

    $.each(fileArr, (idx, f) => {

        if (!f.type.match("image.*")) {
            alert("이미지만 등록가능합니다.");
            return;
        }

        let reader = new FileReader();

        reader.onload = (e) => {
            let img_html = "<img class='menu-img' src='" + e.target.result + "'/>";
            $(".menu-img-area").html(img_html);
        }
        reader.readAsDataURL(f);
    });

});

//등록버튼 클릭시 컨펌띄우고 입력 체크 후 서브밋
$(".menu-submit-btn").on("click", function () {

    Swal.fire({
        title: '메뉴를 등록 하시겠습니까?',
        icon: 'warning',

        showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
        confirmButtonColor: '#01c0c8', // confrim 버튼 색깔 지정
        cancelButtonColor: '#ff5757', // cancel 버튼 색깔 지정
        confirmButtonText: '등록', // confirm 버튼 텍스트 지정
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

            $("#menu-reg-frm :input[required], #menu-reg-frm select[required]").each(function () {
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
                    title: '등록완료',
                    icon: 'success',
                    showCancelButton: false,
                    confirmButtonColor: '#01c0c8',
                    confirmButtonText: '승인',

                }).then((result) => {
                    if (result.isConfirmed) {
                        $("#menu-reg-frm").submit();
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
})

$.ajax({
    url: "/admin/menu/initSelectList",
    type: "post",
    dataType: "json",
    contentType: "application/json",
    async: false,
    beforeSend: function (xhr) {
        xhr.setRequestHeader(header, token);
    }
}).done((rst) => {
    ctgryData = rst.ctgryList;
    ctgryDetArr = rst.ctgryDetailList;
    prctcdArr = rst.prctList;
    prctDetcdArr = rst.productList;
});

//메뉴 유형 셀렉트 박스의 옵션을 생성
function setMenuOtp() {

    let optionStr;
    $.each(ctgryData, function (idx, ctgry) {
        optionStr += `<option value="${ctgry.ctgryId}">${ctgry.ctgryName}</option>`
    });
    ctgrySel.append(optionStr);
}

setMenuOtp();


//물품유형 셀렉트 박스의 옵션을 생성
function setProdOtp(selEl) {
    let optionStr;
    $.each(prctcdArr, function (idx, prct) {
        optionStr += `<option value="${prct.comDetCode}">${prct.comDetCodeNm}</option>`
    });
    selEl.append(optionStr);
}

setProdOtp(prodCdSel);

//소모물품 테이블 행추가
$(document).on("click", "#addProdRow", function () {
    let tbody = $("#prod-tbody");
    let cntRow = tbody.children("tr").length;

    let str =
        `<tr>
                <td>
                    <div class="d-flex align-items-center row-cnt">
                        ${cntRow + 1}
                    </div>
                </td>
                <td>
                    <div class="d-flex align-items-center">
                        <select class="form-select product-cd-sel" required>
                            <option value="" disabled selected>선택해주세요</option>`
    $.each(prctcdArr, function (idx, prct) {
        str += `<option value="${prct.comDetCode}">${prct.comDetCodeNm}</option>`
    })

    str +=
        `</select>
                    </div>
                </td>
                <td>
                    <div class="d-flex align-items-center">
                        <select class="form-select product-item-sel" name="recipeVOList[${cntRow}].prdctNo" required>
                            <option value="" disabled selected>선택해주세요</option>
                        </select>
                    </div>
                </td>
                <td>
                    <div class="d-flex align-items-center">
                        <div class="form-group">
                            <input type="number" value="1" name="recipeVOList[${cntRow}].recQy" class="form-control recQy"/>
                        </div>
                    </div>
                </td>
                <td>
                    <button type="button" class="btn btn-danger row-del-btn"><i class='bx bxs-trash'></i></button>
                </td>
            </tr>
            `
    tbody.append(str);
});

//행삭제 버튼 클릭시 행삭제 후 인덱스 정리
$(document).on("click", ".row-del-btn", function () {
    let row = $(this).closest("tr");

    row.remove();

    $('tbody tr').each(function (index) {
        $(this).find('.row-cnt').html((index + 1));
        $(this).find('.product-item-sel').attr('name', 'recipeVOList[' + index + '].prdctNo');
        $(this).find('.recQy').attr('name', 'recipeVOList[' + index + '].recQy');
    });
});

//물품 유형 셀렉트박스를 변경시 실행되는 함수
$(document).on("change", ".product-cd-sel", function () {
    let pt = $(this).val();
    let detSel = $(this).closest('tr').find('.product-item-sel');

    detSel.find('option').remove();

    let str = `<option value="" disabled selected>선택해주세요</option>`;

    $.each(prctDetcdArr, function (idx, prctDetcd) {
        if (pt === prctDetcd.prdctClsfCd) {
            str += `<option value="${prctDetcd.prdctNo}">${prctDetcd.prdctNm}</option>`;
        }
    });

    detSel.append(str)
})

//메뉴 유형 셀렉트박스를 변경시 실행되는 함수
ctgrySel.on("change", function () {
    let ct = $(this).val();
    let ctgryDetArea = $("#ctgryDetail-sel-area");

    $("#menu-ex-info-area").remove();
    $("#menu-nutrition-info-area").remove();
    $("#ctgryDetail-sel").remove();

    let str = `<select class="form-select" name="ctgryDetailId" id="ctgryDetail-sel">
                            <option value="" disabled selected>선택해주세요</option>`;

    $.each(ctgryDetArr, function (idx, ctd) {
        if (ct === ctd.ctgryId) {
            str += `<option value="${ctd.ctgryDetailId}">${ctd.ctgryDetailNm}</option>`
        }
    });
    str += `</select>`;
    ctgryDetArea.html(str);

    if (ct === "ctg01") {

        let nutriStr =
            `<div id="menu-nutrition-info-area">
                    <h4 class="menu-subtitle text-center">제품 영양 정보</h4>
                    <hr>
                    <div class="row admin-menu-row">
                        <div class="col-sm-1">
                            <strong class="menu-tit-nutrition">
                                칼로리(kcal)
                            </strong>
                        </div>
                        <div class="col-sm-3 nutri-input">
                            <input type="number" class="form-control" name="calories" step="0.01" required>
                        </div>
                        <div class="col-sm-1">
                            <strong class="menu-tit-nutrition">
                                당류(g)
                            </strong>
                        </div>
                        <div class="col-sm-3 nutri-input">
                            <input type="number" class="form-control" name="sugar" step="0.01" required>
                        </div>
                        <div class="col-sm-1">
                            <strong class="menu-tit-nutrition">
                                나트륨(mg)
                            </strong>
                        </div>
                        <div class="col-sm-3 nutri-input">
                            <input type="number" class="form-control" name="sodium" step="0.01" required>
                        </div>
                    </div>
                    <div class="row admin-menu-row">
                        <div class="col-sm-1">
                            <strong class="menu-tit-nutrition">
                                단백질(g)
                            </strong>
                        </div>
                        <div class="col-sm-3 nutri-input">
                            <input type="number" class="form-control" name="protein" step="0.01" required>
                        </div>
                        <div class="col-sm-1">
                            <strong class="menu-tit-nutrition">
                                포화지방(g)
                            </strong>
                        </div>
                        <div class="col-sm-3 nutri-input">
                            <input type="number" class="form-control" name="saturatedFat" step="0.01" required>
                        </div>
                        <div class="col-sm-1">
                            <strong class="menu-tit-nutrition">
                                카페인(mg)
                            </strong>
                        </div>
                        <div class="col-sm-3 nutri-input">
                            <input type="number" class="form-control" name="caffeine" step="0.01" required>
                        </div>
                    </div>
                </div>
                `
        $("#menu-basic-info-area").after(nutriStr);
    }

})