package days08.mvc.member;

import java.sql.Connection;

import com.util.ConnectionProvider;

import days07.mvc.board.command.CommandHandler; // 기존 CommandHandler import
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        String requestMethod = request.getMethod();

        // 1. GET 방식 : 로그인 입력 폼(login.jsp)을 보여줌
        if (requestMethod.equalsIgnoreCase("GET")) {
            return "/WEB-INF/views/days08/member/login.jsp";
        } 
        
        // 2. POST 방식 : 입력한 ID/PW를 받아 DB 검증
        else if (requestMethod.equalsIgnoreCase("POST")) {
            String id = request.getParameter("id");
            String passwd = request.getParameter("passwd");

            Connection conn = ConnectionProvider.getConnection();
            MemberDAO dao = new MemberDAOImpl(conn);
            
            MemberDTO authUser = null;

            try {
                // DB에서 회원 정보 조회
                authUser = dao.login(id, passwd);
            } finally {
                conn.close();
            }

            if (authUser != null) {
                // [로그인 성공] 세션에 회원 객체 바인딩 후 게시판 목록으로 이동
                HttpSession session = request.getSession();
                session.setAttribute("authUser", authUser);

                // 목록 페이지로 리다이렉트
                response.sendRedirect(request.getContextPath() + "/mvc/board/list.htm");
                return null;
            } else {
                // [로그인 실패] 에러 메시지를 담아서 다시 로그인 폼으로 포워딩
                request.setAttribute("errorMsg", "아이디 또는 비밀번호가 올바르지 않습니다.");
                return "/WEB-INF/views/days08/member/login.jsp";
            }
        }

        return null;
    }
}