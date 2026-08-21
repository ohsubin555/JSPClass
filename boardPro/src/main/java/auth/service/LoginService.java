package auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;

import member.dao.MemberDao;
import member.model.Member;

public class LoginService {

   private MemberDao memberDao = new MemberDao();

   public User login(String id, String password) {
      try (Connection conn = ConnectionProvider.getConnection()) {
         Member member = memberDao.selectById(conn, id);
         if (member == null) {
            throw new LoginFailException();
         }
         if (!member.matchPassword(password)) {
            throw new LoginFailException();
         }
         return new User(member.getId(), member.getName());
      } catch (SQLException | NamingException e) {
         throw new RuntimeException(e);
      }
   }

   public String idCheck(String id) {
      
      try (Connection conn = ConnectionProvider.getConnection()) {
    	  //"{count : 1}" 
         String idCheckJson = memberDao.idCheck(conn, id); 
         System.out.println("> LoginService.idCheck : idCheckJson = " + idCheckJson);
         return idCheckJson;
      } catch (SQLException | NamingException e) {
         throw new RuntimeException(e);
      } 
      
   }
}
