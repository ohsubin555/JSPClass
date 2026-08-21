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

public class DeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String requestMethod = request.getMethod();
		System.out.println("❤️❤️ requestMethod");
		if (requestMethod.equals("GET")) {
			return "/WEB-INF/views/days07/board/delete.jsp";
		} else if (requestMethod.equals("POST")) {
			response.setContentType("text/html; charset=UTF-8");
			System.out.println("> DeleteHandler.process() POST..");

			long seq = Integer.parseInt(request.getParameter("seq"));
			String pwd = request.getParameter("pwd");

			Connection conn = ConnectionProvider.getConnection();

			BoardDAO dao = new BoardDAOImpl(conn);
			int rowCount = 0;
			try {

				rowCount = dao.delete(seq, pwd);
				PrintWriter out = response.getWriter();
				if (rowCount == 1) {
					//글 삭제 성공

					String location = "redirect:" + request.getContextPath() + "/mvc/board/list.htm?del=" + seq;
					return location;
                   /*
					out.println("<script>");
					out.println("alert('"+ seq +"번 글 삭제가 완료되었습니다.');");
					out.println("location.href='" + location + "';");
					out.println("</script>");
                   */
				} else {
					// 글삭제 실패
					System.out.println(">2. Delete.process()  글 삭제 실패");
					//return "redirect:/mvc/board/delete.htm?seq="+ seq + "&del=fail";
					return "redirect:/mvc/board/view.htm?seq="+ seq + "&del=fail";
					/*
					out.println("<script>");
					out.println("alert('"+ seq +"번 글 삭제 실패.');");
					out.println("history.back()");
					out.println("</script>");
					*/				
				}

			} catch (SQLException e) {
				System.out.println(">5. DeleteHandler.process() Exception");    
				e.printStackTrace();
			} finally {

				conn.close();
			} 		

		}//if
		//글쓰기 실패 또는 GET, POST 이외의 요청

		return null;
	}
}

