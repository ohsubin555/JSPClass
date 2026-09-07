<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  int id = Integer.parseInt( request.getParameter("id") );
  String type = request.getParameter("type");
  String name = request.getParameter("name");
  String address = request.getParameter("address");
  double  lng =  Double.parseDouble(request.getParameter("lng"));
  double  lat =  Double.parseDouble(request.getParameter("lat"));

  System.out.printf("%d %s %s %s %.2f %.2f\n",id, type, name, address, lng, lat);

  String sql = "insert into googlemap  (id,type,name,lng,lat,address) values (?,?,?,?,?,?)";
 
  int result = 0 ;
         
try{
  conn = ConnectionProvider.getConnection();
  pstmt = conn.prepareStatement(sql);
     pstmt.setInt(1, id);
     pstmt.setString(2, type);
     pstmt.setString(3, name);
     pstmt.setDouble(4, lng);
     pstmt.setDouble(5, lat);
     pstmt.setString(6, address);
  result = pstmt.executeUpdate();
  
}catch(Exception e){
      e.printStackTrace();
}finally{
      pstmt.close(); 
      conn.close(); 
}
%>
<script>
   alert("DB 에 저장 후 이동 - <%= result %>");
   location.href="ex01_oracle_json.jsp";
</script>  