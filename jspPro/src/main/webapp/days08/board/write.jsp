<%-- <%@page import="com.util.Cookies"%>
<%
   // 인증 + 권한
   String loginUser = null;
   String loginUserRole = null; // ADMIN, MANAGER , USER
   
   Cookies cookies = new Cookies(request);
   loginUser = cookies.getValue("loginUser");
   loginUserRole = cookies.getValue("loginUserRole");
   
   // EL 
   request.setAttribute("loginUser", loginUser);
   request.setAttribute("loginUserRole", loginUserRole);
%> --%>
<%@ include file="/WEB-INF/inc/sessionInc.jspf" %>
<%
   if(loginUser == null) {
      out.print("<script>");
      out.print("alert('로그인 필수');");
      out.print("location.href='/days08/ex02_default.jsp';");
      out.print("</script>");
      return; 
   }
%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오전 11:47:19</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">SCM HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
   write.jsp
  </xmp>
</div>
<script>
<c:if test="${ empty loginUser}">
alert("로그인해야 합니다.");
location.href="/days08/ex02_default.jsp";
</c:if>

</script>
</body>
</html>
