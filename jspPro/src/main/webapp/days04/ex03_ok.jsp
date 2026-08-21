<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
  String id = request.getParameter("id");
  String passwd = request.getParameter("passwd");
  
  String name;
  boolean auth; //권한
  
  String location;
  if(id.equals("admin") && passwd.equals("1234")){
	  name = "관리자";
	  auth = true;
	  //url 한글 사용 x -> %로 변경
	  location = "ex03.jsp?name=" + URLEncoder.encode(name) + "&auth="+auth;
  }else if(id.equals("hong") && passwd.equals("1234")){
	  name = "홍길동";
	  auth = false;
	  location = "ex03.jsp?name=" + URLEncoder.encode(name) + "&auth="+auth;
  }else if(id.equals("kim") && passwd.equals("1234")){
	  name = "김도훈";
	  auth = false;
	  location = "ex03.jsp?name=" + URLEncoder.encode(name) + "&auth="+auth;
  }else{   
	  location = "ex03.jsp?error";
  }
 //1 redirect 
 /*  response.sendRedirect(location); */  
 
 //2.forward
 RequestDispatcher dispatcher = request.getRequestDispatcher(location);
 dispatcher.forward(request, response);
 
%>