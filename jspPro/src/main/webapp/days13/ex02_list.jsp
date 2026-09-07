<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 24. 오전 10:06:28</title>
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
   ex02_list.jsp
  </xmp>

  <table align="center" style="width: 100%">
    <tr>
     <td align="right" colspan="4">
          <a href="write.ss">WRITE</a>
     </td>
   </tr>
   <tr>
      <td align="center" width="50">글번호</td>
      <td align="left" >제목</td>
      <td align="center" width="200">첨부파일</td>
      <td align="center" width="50">삭제</td>
    </tr>
    <c:if test="${ empty list }">
      <tr>
        <td  colspan="4">
           게시글이 존재 X
        </td>
      </tr>
    </c:if>
    <c:if test="${ not empty list }">
      <c:forEach items="${ list }" var="dto">
        <tr>
          <td align="center" width="50">${ dto.num }</td>
          <td align="left" >${ dto.subject }</td>
          <td align="center" width="200">
            <a href="/days13/upload/${dto.originalfilename}">${empty dto.originalfilename ? "없음" :dto.originalfilename}</a>
          </td>
          <td align="center" width="50">
            <a href="/days13/delete.ss?num=${ dto.num }&filesystemname=${ dto.filesystemname}">삭제</a>
            <a href="/days13/update.ss?num=${ dto.num }&filesystemname=${ dto.filesystemname}">수정</a>
          </td>
        </tr>
      </c:forEach>
    </c:if>
  </table>  
  
</div>
<script>

</script>
</body>
</html>