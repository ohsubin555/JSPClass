package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter {

   @Override
   public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
         throws IOException, ServletException {
      HttpServletRequest request = (HttpServletRequest) req;
      HttpSession session = request.getSession(false);
      // 로그인 되지 않았다면
      if (session == null || session.getAttribute("authUser") == null) {
         
         // write.do
         String referer = request.getRequestURI();
         session.setAttribute("referer", referer);
         
         HttpServletResponse response = (HttpServletResponse)res;
         response.sendRedirect(request.getContextPath() + "/login.do");
         
      } else {
         chain.doFilter(req, res);
      }
   }

   @Override
   public void init(FilterConfig config) throws ServletException {
   }

   @Override
   public void destroy() {
   }

}
