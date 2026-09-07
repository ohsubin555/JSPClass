<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board 목록</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
</head>
<body>
<header>
  <h1 class="main"><a href="${pageContext.request.contextPath}/mvc/board/list.htm" style="position: absolute;top:30px;">Subin YaHo</a></h1>
  
  <!-- ★ 1. 로그인 / 로그아웃 세션 연동 링크 처리 -->
  <ul>
    <c:choose>
      <c:when test="${empty sessionScope.authUser}">
        <!-- 비로그인 상태일 때 -->
        <li><a href="${pageContext.request.contextPath}/mvc/member/login.htm">로그인</a></li>
        <li><a href="#">회원가입</a></li>
      </c:when>
      <c:otherwise>
        <!-- 로그인 상태일 때 -->
        <li><span style="color: blue; font-weight: bold;">${sessionScope.authUser.name}</span>님 환영합니다!</li>
        <li><a href="${pageContext.request.contextPath}/mvc/member/logout.htm">로그아웃</a></li>
      </c:otherwise>
    </c:choose>
  </ul>
</header>

<div>
  <xmp class="code">
   list.jsp
  </xmp>
	<h3>ReplyBoard 목록</h3>
	
 <table border="1" >
   <tr>
     <td align="right" colspan="6">
         <a href="write.do">글쓰기</a>
     </td>
   </tr>
   <tr style="background:gray;color:white;font-weight:bold">
     <td width="50" align="center">번호</td>
     <td width="280" align="center">제 목</td>
     <td width="100" align="center">작성자</td>
     <td width="120" align="center">작성일</td>
     <td width="50" align="center">조회</td>
     <td width="100" align="center">IP</td>
   </tr>
   <tbody>
   <!-- request.setAtttribute("list", ??); -->
   <c:if test="${ empty list }">
     <tr class="data">
       <td align="center" colspan="6">
        <h3>작성된 게시글이 없습니다.</h3>
       </td>
     </tr>
   </c:if>
   <c:if test="${ not empty list }">
    <c:forEach items="${ list }" var="dto">
       <tr class="data">
         <td align="center">${ dto.num }</td>
         <td>     
           <c:if test="${ dto.depth gt 0 }">
             <img width="${ dto.depth * 15 }">
             <img src="/days16/replyboard/images/arr.gif">
           </c:if>
           <a href="view.do?num=${ dto.num }&page=${ param.page }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }">${ dto.subject }</a>
            <c:if test="${ dto.newImg }">
             <img src="/days16/replyboard/images/ico-new.gif">
           </c:if> 
         </td>
         <td>  
           <img  width="20px" height="20px" 
           src="/days16/replyboard/emoticon/${dto.writer}.png">            
           <a href="mailto:${ dto.email }">${ dto.writer }</a> 
         </td>
         <td>${ dto.regdate }</td>
         <td>${ dto.readcount }</td>
         <td>${ dto.ip }</td>
       </tr>
    </c:forEach>    
    <tr>
     <td align="center" colspan="6">
      <!-- request.setAttribute("pageBlock", "[1] 2 3 4 5 6 7 8 9 10 > ");-->
       ${ pageBlock }
     </td>
    </tr>
   </c:if>
    
   </tbody>
<form>
   <tr>
      <td colspan="6" align="center" style="padding:3px;">
        <select id="searchCondition" name="searchCondition" 
        style="font-size: 15px;">
          <option value="subject" ${ param.searchCondition eq "subject" ? "selected" : "" }>제목</option>       
          <option value="writer"  ${ param.searchCondition eq "writer" ? "selected" : "" }>작성자</option>
          <option value="subject+content">제목+내용</option>
        </select>
        <input type="text" name="searchWord"   value='${ param.searchWord }'>
        <input type="button" style="height:22px;width:50px"
        value="검색" id="searchBtn">
      </td>
    </tr>   
 </form>
 
</table>
		
<script>
  
</script>

<script>

</script>
</body>
</html>