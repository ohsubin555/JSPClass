package auth.command;

import java.util.HashMap;
import java.util.Map;

import auth.service.LoginFailException;
import auth.service.LoginService;
import auth.service.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvc.command.CommandHandler;

public class LoginHandler implements CommandHandler {

   private static final String FORM_VIEW = "/WEB-INF/view/loginForm.jsp";
   private LoginService loginService = new LoginService();

   @Override
   public String process(HttpServletRequest req, HttpServletResponse res) 
   throws Exception {
      if (req.getMethod().equalsIgnoreCase("GET")) {
         return processForm(req, res);
      } else if (req.getMethod().equalsIgnoreCase("POST")) {
         return processSubmit(req, res);
      } else {
         res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
         return null;
      }
   }

   private String processForm(HttpServletRequest req, HttpServletResponse res) {
      return FORM_VIEW;
   }

   private String processSubmit(HttpServletRequest req, HttpServletResponse res) 
   throws Exception {
      String id = trim(req.getParameter("id"));
      String password = trim(req.getParameter("password"));

      Map<String, Boolean> errors = new HashMap<>();
      req.setAttribute("errors", errors);

      if (id == null || id.isEmpty())
         errors.put("id", Boolean.TRUE);
      if (password == null || password.isEmpty())
         errors.put("password", Boolean.TRUE);

      if (!errors.isEmpty()) {
         return FORM_VIEW;
      }

      try {
         User user = loginService.login(id, password);
         // 세션 저장.
         req.getSession().setAttribute("authUser", user);
         
         String location = req.getContextPath() + "/index.do";
         String referer = null;
         if( ( referer = (String) req.getSession().getAttribute("referer") ) != null ) {
            location = referer;
            req.getSession().removeAttribute("referer");
         }
         res.sendRedirect(location);
         return null;
      } catch (LoginFailException e) {
         errors.put("idOrPwNotMatch", Boolean.TRUE);
         return FORM_VIEW;
      }
   }

   private String trim(String str) {
      return str == null ? null : str.trim();
   }
}
