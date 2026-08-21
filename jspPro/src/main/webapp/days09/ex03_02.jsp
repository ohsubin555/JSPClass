<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 14. 오전 10:36:19</title>
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
   JSTL 5가지 - 코어 c:
   1) 변수 선언, 삭제 - c:set c:remove 태그
   2) 흐름제어 if choose forEach  forTokens
   3) URL import redirect c:url
   4) 기타 catch out 
   
   예) ex03_02.jsp?kor=90
     kor(90): 수
     
  </xmp>
  
  <form>
   국어: <input type="text" name="kor" autofocus="autofocus">
  </form>
  >국어: ${param.kor}<br>
  >empty 국어: ${empty param.kor}<br>
  >not empty 국어: ${! empty param.kor}<br>
  
  <c:if test="${not empty param.kor }">
    <!-- 변수 선언 value 속성=EL 표현식, 정적문자열-->
    <c:set var="score" value="${Math.floor(param.kor/10) }" scope="page"></c:set>
    <c:choose>  
      <c:when test="${score gt 90 or score eq 9}">수</c:when>
      <c:when test="${score gt 90 or score eq 8}">우</c:when>
      <c:when test="${score gt 90 or score eq 7}">미</c:when>
      <c:when test="${score gt 90 or score eq 6}">양</c:when>
      <c:otherwise>가</c:otherwise>
    </c:choose>
  </c:if>
</div>
<script>
</script>
</body>
</html>