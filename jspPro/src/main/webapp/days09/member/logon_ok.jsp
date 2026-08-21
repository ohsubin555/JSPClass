<%@page import="days08.AuthUser"%>
<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%
   //1. DB 연동해서 id, pwd 인증처리.
   String id = request.getParameter("id");
   String passwd = request.getParameter("passwd");
   
   String referer = (String)session.getAttribute("referer");
   String location = referer == null ? request.getContextPath() + "/days09/board/list.jsp" : referer;
   //String location = request.getContextPath() + "/days09/board/list.jsp";
   //여기서는 EL사용불가!
   
   
   if(id.equals("admin") && passwd.equals("1234")){   //관리자 ADMIN 롤(role) 부여
   /*  session.setAttribute("loginUser", id);
       session.setAttribute("loginUserRole", "ADMIN"); */
       session.setAttribute("authUser", new AuthUser(id,"ADMIN"));
     if(referer != null)  session.removeAttribute("referer");
   }else if(id.equals("hong") && passwd.equals("1234")){ //일반 사용자 USER
	  /*  session.setAttribute("loginUser", id);
	    session.setAttribute("loginUserRole", "USER"); */
	   session.setAttribute("authUser", new AuthUser(id,"USER"));
	   if(referer != null)  session.removeAttribute("referer");
   }else if(id.equals("kim") && passwd.equals("1234")){
	   session.setAttribute("authUser", new AuthUser(id,"MANAGER"));
	   if(referer != null)  session.removeAttribute("referer");
   }else{
      location +="/days09/member/logon.jsp?on=fail";
   }
   response.sendRedirect(location);

%>