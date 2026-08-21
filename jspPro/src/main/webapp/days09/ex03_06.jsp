<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 14. 오전 11:51:20</title>
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
   fmt:parseNumber
  </xmp>
  <%
    String sNow = "2026년 08월 14일"; 
  
/*  String pattern = "yyyy년 MM월 dd일"; 
  SimpleDateFormat sdf = new SimpleDateFormat(pattern);
  Date now = sdf.parse(strNow);
   */
  %>
  <fmt:parseDate value="<%= sNow %>" pattern="yyyy년 MM월 dd일" var="now"></fmt:parseDate>
  now = ${now }<br>
  
  <%
   long price = 22345;
  
  %>
  
  
  <c:set value="<%=price %>" var="p" ></c:set>
  price <fmt:formatNumber value="${p}" type="number" pattern="##,##0.00" var="sPrice"/>
  price : ${sPrice}<br>
  
  <hr>
  <fmt:parseNumber value="${sPrice }" pattern="0,000.00"/>

</div>
<script>
</script>
</body>
</html>