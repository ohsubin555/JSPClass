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
	<h3>Board 목록</h3>

		<table>
			<caption style="text-align: right">
				<a href="${pageContext.request.contextPath}/mvc/board/write.htm">글쓰기</a>
			</caption>
			<thead>
				<tr>
					<th width="10%">번호</th>
					<th width="45%">제목</th>
					<th width="17%">작성자</th>
					<th width="20%">등록일</th>
					<th width="10%">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="5" align="center">등록된 게시글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.seq}</td>
								<td>
									<a href="${pageContext.request.contextPath}/mvc/board/view.htm?seq=${dto.seq}">${dto.title}</a>
								</td>
								<td>${dto.writer}</td>
								<td>${dto.writedate}</td>
								<td>${dto.readed}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" align="center">
						<div class="pagination">
							<c:if test="${pDto.prev}">
								<a href="${pDto.startPage - 1}">&lt;</a>
							</c:if>
							<c:forEach begin="${pDto.startPage}" end="${pDto.endPage}" step="1" var="i">
								<a href="${i}" class="${i == (empty param.currentPage ? 1 : param.currentPage) ? 'active' : ''}">${i}</a>
							</c:forEach>
							<c:if test="${pDto.next}">
								<a href="${pDto.endPage + 1}">&gt;</a>
							</c:if>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="5" align="center">
						<form method="get" action="${pageContext.request.contextPath}/mvc/board/list.htm">
							<select name="searchCondition" id="searchCondition">
							    <option value="t">title</option>
								<option value="c">content</option>
								<option value="w">writer</option>
								<option value="tc">title + content</option> 
							</select> 
							<input type="text" name="searchKeyword" id="searchKeyword" value="${param.searchKeyword}">
							<input type="submit" value="search" />
						</form>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>

<script>
	// 검색조건 셀렉트박스 선택값 유지
	$("#searchCondition").val("${empty param.searchCondition ? 't' : param.searchCondition}");

	// 페이징 클릭 시 URL 바인딩
	$(".pagination a:not(.active)").attr("href", function(index, oldHref) {
	     let searchKeyword = encodeURIComponent("${param.searchKeyword}");
	     let searchCondition = "${empty param.searchCondition ? '' : param.searchCondition}";
	     let numberPerPage = "${empty param.numberPerPage ? 10 : param.numberPerPage}";
	     
	     return "${pageContext.request.contextPath}/mvc/board/list.htm"
	      + "?currentPage=" + oldHref
	      + "&numberPerPage=" + numberPerPage
	      + "&searchCondition=" + searchCondition
	      + "&searchKeyword=" + searchKeyword;
	});
</script>

<script>
    // URL 파라미터에 del=fail 이 넘어왔는지 확인
    <c:if test="${param.del eq 'fail'}">
        alert("비밀번호가 올바르지 않거나 삭제에 실패했습니다.");
    </c:if>
</script>
</body>
</html>