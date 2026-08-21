<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 4. 오후 12:11:08</title>
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
  </xmp>
  
  <p id="demo">
  <%
     // 스크립트릿 : 자바 코딩
     int sum = 0;
     for(int i=1; i<= 10; i++){
    	 //System.out.printf("%d+", i);
    	 out.print( i +"+" );
    	 sum += i;
     } // for
     //System.out.printf("=%d", sum);
     out.print( "=" + sum );
  %>
  </p>
  
</div>
<script>
   // [js] 1+2+..+9+10=55 p태그 출력
   /*
   const arr = [];
   for (var i = 1; i <= 10; i++) {
	  arr.push(i);
   } // for
   // console.log( arr );
   let result = arr.reduce( (total, value) => total + value );
   $("#demo").html( arr.join("+") + "=" + result );
   */
</script>
</body>
</html>




