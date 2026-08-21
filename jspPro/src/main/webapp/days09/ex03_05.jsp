<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 14. 오전 11:43:12</title>
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
     int [] arr = {3, 5, 2, 4, 1};
   %>
   <c:set value="<%= arr %>" var="ar"></c:set>
   <c:forEach items="${ar}" var="n" varStatus="vs" >
   <li>arr[${vs.index}]=${n}</li></c:forEach>
  <%
   Map <String, String> map = new HashMap<>();
  map.put("id", "admin");
  map.put("passwd", "1234");
  request.setAttribute("map", map);
  %>
  <c:set value="<%= map %>" var="m"></c:set>
  <c:forEach items="${m}" var="entry">
  <li>${entry.key }- ${entry.value }</li>
   </c:forEach>
</div>
<script>
</script>
</body>
</html>