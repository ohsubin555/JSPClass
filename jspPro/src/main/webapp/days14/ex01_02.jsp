<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 25. 오전 9:00:57</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">Subin YaHo</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
      days14.ex01_02.jsp
      Google Map Open API
  </xmp>

  구글 지도 오버레이: 마커, 정보창, 폴리라인, 원, 사각형, 다각형
  마커: 지도 상의 개별위치 표시
  마커추가
   ㄴ1) Marker() 객체 생성
   ㄴ2) setMap() 지도위에 마커 표시
  <div id="googleMap" style="width: 100%; height: 400px"></div>
  <script>
  let lat = <%= request.getParameter("lat")%>;
  let lng = ${param.lng};
 
   function myMap() {
	   const mapConvas = document.getElementById("googleMap");
	   let mapCenter = new google.maps.LatLng(lat,lng);
	var mapOptions = {
			center: mapCenter
	        ,zoom: 15
	};
	var map = new google.maps.Map(
		mapConvas
	  , mapOptions
	);
	
	// 쌍용교육센터 표시(마커)추가
	let marker = new google.maps.Marker({
		
		position: mapCenter
	//	, animation: google.maps.Animation.BOUNCE
		,icon: "핑크볼.png"
	});
	marker.setMap(map);
	
	//2. 정보창: 텍스트 내용이 포함된 창
	let message = "<a href='http://www.sist.co.kr'><img src='/images/SiSt.ico'>썅용</a>"
	let infoWindow = new google.maps.InfoWindow({
		content: message
	});
	infoWindow.open(map, marker);
}
</script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAqRI-3Zdf5hgJFU2UdbPG9p3gS6MwPj2Q&callback=myMap"></script>
</div>
<script>

</script>
</body>
</html>