
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오전 11:47:19</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
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
   글쓰기
  </xmp>
   <h3>Board 글쓰기</h3>
  
  <!-- http://localhost/mvc/board/write.htm -->
   <form method="post">
    <table>
       <tr>
         <td colspan="2" align="center"><b>글을 적어주세요</b></td>
      </tr>
      <tr>
         <td align="center">이름</td>
         <td><input type="text" name="writer" size="15"
            autofocus="autofocus" required="required" value="홍길동"></td>
      </tr>
      <tr>
         <td align="center">비밀번호</td>
         <td><input type="password" name="pwd" size="15"
            required="required" ></td>
      </tr>
      <tr>
         <td align="center">Email</td>
         <td><input type="email" name="email" size="50" value="se@sis.co.kr"></td>
      </tr>
      <tr>
         <td align="center">제목</td>
         <td><input type="text" name="title" size="50"
            required="required" value="JSP 게시글작성"></td>
      </tr>
      <tr>  
         <td align="center">내용</td>
         <td><textarea name="content" cols="50" rows="10">JSP 게시글작성 내용</textarea></td>
      </tr>
      <tr>
         <td align="center">HTML</td>
         <td>
            <input type="radio" name="tag" value="1" checked>적용
            <input type="radio" name="tag" value="0">비적용
         </td>
      </tr>
      <tr>
         <td colspan="2" align="center">
            <input type="submit" value="작성 완료"> &nbsp;&nbsp;&nbsp; 
            <input type="reset" value="다시 작성"> &nbsp;&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/cstvsboard/list.htm">Home</a></td>
      </tr>   
    </table>
   </form>
   
</div>
<script>
</script>
</body>
</html>
