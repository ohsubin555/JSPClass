<%@page import="java.security.PublicKey"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오전 11:21:12</title>
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
     [JSP 구성 요소 중 "JSP 스크립트"]
     • 스크립트릿(Scriptlet) % - 자바 코딩
	 • 표현식(Expression)   %= - 어떤 값 선언
	 • 선언부(Declaration)  %! - 위에서 사용할 변수 또는 메서드 선언
  </xmp>
  
  <%
    String name = "홍길동";
    for(int i=1; i<=10; i++){
   %>  
    i= <%= i %><br>
  <%     	
    }
  %>
  
  <hr>
  
  이름: <%= name %><br>
  나이: <%= age %><br>
  getMessage(): <%= getMessage("관리자") %>
  
  선언문: 
  
  <%!
   int age = 20;
   public String getMessage(String msg){
	  return "안녕-" + msg;
  }
  
  %>
  
  C:\Class\JSPClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspPro
  
</div>
<script>
</script>
</body>
</html>