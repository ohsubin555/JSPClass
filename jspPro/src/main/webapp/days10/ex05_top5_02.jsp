<%@page import="java.util.Calendar"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page trimDirectiveWhitespaces="true"
         contentType="application/json; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String sql =
          "SELECT * "
        + "FROM ( "
        + "    SELECT empno, ename, sal, "
        + "           RANK() OVER(ORDER BY sal DESC) r "
        + "    FROM emp "
        + ") "
        + "WHERE r <= 5";

    Calendar c = Calendar.getInstance();
    String now = String.format("%tT", c);

    StringBuilder json = new StringBuilder();

    json.append("{");
    json.append("\"now\":\"").append(now).append("\",");
    json.append("\"list\":[");

    try {

        conn = ConnectionProvider.getConnection();
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        boolean first = true;

        while (rs.next()) {

            int r = rs.getInt("r");
            int empno = rs.getInt("empno");
            String ename = rs.getString("ename");
            double sal = rs.getDouble("sal");

            if (!first) {
                json.append(",");
            }

            json.append("{");
            json.append("\"r\":").append(r).append(",");
            json.append("\"empno\":").append(empno).append(",");
            json.append("\"ename\":\"").append(ename).append("\",");
            json.append("\"sal\":").append(sal);
            json.append("}");

            first = false;
        }

        json.append("]");
        json.append("}");

    } catch (Exception e) {

        e.printStackTrace();

        json.setLength(0);

        json.append("{");
        json.append("\"error\":true,");
        json.append("\"message\":\"").append(e.getMessage()).append("\"");
        json.append("}");

    } finally {

        try {
            if (rs != null) rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            if (pstmt != null) pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<%= json.toString() %>