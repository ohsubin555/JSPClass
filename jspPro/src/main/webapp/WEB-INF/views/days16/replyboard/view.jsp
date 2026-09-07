<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 28. 오전 10:08:35</title>
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
      view.jsp
  </xmp>
  
    <h3>Replyboard 상세보기</h3>
  
  <table border="1">
      <tr>
         <td colspan="2" align="right">글보기</td>
      </tr>
      <tr>
         <td width="70" align="center">글번호</td>
         <td width="330">${ dto.num }</td>
      </tr>
      <tr>
         <td width="70" align="center">조회수</td>
         <td width="330">${ dto.readcount }</td>
      </tr>
      <tr>
         <td width="70" align="center">작성자</td>
         <td width="330">${ dto.writer }</td>
      </tr>
      <tr>
         <td width="70" align="center">글제목</td>
         <td width="330">${ dto.subject }</td>
      </tr>
      <tr>
         <td width="70" align="center">글내용</td>
         <td width="330">
            <div style="width: 100%; height: 200px; overflo: scroll;">${ dto.content }</div>
         </td>
      </tr>
      <tr>
         <td colspan="2" align="center">
           <input type="button" value="글수정"
            onclick="location.href='edit.do?num=${ dto.num }&page=${ param.page}&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }'">

            <a href="delete.do?num=${ dto.num }">글삭제</a> 
             
           <!-- [기억] 답글 버튼 클릭하면           write.do?부모num, 부모그룹 ref, 부모step,부모=depth -->
            <input type="button" value="답글"
            onclick="location.href='write.do?num=${ dto.num }&ref=${dto.ref }&step=${ dto.step }&depth=${ dto.depth }'">
         
         <input type="button" value="글목록"
            onclick="location.href='list.do?page=${ param.page}&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }'">
         </td>
      </tr>
      <tr>
         <td colspan="2" align="center">
          <input type="button" id="btnModalDelete"      value="모달창으로 글 삭제">
         </td>
      </tr>
   </table>
  
</div>
<script>

</script>
</body>
</html>