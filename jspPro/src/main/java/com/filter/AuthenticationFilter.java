package com.filter;

import java.io.IOException;

import days08.AuthUser;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AuthenticationFilter extends HttpFilter implements Filter {
   
   private String encoding; 
      
    public AuthenticationFilter() {
        super(); 
    }
 
   public void destroy() { 
   }
 
   public void doFilter(ServletRequest frequest, ServletResponse fresponse, FilterChain chain) throws IOException, ServletException {
      System.out.println("👌 AuthenticationFilter.doFilter()...");
      
      HttpServletRequest request = (HttpServletRequest)frequest;
      HttpServletResponse response = (HttpServletResponse)fresponse;
      
      HttpSession session =request.getSession(false);
      AuthUser authUser = null;
      boolean isLogon = false;
      
      if (session != null) {
    	  authUser = (AuthUser)session.getAttribute("authUser");
    	  if (authUser != null) isLogon = true; 
			
	}
      if (isLogon) {
		  // 필터링할 작업 authUser
          chain.doFilter(request, response);  
	}else {
		//인증 x 로그인페이지 리다이렉트
		String location ="/days09/member/logon.jsp";
		response.sendRedirect(location);
	}
       
   }
 
   public void init(FilterConfig fConfig) throws ServletException {

   }

}
