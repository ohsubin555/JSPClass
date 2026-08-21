<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.function.Consumer"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String pEmpno = request.getParameter("empno"); //중복체크할 ID(empno)
  if( pEmpno == null ) pEmpno = "0";
%>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

conn = ConnectionProvider.getConnection();

String esql = """
		 SELECT COUNT(*) cnt
		 FROM emp
		 WHERE empno = ?
		""";

// out.print(esql);
int cnt = 0;
try {
	int empno = Integer.parseInt(pEmpno);
	pstmt = conn.prepareStatement(esql);
	pstmt.setInt(1, empno);
	rs = pstmt.executeQuery();

	if (rs.next()) { // 첫 번째 레코드는 존재한다.
		cnt = rs.getInt("cnt");

	}
} catch (SQLException e) {
	e.printStackTrace();
} finally {
	try {
		rs.close();
		pstmt.close();
		conn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}

//{"count" : 1}
//{"count" : 0}
//EmpVO
Gson gson = new Gson();
JsonObject jObj = new JsonObject();
jObj.addProperty("count", cnt);
String json = gson.toJson(jObj);
out.println(json);
%>
