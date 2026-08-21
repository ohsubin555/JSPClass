<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map.Entry"%>


<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 14. 오전 9:45:28</title>
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
    ex01_ok.jsp
    + - /(div) * %(mod)
    ==(eq) !=(ne) <(lt)  >(gt) <=(le) >=(ge)
    &&(and) ||(or) !(not)
    
    empty 연산자
    null "" 0 map collection --> true 
  </xmp>
  <c:forEach items="${cookie}" var="entry">
  <li>${entry.key } : ${entry.value.value }</li>
  </c:forEach>
  
  <hr>
  
  <%
   Cookies cookies = new Cookies(request);
   Set<Entry<String, Cookie>> set = cookies.cookieMap.entrySet();
   Iterator<Entry<String, Cookie>> ir = set.iterator();
  
  while(ir.hasNext() ){
	  Entry<String, Cookie> entry = ir.next();
	  String cookieName = entry.getKey();
	  //Cookie c = entry.getValue();
	  String cookieValue = entry.getValue().getValue();

  %>
    <li><%= cookieName %> : <%= cookieValue %> </li>
  <%
  }//while  
  %>
</div>
<script>
</script>
</body>
</html>