<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오전 9:51:08</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->

<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>

  <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.14.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
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
  
  <div id="tabs">
  <ul>
    <li><a href="#tabs-1">JSP- get 방식요청 체크 </a></li>
    <li><a href="#tabs-2">JSP- post 방식 체크 </a></li>
    <li><a href="#tabs-3">servlet -get,post </a></li>
    
  </ul>
  <div id="tabs-1">
    <p>
    	<ol>
    		<li>웹브라우저 url 입력후 요청 get</li>
    		<li>a link tag req- get</li>
    		<li>location.href - get</li>
    		<li>form method='get' - get</li>
    	</ol>
    	
    	<br>
    	정수: <input type="text" id="n" name="n" value="10" /><br>
    	<a href="ex01_ok.jsp">ex01_ok.jsp</a>
    	
    </p>
  </div>
  <div id="tabs-2">
    <p>
       <form>
         Name : <input type="text" id="name" name="name" value="홍길동"><br>
         age : <input type="text" id="age" name="age" value="20"><br> 
         
        <input type="radio" name="method" value="get" checked="checked">GET 요청
       <input type="radio" name="method" value="post" >POST 요청
       
       <br> 
       <button type="button">전송(submit)</button>
      </form>
    </p>
  </div>
  <div id="tabs-3">
    <p>
       <form>
         Name : <input type="text" id="name2" name="name2" value="홍길동"><br>
         age : <input type="text" id="age2" name="age2" value="20"><br> 
         
        <input type="radio" name="method2" value="get" checked="checked">GET 요청
       <input type="radio" name="method2" value="post" >POST 요청
       
       <br> 
       <button type="button">전송(submit)</button>
      </form>
    </p>
  </div>
  
</div>
 
</div>

<script>
$("#tabs-3 button").on("click", function () {
	let method = $("#tabs-3 :radio[name='method2']:checked").val();
	$(this).parent() // <form> 
	         .attr({
	        	   "method": method,
	        	   "action": "/days03/ex01_ok_03.ss"
	         })
	         .submit();
});

</script>
<script>
$("#tabs-2 button").on("click", function () {
	let method = $("#tabs-2 :radio[name='method']:checked").val();
	$(this).parent() // <form> 
	         .attr({
	        	   "method": method,
	        	   "action": "ex01_ok_02.jsp"
	         })
	         .submit();
});

</script>
<script>
/* $("#tabs-1 a").on("click", function () {
	let n = $("#n").val();
	let oldHref = $(this).attr("href");
	let newHref = `\${oldHref}?n=\${n}`;
	      $(this).attr("href", newHref);
});
 */
 
 $("#tabs-1 a").on("click", function () {
	 $(this).attr("href", function (index, oldHref) {
		 let n = $("#n").val();
		return `\${oldHref}?n=\${n}`;
	});
 });
 
</script>
</body>
</html>