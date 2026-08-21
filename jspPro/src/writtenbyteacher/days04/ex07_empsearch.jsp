<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 7. 오후 3:36:09</title>
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
   ex07_empsearch.jsp
  </xmp>
  
  <form action="${pageContext.request.contextPath}/scott/empsearch.htm">
    <fieldset>
      <legend>부서 선택</legend>
      <c:forEach items="${ dlist }" var="dvo">
        <input type="checkbox" id="deptno-${dvo.deptno}" name="deptno" value="${dvo.deptno}">
        <label for="deptno-${dvo.deptno}">${dvo.dname}</label> 
      </c:forEach>
    </fieldset>
    
    <fieldset>
      <legend>잡(job) 선택</legend>
      <c:forEach items="${ jlist }" var="job">
        <input type="checkbox" id="job-${job}" name="job" value="${job}">
        <label for="job-${job}">${job}</label> 
      </c:forEach>
    </fieldset>
    
    
    <fieldset>
      <legend>입사일자 선택</legend>
      <input type="datetime-local" id="hiredate_start" name="hstart">
      ~
      <input type="datetime-local" id="hiredate_end" name="hend">
    </fieldset>
    <br>
    <input type="submit" value="search">
  </form>
  
  <h3>emp search list</h3>
  
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
    <c:if test="${ empty elist }">
      <tr>
          <td colspan="8">사원이 존재하지 않습니다.</td>
      </tr>
    </c:if>
    <c:if test="${ not empty elist }">
      <c:forEach items="${ elist }" var="evo">
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
          <span class="badge left red">${ empty elist ? 0 : fn:length(elist) }명</span>
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






