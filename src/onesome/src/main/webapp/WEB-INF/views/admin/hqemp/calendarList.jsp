<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script src="${pageContext.request.contextPath}/resources/fullcalendar-6.1.9/dist/index.global.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>

<!-- 로그인 정보 긁어오기 -->
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.ownerVO" var="franchiseOwnerVO"/>
</sec:authorize>

<!-- Core Css -->
<style data-fullcalendar=""></style>
<link rel="stylesheet" href="/resources/bootstrap/src/assets/css/styles.css">


<!-- head start -->
<div
	class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
	<div class="card-body px-4 py-3">
		<div class="row align-items-center">
			<div class="col-9">
				<h1 class="fw-semibold mb-8">본사 직원 근태관리</h1>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							class="text-muted text-decoration-none" href="/admin/main">Main</a>
						</li>
						<li class="breadcrumb-item" aria-current="page">근태관리</li>
					</ol>
				</nav>
			</div>
			<div class="col-3">
				<div class="text-center mb-n5">
					<img
						src="/resources/bootstrap/src/assets/images/breadcrumb/ChatBc.png"
						alt="" class="img-fluid mb-n4">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- head end -->


<!--///////////////// 캘린더 시작  /////////////////-->
<div class="card">
	<div>
		<div class="row gx-0">
			<div class="col-lg-12">
				<div class="p-4 calender-sidebar app-calendar">
					<div id="calendar"
						class="fc fc-media-screen fc-direction-ltr fc-theme-standard"
						style="height: 1052px;">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--///////////////// 캘린더 끝  /////////////////-->


<button type="button"
	class="btn mb-1 waves-effect waves-light btn-outline-success" onclick="location.href='/frcs/emp/list'">
	<a href="/frcs/emp/list">직원 목록</a>
</button>


<script>

	//전송하기 위해 추가함
	let attendanceManagementVO = new Object();
	
    let calendar = null;
    let localeCode = 'ko'; //달력 언어설정
	
    /**
     * 캘린더 이벤트 수정을 위한 함수 사용되는 곳이 2곳 이상이므로
     * 코드의 중복을 피하기 위해 함수 분리
     * @param info 정보를 수정할 이벤트 객체
     */
     
   //calendar update 시작
    function event_update(info) {
        let jsondata;
        if (confirm(info.event.attndceTypeCd + " 일정을 수정하시겠습니까?")) {

            let event = {};
            event.attndceNo = info.event.id;
            event.attndceTypeCd = info.event.title;
            event.attndceStrDt = info.event.start;

            if (info.event.end !== null) {
                event.attndceEndDt = info.event.end;
            } else {
                event.attndceStrDt = info.event.start;
            }

//             if (info.event.allDay === true) {
//                 event.calendarAllday = 1;
//             } else {
//                 event.calendarAllday = 0;
//             }

            jsondata = JSON.stringify(event);

        } else {
            location.reload();
        }

        $.ajax({
            url: "${pageContext.request.contextPath}/frcs/emp/updateEvent",
            type: "post",
            dataType: "json",
            data: jsondata,
            contentType: "application/json",
			beforeSend: function (xhr) {
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			    }
        }).done((rst) => {
            if (rst.stat === "ok") {
                alert("일정 수정 완료");
            }
        }).fail((request, status, error) => {
            alert("에러발생" + error);
        });
    }

	//calendar update 끝
	
	//calendar 불러오기 시작
    
    $(document).ready(() => {

        $(function () {
			
        	let frcsEmpNo = '${franchiseEmployeeVO.frcsEmpNo}';
        	let frcsNo = '${franchiseEmployeeVO.frcsNo}';
        	
        	//전송하기 위해 추가함
         	let data = {"frcsEmpNo": frcsEmpNo};
         	//let data = {"frcsNo": frcsNo};
        	console.log(data);
//         	attendanceManagementVO.append("frcsEmpNo", frcsEmpNo);
        	//추가 끝
        	
            let request = $.ajax({
                url: "${pageContext.request.contextPath}/frcs/emp/getEvents",
                type: "POST",
                //전송하기 위해 추가함
                data: JSON.stringify(data),
                contentType:"application/json;charset=utf-8",
                beforeSend: function (xhr) {
    				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    			    },
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
                        right: 'dayGridMonth,timeGridWeek,timeGridDay'
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
                            	end: arg.end
                            })
                        } else {
                            alert("제목을 입력해주세요");
                            return;
                        }

                        let event = {};

                        event.attndceTypeCd = title;
                        event.attndceStrDt = arg.start;
                        event.attndceEndDt = arg.end;
						event.frcsEmpNo = frcsEmpNo;
						event.frcsNo = frcsNo;
						
                        console.log(event);
                        /*
                           	이벤트 생성시 allDay속성은 boolean타입이나 오라클에서는
                            boolean타입을 지원하지 않기때문에 true는 1로 false는 0으로 표현함
                         */
                        /* if (arg.allDay === true) {
                            event.calendarAllday = 1;
                        } */

                        let jsondata = JSON.stringify(event);

                        $.ajax({
                            url: "${pageContext.request.contextPath}/frcs/emp/addEvent",
                			beforeSend: function (xhr) {
                				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
                			    },
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


                            let data = JSON.stringify({attndceNo: event.event.id});

                            $.ajax({
                                url: "${pageContext.request.contextPath}/frcs/emp/deleteEvent",
                    			beforeSend: function (xhr) {
                    				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
                    			    },
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

</script>


<script
	src="/resources/bootstrap/src/assets/libs/jquery/dist/jquery.min.js"></script>
<!-- <script src="/resources/bootstrap/src/assets/js/app.min.js"></script> -->
<!-- <script src="/resources/bootstrap/src/assets/js/app.init.js"></script> -->
<script
	src="/resources/bootstrap/src/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="/resources/bootstrap/src/assets/libs/simplebar/dist/simplebar.min.js"></script>

<script src="/resources/bootstrap/src/assets/js/sidebarmenu.js"></script>
<script src="/resources/bootstrap/src/assets/js/theme.js"></script>

<script
	src="/resources/bootstrap/src/assets/libs/fullcalendar/index.global.min.js"></script>
<!-- <script src="/resources/bootstrap/src/assets/js/apps/calendar-init.js"></script> -->

