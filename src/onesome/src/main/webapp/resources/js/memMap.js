// 지도를 표시할 div
var mapContainer = document.getElementById('map'),
	mapOption = {
		center: new kakao.maps.LatLng(36.32507, 127.4089), // 지도의 현재 중심좌표
		level: 4 // 지도의 확대 레벨
	};

// 지도 생성
var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커를 담을 배열
var markers = [{
	title: '대전 오류점',
	latlng: new kakao.maps.LatLng(36.32437, 127.4099)
},
{
	title: '대전 용두점',
	latlng: new kakao.maps.LatLng(36.32517, 127.4104)
},
{
	title: '대전 목동점',
	latlng: new kakao.maps.LatLng(36.33481, 127.4083)
},
{
	title: '대전 서대전점',
	latlng: new kakao.maps.LatLng(36.32133, 127.4089)
}
];


// 마커를 생성
for (var i = 0; i < markers.length; i++) {
	var marker = new kakao.maps.Marker({
		map: map, // 마커를 표시할 지도
		title: markers[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		position: markers[i].latlng // 마커를 표시할 위치
	});
}

// 검색 결과 목록을 클릭했을때 실행되는 함수
function goto_position(x, y, name) {
	var moveLatLon = new kakao.maps.LatLng(x, y, name); //마커 표시

	// 지도 중심을 이동 시킵니다
	map.panTo(moveLatLon);
	var iwContent = '<div style="padding:5px;">'+ name + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		iwPosition = new kakao.maps.LatLng(x, y); //인포윈도우 표시 위치입니다

	// 검색 결과 목록을 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		content: iwContent,
		position: iwPosition
	});
	
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker[0]);
}