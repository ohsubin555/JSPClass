package days05.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import com.util.DBConn;

import days05.board.domain.BoardDTO;
import days05.board.domain.PageDTO;
import days05.board.persistence.BoardDAO;
import days05.board.persistence.BoardDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cstvsboard/view.htm")
public class View extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public View() {
		super();

	}

	//http://localhost/cstvsboard/list.htm?currentPage=1
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("> View.doGet..");
		
		long seq = Long.parseLong(request.getParameter("seq"));
		
		Connection conn = DBConn.getConnection();
		
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
			System.out.println(">3. View.doget() Exception");    
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            DBConn.close();
			} 
		
		request.setAttribute("dto", dto);
		
		String path = "/days05/board/view.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
