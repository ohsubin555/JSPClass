<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 7. 오후 2:38:47</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
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
   ex06.jsp -> 
   이름		주소		이름/나이/주소/연락처 화면 출력
   나이		연락처
   [다음]클릭	[다음]클릭
   
  </xmp>
     <form action="ex06_02.jsp">
    name : <input type="text" name="name" value="홍길동"><br>
    age : <input type="text" name="age" value="20"><br>
    <input type="submit" value="Next">
  </form>  
</div>
<script>

</script>
</body>
</html>