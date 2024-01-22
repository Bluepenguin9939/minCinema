<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<link href="/resources/css/loadMap.css" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dffa15c91047af591f132ab540dab1ab"></script>
<script>
$(function() {
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(35.535067, 129.310925),
		level: 3
	};
	
	var map = new kakao.maps.Map(container, options);
	
	var markerPosition  = new kakao.maps.LatLng(35.535000, 129.310800); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	var iwContent = '<div style="padding:5px;">MinCinema</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(35.535000, 129.310800); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8" style="height: 85vh;">
			<h2 style="margin-top: 20px;">오시는 길</h2>
			<hr style="border-bottom: 2px solid #555555;">
			<div id="map" style="width:100%;height:400px;"></div>
			<h2>위치 정보</h2>
			<hr style="border-bottom: 2px solid #555555;">
			<h4>주소 : 울산광역시 남구 삼산로35번길 19 (신정동)(44677)</h4>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>