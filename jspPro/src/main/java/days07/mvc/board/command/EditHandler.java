package days07.mvc.board.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import org.apache.tomcat.util.http.fileupload.RequestContext;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days07.mvc.board.domain.BoardDTO;
import days07.mvc.board.persistence.BoardDAO;
import days07.mvc.board.persistence.BoardDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String requestMethod = request.getMethod();
		System.out.println("❤️❤️ requestMethod");
		if (requestMethod.equals("GET")) {
			long seq = Long.parseLong(request.getParameter("seq"));      
	         Connection conn = ConnectionProvider.getConnection();
	         BoardDTO dto = null;
	         BoardDAO dao = new BoardDAOImpl(conn);      
	         try { 
	            dto = dao.view(seq);         
	         } catch (SQLException e) {         
	            System.out.println("> EditHandler.process Exception...");
	            e.printStackTrace();
	         } finally {
	            conn.close(); 
	         }       
	         request.setAttribute("dto", dto);         
	         return "/WEB-INF/views/days07/board/edit.jsp";   
		} else if (requestMethod.equals("POST")) {
			response.setContentType("text/html; charset=UTF-8");
			System.out.println("> EditHandler.process() POST..");
			long seq = Long.parseLong(request.getParameter("seq"));

			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int tag = Integer.parseInt(request.getParameter("tag"));

			BoardDTO bDto = BoardDTO.builder()
					.seq(seq)
					.pwd(pwd)
					.email(email)
					.title(title)
					.content(content)
					.tag(tag)
					.build();



			Connection conn = ConnectionProvider.getConnection();

			BoardDAO dao = new BoardDAOImpl(conn);
			int rowCount = 0;
			try {

				rowCount = dao.update(bDto);
				PrintWriter out = response.getWriter();
				if (rowCount == 1) {

					// [2]
					String location = "/cstvsboard/view.htm?seq="+seq;

					out.println("<script>");
					out.println("alert('"+ seq +"번 글 수정이 완료되었습니다.');");
					out.println("location.href='" + location + "';");
					out.println("</script>");

				} else {
					// 글쓰기 실패
					System.out.println(">2. EditHandler.process()  글 수정 실패");
					out.println("<script>");
					out.println("alert('"+ seq +"번 글 수정 실패.');");
					out.println("history.back()");
					out.println("</script>");
				}

			} catch (SQLException e) {
				System.out.println(">2. EditHandler.process() Exception");    
				e.printStackTrace();
			} finally {

				conn.close();
			} 		

			return null;
		}
		return null;
	}
}
