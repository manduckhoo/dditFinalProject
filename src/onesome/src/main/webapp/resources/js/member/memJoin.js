const token = $("meta[name='_csrf']").attr("content");
const header = $("meta[name='_csrf_header']").attr("content");

let submitFlag = false;
let telCodeFlag = false;
let memIdInput = $("#memId-input");
let pass_rst = $("#password-result");
let passwd_ck = $("#password-check");
let memPw_input = $("#memPw");

$("#join-btn").on("click", () => {
    let joinFlag = true;
    $("#join-frm").find(":input[required]").each(function () {

        if ($(this).val() === "") {
            joinFlag = false;
            $(this).css("border", "2px solid red");
        } else {
            $(this).css("border", "");
            joinFlag = true;
        }

    });
    if (joinFlag && submitFlag && telCodeFlag) {
        $("#join-frm").submit();
    }
});

$("#memMail").on("change", function () {
    const regExp = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
    let memMailVal = $(this).val();
    let memMailRst = $("#memMail-result");

    if (memMailVal.match(regExp) === null) {
        memMailRst.css("color", "red").html("잘못된 이메일입니다.");
        submitFlag = false;
    } else {
        memMailRst.css("color", "red").html("");
        submitFlag = true;
    }
})

//인증번호 발송시 화면에 표시될 타이머 함수
let timer;
function startTimer() {
    let time = 180;
    timer = setInterval(function () {
        let min = parseInt(time / 60);
        let sec = time % 60;
        let text = (time > 0) ? `<p>인증코드 만료 ${min}분 : ${sec}초 남았습니다.</p>` : `<p>인증코드가 만료 되었습니다.</p>`;
        $("#memTelTimer").html(text);
        time--;

        if (time < 0) {
            clearInterval(timer);
        }
    }, 1000);
}

//핸드폰 번호 정규식 검증 및 인증번호 발송
$("#telCodeBtn").on("click", () => {
    if (timer){
        clearInterval(timer);
    }

    const regExp = /^01[0-9]{8,9}$/;
    let memTelVal = $("#memTel").val();
    let memTelRst = $("#memTel-result");

    if (memTelVal.match(regExp) === null) {
        memTelRst.css("color", "red").html("유효하지 않은 연락처");
    } else {
        let data = {"memTel": memTelVal};
        memTelRst.css("color", "red").html("");
        $.ajax({
            url: "/mem/phoneAuthentication",
            type: "post",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            }
        }).done((rst) => {
            if (rst.rst === "ok") {
                memTelRst.html("");
                $("#telCodeBtn").html("재발송");
                $("#memTelCodeArea").remove();
                $("#memTelTimer").remove();
                $("#memTelArea").append(
                    `<div class="input-group" id="memTelCodeArea">
                        <input type="text" class="form-control" id="memTelCode" placeholder="인증번호 입력"
                               required>
                        <button type="button" class="btn btn-secondary" id="telCodeCheckBtn">인증번호확인</button>
                    </div>`
                );

                memTelRst.append(
                    `<div id="memTelTimer" style="color: red"></div>`
                );

                startTimer();
            } else {
                memTelRst.css("color", "red").html(rst.msg);
                submitFlag = false;
            }
        })
    }
});

//핸드폰 인증번호 검증
$(document).on("click", "#telCodeCheckBtn", () => {
    let data = {"inputCode": $("#memTelCode").val()};
    $("#memTel").attr("readonly", "readonly");

    $.ajax({
        url: "/mem/codeVerification",
        type: "post",
        data: JSON.stringify(data),
        dataType: "json",
        contentType: "application/json",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    }).done((rst) => {
        if (rst.rst === "ok") {
            $("#memTelCode").attr("disabled", "disabled");
            if (timer){
                clearInterval(timer);
            }
            $("#memTelTimer").remove();
            $("#memTelCode").val("인증완료");
            telCodeFlag = true;
            submitFlag = true;
        }else {
            alert("잘못된 인증번호입니다.");
        }
    }).fail((xhr) => {
        console.log(xhr);
    })
});

//이름 정규식 검증
$("#memNm").on("change", function () {
    const regExp = /^[가-힣]{2,6}$/;
    let memNmVal = $(this).val();
    let memNmRst = $("#memNm-result");

    if (memNmVal.match(regExp) === null) {
        memNmRst.css("color", "red").html("이름은 한글만 가능합니다.");
        submitFlag = false;
    } else {
        memNmRst.css("color", "red").html("");
        submitFlag = true;
    }
});

//비밀번호 검증
memPw_input.on("input", function () {
    const regExp = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{8,20}$/;
    if (memPw_input.val().match(regExp) === null) {
        pass_rst.css("color", "red").html("영문, 숫자, 특수문자 중 2가지 이상 조합하여 8자리 이상");
        passwd_ck.attr("disabled", "disabled");
        submitFlag = false;
    } else {
        pass_rst.css("color", "red").html("");
        passwd_ck.removeAttr("disabled");
    }
});
passwd_ck.on("input", function () {

    if ($(this).val() !== memPw_input.val()) {
        $("#password-result").css("color", "red").html("비밀번호가 일치하지 않습니다.");
        submitFlag = false;
    } else {
        $("#password-result").css("color", "green").html("비밀번호가 일치합니다.");
        submitFlag = true;
    }

});
//비밀번호 검증 끝

//아이디 중복검사 및 정규식 검증
$("#checkMemId").on("click", function () {
    console.log(memIdInput.val());
    let memId = {"memId": memIdInput.val()};
    let checkId_result = $("#checkId-result");
    console.log(memId);

    $.ajax({
        url: "/mem/idAvailabilityCheck",
        type: "post",
        data: JSON.stringify(memId),
        dataType: "json",
        contentType: "application/json",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    }).done((rst) => {
        console.log(rst)
        if (rst.rst === "ok") {
            checkId_result.css("color", "green").html(rst.msg);
            submitFlag = true;
        } else {
            checkId_result.css("color", "red").html(rst.msg);
            submitFlag = false;
        }
    }).fail((xhr) => {
        console.log(xhr);
    })
});
