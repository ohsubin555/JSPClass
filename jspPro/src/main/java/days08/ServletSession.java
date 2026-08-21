package days08;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/days08/session.do")
public class ServletSession extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletSession() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//AuthUser 로그인 한 사용자 정보 -> 서블릿에서 -> 세션에 저장. 
		String loginUser = "hong";
		String loginUserRole = "MANAGER";
		AuthUser authUser = AuthUser.builder()
				      .loginUser(loginUser)
				      .loginUserRole(loginUserRole)
				      .build();
		
		request.getSession();				      
		request.getSession(true); //세션객체가 존재하지 않으면 세션을 생성해서 반환. 
		HttpSession session = request.getSession();
		session.setAttribute("authUser", authUser);
		/*
		 * if (session == null) { //A 처리될 일이 없음. 세션을 생성하기 때문에 null 일리 x }
		 */
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
