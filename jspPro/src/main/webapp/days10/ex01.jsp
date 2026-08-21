<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 18. 오전 9:16:04</title>
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
     AJAX = Asynchronous JavaScript And XML
     
     
     3. js Ajax 처리 순서
     (1) 웹 페이지에서 이벤트 발생
       [hong] 중복체크 버튼 클릭
     (2) XMLHttpRequest 객체 생성 == 비동기적 처리하는 객체 == ajax 객체
     (3) XMLHttpRequest 객체 + 설정 : open() 비동기처리 설정.
                                      콜백함수 설정  
     (4) 비동기적으로 요청 --> 응답 데이터 처리 : send() 
                                      아이디 사용중, 가능 -> 화면 출력. 
                                      
     A) get 방식
              XMLHttpRequest객체.open("GET", "/test.jsp?id=admin", true);
              XMLHttpRequest객체.send();
     B) post 방식
              XMLHttpRequest객체.open("POST", "/test.jsp", true);
              XMLHttpRequest객체.send("id=admin");
              
              
     ㄴ. XMLHttpRequest 객체 - on readystatechage 이벤트 속성  
               if( state = 200 + readState == 4 ) 
                   // 응답 데이터
                   1) 텍스트(JSON) - responseText 속성
                   2) xml          - responseXML 속성       
        
        ex02.jsp 
        ex02_02.jsp                                   
  </xmp>
</div>
<script>
</script>
</body>
</html>