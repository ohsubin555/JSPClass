<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<%
   //1. DB 연동해서 id, pwd 인증처리.
   String id = request.getParameter("id");
   String passwd = request.getParameter("passwd");
   String location = request.getContextPath() + "/days07/ex02_default.jsp";
   //여기서는 EL사용불가!
   
   
   if(id.equals("admin") && passwd.equals("1234")){   //관리자 ADMIN 롤(role) 부여
      Cookie cookie = Cookies.createCookie("loginUser", id, "/", -1);
      response.addCookie(cookie);
      cookie = Cookies.createCookie("loginUserRole", "ADMIN", "/", -1);
      response.addCookie(cookie);
   }else if(id.equals("hong") && passwd.equals("1234")){ //일반 사용자 USER
      Cookie cookie = Cookies.createCookie("loginUser", id, "/", -1);
      response.addCookie(cookie);
      cookie = Cookies.createCookie("loginUserRole", "USER", "/", -1);
      response.addCookie(cookie);
   }else if(id.equals("kim") && passwd.equals("1234")){
      Cookie cookie = Cookies.createCookie("loginUser", id, "/", -1);
      response.addCookie(cookie);
      cookie = Cookies.createCookie("loginUserRole", "MANAGER", "/", -1);
      response.addCookie(cookie);
   }else{
      location +="?on=fail";
   }
   response.sendRedirect(location);
   //2. 로그인 성공: 쿠키 loginUser 저장  + 다시 ex02_default.jsp로 이동...
   //" 실패: 다시 ex02_default.jsp로 이동.
   
   
   
%>