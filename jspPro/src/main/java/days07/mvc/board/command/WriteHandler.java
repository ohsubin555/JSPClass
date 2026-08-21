package days07.mvc.board.command;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import org.apache.tomcat.util.http.fileupload.RequestContext;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days07.mvc.board.domain.BoardDTO;
import days07.mvc.board.persistence.BoardDAO;
import days07.mvc.board.persistence.BoardDAOImpl;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class WriteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		/*
		 * HttpSession session = request.getSession(); loginUser = (loginUser)
		 * session.getAttribute("authUser"); // 또는 "member", "loginUser" 등 세션 키값
		 * 
		 * // 2. 만약 로그인 정보가 없다면? (인증 X) if (authUser == null) { // 로그인 페이지로 이동시킴 (원래 가려던
		 * write.htm 주소를 킵해둘 수도 있음) response.sendRedirect(request.getContextPath() +
		 * "/member/login.htm"); return null; // DispatcherServlet 포워딩 방지 }
		 * 
		 * // 3. 로그인 상태라면 정상적으로 글쓰기 폼(JSP)을 띄워줌 if
		 * (request.getMethod().equalsIgnoreCase("GET")) { return
		 * "/WEB-INF/views/days07/board/write.jsp"; }
		 * 
		 * // ... POST 처리 생략 ... return null;
		 */
		
		String requestMethod = request.getMethod();
		System.out.println("❤️❤️ requestMethod");
		if (requestMethod.equals("GET")) {
			return "/WEB-INF/views/days07/board/write.jsp";
		} else if (requestMethod.equals("POST")) {
			response.setContentType("text/html; charset=UTF-8");
			System.out.println("> WriteHandler.process() POST..");

			String writer = request.getParameter("writer");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int tag = Integer.parseInt(request.getParameter("tag"));

			BoardDTO bDto = BoardDTO.builder().writer(writer).pwd(pwd).email(email).title(title).content(content)
					.tag(tag).build();

			Connection conn = ConnectionProvider.getConnection();

			BoardDAO dao = new BoardDAOImpl(conn);
			int rowCount = 0;
			try {
				int newSeq = dao.getNextSeq();
				bDto.setSeq(newSeq);

				rowCount = dao.insert(bDto);
				if (rowCount == 1) {

					// [2]
					String location = "redirect:" + request.getContextPath() + "/mvc/board/list.htm";
					return location;
					/*
					  PrintWriter out = response.getWriter();
					  out.println("<script>"); 
					  out.println("alert('"+ newSeq+"번 글쓰기가 완료되었습니다.');");
					  out.println("location.href='" + location + "';"); 
					  out.println("</script>");
					 */
				} else {
					// 글쓰기 실패
					System.out.println("> WriteHandler.process() POST..");
				}

			} catch (SQLException e) {
				System.out.println(">> WriteHandler.process() POST..");
				e.printStackTrace();
			} finally {

				conn.close(); // 커넥션 풀에 반환.
			}
			
		}//if
		//글쓰기 실패 또는 GET, POST 이외의 요청
		return null;
		

	}

}
