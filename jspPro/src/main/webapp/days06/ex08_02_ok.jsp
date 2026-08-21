<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% 
String cookieName = request.getParameter("cookieName");
String cookieValue= request.getParameter("cookieValue");

//쿠키생성
// (주의할점) 한글, 콤마, 세미콜론, 공백x
//jsp : Cookie 클래스 + response.addCookie()
Cookie cookie = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8") );
cookie.setMaxAge(-1); //브라우저 닫으면 쿠키 자동 삭제 
response.addCookie(cookie);

String location = "ex08_03.jsp";

response.sendRedirect(location);

%>