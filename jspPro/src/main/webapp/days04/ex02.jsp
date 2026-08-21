<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 7. 오전 10:08:16</title>
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
    <form action="ex02_ok.jsp" method="post">
    아이디 : <input type="text" name="id" value="admin"> <br>
    비밀번호 :  <input type="password" name="passwd" value="1234"> <br>
    <input type="submit"> 
    <input type="reset"> 
  </form>
</div>

<%
 String error = request.getParameter("error");
%>
<%-- <c:if test="<%= error.equals(' ') %>">
     <script>
       alert("로그인 실패 후 redirect.");
     </script>
</c:if> --%>
<%-- <%
if (error != null && !error.equals("")) {
%>
<script>
    alert("로그인 실패 후 다시 ex02.jsp 리다이렉트되었다.");
</script>
<%
}
%> --%>
<c:if test="${param.error eq ''}">
    <script>
        alert("로그인 실패 후 다시 ex02.jsp 리다이렉트되었다.");
    </script>
</c:if>
<script>
</script>
</body>
</html>