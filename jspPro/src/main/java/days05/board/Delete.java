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


@WebServlet("/cstvsboard/delete.htm")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Delete() {
        super();
      
    }
    
    int currentPage = 1;    // 현재 페이지 번호
    int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
    int numberOfPageBlock = 10;  // [1] 2 3 4 5 6 7 8 9 10 >
    int totalRecords = 0;   // 총 레코드 수
    int totalPages = 0 ;    // 총 페이지 수

	//http://localhost/cstvsboard/list.htm?currentPage=1
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("> Delete.doGet..");
		
		
		
		String path = "/days05/board/delete.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("> Delete.doGet..");
		
        long seq = Integer.parseInt(request.getParameter("seq"));
        String pwd = request.getParameter("pwd");
        
        Connection conn = DBConn.getConnection();
        
		BoardDAO dao = new BoardDAOImpl(conn);
	    int rowCount = 0;
		try {
			
			rowCount = dao.delete(seq, pwd);
			 PrintWriter out = response.getWriter();
			if (rowCount == 1) {
				//글 삭제 성공

	            String location = "/cstvsboard/list.htm";

	            out.println("<script>");
	            out.println("alert('"+ seq +"번 글 삭제가 완료되었습니다.');");
	            out.println("location.href='" + location + "';");
	            out.println("</script>");
				
			} else {
                // 글삭제 실패
               System.out.println(">2. Delete.doPost()  글 삭제 실패");
                out.println("<script>");
	            out.println("alert('"+ seq +"번 글 삭제 실패.');");
	            out.println("history.back()");
	            out.println("</script>");
			}
			
		} catch (SQLException e) {
			System.out.println(">5. Delete.doPost() Exception");    
			e.printStackTrace();
		} finally {

			DBConn.close();
			} 		
	}

}
