<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<form action="login.do" method="post">
<c:if test="${errors.idOrPwNotMatch}">
아이디와 암호가 일치하지 않습니다.
</c:if>
<p>
   아이디:<br/><input type="text" name="id" value="${param.id}">
   <c:if test="${errors.id}">ID를 입력하세요.</c:if>
</p>
<p>
   암호:<br/><input type="password" name="password">
   <c:if test="${errors.password}">암호를 입력하세요.</c:if>
</p>
<input type="submit" value="로그인">
</form>

<br>
<br>
<a href="index.do">HOme</a>
</body>
</html>