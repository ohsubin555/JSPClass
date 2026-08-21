package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import jdbc.JdbcUtil;
import member.model.Member;


public class MemberDao {

   public Member selectById(Connection conn, String id) throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         pstmt = conn.prepareStatement(
               "select * from member where memberid = ?");
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();
         Member member = null;
         if (rs.next()) {
            member = new Member(
                  rs.getString("memberid"), 
                  rs.getString("name"), 
                  rs.getString("password"),
                  toDate(rs.getTimestamp("regdate")));
         }
         return member;
      } finally {
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
   }

   private Date toDate(Timestamp date) {
      return date == null ? null : new Date(date.getTime());
   }

   public void insert(Connection conn, Member mem) throws SQLException {
      try (PreparedStatement pstmt = 
            conn.prepareStatement("insert into member values(?,?,?,?)")) {
         pstmt.setString(1, mem.getId());
         pstmt.setString(2, mem.getName());
         pstmt.setString(3, mem.getPassword());
         pstmt.setTimestamp(4, new Timestamp(mem.getRegDate().getTime()));
         pstmt.executeUpdate();
      }
   }

   public void update(Connection conn, Member member) throws SQLException {
      try (PreparedStatement pstmt = conn.prepareStatement(
            "update member set name = ?, password = ? where memberid = ?")) {
         pstmt.setString(1, member.getName());
         pstmt.setString(2, member.getPassword());
         pstmt.setString(3, member.getId());
         pstmt.executeUpdate();
      }
   }

   public String idCheck(Connection conn, String id) {
   //  0(사용가능)             1(사용불가능)
         String sql =    " select count(*) cnt " + 
                     " from member  " + 
                     " where memberid =  ?";
         ResultSet rs = null;         
         String jsonResult =  null;  //   "{ "count":1 }"; 

         try (PreparedStatement pstmt =   conn.prepareStatement(sql)) {
            pstmt.setString(1, id );
            rs = pstmt.executeQuery();
            rs.next();
            int cnt = rs.getInt("cnt");  
            // jsonResult  = "{ \"count\":  "+ cnt +" }";
            jsonResult  = String.format("{ \"count\":%d }", cnt) ;
            System.out.println( " jsonReuslt :  " + jsonResult);
            
         }catch(Exception e){
            e.printStackTrace();
         }finally{ 
            JdbcUtil.close(rs); 
         }
    
         return jsonResult;
   }
}
