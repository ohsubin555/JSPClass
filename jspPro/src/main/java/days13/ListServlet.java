package days13;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/days13/list.ss")
public class ListServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public ListServlet() {
      super(); 
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Connection conn = null;
      try {
         conn = ConnectionProvider.getConnection();
         FileTestDAO dao = FileTestDAO.getInstance(); // 싱글톤
         ArrayList<FileTestDTO>  list =  dao.selectFileList(conn);
         request.setAttribute("list", list);
         
         String path = "/days13/ex02_list.jsp";
         RequestDispatcher dispatcher = request.getRequestDispatcher(path);
         dispatcher.forward(request, response);
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         JdbcUtil.close(conn); 
      } // try
      
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
   } 

}
