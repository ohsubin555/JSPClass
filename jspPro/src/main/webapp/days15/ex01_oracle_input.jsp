<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 26. 오전 9:27:24</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>

<!-- jquery.com UI 모달창 -->
<link rel="stylesheet"    href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kEnik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
   ex01_oracle_input.jsp - 맛집 등록
  </xmp>
  
  <div id="map" style="width: 100%; height: 500px;"></div>
  
  <script>
   // 쌍용교육센타 - 지도 중심
   let lat = 37.5047505;  // 위도
    let lng = 127.0531719; // 경도
   
   function  myMap() {
      // 1. 
      var mapCanvas = document.getElementById("map");
      var myCenter = new google.maps.LatLng(lat, lng); 
      var mapOptions = {
         center : myCenter,
         zoom : 13
      };
      var map = new google.maps.Map(mapCanvas, mapOptions);
      
      // 2. 지도 클릭할 때 이벤트 처리
      google.maps.event.addListener(map, 'click', function(event) {
         placeMarker(map, event.latLng);
         $('#h_lng').val(event.latLng.lng()); // 위도
         $('#h_lat').val(event.latLng.lat()); // 경도   
         
         $("#myModal").modal("show");
      });      
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
  </script>
  
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAqRI-3Zdf5hgJFU2UdbPG9p3gS6MwPj2Q&callback=myMap"></script>
<!-- Modal -->
   <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog" style="width: 350px">

         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title">위치 정보 입력</h4>
            </div>
            <div class="modal-body"> 
               <div style="text-align: center">
                  <form id="form1" action="ex01_oracle_input_ok.jsp" method="post">
                     <table style="width:300px;text-align: center" border="1">
                     
                        <tr><td>ID</td></tr>
                        <tr><td><input type="text" name="id" value="100"></td></tr>
                        <tr><td>TYPE</td></tr>
                        <tr><td><input type="text" name="type" value="restaurant or bar"></td></tr>
                        <tr><td>NAME</td></tr>
                        <tr><td><input type="text" name="name" value="seven"></td></tr>
                        <tr><td>ADDRESS</td></tr>
                        <tr><td><input type="text" name="address" value="seoul"></td></tr>
                        <tr>
                           <td><input type="button" id="btnSave" value="저장"></td>
                        </tr>
                     </table>
   <input type="hidden" id="h_lat" name="lat" value="" />
   <input type="hidden" id="h_lng" name="lng" value="" />
                  </form>
               </div>

            </div>
            <div class="modal-footer">
               <button type="button" onclick="modal_close();" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
         </div>

      </div>
   </div>
   
</div>

<script>
   $("#btnSave").click(function (){
      if( confirm("정말 저장합니까?") ){
       $("#form1").submit();
      } // if
    }); // click
    
    function modal_close(){
       if( typeof marker != 'undefined') {
          marker.setMap(null);  // 마커 삭제....
       } // if
    } // modal_close
</script>
</body>
</html>