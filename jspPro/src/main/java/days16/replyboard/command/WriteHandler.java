package days16.replyboard.command;

import java.util.List;

import days16.replyboard.domain.ReplyBoardDTO;
import days16.replyboard.service.ReplyBoardService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WriteHandler implements CommandHandler {

	int currentPage = 1;    // 현재 페이지 번호
	int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
	int numberOfPageBlock = 10;  // [1] 2 3 4 5 6 7 8 9 10 >
	int totalRecords = 0;   // 총 레코드 수
	int totalPages = 0 ;    // 총 페이지 수
	
	@Override
	   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      String method = request.getMethod(); // GET, POST
	      if (method.equals("GET")) {
	         // 2. 포워딩. 
	         return "/WEB-INF/views/days16/replyboard/write.jsp";
	      } else { // POST

	         String writer = request.getParameter("writer");
	         String email = request.getParameter("email");
	         String subject = request.getParameter("subject");
	         String content = request.getParameter("content");
	         String pass = request.getParameter("pass");         

	         ReplyBoardDTO dto = new ReplyBoardDTO();
	            dto.setWriter(writer);
	            dto.setEmail(email);
	            dto.setSubject(subject);
	            dto.setContent(content);
	            dto.setPass(pass);  
	         // PC ip 주소
	         dto.setIp(   request.getRemoteAddr()  );
	         
	         // 새글 ,  답글
	         // 새글           write.do
	         // 답글일 경우    write.do?num=2&ref=2&step=1&depth=0 ( 부모글 정보)
	          String parentNum = request.getParameter("num");
	          if (parentNum == null) { // 새글
	             dto.setStep(1);  // 그룹순서   1
	            dto.setDepth(0); // 깊이      0
	         } else { // 답글
	        	 int parentRef = Integer.parseInt( request.getParameter("ref") );  // 부모 그룹
	             int parentStep = Integer.parseInt( request.getParameter("step") ); // 부모 그룹순서
	             int parentDepth = Integer.parseInt( request.getParameter("depth") ); // 부모 깊이
	             
	             dto.setRef(parentRef);
	             dto.setStep(parentStep + 1);
	             dto.setDepth(parentDepth + 1); 
	             
	         }// if
	          
	          ReplyBoardService replyBoardService = ReplyBoardService.getInstance();
	          int rowCount = replyBoardService.write(dto);
	          if (rowCount == 1) { 
	            String location = "list.do";
	            response.sendRedirect(location); 
	         }
	         
	      } // if
	      
	      return null;
	   }
}