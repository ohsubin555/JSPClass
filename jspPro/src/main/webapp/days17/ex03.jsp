<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 31. 오전 10:05:50</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
      
  </xmp>
  <div id="myChart" style="width:100%; max-width:600px; height:500px;"></div>
</div>
<script>
google.charts.load('current',{packages:['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
// Set Data
const data = google.visualization.arrayToDataTable([
  ['Price', 'Size'],
  [50,7],[60,8],[70,8],[80,9],[90,9],
  [100,9],[110,10],[120,11],
  [130,14],[140,14],[150,15]
]);
// Set Options
const options = {
  title: 'House Prices vs. Size',
  hAxis: {title: 'Square Meters'},
  vAxis: {title: 'Price in Millions'},
  legend: 'none'
};
// Draw
const chart = new google.visualization.LineChart(document.getElementById('myChart'));
chart.draw(data, options);
}
</script>
</body>
</html>