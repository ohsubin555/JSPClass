<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오후 2:02:23</title>
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
    <li><a href="${pageContext.request.contextPath}/days03/dept/dept_list.jsp">부서관리</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
    부서목록 (dept_list.jsp) + 부서추가버튼
    부서추가 dept_add.jsp + 저장버튼
      입력값에 대한 유효성 검사
     DB 추가  dept_add_ok.jsp  
  </xmp>
    
</div>
<script>
</script>
</body>
</html>