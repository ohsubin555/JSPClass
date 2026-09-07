<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 24. 오전 9:23:21</title>
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
   ex02_write.jsp
  </xmp>

  <h2>글수정</h2>
<form action="/days13/update.ss"
    method="post" 
    enctype="multipart/form-data">
    
      <!-- ★ 1. 수정할 글의 식별자(PK/글번호)를 hidden으로 전송 -->
      <input type="hidden" name="num" value="${dto.num}" />
      
      <table border="1" align="center">
         <tr>
            <td>subject</td>
            <!-- ★ 2. 기존 제목 출력 -->
            <td><input type="text" name="subject" value="${ dto.subject }" /></td>
         </tr>
         <tr>
            <td>attach file</td>
            <td>
               <!-- ★ 3. 기존 첨부파일이 있다면 안내 표시 -->
               <c:if test="${ not empty dto.originalfilename }">
                  <div style="margin-bottom: 5px; color: gray; font-size: 0.9em;">
                     기존 파일: <b>${ dto.originalfilename }</b> (${ dto.filelength } bytes)
                  </div>
               </c:if>
               <input type="file" name="attachFile" />
               <br>
               <span style="font-size: 0.8em; color: red;">* 새 파일을 선택하면 기존 파일은 삭제되고 교체됩니다.</span>
            </td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <input type="submit" value="수정완료" />
               <input type="button" value="취소" onclick="location.href='/days13/list.ss';" />
            </td>
         </tr>
      </table>
   </form>
  
<script>

</script>
</body>
</html>