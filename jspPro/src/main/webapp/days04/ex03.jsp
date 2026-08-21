<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String logonName = request.getParameter("logonName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 7. 오전 10:08:16</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<style>
#logon, #logout{
    border:1px solid gray;
    width:300px;
    padding:20px;
    border-radius: 10px;
  }
</style>

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

  <c:if test="${param.name == null }">
    <div id="logon">
         <form action="ex03_ok.jsp" method="post">
    아이디 : <input type="text" name="id" value="admin"> <br>
    비밀번호 :  <input type="password" name="passwd" value="1234"> <br>
    <input type="submit"> 
    <input type="reset">   
  </form>
</div>

  </c:if>
  <!-- 로그인 o -->
  <c:if test="${param.name != null }">
  <div id="logout" style="display: none">
  
  
  <%= logonName %>>님 로그인하셨습니다.<br>
     <button>로그아웃</button>

<c:if test="${param.auth eq true }">
<a href="#">설문조사</a><br>
</c:if>

 <a href="#">일정관리</a><br>
  </c:if>

  <br>
  
  <a href="#">게시판</a><br>
</div>
<c:if test="not empty param.name">
  <script>
    alert("로그인성공");
    $("#logon").hide();
    $("#logout").show();
  </script>
</c:if>

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

$("button").on("click", function (){
	location.href = "ex03_logout.jsp"
});

</script>
</body>
</html>