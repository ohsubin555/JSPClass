<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<% 


//1.쿠키 삭제 loginUser loginUserRole
   String loginUser ="loginUser";
   String loginUserRole = "loginUserRole";
   
   Cookies cookies = new Cookies(request);
   
   String logoutUser = null;
   if(cookies.exists(loginUser)){
      logoutUser = cookies.getValue(loginUser);
      Cookie cookie = Cookies.createCookie(loginUser, "", "/", 0);
      response.addCookie(cookie);
   }
   
   if(cookies.exists(loginUserRole)){
      Cookie cookie = Cookies.createCookie(loginUserRole, "", "/", 0);
      response.addCookie(cookie);
   }
   
   

//2.메인 페이지로 이동

%>
<script>
   alert("<%=logoutUser%>님 로그아웃 되었습니다");
   location.href= "ex02_default.jsp";
</script>
<%

%>