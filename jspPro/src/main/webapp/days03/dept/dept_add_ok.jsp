<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% 
//2. 
int deptno = Integer.parseInt(request.getParameter("deptno"));
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");

Connection conn = null;
PreparedStatement  pstmt = null;

conn = DBConn.getConnection();

String sql = """
           INSERT INTO dept (deptno, dname, loc) 
           VALUES ( ?, ?, ?) 
             """;

int rowCount = 0;
try {
   pstmt = conn.prepareStatement(sql);
   pstmt.setInt(1,deptno);
   pstmt.setString(2,dname);
   pstmt.setString(3,loc);
   rowCount = pstmt.executeUpdate();   
   
   if (rowCount == 1) {
     //부서 목록 페이지로 이동
     String location = "dept_list.jsp";
     response.sendRedirect(location);
   }else{
		
		%>
		<script>
		 alert("부서추가실패!!!"); 
		 history.back();
		</script>
		
		<%
	   
   }
   
} catch (SQLIntegrityConstraintViolationException e) {
	
	%>
	<script>
	 alert("이미 존재하는 부서입니다. ");
	 history.back();
	</script>
	
	<%
   e.printStackTrace();
} catch (SQLException e) {
	
	%>
	<script>
	 alert("부서추가실패!!!");
	 history.back();
	</script>
	
	<%
   e.printStackTrace();
} finally {
   try {            
      pstmt.close(); 
      DBConn.close();
   } catch (SQLException e) { 
      e.printStackTrace();
   }
} 

%>