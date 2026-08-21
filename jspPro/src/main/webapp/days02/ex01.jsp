<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  정수 <input type="text" id="num" autofocus="autofocus" />
  <br>
  <p id="demo">1+2+3=6</p>
</div>
<%-- <% 
if(num != null){
int n = parseInt(num);
int sum = 0;
for (int i = 1; i <= n; i++ )
	sum += i;
}
out.print("합 = " + sum);
}
%> --%>
<script>
  $("#num").on({
	"keydown": function (e) {
		if ( !(
				/^[0-9]$/.test(e.key)
				|| ["Backspace", "Delete" , "Enter", "Tab"
					, "ArrowLeft" , "ArrowRight", "Home", "End"].includes(e.key)
					|| e.isComposing // 한글 입력기 입력중일때
				)) {
			alert("숫자만 입력하세요");
			e.preventDefault();
		}
	},
	"keyup": function (e) {
		if (e.key ==='Enter') {
			$("#demo").empty();
			let n = $(this).val();
			let sum = 0;
			for (var i = 1; i <= n; i++) {
				sum += i;
				$("#demo").html(function (index, oldHtml) {
					return oldHtml + i + (i==n? "" : "+");
				});
			}
				$("#demo").html(function (index, oldHtml) {
					return oldHtml + "=" + sum;
				});
				
		}
				$(this).select();
	}
  });
</script>
</body>
</html>