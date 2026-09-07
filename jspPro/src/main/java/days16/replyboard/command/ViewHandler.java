package days16.replyboard.command;

import java.util.List;

import days16.replyboard.domain.ReplyBoardDTO;
import days16.replyboard.service.ReplyBoardService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewHandler implements CommandHandler {

	int currentPage = 1;    // 현재 페이지 번호
	int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
	int numberOfPageBlock = 10;  // [1] 2 3 4 5 6 7 8 9 10 >
	int totalRecords = 0;   // 총 레코드 수
	int totalPages = 0 ;    // 총 페이지 수
	
	@Override
	   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      // view.do?num=2&cp/sc/sw
	      int num = Integer.parseInt( request.getParameter("num") );
	      ReplyBoardService replyBoardService = ReplyBoardService.getInstance();
	      ReplyBoardDTO dto = replyBoardService.selectOne(num);
	      request.setAttribute("dto", dto);
	      return "/WEB-INF/views/days16/replyboard/view.jsp";      
	   }
}