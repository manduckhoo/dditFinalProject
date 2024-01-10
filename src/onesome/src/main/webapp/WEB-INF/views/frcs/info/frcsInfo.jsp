<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?9b66b242d99a62e251cf9fee5901e169"></script> -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>

<!-- 키 물어보기 -->

<style>
.card-body {
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
}
.right-box{
	margin-left:150px
}
</style>

<!-- 로그인 정보 긁어오기 -->
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.ownerVO" var="franchiseOwnerVO"/>
</sec:authorize>

<%-- <p>${franchiseVO}</p> --%>
<%-- <p>${franchiseVO.frcsNm}</p> --%>

<!-- 브레드 크럼 시작  -->
<div
	class="card bg-success-subtle shadow-none position-relative overflow-hidden mb-4">
	<div class="card-body px-4 py-3">
		<div class="row align-items-center">
			<div class="col-9">
				<h4 class="fw-semibold mb-8">가맹점 정보 관리</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							class="text-muted text-decoration-none" href="/frcs/main">Main</a>
						</li>
						<li class="breadcrumb-item text-muted" aria-current="page">가맹점 정보 조회</li>
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
<!-- 브레드 크럼 끝  -->

<div class="col-sm-12 col-lg-12">
	<div class="card">
		<div class="border-bottom title-part-padding">
			<h4 class="card-title mb-0">가맹점 정보 조회</h4>
		</div>
		<div class="card-body">
			<div class="left-box">
				<div class="mb-3">
					<input type="hidden" class="form-control date-inputmask"
						name="frcsNo" id="frcsNo" placeholder="Enter Date"
						value="${franchiseVO.frcsNo}">
				</div>
				<div class="mb-3">
					<label class="font-weight-medium fs-3 mb-1">가맹점명</label> <input
						type="text" class="form-control phone-inputmask" id="frcsNm"
						name="frcsNm" value="${franchiseVO.frcsNm}" readonly>
				</div>
				<div class="mb-3">
					<label class="font-weight-medium fs-3 mb-1">가맹점 번호</label> <input
						type="text" class="form-control international-inputmask"
						id="frcsTel" name="frcsTel" value="${franchiseVO.frcsTel}"
						readonly>
				</div>
				<div class="mb-3">
					<label class="font-weight-medium fs-3 mb-1">가맹점 수용 인원</label> <input
						type="text" class="form-control international-inputmask"
						id="frcsCpctPsn" name="frcsCpctPsn"
						value="${franchiseVO.frcsCpctPsn} 명" readonly>
				</div>
				<div class="mb-3">
					<label class="font-weight-medium fs-3 mb-1">영업 시작 시간</label> <input
						type="time" class="form-control xphone-inputmask"
						id="frcsBsnsStrtTm" name="frcsBsnsStrtTm"
						value="${franchiseVO.frcsBsnsStrtTm}" readonly>
				</div>
				<div class="mb-3">
					<label class="font-weight-medium fs-3 mb-1">영업 종료 시간</label> <input
						type="time" class="form-control purchase-inputmask"
						id="frcsBsnsEndTm" name="frcsBsnsEndTm"
						value="${franchiseVO.frcsBsnsEndTm}" readonly>
				</div>
				<div class="mb-3">
					<label class="font-weight-medium fs-3 mb-1">개점일자</label> <input
						type="date" class="form-control cc-inputmask" id="frcsOpngDt"
						name="frcsOpngDt"
						value="<fmt:formatDate value="${franchiseVO.frcsOpngDt}" pattern="yyyy-MM-dd"/>"
						readonly />
				</div>
				<div class="mb-3">
					<label class="font-weight-medium fs-3 mb-1">가맹점 주 고유번호 </label> <input
						type="text" class="form-control ssn-inputmask" id="frcsOwnrNo"
						name="frcsOwnrNo" value="${franchiseOwnerVO.frcsOwnrNo}" readonly>
				</div>
			</div>
			<div class="right-box">
				
				<div class="mb-3">
					<label class="font-weight-medium fs-3 mb-1"
						style="margin-top: 16px;">우편번호 </label> <input type="text"
						class="form-control ssn-inputmask" id="frcsPostNo"
						name="frcsPostNo" value="${franchiseVO.frcsPostNo}" readonly>
				</div>
				<div class="mb-3">
					<label class="font-weight-medium fs-3 mb-1">기본 주소</label> <input
						type="text" class="form-control ssn-inputmask" id="frcsAddr"
						name="frcsAddr" value="${franchiseVO.frcsAddr}" readonly>
				</div>
				<div class="mb-3">
					<label class="font-weight-medium fs-3 mb-1">상세 주소</label> <input
						type="text" class="form-control ssn-inputmask" id="frcsDtlAddr"
						name="frcsDtlAddr" value="${franchiseVO.frcsDtlAddr}" readonly>
				</div>
				<div>
				<label class="font-weight-medium fs-3 mb-1" style="margin-top: 16px;">가맹점 위치 </label>
				<div id="map" style="border: solid; border-color:#5A6A85; width: 450px; height: 450px;"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
let franchiseVO ='${franchiseVO}';

var mapContainer = document.getElementById('map'), //지도를 표시할 div
	mapOption = {
		center: new kakao.maps.LatLng(36.32503, 127.4089), //지도의 중심좌표
		level: 3 //지도 확대 레벨
};

//지도 생성
var map = new kakao.maps.Map(mapContainer, mapOption);

//주소 -> 좌표 변환 객체
var geocoder = new kakao.maps.services.Geocoder();

for(let i=0; i<franchiseVO.length; i++){
	let imgSrc="${pageContext.request.contextPath}/resources/image/chan_marker.png";
	let imgSize = new kakao.maps.Size(64, 64);
	
	
	let markerImage = new kakao.maps.MarkerImage(imgSrc, imgSize);
	
	//주소로 좌표 검색
	geocoder.addressSearch('${franchiseVO.frcsAddr}', function (result, status){
		
		//정상적으로 검색이 완료됐으면
		if(status === kakao.maps.services.Status.OK){
			
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			//결과값으로 받은 위치를 마커로 표시
			var marker = new kakao.maps.Marker({
                map: map,
                position: coords,
                image: markerImage
            });
			
			// 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: `<div style="width:150px;text-align:center;padding:6px 0;">\'${franchiseVO.frcsNm}'</div>`
            });
			
			//마커에 이벤트 부여
            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
		
		map.setCenter(coords);
		
	});
}

// 인포윈도우를 표시하는 클로저를 만드는 함수
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수
function makeOutListener(infowindow) {
    return function () {
        infowindow.close();
    };
}

$(".store_row").on("click", function () {
    let addr = $(this).children("td:eq(3)").html();

    geocoder.addressSearch(addr, function (result, status) {

        var moveLatLon = new kakao.maps.LatLng(result[0].y, result[0].x);

        map.panTo(moveLatLon);
    })
})

</script>












