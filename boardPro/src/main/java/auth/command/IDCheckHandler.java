package auth.command;

import java.util.HashMap;
import java.util.Map;

import auth.service.LoginService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvc.command.CommandHandler;

public class IDCheckHandler implements CommandHandler{

   private LoginService loginService = new LoginService();
   
   @Override
   public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
       
      // 중복체크할 ID 
      String id = trim(req.getParameter("memberid"));   
      
      System.out.println("> IDCheckHandler .... ");
      
      Map<String, Boolean> errors = new HashMap<>();
      req.setAttribute("errors", errors);
      if (id == null || id.isEmpty())
         errors.put("id", Boolean.TRUE); 
      if (!errors.isEmpty()) {
         return null;
      }
      
      try {
         // { "count":1  }
         // { "count":0  }
         String idCheckJson = loginService.idCheck(id); 
         return idCheckJson;
      } catch ( Exception e) {
         errors.put("idCheck", Boolean.TRUE);
         return null;
      } 
   }
   
   private String trim(String str) {
      return str == null ? null : str.trim();
   }

}
