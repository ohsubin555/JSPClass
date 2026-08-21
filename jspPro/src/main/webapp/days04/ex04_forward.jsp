<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% 
String path ="ex04_finish.jsp";
RequestDispatcher dispatcher = request.getRequestDispatcher(path);
dispatcher.forward(request, response);

%>

 