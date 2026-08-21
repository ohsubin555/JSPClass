package com.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import days08.AuthUser;

public class AuthorizationFilter extends HttpFilter implements Filter {
   
   private String encoding; 
      
    public AuthorizationFilter() {
        super(); 
    }
 
   public void destroy() { 
   }
 
   public void doFilter(ServletRequest frequest, ServletResponse fresponse, FilterChain chain) throws IOException, ServletException {
      System.out.println("👌 AuthorizationFilter.doFilter()...");
      
      HttpServletRequest request = (HttpServletRequest)frequest;
      HttpServletResponse response = (HttpServletResponse)fresponse;
      
      HttpSession session =request.getSession(false);
      AuthUser authUser = (AuthUser)session.getAttribute("authUser");
      
      String loginUserRole = authUser.getLoginUserRole();
      
      if (! loginUserRole.equals("ADMIN")) {
		response.sendError(HttpServletResponse.SC_FORBIDDEN);
		return;
	} else {
		
		String referer = request.getRequestURI();
		session.setAttribute("referer", referer);
	}
      chain.doFilter(request, response);  
   }
 
   public void init(FilterConfig fConfig) throws ServletException {

   }

}
