<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오전 9:03:41</title>
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
   ex08_03.jsp
   모든 쿠키값을 조회/수정/삭제/생성
  </xmp>
  <!-- 모든 쿠키값을 조회해서 출력 -->
  <form>
   <%
    //js: document.cookie 속성
    Cookie [] cookies  = request.getCookies();
   for(Cookie cookie : cookies){
	   String cName = cookie.getName();
	   String cValue =  URLDecoder.decode(cookie.getValue(), "UTF-8");
   %>

  <input type="checkbox" name="ckbCookie" value="<%= cName %>" />
  <%= cName %> - <%= cValue %>
  <br>
  <% 		   
   }
   %>
  </form>
  <br>
  
   <a href="ex08.jsp">쿠키 Home</a><br>
  <a href="ex08_02.jsp">쿠키 생성</a><br>
  쿠키를 삭제, 수정할때는 체크한 후에 수정, 삭제<br>
  <a href="ex08_04.jsp">쿠키 삭제</a><br>
  <a href="ex08_05.jsp">쿠키 수정</a><br>
  
</div>
<script>

$("div a").eq(2).on("click", function (){
   event.preventDefault();
   let url = $(this).attr("href");
     $("form")
     .attr("action", url)
     .submit(); 
}); 

//[1] location href = "?"
//[2] form.submit()

</script>
<script>

$("div a").eq(3).on("click", function (){
   event.preventDefault();
   let url = $(this).attr("href"); 
     $("form")
     .attr("action", url)
     .submit(); 
}); 

//[1] location href = "?"
//[2] form.submit()

</script>
</body>
</html>