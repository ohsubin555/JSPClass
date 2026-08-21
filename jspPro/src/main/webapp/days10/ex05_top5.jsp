<%@page import="java.util.Calendar"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.Date"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   // test02_02.jsp?deptno=20


   
   Connection conn = null;
   PreparedStatement pstmt = null;

   String sql =  "SELECT * " 
			            +" FROM ( "
			            +"       SELECT empno, ename, sal "
			            +"      , RANK() OVER(ORDER BY sal DESC) r  "
			            +"       FROM emp  "
			            +"       )  "
			            +"       WHERE r <= 5";

   
   ResultSet rs = null;   
   int empno, mgr;
   String ename, job;
   Date hiredate;
   double sal, comm;

   EmpVO vo = null;
   Iterator<EmpVO> ir = null;
   String responseText = "";
   
   Calendar c = Calendar.getInstance();
   String now = String.format("%tT", c);
   responseText = "<h3>"+now+"</h3>";
   
   try{
      conn = ConnectionProvider.getConnection();
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      if( rs.next() ){
         do{
            int r = rs.getInt("r");
            empno = rs.getInt("empno");
            ename = rs.getString("ename");
            sal = rs.getDouble("sal");
          

            
           // responseText += String.format("<li>[%d] %d %s\t\t(%.2f) </li>", r, empno, ename, sal);
            responseText += String.format("[%d] %d %s\t\t(%.2f),", r, empno, ename, sal);
            
         }while( rs.next() );
      } // if
   }catch(Exception e){
      e.printStackTrace();
   }finally{
      try{
       pstmt.close();
       rs.close();
        conn.close();
      }catch(Exception e){
         e.printStackTrace();
      }
   } // try 
   // XML JSON 데이터 가공해서 응답
%>
<%= responseText %>