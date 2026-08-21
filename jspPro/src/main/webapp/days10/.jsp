<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.*, java.util.*, com.util.DBConn" %>
<%
    String pDeptno = request.getParameter("deptno");
    if (pDeptno == null || pDeptno.trim().isEmpty()) {
        pDeptno = "10";
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String sql = """
                SELECT empno, ename, job, NVL(mgr, 0) mgr
                     , TO_CHAR(hiredate, 'yyyy-MM-dd') hiredate, sal, NVL(comm, 0) comm, deptno
                FROM emp
                WHERE deptno = ?
                ORDER BY empno ASC
               """;

    StringBuilder json = new StringBuilder();
    json.append("[");

    try {
        conn = DBConn.getConnection();
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, pDeptno);
        rs = pstmt.executeQuery();

        boolean isFirst = true;
        while (rs.next()) {
            if (!isFirst) json.append(",");
            json.append("{");
            json.append(String.format("\"empno\":%d,", rs.getInt("empno")));
            json.append(String.format("\"ename\":\"%s\",", rs.getString("ename")));
            json.append(String.format("\"job\":\"%s\",", rs.getString("job")));
            json.append(String.format("\"mgr\":%d,", rs.getInt("mgr")));
            json.append(String.format("\"hiredate\":\"%s\",", rs.getString("hiredate")));
            json.append(String.format("\"sal\":%.2f,", rs.getDouble("sal")));
            json.append(String.format("\"comm\":%.2f,", rs.getDouble("comm")));
            json.append(String.format("\"deptno\":%d", rs.getInt("deptno")));
            json.append("}");
            isFirst = false;
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) DBConn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    json.append("]");
%>
<%= json.toString() %>