<%@page import="days15.GoogleMapDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%> 
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <h3>ex02_oralce_json_data.jsp</h3> --%>
<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String sql = " select id, type,name, lng,lat,address " 
              + " from googlemap";
   
   Gson gson = new Gson();
   
   ArrayList<GoogleMapDTO> list = new ArrayList<>();
             
   try{
     conn = ConnectionProvider.getConnection();
     pstmt = conn.prepareStatement(sql);
     rs = pstmt.executeQuery();
     
     GoogleMapDTO dto = null;
     
     while( rs.next() ){
       dto = GoogleMapDTO.builder()
             .id(rs.getInt("id"))
             .type(rs.getString("type"))
             .name(rs.getString("name"))
             .lng(rs.getDouble("lng"))
             .lat(rs.getDouble("lat"))
             .address(rs.getString("address"))
             .build(); 
      list.add(dto); 
     }  
     
     String responseJson = gson.toJson(list);
     out.print(responseJson);
   }catch(Exception e){
      e.printStackTrace();
   }finally{
      pstmt.close();
      rs.close();
      conn.close();
   }
%> 

