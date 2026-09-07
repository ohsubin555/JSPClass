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
      days14.ex01_04.jsp
      Google Map Open API
      지도위에서 지도를 클릭할때 이벤트 처리 : 클릭된 위치에 마커 + 정보창 출력
 
  </xmp>

  구글 지도 오버레이: 마커, 정보창, 폴리라인, 원, 사각형, 다각형
  마커: 지도 상의 개별위치 표시
  마커추가
   ㄴ1) Marker() 객체 생성
   ㄴ2) setMap() 지도위에 마커 표시
  <div id="googleMap" style="width: 100%; height: 400px"></div>
 <script>
    function getRndNumber(min, max) {
      return (Math.random() * (max - min) ) + min;
   }
  
    function myMap(){
       // 쌍용교육센터 위도, 경도
       let lat = 37.5047505;
       let lng = 127.0531719;
       
       const mapCanvas = document.getElementById("googleMap");
       let mapCenter = new google.maps.LatLng( lat , lng );
       
       var  mapOptions = {
             center: mapCenter
             , zoom: 15
       };
       
       var map = new google.maps.Map(
             mapCanvas
             , mapOptions
       ); 
       
            
       // 지도 클릭할 때 정보창 표시
       map.addListener("click", function (event){
          console.log(event.latLng);
          console.log(event.latLng.lat() + "/" + event.latLng.lng());
          placeMarker(map, event.latLng);
       }); 
       
    }
    function placeMarker(map, markerCenter) {
    	//1
        let marker = new google.maps.Marker({
           position: markerCenter 
        });
        marker.setMap( map );
        
        //2
        let message = `lat=\${markerCenter.lat()}<br>lng=\${markerCenter.lng()}`;
        let infoWindow = new google.maps.InfoWindow({
           content: message
        });
        infoWindow.open( map , marker );
        
	}
  </script>  
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAqRI-3Zdf5hgJFU2UdbPG9p3gS6MwPj2Q&callback=myMap"></script>
</div>
<script>

</script>
</body>
</html>