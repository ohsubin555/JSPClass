<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 7. 오전 11:24:28</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
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
   ex04_finish.jsp
  </xmp>
<%
  String name = request.getParameter("name");
  String age = request.getParameter("age");
%>  

<!-- ex04.jsp[a]클릭->ex04_forward.jsp 포워딩-> -->
name : <%= name %><br>
age : <%= age %><br>
<hr>
EL name : ${ param.name }<br> 
EL age : ${ param.age }<br> 
  
</div>
<script>
</script>
</body>
</html>








