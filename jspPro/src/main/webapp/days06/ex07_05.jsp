<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import= "days06.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 11. 오후 4:14:47</title>
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
    ex07_05.jsp
    
    days06.MenberInfo.java
    jsp: ...
  </xmp>

  <jsp:useBean id="member" scope="page" class="days06.Member"></jsp:useBean>
  <jsp:setProperty property="*" name="member" />

  <jsp:setProperty property="registerDate" name="member" value="<%= new Date() %>"/>
  
   아이디: : <jsp:getProperty property="id" name="member" ></jsp:getProperty><br>
   이름: : <%=member.getName() %><br>
   비번: : <%=member.getPasswd() %><br>
   이메일: : <%=member.getEmail() %><br>
   등록일: : <%=member.getRegisterDate() %><br>
   
</div>
<script>
</script>
</body>
</html>