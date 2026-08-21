<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 11. 오전 10:49:41</title>
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
   
   HTTP 상태 500 - 내부 서버 오류
   
   1) 응답 상태 코드
   404: 요청 URL을 처리하기 위한 자원 존재 x
   500: 서버 내부 에러 (자바 코딩에 오류)
   200: 요청을 정상적으로 처리
   401: 접근 허용 x
   403: get/post 요청방식, PUT 요청 x
   400: 클라이언트의 요청이 잘못된 구문으로 구성. 
   
   **응답 상태 코드별로 에러페이지 지정해서 정리
   **예외 타입별로  에러페이지 지정해서 정리
   
  </xmp>
  
  <%
   String name = null;
  /*  name = request.getParameter("name");
   name = name.toUpperCase(); */
   
   try{
	   name = request.getParameter("name");
	   name = name.toUpperCase();
	   
   }catch(NullPointerException e){
	   e.printStackTrace();
   }catch(Exception e){
	   e.printStackTrace();
   }finally{
	   //예외 발생 유무 상관없이 하는 코딩.
   }
   
  %>
  >name = <%= name %><br>
  
  <br />
  <br />
  <br />
  <a href="ex1000.jsp">ex1000.jsp</a>
  
</div>
<script>


</script>
</body>
</html>   