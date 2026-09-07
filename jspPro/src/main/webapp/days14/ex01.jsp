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
      days14.ex01.jsp
      Google Map Open API
  </xmp>
   
   <a href="ex01_02.jsp?lat=37.5047505&lng=127.0531719">쌍용교육센터</a>
  <br>
  <br>
  지도를 출력할 컨테이너 div 태그 선언
  <div id="googleMap" style="width: 100%; height: 400px"></div>
  <script>
   function myMap() {
	   
	var mapOptions = {
			center: new google.maps.LatLng(51.508742, -0.120850)
	        ,zoom: 5
	};
	var map = new google.maps.Map(
	  document.getElementById("googleMap")
	  , mapOptions
	);
}
</script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAqRI-3Zdf5hgJFU2UdbPG9p3gS6MwPj2Q&callback=myMap"></script>
</div>
<script>

</script>
</body>
</html>