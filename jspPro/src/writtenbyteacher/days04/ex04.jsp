<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 7. 오전 11:20:55</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kEnik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
    ex04.jsp
    ex04_finish.jsp
    [포워딩, 리다이렉트 개념 설명 예제]
  </xmp>

<%
   String name = "admin";
   int age = 20;
%>  

<%-- 
  <a href="ex04_redirect.jsp?name=<%= name %>&age=<%= age %>">리다이렉트</a><br>
  <a href="ex04_forward.jsp?name=<%= name %>&age=<%= age %>">포워딩</a><br>  
 --%> 

  <a href="ex04_redirect.jsp">리다이렉트</a><br>
  <a href="ex04_forward.jsp">포워딩</a><br>   
  
</div>
<script>
  $("a").on("click", function ({
	  $(this).attr("href", function (index, oldHref){
		  return `\${oldHref}?name=<%= name%>&age=<%= age %>`;
	  });
  }));
</script>
</body>
</html>






