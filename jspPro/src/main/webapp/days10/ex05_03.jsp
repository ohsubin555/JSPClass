<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 18. 오전 10:37:06</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
</head>
<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">Subin YaHo</a>
		</h1>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</header>
	<div>
		<xmp class="code"> 일정한 간격으로 emp 테이블에서 급여 많이 받는 top 5 정보 fetch 처리

		</xmp>
		<h3>
			서버 요청 시간 :
			<%=new Date().toLocaleString()%></h3>

		<input type="button" value="EmpTop5" /> <br>
		<p id="demo"></p>
	</div>
<script>
 document.querySelector("input[type=button]").addEventListener("click", function () {
	//alert("버튼클릭");
	let url = `ex05_top5_02.jsp`;
	fetch(url)
	   .then(response => response.json())
	   .then(data=> {
		   
			const now = data.now; //string
			const emps = data.list; // js[]
			
			let content =  `
	             <table border="1">
	             <caption>\${ now }</caption>
	              <thead>
	                  <tr>
	                      <th>순위</th>
	                      <th>사원번호</th>
	                      <th>사원명</th>
	                      <th>급여</th>
	                  </tr>
	              </thead>
	              <tbody>
	      `;
	      
	      emps.forEach(function (emp) {
			content += `
			  
				<tr>
                <td>\${emp.r}</td>
                <td>\${emp.empno}</td>
                <td>\${emp.ename}</td>
                <td>\${emp.sal}</td>
              </tr>
			
			`;
	      });
	        
	      content += `
              </tbody>
              </table>
          `;
			
			document.querySelector("#demo").innerHTML = content;
	   });
});
	
</script>
</body>
</html>