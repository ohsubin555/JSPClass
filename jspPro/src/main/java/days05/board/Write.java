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
 
@WebServlet("/cstvsboard/write.htm")
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Write() {
        super();
      
    }
  
	//http://localhost/cstvsboard/list.htm?currentPage=1
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("> Write.doGet..");
			
		  // 1. 글쓰기 로직 처리
	       
	      // 2. list.jsp 포워딩
	      String path = "/days05/board/write.jsp";
	      RequestDispatcher dispatcher = request.getRequestDispatcher(path);
	      dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("> Write.doGet..");
		
		String writer = request.getParameter("writer");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int tag = Integer.parseInt(request.getParameter("tag"));
		
		BoardDTO bDto = BoardDTO.builder()
			    .writer(writer)
			    .pwd(pwd)
			    .email(email)
			    .title(title)
			    .content(content)
			    .tag(tag)
			    .build();
				
			
				
		Connection conn = DBConn.getConnection();
 
		BoardDAO dao = new BoardDAOImpl(conn);
	    int rowCount = 0;
		try {
			int newSeq = dao.getNextSeq();
	         bDto.setSeq(newSeq);
			
			rowCount = dao.insert(bDto);
			if (rowCount == 1) {
				//글쓰기 성공
				// 1. list.jsp 리다이렉트
				/*
				 * String location = "/cstvsboard/list.htm?msg=success";
				 * response.sendRedirect(location);
				 */
				
				// [2]
	            String location = "/cstvsboard/list.htm";
	            PrintWriter out = response.getWriter();

	            out.println("<script>");
	            out.println("alert('"+ newSeq+"번 글쓰기가 완료되었습니다.');");
	            out.println("location.href='" + location + "';");
	            out.println("</script>");
				
			} else {
                // 글쓰기 실패
               System.out.println(">2. Write.doPost()  글쓰기 실패");
			}
			
		} catch (SQLException e) {
			System.out.println(">2. Write.doPost() Exception");    
			e.printStackTrace();
		} finally {

			DBConn.close();
			} 
	}

}
