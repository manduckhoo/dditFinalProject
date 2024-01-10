let calendar = null;
let localeCode = 'ko'; //달력 언어설정

/**
 * 캘린더 이벤트 수정을 위한 함수 사용되는 곳이 2곳 이상이므로
 * 코드의 중복을 피하기 위해 함수 분리
 * @param info 정보를 수정할 이벤트 객체
 */
function event_update(info) {
    let jsondata;
    if (confirm(info.event.title + " 일정을 수정하시겠습니까?")) {

        let event = {};
        event.calendarNo = info.event.id;
        event.calendarTitle = info.event.title;
        event.calendarStart = info.event.start;

        if (info.event.end !== null) {
            event.calendarEnd = info.event.end;
        } else {
            event.calendarEnd = info.event.start;
        }

        if (info.event.allDay === true) {
            event.calendarAllday = 1;
        } else {
            event.calendarAllday = 0;
        }

        jsondata = JSON.stringify(event);

    } else {
        location.reload();
    }

    $.ajax({
        url: "/fullcalendar/updateEvent",
        type: "post",
        dataType: "json",
        data: jsondata,
        contentType: "application/json"
    }).done((rst) => {
        if (rst.stat === "ok") {
            alert("일정 수정 완료");
        }
    }).fail((request, status, error) => {
        alert("에러발생" + error);
    });
}

$(document).ready(() => {

    $(function () {

        let request = $.ajax({
            url: "/fullcalendar/getEvents",
            type: "GET",
            dataType: "json"
        });

        request.done((data) => {
            let caledarEl = document.querySelector("#calendar");
            calendar = new FullCalendar.Calendar(caledarEl, {
                initialView: 'dayGridMonth',
                locale: localeCode,
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                },
                navLinks: true,
                editable: true,
                selectable: true,
                droppable: true,
                events: data, // 데이터베이스에서 가져온 이벤트 정보가 들어가야하는 위치
                /**
                 * 캘린더에서 클릭 및 드래그시 발생하는 이벤트
                 * 이벤트 추가기능을 구현함
                 * @param arg 클릭한 날짜의 이벤트 객체
                 */
                select: (arg) => {
                    let title = prompt("일정 내용을 입력해 주세요");
                    if (title) {
                        calendar.addEvent({
                            title: title,
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay
                        })
                    } else {
                        alert("제목을 입력해주세요");
                        return;
                    }

                    let event = {};

                    event.calendarTitle = title;
                    event.calendarStart = arg.start;
                    event.calendarEnd = arg.end;

                    /*
                        이벤트 생성시 allDay속성은 boolean타입이나 오라클에서는
                        boolean타입을 지원하지 않기때문에 true는 1로 false는 0으로 표현함
                     */
                    if (arg.allDay === true) {
                        event.calendarAllday = 1;
                    }

                    let jsondata = JSON.stringify(event);

                    $.ajax({
                        url: "/fullcalendar/addEvent",
                        type: "post",
                        dataType: "json",
                        data: jsondata,
                        contentType: "application/json"
                    }).done((rst) => {
                        if (rst.stat === "ok") {
                            alert("일정 추가 완료");
                        }
                    }).fail((request, status, error) => {
                        alert("에러발생" + error);
                    });

                    calendar.unselect();
                },
                /**
                 * 캘린더의 이벤트를 드래그&드롭시 발생하는 이벤트
                 * 이벤트 수정기능을 구현함
                 * @param event 드래그&드롭으로 이동된 이벤트 객체
                 */
                eventDrop: (event) => {
                    event_update(event);
                },
                /**
                 * 캘린더의 이벤트의 가장자리를 드래그하여 리사이징시 발생하는 이벤트
                 * 이벤트 수정기능을 구현함
                 * @param event 리사이징한 이벤트 객체
                 */
                eventResize: (event) => {
                    event_update(event);
                },
                /**
                 * 캘린더의 이벤트를 클릭시 발생하는 이벤트
                 * 이벤트 삭제기능을 구현함
                 * @param event 클릭한 이벤트 객체
                 */
                eventClick: (event) => {
                    if (confirm(event.event.title + " 일정을 삭제 하시겠습니까?")) {
                        event.event.remove();

                        let data = JSON.stringify({calendarNo: event.event.id});

                        $.ajax({
                            url: "/fullcalendar/deleteEvent",
                            type: "post",
                            data: data,
                            dataType: "json",
                            contentType: "application/json"
                        }).done((rst) => {
                            if (rst.stat === "ok") {
                                alert("일정 삭제 완료");
                            }
                        }).fail((request, status, error) => {
                            alert("에러발생" + error);
                        });
                    }
                }

            });
            calendar.render();
        });

    });

});