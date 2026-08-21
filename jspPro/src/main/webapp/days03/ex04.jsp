<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오후 12:21:31</title>
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
    request parameter
  </xmp>
    <form action="ex04_ok.jsp" method="get">
    이름 : <input type="text" id="name" name="name" 
    placeholder="이름을 입력하세요" value="홍길동">
    <br>
    성별 : 
    <input type="radio" name="gender" value="m" checked="checked">남자    
    <input type="radio" name="gender" value="f">여자
    <br>
    좋아하는 동물 : 
    <input type="checkbox" name="pet" value="dog" checked="checked">개
    <input type="checkbox" name="pet" value="cat" >고양이
    <input type="checkbox" name="pet" value="pig" checked="checked">돼지
    <br>
  
    <input type="submit">
  </form> 
</div>
<script>
</script>
</body>
</html>