<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오전 9:16:50</title>
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
   ex08_04 쿠키 삭제 
   jsp 쿠키생성 + setMaxAge(-1) 브라우저를 닫으면 쿠키 자동 삭제
              + setMaxAge(0) 즉시 쿠키 삭제 
  </xmp>
  
 <%
 String [] delCookieNames = request.getParameterValues("ckbCookie");
 for(int i=0; i< delCookieNames.length; i++){
	 
	 String cookieName = delCookieNames[i];
	 //쿠키생성
	 // (주의할점) 한글, 콤마, 세미콜론, 공백x
	 //jsp : Cookie 클래스 + response.addCookie()
	 Cookie cookie = new Cookie(cookieName, "X");
	 cookie.setMaxAge(0); //즉시 쿠키 삭제
	 response.addCookie(cookie);
 }
 %>
</div>
<script>
   alert("쿠키 삭제 완료")
   location.href = "ex08_03.jsp";
</script>
</body>
</html>