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
 
@WebServlet("/cstvsboard/edit.htm")
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Edit() {
        super();
      
    }
  
	//http://localhost/cstvsboard/list.htm?currentPage=1
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("> Edit.doGet..");
			
		  // 1. 수정 로직 처리
	      //http://localhost/cstvsboard/edit.htm?seq=149
		
        long seq = Long.parseLong(request.getParameter("seq"));
		
		Connection conn = DBConn.getConnection();
		
		BoardDTO dto = null;
		BoardDAO dao = new BoardDAOImpl(conn);
	    
		int rowCount = 0;
		
		try {
         	dto = dao.view(seq);
		} catch (SQLException e) {
			
			System.out.println(">3. Edit.doget() Exception");    
			e.printStackTrace();
		} finally {
			
            DBConn.close();
			} 
		
     	request.setAttribute("dto", dto);
		
	      // 2. list.jsp 포워딩
	      String path = "/days05/board/edit.jsp";
	      RequestDispatcher dispatcher = request.getRequestDispatcher(path);
	      dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("> Edit.doPost..");
		
		long seq = Integer.parseInt(request.getParameter("seq"));
		
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
				
			
				
		Connection conn = DBConn.getConnection();
 
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
               System.out.println(">2. Edit.doPost()  글 수정 실패");
                out.println("<script>");
	            out.println("alert('"+ seq +"번 글 수정 실패.');");
	            out.println("history.back()");
	            out.println("</script>");
			}
			
		} catch (SQLException e) {
			System.out.println(">2. Edit.doPost() Exception");    
			e.printStackTrace();
		} finally {

			DBConn.close();
			} 		
	}

}
