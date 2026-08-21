<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게시글 쓰기</title>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   <link rel="stylesheet" href="/resources/cdn-main/example.css">
   <script src="/resources/cdn-main/example.js"></script>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kEnik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
   newArticleForm.jsp
  </xmp>
<form action="write.do" method="post">
<p>
   제목:<br/><input type="text" name="title" value="${param.title}">
   <c:if test="${errors.title}">제목을 입력하세요.</c:if>
</p>
<p>
   내용:<br/>
   <textarea name="content" rows="5" cols="30">${param.title}</textarea>
</p>
<input type="submit" value="새 글 등록">
</form>
</body>
</html>