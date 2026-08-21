<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 14. 오전 11:14:35</title>
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
<%--<c:forEach begin="1" end="10" step="1" var="i" varStatus="vs">
    ${i} / ${vs.index } / ${vs.count} / ${vs.first} / ${vs.last}<br>
   </c:forEach> --%>
   
   <c:set var="sum" value="0" ></c:set>
    <c:forEach begin="1" end="10" step="1" var="i" varStatus="vs">
    
    ${i}
    <c:set var="sum" value="${sum + i }"></c:set>
    <c:if test="${not vs.last }" >+</c:if>
   </c:forEach> 
   
   =${sum}
   <hr>
   <c:set value="홍길동, 정창기, 서영학" var="names"></c:set>
   <c:forTokens items="${name }" delims="," var="name">
    <li>${name}</li>
   </c:forTokens>
   
   <hr>
   
   <c:set value="<h3>Hello</h3>" var="msg"></c:set>
   <p id="demo">
   ${msg}<br>
   <c:out value="${msg}"></c:out><br>
   <c:out value="${msg}" escapeXml="false"></c:out><br>
   </p>
</div>
<script>
</script>
</body>
</html>