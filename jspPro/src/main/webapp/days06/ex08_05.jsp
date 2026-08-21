<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오전 9:16:50</title>
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
  <%!
   public String getCookieValue(String cookieName, HttpServletRequest request){
	  Cookie [] cookies  = request.getCookies();
	
	  for(Cookie cookie : cookies){
		   String cName = cookie.getName();
		   try{
		   String cValue =  URLDecoder.decode(cookie.getValue(), "UTF-8");
	       if(cookieName.equals(cName)){
	    	   return cValue;
	       }
	  }catch(Exception e){
		  e.printStackTrace();
	  }
	  }
	  return null;
  }
  %>
  
  <form action="ex08_05_ok.jsp">
  
     <%
   String [] upCookieNames =  request.getParameterValues("ckbCookie");

   for(String cName : upCookieNames){
	 
	   String cValue =  getCookieValue(cName, request);
   %>
   <li>
   <%= cName %>
   <input type="text" name="<%= cName %>" value="<%= cValue %>" />
   </li>
  <% 		   
   }
   %>
  
  <br>
  <input type="submit" value="쿠키 수정"/>
  </form>
 
</div>
<script>
</script>
</body>
</html>