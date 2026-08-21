<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="com.google.gson.Gson"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 19. 오전 9:38:16</title>
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
      
  </xmp>
<%--   <%
    Gson gson = new Gson(); 
    
    EmpVO evo = EmpVO.builder()
    .empno(7369)
    .ename("SMITH")
    .sal(800)
    .build();
    
    String responseJson = gson.toJson(evo);
    out.print(responseJson);
  %> --%>
  
  <%
    Gson gson = new Gson(); 
  
    ArrayList<EmpVO> elist= new ArrayList<>();  
    
    EmpVO evo = EmpVO.builder()
    .empno(7369)
    .ename("SMITH")
    .sal(800)
    .build();
    
    elist.add(evo);
   
    evo = EmpVO.builder()
    .empno(7521)
    .ename("WARD")
    .sal(1250)
    .build();
    
    elist.add(evo);
    
     evo = EmpVO.builder()
    .empno(7499)
    .ename("ALLEN")
    .sal(1600)
    .build();
    
    elist.add(evo);
    
     
    Map<String, Object> map = new HashMap<>();
    map.put("now", new Date().toLocaleString());
    map.put("elist" ,elist);
   
    String responseJson = gson.toJson(map);  
    
    out.print(responseJson); 
    
  %>
</div>
<script>

</script>
</body>
</html>