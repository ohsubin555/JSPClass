<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 스크립트 릿
  Date now = new Date();
  //2026-08-04 11:15:07
   String pattern = "yyyy-MM-dd hh:mm:ss";
   SimpleDateFormat sdf = new SimpleDateFormat(pattern);
   String strNow = sdf.format(now);
   System.out.printf("😍strNow %s\n" , strNow);
   // out 객체
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 4. 오전 10:46:01</title>
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
     JSP(Java Server Pages)란?
     Java를 이용해서 동적인 웹페이지를 만드는 기술입니다. HTML 안에서 Java 코드를 사용할 수 있는 웹 기술
     
        - JSP 구성요소 중 스크립트 3가지 종류  
    1) 스크립트릿(Scriptlet)
    2) 표현식(Expression)
    4) 선언문(Declaration) 
  </xmp>
  <h3>out 현재 날짜 + 시간: <%out.println(strNow); %></h3>
  <h3>표현식 현재 날짜 + 시간: <%= strNow %></h3> 
  <h3>js 현재 날짜 시간 <span id="now"></span> </h3>
</div>
<script>
let now = '<%= strNow %>'; // js에서 문자 따옴표
$("#now").html(now);
</script>
</body>
</html>