<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 7. 오후 2:40:46</title>
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
   ex06_03.jsp
  </xmp>

  
  <%
    String name = request.getParameter("name");
    String age = request.getParameter("age");  
    String address = request.getParameter("address");
    String tel = request.getParameter("tel");
  %>  
  
  > 이름 : <%= name %><br> 
  > 나이 : <%= age %><br>
  > 주소 : <%= address %><br>
  > 연락처 : <%= tel %><br>
  
</div>
<script>
</script>
</body>
</html>