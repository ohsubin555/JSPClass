<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file = "/WEB-INF/inc/sessionInc.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오전 10:44:47</title>
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
  ex02_default.jsp 메인페이지
  모든 인증한 사용자 정보를 개체로 세션에 저장
  days08.AuthUser.java
    MAin page
  </xmp>
  <c:choose>
     <c:when test="${empty loginUser}">
     <div id="logon">
     <!-- //로그인 하지 않은 경우... -->
        <form action="ex02_logon.jsp" method="get">
          아이디 : <input type="text" name="id" value="admin"> <br>
          비밀번호 :  <input type="password" name="passwd" value="1234"> <br>
          <input type="submit" value="로그인"> 
          <input type="reset">     
          <span style="color:red;display: none">로그인 실패했습니다.</span>    
       </form>
     </div>
     </c:when>
     <c:otherwise>
     <!-- //로그인 한 경우... -->
     <div id="logout">
        [${ loginUser }]님 로그인하셨습니다.<br>
        <a href="ex02_logout.jsp">로그아웃</a> 
     </div>
     </c:otherwise>
  </c:choose>
  
  <br><br>
<!--   ADMIN/MANAGER 역할 -->
   <c:if test="${loginUserRole eq 'ADMIN' or loginUserRole eq 'MANAGER'}">
      <a href="#">직원관리</a><br />
        <a href="#">상품관리</a><br />
   </c:if>
 
  
  <!--로그인만 하면 사용 가능  -->
     <c:if test="${ not empty loginUser}">
        <a href="#">일정관리</a><br />
   </c:if>
 
 
  <!-- 로그인 X여도 사용 가능 -->
  <a href="${pageContext.request.contextPath}/days08/board/list.jsp ">게시판</a><br />
  
  
  
</div>
<script>
//location += "on=fail"
if(${param.on eq 'fail'}){
   $("#logon span").fadeIn().fadeOut(3000);
   
}
</script>
</body>
</html>