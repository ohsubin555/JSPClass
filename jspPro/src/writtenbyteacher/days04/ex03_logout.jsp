<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
   // 인증, 권한 정보 : 세션 제거
   // 메인 페이지로 이동
   
   // [1] 리다이렉트
   String location = "ex03.jsp";
   response.sendRedirect(location);
%>