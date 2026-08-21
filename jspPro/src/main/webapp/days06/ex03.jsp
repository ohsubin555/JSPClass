<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page buffer="1kb" autoFlush="true" %>
<%@ page trimDirectiveWhitespaces="ture" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 11. 오전 11:40:34</title>
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
     ex03.jsp
     p.152 버퍼와 에러 페이지의 관계
  </xmp>
  <%
   for(int i=1; i<=10000; i++){
	   out.print("["+i+"]");
	   if(i==2){
		   out.clearBuffer();
	   }
   }          
  %>
  
</div>
<script>
</script>
</body>
</html>