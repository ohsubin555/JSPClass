<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오후 2:02:18</title>
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
   p170 include 지시자: 중복 코딩..처리
   ex03.jsp
   p416 커넥션 풀(Connection Pool)
   META-INF 폴더 안에 context.xml 넣어도 되는 이유?
   톰캣에서 자동으로 인식. 웹 애플리케이션의 표준 디렉토리
   ㄴ context의미 : 톰캣에서 실행되는 하나의 웹 애플리케이션(사이트)
   
   com.util.ConnectionProvider.class
   
   
   <Resource name="jdbc/myoracle" auth="Container"
              type="javax.sql.DataSource" driverClassName="oracle.jdbc.OracleDriver"
              url="jdbc:oracle:thin:@127.0.0.1:1521:mysid"
              username="scott" password="tiger" maxTotal="20" maxIdle="10"
              maxWaitMillis="-1"/>
  </xmp>
  <%
  
  /* Context initContext = new InitialContext();
  Context envContext  = (Context)initContext.lookup("java:/comp/env");
  DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
  Connection conn = ds.getConnection();
   */
  //etc.
  Connection conn = ConnectionProvider.getConnection();
  %>
  >conn: <%=conn %>
  <%  
  conn.close(); //커넥션 풀 반환
  %>
</div>
<script>
</script>
</body>
</html>