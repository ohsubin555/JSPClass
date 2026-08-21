package days05.board;

import java.io.IOException;
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

/**
 * Servlet implementation class List
 */
@WebServlet("/cstvsboard/list.htm")
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public List() {
		super();

	}

	int currentPage = 1;    // 현재 페이지 번호
	int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
	int numberOfPageBlock = 10;  // [1] 2 3 4 5 6 7 8 9 10 >
	int totalRecords = 0;   // 총 레코드 수
	int totalPages = 0 ;    // 총 페이지 수
	

	//http://localhost/cstvsboard/list.htm?currentPage=1
	//http://localhost/cstvsboard/list.htm?currentPage=1&searchCondition=&searchKeyword=검색어
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("> List.doGet..");

		String pCurrentPage = request.getParameter("currentPage");
		//if (pCurrentPage == null || pCurrentPage.equals("") ) 
		//if (pCurrentPage == null || pCurrentPage.isEmpty() )
		if (pCurrentPage == null || pCurrentPage.isBlank() ) {
			pCurrentPage = "1";
		}
		currentPage = Integer.parseInt(pCurrentPage);

		//한페이지에 출력할 게시글 수 
		try {
			this.numberPerPage = Integer.parseInt(request.getParameter("numberPerPage"));
		} catch (Exception e) {
			this.numberPerPage = 10;
		}

		//3+4 검색조건과 검색어

		String searchCondition = request.getParameter("searchCondition");


		if (searchCondition == null || searchCondition.isBlank() ) {
			searchCondition = "t";
		}
		String searchKeyword = request.getParameter("searchKeyword");


		//1. 게시글 목록 로직 처리
		Connection conn = DBConn.getConnection();
		java.util.List<BoardDTO> list = null;
		PageDTO pDto = null;
		BoardDAO dao = new BoardDAOImpl(conn);

		try {
			//[1] 페이징처리 x
			//list = dao.select()

			//[2] 페이징 처리 o
			//list = dao.select(currentPage, numberPerPage);
			//4. 페이징 처리, 검색처리

			//[3] 페이징 블럭

			if (searchKeyword == null || searchKeyword.isBlank()) {
				pDto = new PageDTO(currentPage, numberPerPage, numberOfPageBlock);
				list = dao.select(currentPage,numberPerPage);
			}else {
				pDto =new PageDTO(currentPage, numberPerPage, numberOfPageBlock, searchCondition,searchKeyword);
				list = dao.search(searchCondition, searchKeyword, currentPage, numberPerPage);

			}
			
		

		} catch (SQLException e) {
			System.out.println(">1. List.doget()");    
			e.printStackTrace();
		} finally {

			DBConn.close();
		} 
		//System.out.println("😘💕😍❤️👍🤣😊"+list.size());
		request.setAttribute("list", list);
		request.setAttribute("pDto", pDto);
		
		System.out.println("👌👌👌총페이지 수 "+pDto.getEndPage());

		//2. list.jsp 포워딩

		String path = "/days05/board/list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
