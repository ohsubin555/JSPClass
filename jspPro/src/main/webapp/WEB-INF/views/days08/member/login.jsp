<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

<h2>로그인</h2>

<!-- 로그인 실패 시 에러 메시지 출력 -->
<c:if test="${not empty errorMsg}">
    <div style="color: red; margin-bottom: 10px;">
        ${errorMsg}
    </div>
</c:if>

<form action="${pageContext.request.contextPath}/mvc/member/login.htm" method="post">
    <table border="1">
        <tr>
            <th>아이디</th>
            <td><input type="text" name="id" required></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="passwd" required></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="로그인">
                <input type="button" value="취소" onclick="history.back();">
            </td>
        </tr>
    </table>
</form>

</body>
</html>