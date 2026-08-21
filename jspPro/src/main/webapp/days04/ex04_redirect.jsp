<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% 
String name = request.getParameter("name");
String age = request.getParameter("age"); 

String location = "ex04_finish.jsp?&name="+ name + "&age=" +age;
response.sendRedirect(location);
%>
