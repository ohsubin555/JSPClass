<%@page import="java.util.regex.Pattern"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="days09.FormatUtil"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 14. 오전 10:08:13</title>
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
   [EL 메서드 사용] 
   FormatUtil.java
     ㄴ static 메서드 선언 -> 호출
     ㄴ 인스턴스 메서드 선언 -> 호출
  </xmp>
  
  <%
  long price = 22345;
  request.setAttribute("price", price);
  
  %>
  
  >price(JSTL:fmt) <fmt:formatNumber value="${price }" pattern="#,##0"/><br>
  
  <hr>
  
  >price(EL) : ${ FormatUtil.staticNumber(price , "#,##0") }<br>
  
  <%
   FormatUtil fObj = new FormatUtil();
  request.setAttribute("fObj", fObj);
  %>
  >price(EL) : ${ FormatUtil.instanceNumber(price , "#,##0") }<br>
  

  <hr>
  >price : <%=price %><br>
  <!-- 세자리 마다 콤마를 출력해서.... -->
  >price : <%=String.format("%,d" , price) %><br>
  <%
    String pattern = "##,###";
    DecimalFormat df = new DecimalFormat(pattern);
  %>
  >price : <%= df.format(price) %><br>
  
</div>
<script>
</script>
</body>
</html>