package days07.mvc.board.command;

import java.io.IOException;
import java.security.Provider;
import java.sql.Connection;
import java.sql.SQLException;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days07.mvc.board.domain.BoardDTO;
import days07.mvc.board.domain.PageDTO;
import days07.mvc.board.persistence.BoardDAO;
import days07.mvc.board.persistence.BoardDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewHandler implements CommandHandler {



	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1. 로직처리
		System.out.println("> ViewHandler.process()... ");

	

			long seq = Long.parseLong(request.getParameter("seq"));

			Connection conn = ConnectionProvider.getConnection();

			BoardDTO dto = null;
			BoardDAO dao = new BoardDAOImpl(conn);

			int rowCount = 0;

			try {
				//conn.setAutoCommit(false);
				//[1] seq = 155 조회수 1증가
				//[2] seq = 155 게시글 정보
				rowCount = dao.increaseReaded(seq);
				dto = dao.view(seq);
			} catch (SQLException e) {
				try {
					conn.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
					
				}
				System.out.println(">3. ViewHandler.preocess() Exception");    
				e.printStackTrace();
			} finally {
				try {
					conn.setAutoCommit(true);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				conn.close();
			} 

			request.setAttribute("dto", dto);


			//3.포워딩
			return "/WEB-INF/views/days07/board/view.jsp";
		}

	}
