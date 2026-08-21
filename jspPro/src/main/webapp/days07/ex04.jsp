<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오후 2:44:32</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
</head>
<body>
<header>
  <h1 class="main">
    <a href="${pageContext.request.contextPath}/mvc/board/list.htm" style="position: absolute;top:30px;">Subin YaHo</a>
  </h1>
  <ul>
    <c:choose>
      <c:when test="${empty sessionScope.authUser}">
        <li><a href="${pageContext.request.contextPath}/mvc/member/login.htm">로그인</a></li>
        <li><a href="#">회원가입</a></li>
      </c:when>
      <c:otherwise>
        <li><span style="color: blue; font-weight: bold;">${sessionScope.authUser.name}</span>님</li>
        <li><a href="${pageContext.request.contextPath}/mvc/member/logout.htm">로그아웃</a></li>
      </c:otherwise>
    </c:choose>
  </ul>
</header>
<div>
  <xmp class="code">
   ex04.jsp
   MVC 패턴 실습
   패키지 선언
     days07.mvc.board.controller 패키지 : MV[C] 
     days07.mvc.board.command    패키지 : [M]VC  Command Handler
     
     ㄴ 요청을 처리하는 모델객체
     command 인터페이스 구현
     String process(request, response)
     뷰 결과물 session request저장
     
     days07.mvc.board.domain     패키지 : DTO, VO, 자바빈
     days07.mvc.board.persistence 패키지: DAO
     days07.mvc.board.service    패키지: 서비스
     
     요청URL => CommandHandler /WEB-INF/commandHandler.properties 파일 
   
  </xmp>
  
    <a href="${pageContext.request.contextPath}/mvc/board/list.htm"> 게시판 목록 보기 (/mvc/board/list.htm)</a>
   <p>
   <a href="${pageContext.request.contextPath}/mvc/member/login.htm">로그인 화면 가기 (/mvc/member/login.htm)</a>
   </p>
</div>
<script>
</script>
</body>
</html>