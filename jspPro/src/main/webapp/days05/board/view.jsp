<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 10. 오전 9:13:02</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
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
    days05/board/view.jsp
  </xmp>
  
  <h3>Board 상세보기</h3>
  <table>
    <thead></thead>
    <tbody>
       <tr>
         <th>이름</th>
         <td>${dto.writer }</td>
         <th>등록일</th>
         <td>${dto.writedate }</td>
       </tr>
       <tr>
         <th>Email</th>
         <td>${dto.email }</td>
         <th>조회수</th>
         <td>${dto.readed }</td>
       </tr>
       <tr>
         <th>제목</th>
         <td colspan="3">${dto.title }</td>
       </tr>
       <tr>
         <th>내용</th>
         <td colspan="3" class="full" style="height:200px; vertical-align: top">${dto.content }</td>
       </tr>
    </tbody>
    <tfoot>
      <tr>
       <td colspan="4" align="center">
         <a href="${pageContext.request.contextPath}/cstvsboard/edit.htm?seq=${dto.seq}">수정</a>
         <a href="${pageContext.request.contextPath}/cstvsboard/delete.htm?seq=${dto.seq}">삭제</a>
         <a href="${pageContext.request.contextPath}/cstvsboard/list.htm">목록</a>
     
        
       </td>
      </tr>
    </tfoot>
  </table>
</div>


<h3>Board 삭제</h3>
   

   <form method="post">
    <table>
       <tr>
         <td colspan="2" align="center"><b>삭제시 비밀번호 입력</b></td>
      </tr>
  
      <tr>
         <td align="center">비밀번호</td>
         <td><input type="password" name="pwd" size="15"
            required="required"></td>
      </tr>
     
      <tr>
            <td colspan="2" align="center">
            <input type="submit" value="작성 완료"> &nbsp;&nbsp;&nbsp; 
            <input type="button" value="취소" id="cancel"> 
           
      </tr>   
      
    </table>
  
   </form>
   
</div>

<script>
// 목록 버튼
$("tfoot a").last().attr("href", function (index, oldHref){
    
     let searchKeyword = encodeURIComponent("${param.searchKeyword}");
     let npp = 10;
     return `\${oldHref}?currentPage=${param.currentPage}&numberPerPage=\${npp}&searchCondition=${param.searchCondition}&searchKeyword=\${searchKeyword}`;
 }); 
</script>
</body>
</html>