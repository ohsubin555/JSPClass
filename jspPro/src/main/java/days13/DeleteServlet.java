package days13;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collection;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/days13/delete.ss")
public class DeleteServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public DeleteServlet() {
      super(); 
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Connection conn = null;
      try {
         conn = ConnectionProvider.getConnection();
         FileTestDAO dao = FileTestDAO.getInstance(); // 싱글톤
         
         int num = Integer.parseInt(request.getParameter("num") );
         String filesystemname = request.getParameter("filesystemname");  // ""   
         // 1. DB 테이블 삭제
         int rowCount = dao.delete(conn, num);   
         
         // 2. 배포 폴더에 파일 삭제
         String saveDirectory = request.getServletContext().getRealPath("/days13/upload");
         String pathname = String.format("%s\\%s", saveDirectory, filesystemname);
         
         File deleteFile = new File(pathname);   
         if ( deleteFile.exists() ) {
            deleteFile.delete();
         }
         
         response.sendRedirect("/days13/list.ss");
         
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         JdbcUtil.close(conn); 
      } // try
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
   } 

}
