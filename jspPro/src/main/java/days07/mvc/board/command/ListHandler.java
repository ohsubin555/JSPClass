package days07.mvc.board.command;

import java.sql.Connection;
import java.sql.SQLException;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days07.mvc.board.domain.BoardDTO;
import days07.mvc.board.domain.PageDTO;
import days07.mvc.board.persistence.BoardDAO;
import days07.mvc.board.persistence.BoardDAOImpl;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ListHandler implements CommandHandler {

	int currentPage = 1;    // 현재 페이지 번호
	int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
	int numberOfPageBlock = 10;  // [1] 2 3 4 5 6 7 8 9 10 >
	int totalRecords = 0;   // 총 레코드 수
	int totalPages = 0 ;    // 총 페이지 수
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1. 로직처리
		System.out.println("> ListHandler.process()... ");
		


		String pCurrentPage = request.getParameter("currentPage");
		
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
		
		Connection conn = ConnectionProvider.getConnection();
		java.util.List<BoardDTO> list = null;
		PageDTO pDto = null;
		BoardDAO dao = new BoardDAOImpl(conn);

		try {

			if (searchKeyword == null || searchKeyword.isBlank()) {
				pDto = new PageDTO(currentPage, numberPerPage, numberOfPageBlock);
				list =	dao.select(currentPage, numberPerPage);
				
			}else {
				pDto =new PageDTO(currentPage, numberPerPage, numberOfPageBlock, searchCondition,searchKeyword);
				list = dao.search(searchCondition, searchKeyword, currentPage, numberPerPage);

			}
			
		

		} catch (SQLException e) {
			System.out.println(">1. List.doGet() ");    
			e.printStackTrace();
		} finally {

			conn.close(); //커넥션 풀에 커넥션 객체 반환. 
		} 
		
		//2. request, session  저장. 
		request.setAttribute("list", list);
		request.setAttribute("pDto", pDto);
		

		//3.포워딩
		return "/WEB-INF/views/days07/board/list.jsp";
	}

}
