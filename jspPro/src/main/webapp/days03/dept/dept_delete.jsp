<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% 
//2. 
//삭제할 부서번호
int deptno = Integer.parseInt(request.getParameter("deptno"));

Connection conn = null;
PreparedStatement  pstmt = null;

conn = DBConn.getConnection();

String sql = """
           DELETE FROM dept 
           WHERE deptno =?
             """;

int rowCount = 0;
try {
   pstmt = conn.prepareStatement(sql);
   pstmt.setInt(1,deptno);

   rowCount = pstmt.executeUpdate();   
   
   if (rowCount == 1) {
	   %>
	   <script>
	       alert("<%= deptno %>번 부서번호 삭제되었습니다.");
	       location.href = "dept_list.jsp";
	   </script>
	   <%
   }else{
		
		%>
		<script>
		<%-- alert("<%= rowCount%>"); --%>
		 alert("부서삭제실패!!!");
		 history.back();
		</script>
		
		<%
		 return; 
   }
   
} catch (SQLException e) {
	
	%>
	<script>
	 alert("부서 삭제 실패!!!");
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