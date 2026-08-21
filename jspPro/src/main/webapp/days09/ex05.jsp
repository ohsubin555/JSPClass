<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 14. 오후 3:06:44</title>
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
    days09 (webapp)
  ㄴ  ex05.jsp
  ㄴ  admin 폴더: 인증 o + 관리자(ADMIN) 권한 o 
    ㄴ memberManage.jsp 회원관리 페이지
    ㄴ payManage.jsp 급여관리 페이지
    /admin/*
    ㄴ board 폴더
      ㄴ list.jsp 회원관리 페이지  인증 x
      ㄴ view.jsp 회원관리 페이지  인증 x
      ㄴ write.jsp 회원관리 페이지 인증 o
      ㄴ edit.jsp 회원관리 페이지  인증o + 작성자로 인정
      ㄴ delete.jsp 회원관리 페이지  인증 ㅇ + ""
    ㄴ member 폴더  인증 x
      ㄴ addMember.jsp 회원가입페이지  
      ㄴ logon.jsp 로그인페이지  
      ㄴ logout.jsp 로그아웃페이지
      
    [필터작성]
    1.AuthenticationFilter 인증필터
      요청URL : /admin/*
      요청URL : /board/write.jsp
      요청URL : /board/edit.jsp
      요청URL : /board/delete.jsp
      요청URL : /board/delete.jsp
    
    2. AuthorizationFilter 권한필터 - ADMIN MANAGER USER 
    요청 URL : /admin/* ADMIN 권한 o 
    
    
                        HTTP 요청
                       │
                       ▼
             AuthenticationFilter
                  로그인 확인
                       │
             ┌─────────┴─────────┐
             │                   │
        /board/write        /admin/*
             │                   │
             │          AdminAuthorizationFilter
             │                   │
             │              ADMIN 확인
             │                   │
             ▼                   ▼
        Controller          Controller
  
  </xmp>
  
  <a href="/days09/member/logon.jsp">로그인</a><br>
  <a href="/days09/member/logout.jsp">로그아웃</a><br>
  <a href="/days09/board/list.jsp">게시판 목록</a><br>
  <a href="/days09/admin/payManage.jsp">관리자 급여관리</a><br>
</div>
<script>
</script>
</body>
</html>