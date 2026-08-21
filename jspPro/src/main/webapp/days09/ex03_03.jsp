<%@page import="days06.Member"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 14. 오전 11:05:33</title>
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
   
  </xmp>
  <%
    Member member = new Member();
    member.setId("admin");
    member.setName("관리자");
    
  %>
  <c:set value="member" var="mem"></c:set>
  
  
  <c:set target="${mem}" property="email" value="admin@naver.com"></c:set>
  
  id: ${mem.id}<br>
  name: ${mem.name}<br>
  eamil: ${mem.email}<br>
  
  
  <%
   Map <String, String> map = new HashMap<>();
  map.put("id", "admin");
  map.put("passwd", "1234");
  request.setAttribute("map", map);
  %>
  
  id: <%= map.get("id") %><br>
  passwd: <%= map.get("passwd") %><br>
  
  <hr>
  <c:set value="${map}" var="m"></c:set>
  id : ${m.id }<br>
  passwd : ${m.passwd }<br>
  
  
</div>
<script>
</script>
</body>
</html>