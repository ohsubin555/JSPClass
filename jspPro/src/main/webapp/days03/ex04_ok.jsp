<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오후 12:21:31</title>
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
  
  <%
  Enumeration<String> en = request.getParameterNames();
  while(en.hasMoreElements()){
	  String paramName = en.nextElement();
	%>
	  <%= paramName %>
  <% 
  }   
  %>
  <hr>
  <%
   List<String> pNames = Collections.list(request.getParameterNames());
  %>
  
   <c:forEach items="<%= pNames %>" var="pn">
   >>전송된 파라미터 이름: ${pn}<br>
   </c:forEach>
   
   <b>request.getParameterMap()메서드 사용</b><br>
   
   <!-- 주의 entry.value 는  String [] 이다 -->   
  <c:forEach items="<%= request.getParameterMap()%>" var="entry">
     ${ entry.key } : ${ Arrays.toString(entry.value) }<br>  
  </c:forEach>
  
  <hr>
  <%
  
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    
    String [] pets = request.getParameterValues("pet");
  %>
  > 이름: <%=name %> <br>
  > 이름 EL: ${param.name}<br>
  >성별: <%= gender.equals("m")?"남":"여" %>
  >좋아하는 동물: <%= Arrays.toString(pets) %>
  
  <c:forEach items="${paramValues.pet}" var="pet">
  <li>${pet}</li>
  </c:forEach>
  
</div>
<script>
</script>
</body>
</html>