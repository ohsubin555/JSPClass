<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
 String name = "홍길동";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 11. 오후 12:32:12</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
</head>
<body>
<jsp:include page="/layout/top.jsp" flush="false">
 <jsp:param value="name" name="teamLeader"/>
</jsp:include>
<div>
  <xmp class="code">
    ex05_template - 일정관리 파트
  </xmp>
  <table>
    <tr height="500px">
      <td width="100px">
        <jsp:include page="/days06/layout/left.jsp" flush="false"></jsp:include>
      </td>
      <td>
       일정관리 내용부분 <br>
       일정관리 내용부분 <br>
       일정관리 내용부분 <br>
       일정관리 내용부분 <br>
       일정관리 내용부분 <br>
       일정관리 내용부분 <br>
       일정관리 내용부분 <br>
      </td>
      <td>
       <jsp:include page="/days06/layout/right.jsp" flush="false"></jsp:include>
      </td>
    </tr>
  </table>
  
</div>
<jsp:include page="/layout/bottom.jsp" flush="false">
<jsp:param value="name" name="teamLeader"/>
</jsp:include>

<script>
</script>
</body>
</html>