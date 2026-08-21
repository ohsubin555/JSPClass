<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 7. 오후 2:04:26</title>
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
   ex05_emp.jsp
  </xmp>
  
  <h3>emp list</h3>
  
  <table>
    <thead>
      <tr>     
	      <th>empno</th>
	      <th>ename</th>
	      <th>job</th>
	      <th>mgr</th>
	      <th>hiredate</th>
	      <th>sal</th>
	      <th>comm</th>
	      <th>deptno</th>
	  </tr> 
    </thead>
    <tbody>
    <c:if test="${ empty list }">
      <tr>
          <td colspan="8">사원이 존재하지 않습니다.</td>
      </tr>
    </c:if>
    <c:if test="${ not empty list }">
      <c:forEach items="${ list }" var="evo">
        <tr>
           <td>${ evo.empno }</td>
           <td>${evo.ename}</td>
	       <td>${evo.job}</td>
	       <td>${evo.mgr}</td>
	       <td>${evo.hiredate}</td>
	       <td>${evo.sal}</td>
	       <td>${evo.comm}</td>
	       <td>${evo.deptno}</td> 
         </tr>
      </c:forEach>
    </c:if> 
    </tbody>
    <tfoot>
      <tr>
        <td colspan="8">
          <%-- <span class="badge left red">${ empty list ? 0 : list.size() }명</span> --%>
          <span class="badge left red">${ empty list ? 0 : fn:length(list) }명</span>
          <a href="javascript:history.back()">뒤로 가기</a>
        </td>
      </tr>
    </tfoot>
  </table>
  
</div>
<script>
</script>
</body>
</html>