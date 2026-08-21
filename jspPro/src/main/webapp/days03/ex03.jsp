<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오후 12:05:44</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/cdn-main/example.css">
<script src="${pageContext.request.contextPath}/resources/cdn-main/example.js"></script>
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
   request 객체
   
   http://localhost/jspPro/days03/ex03.jsp
  </xmp>
  <%= request.getRemoteAddr() %><br>
  <%= request.getContentLength() %><br>
  <%= request.getCharacterEncoding() %><br>
  <%= request.getContentType() %><br>
  <%= request.getProtocol() %><br>
  <%= request.getMethod() %><br>
  <%= request.getRequestURL() %><br>
  <%= request.getContextPath() %><br>
  <%= request.getServerName() %><br>
  
   <h3>EL로 표현</h3>
 *** 1. contextPath(컨텍스트 루트) : ${pageContext.request.contextPath}<br>
 *** 2. 클라이언트 IP 주소 : ${pageContext.request.remoteAddr}<br>
 *** 3. 요청 전송 방식 : ${pageContext.request.method}<br>
 *** 4. 요청 URL : ${pageContext.request.requestURL}<br>
 *** 5. 요청 URI : ${pageContext.request.requestURI}<br> 

</div>
<script>
</script>
</body>
</html>