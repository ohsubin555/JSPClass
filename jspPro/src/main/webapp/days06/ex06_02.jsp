<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 11. 오후 12:42:13</title>
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
   ex06_02.jsp
   web.xml
  </xmp>
  <c:forEach items="${initParam}" var="entry">
     파라미터 이름 = ${entry.key }<br>
     파라미터 깂 = ${entry.value }<br>
  </c:forEach>
  <hr>
  <%
   Enumeration<String> en = application.getInitParameterNames();
   while(en.hasMoreElements()){
	  String paramName = en.nextElement();
	  String paramValue = application.getInitParameter(paramName);
  
    %>
   파라미터 이름 = <%= paramName %><br>
   파라미터 값 = <%= paramValue %>
   <%
   } // while
   %>
</div>
<script>
</script>
</body>
</html>