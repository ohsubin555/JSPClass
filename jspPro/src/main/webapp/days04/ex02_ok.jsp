<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
  String id = request.getParameter("id");
  String passwd = request.getParameter("passwd");
  
  
  String location;
  if(id.equals("admin") && passwd.equals("1234")){
	  location = "ex02_main.jsp";
  }else if(id.equals("hong") && passwd.equals("1234")){
	  location = "ex02_main.jsp";
  }else if(id.equals("kim") && passwd.equals("1234")){
	  location = "ex02_main.jsp";
  }else{   
	  location = "ex02.jsp?error";
  }
 //1 redirect 
 /*  response.sendRedirect(location); */  
 
 //2.forward
 RequestDispatcher dispatcher = request.getRequestDispatcher(location);
 dispatcher.forward(request, response);
 
%>