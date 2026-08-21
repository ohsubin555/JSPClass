<%@page import="java.util.Objects"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	int num; 
	String content = "";
	int sum = 0;
    String pNum = request.getParameter("num") ;
     if(!(pNum ==null || pNum.trim().isEmpty())){
    	 num = Integer.parseInt(pNum);
    	 for (int i = 1; i <= num; i++ ){
 			content += i;
 		    if (i < num) {
 		        content += "+";
 		    }
 		    sum += i;
 	}
 	content += "=" + sum; 
     }
	 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 5. 오전 9:06:13</title>
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
  <form>
  정수 <input type="text" id="num" autofocus="autofocus" name="num" value="${parm.num}" />
  </form>
  <%-- value="<%=Objects.toString(pNum, "") %> --%>
  <br>
  <p id="demo"><%= content %></p>
  <br>
  <p></p>
</div>

<script>
  $("form").on("submit", function (e) {
	alert("서브밋 될 때 submit 이벤트에 의해 호출됨\n 입력값에 대한 유효성 검사")
   // e.preventDefault();
});
  $("#num").select();
</script>
</body>
</html>