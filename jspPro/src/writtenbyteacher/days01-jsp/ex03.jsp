<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 조지훈 DB서버/scott/
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	String user = "scott";
	String password = "tiger";
	
	Connection conn = DBConn.getConnection(url, user, password);
	System.out.println( "🤩 : " +  conn ); 
	 
	DBConn.close();
	 
	System.out.println("end");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 4. 오후 2:04:10</title>
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
    Oracle + Dept 조회 -> 부서 정보 출력
    1) DBConn.java
    2) DeptVO.java
  </xmp>
</div>
<script>
</script>
</body>
</html>