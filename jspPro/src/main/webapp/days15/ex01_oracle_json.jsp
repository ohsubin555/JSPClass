<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 26. 오전 9:27:57</title>
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
      json.jsp
  </xmp>
  <a href="ex01_oracle_input.jsp">맛집 등록</a> 
  <br>
  <button id="btnDeleteMarkers">delete marker</button>
  <br>  
  <div id="map" style="width: 100%; height: 500px;"></div>

</div>
<script>
   let lat = 37.5047505;  // 위도
   let lng = 127.0531719; // 경도
   
   // js 배열
   var markers = [];
   
   // js 객체
   var customLabel = {
         restaurant:{
            label:'R'
         }
            ,bar:{
               label: 'B'
            }
   };
   
   // 콜백함수
   function  myMap() {
      // 1. 
      var mapCanvas = document.getElementById("map");
      var myCenter = new google.maps.LatLng(lat, lng); 
      
      var mapOptions = {
         center : myCenter,
         zoom : 13
      };
      var map = new google.maps.Map(mapCanvas, mapOptions);
      
      // 2. ajax 요청 -> _json_data.jsp  -> 지도 위에 마커 표시
      var infoWindow = new google.maps.InfoWindow;
      
      // 3. jquery ajax method :   ajax()
      var params = null;
      
      $.ajax({
         url : "ex01_oracle_json_data.jsp",
         dataType : "json",
         type : "get",
         data : params,
         cache : false,
         success : function(data) { //  []
         // data == [
          //             {"id":100,"type":"restaurant","name":"admin","lng":127.03432487024399,"lat":37.49937084987687,"address":"seoul"}
          //             ,{"id":200,"type":"bar","name":"admin","lng":127.03231042642815,"lat":37.49895800057274,"address":"seoul"}
          //        ]
            $(data).each(
                  function(index, e) {
                     console.log( e );
                     // id, type,name, lng,lat,address
                     var id = e.id;
                     var name = e.name;
                     var address = e.address;
                     var type = e.type;
                     var point = new google.maps.LatLng(
                           parseFloat(e.lat), parseFloat(e.lng));

                     var infowincontent = $("<div />");
                     var strong = $("<strong />").html(name);
                      infowincontent.append(strong).append($("<br>"));

                     var text = document.createElement('text');
                     text.textContent = address;
                      infowincontent.append(text);
                      // "restaurant"
                      // person.name == person["name"]
                     var icon = customLabel[type] || {};

                     var marker = new google.maps.Marker({
                        map : map,
                        position : point,
                        label : icon.label
                     });
                     
                     marker.addListener('click', function() {
                        infoWindow.setContent(infowincontent.html());
                        infoWindow.open(map, marker);
                     }); 
                     
                     // 모든 마커를 저장했다.
                     markers.push(marker);
                  }); // each
         }
      }); // ajax 
         
   } // myMap
   
   function placeMarker(map, location) {       
      marker = new google.maps.Marker({
         position : location,  
         map : map
      });
      // 
      var infowindow = new google.maps.InfoWindow({
         content : 'Latitude: ' + location.lat() + 
         '<br>Longitude: '   + location.lng()
      });
      infowindow.open(map, marker);
   }
   
   // 5. 
   $("#btnDeleteMarkers").click(function (){
      for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(null);  // 마커 삭제
      }
   });
</script>
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAqRI-3Zdf5hgJFU2UdbPG9p3gS6MwPj2Q&callback=myMap"></script>
<script>

</script>
</body>
</html>