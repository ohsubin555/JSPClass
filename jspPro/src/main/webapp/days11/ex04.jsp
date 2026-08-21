<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 19. 오전 10:43:53</title>
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
      [파일업로드]
      1. 서블릿 3.0 기능 p 700
        1)HttpServeletRequest 의 getPart() 메서드를 이용해서 업로드 데이터 접근
        2) 서블릿이 multipart 데이터를 처리할 수 있도록 설정
          ㄱ. web.xml 에서 설정 multipart-config 태그
          ㄴ. @MultipartConfig
      2. 외부 라이브러리 사용
      ㄴ http://www.servelts.com
      ㄴ cos.jar
      
      form method="post" enctype="멀티파트 폼 데이타"
      
        MultipartRequest mrequest = new MultipartRequest(ㄱ,ㄴ,ㄷ,ㄹ,ㅁ);  
       ㄱ - JSP의 request 객체    
       ㄴ - 서버에 저장될 위치(업로드 경로) 
       ㄷ - 최대 파일 크기
       ㄹ - 파일의 인코딩 방식
       ㅁ - 파일 중복 처리위한 인자(클래스  제공)
  </xmp>
  <form action="/days11/upload" method="post" enctype="multipart/form-data">
  이름: <input type="text" name="message" value="HELLO WORLD"/>
  <!-- 
  <button type="button">첨부파일 추가</button>
  <div id="filebox">
   첨부파일 1: <input type="file" name="file1" /><br> 
  </div> -->
   <div id="filebox">
   첨부파일 1: <input type="file" name="attachFile" multiple="multiple" /><br> 
  </div>
  <input type="submit">
</div>
<script>
  $("button").on("click", function () {
	  //input type="file" :file
	let no = $("#filebox :file").length + 1;
	$("#filebox").append(`첨부파일 "\${no}" : <input type="file" name="\${no}" /><br>`);  
});
</script>
</body>
</html>