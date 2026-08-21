package auth.command;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mvc.command.CommandHandler;

public class LogoutHandler implements CommandHandler {

   @Override
   public String process(HttpServletRequest req, HttpServletResponse res) 
   throws Exception {
      HttpSession session = req.getSession(false);
      if (session != null) {
         session.invalidate(); //강제 제거
      }
      res.sendRedirect(req.getContextPath() + "/index.do");
      return null;
   }

}
