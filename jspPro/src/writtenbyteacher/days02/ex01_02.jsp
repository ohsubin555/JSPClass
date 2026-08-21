<%@page import="java.util.Objects"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // http://localhost/days02/ex01_02.jsp         => null request.getParameter("num")
    // http://localhost/days02/ex01_02.jsp?num     => ""   request.getParameter("num")
    // http://localhost/days02/ex01_02.jsp?num=10  => "10" request.getParameter("num")
    int num ;
    String content = ""; 
    int sum = 0;   
    
    String pNum = request.getParameter("num") ;
    
    // if(  pNum == null || pNum.equals("")){
    if(  !( pNum == null || pNum.trim().isEmpty() ) ){ 
    	num = Integer.parseInt(pNum);
    	for( int i = 1;  i<= num; i++ ){
        	content += i + (i==num?"":"+");
        	sum += i;
        } // for
        content += "=" + sum;  // "1+2+...+9+10=55" 
    } // if
    
     		
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 5. 오전 6:56:10</title>
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
    ex01_02.jsp  
  </xmp>
  
  <%-- 정수 : <input type="text" id="num" autofocus="autofocus" value="<%= pNum == null ? "": pNum %>">  --%>
  <%-- 정수 : <input type="text" id="num" autofocus="autofocus" value="<%= Objects.toString(pNum, "") %>">  --%>
  정수 : <input type="text" id="num" autofocus="autofocus" value="${ param.num }">
  
  <br>
  <p id="demo"><%= content %></p>
  <br>
  <p></p>
  
</div>
<script>
  // one(), on(), off()
  $("#num").on("keydown", function (e){
	  if( e.key === 'Enter' ){
		  //alert("입력값에 대한 유효성 검사 완료!!");
		  let num = $(this).val();
		  // 쿠키 저장 num=10, localStorage X
		  // jsp 페이지                     EL
		  location.href = `ex01_02.jsp?num=\${num}`;
	  } // if
  });
  
  
  <%-- $("#num").val('<%= Objects.toString(pNum, "") %>').select(); --%>
  $("#num").select();
</script>
</body>
</html>







