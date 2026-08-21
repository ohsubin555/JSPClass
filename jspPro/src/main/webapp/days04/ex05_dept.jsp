<%@page import="org.doit.domain.DeptVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 7. 오후 12:13:53</title>
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
  <select id="deptno" name="deptno">
    <option>부서 선택...</option>
    
    <c:if test="${not empty list}">
     <c:forEach items="${list}" var="dvo">
    <option value=${deptno }>${dname}</option>
        </c:forEach>
       </c:if>

  </select>
</div>
<script>
/*[1]
$("#deptno").on("change",function(){
   let deptno = $(this).val();
   if(deptno !== "부서 선택..." ){
      location.href="${pageContext.request.contextPath}/scott/emp?deptno=" + deptno
   }
});
*/
</script>
<script>
#("#deptno").wrap("<form></form>").on("change", function () {
	$(this).parent()
	.attr({
		methcod = "get"
		,  
	})
})
</script>

</script>
</body>
</html>