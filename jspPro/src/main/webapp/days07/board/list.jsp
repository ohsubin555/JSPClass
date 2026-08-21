<%@page import="com.util.Cookies"%>
<%-- <%
  //쿠키 저장 : 인증 + 권한
  String loginUser = null; //쿠키 이름 : loginUser
  String loginUserRole = null; // ADMIN MANAGER USER
  
  //생성자: cookieMap<k,v>
  Cookies cookies = new Cookies (request);
  loginUser = cookies.getValue("loginUser");
  loginUser = cookies.getValue("loginUserRole");
  
  request.setAttribute("loginUser", "loginUser");
  request.setAttribute("loginUserRole", "loginUserRole");
%> --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오전 11:46:52</title>
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
   list.jsp
  </xmp>
  <h3>게시판 목록</h3>
  <br>
 <%-- <c:if test="${empty loginUser != null}">
   <a href="write.jsp">글쓰기</a>
 </c:if> --%>
 
 <a href="write.jsp" id="write">글쓰기</a>
  
</div>
<script>
<%--
  $("#write").on("click", function (e) {
	e.preventDefault();
	let loginUser = "${loginUser}";
	if (!loginUser) { //null , "" , 0 ,NaN등
		alert("로그인 필수");
	location.href = "${pageContext.request.contextPath}/days07/ex02_default.jsp"
	}else{
		location.href = $(this).attr("href");
	}
});
--%>

</script>
</body>
</html>
