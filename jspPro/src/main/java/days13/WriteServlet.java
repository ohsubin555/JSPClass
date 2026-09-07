package days13;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.Collection;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

//@WebServlet("/days13/write.ss")
public class WriteServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public WriteServlet() {
      super(); 
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String path = "/days13/ex02_write.jsp";
      RequestDispatcher dispatcher = request.getRequestDispatcher(path);
      dispatcher.forward(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html; charset=UTF-8");      
      String contentType = request.getContentType();
      
      if (contentType != null 
            && contentType.toLowerCase().startsWith("multipart/")) {         
         savePartInfo(request, response);
      } else {
         // out.print("> multipart 아니다. ");
      } //
   }

   private void savePartInfo(HttpServletRequest request, HttpServletResponse response)
           throws IOException, ServletException {

       String subject = request.getParameter("subject");

       String filesystemname = null;
       String originalfilename = null;
       long filelength = 0;

       Connection conn = null;

       try {

           conn = ConnectionProvider.getConnection();
           FileTestDAO dao = FileTestDAO.getInstance();
           
           Collection<Part> parts = request.getParts();

           // 저장 디렉터리
           String saveDir = request.getServletContext().getRealPath("/days13/upload");
           System.out.println("🤩 " + saveDir);
           
           File uploadDir = new File(saveDir);
           if (!uploadDir.exists()) {         uploadDir.mkdirs();       }

           // Part 검사
           for (Part part : parts) {              
               // 파일 Part인지 확인
               String submittedFileName = part.getSubmittedFileName();

               if (submittedFileName != null   && !submittedFileName.isEmpty()) {

                   filelength = part.getSize();
                   // 원본 파일명
                   originalfilename = submittedFileName;

                   //if (part.getSize() > 0) {
                       // 중복되지 않는 저장 파일명 생성
                       filesystemname = getUniqueFileName(uploadDir, originalfilename);

                       System.out.println("원본파일명 : " + originalfilename);
                       System.out.println("저장파일명 : " + filesystemname);

                       // ★ 실제 저장할 때 filesystemname 사용
                       part.write(    saveDir + File.separator + filesystemname  );

                       part.delete();
                   //}

                   // 파일 Part를 찾았으면 반복 종료
                   break;
               }
           }

           // DB 저장
           FileTestDTO dto = FileTestDTO.builder()
                 .subject(subject)
                   .filelength(filelength)
                   .originalfilename(originalfilename)
                   .filesystemname(filesystemname)
                   .build();

           int rowCount = dao.insert(conn, dto);

           System.out.println("insert rowCount : " + rowCount);

           // ★ 반복문 밖에서 한 번만 redirect
           response.sendRedirect("/days13/list.ss");

       } catch (Exception e) {

           e.printStackTrace();

       } finally {

           JdbcUtil.close(conn);
       }
   }
   
   // a.txt
   // a-1.txt
   // a-2.txt
   // a-3.txt
   private String getUniqueFileName(File uploadDir, String fileName) {

      File file = new File(uploadDir, fileName); 
      if (!file.exists()) {
         return fileName;
      } 
      int dotIndex = fileName.lastIndexOf(".");

      String baseName;
      String extension;

      if (dotIndex > 0) { 
         baseName = fileName.substring(0, dotIndex); 
         extension = fileName.substring(dotIndex);
      } else { 
         baseName = fileName;
         extension = "";
      }
      int count = 1;
      while (true) {
         String newFileName = baseName + "-" + count + extension;
         file = new File(uploadDir, newFileName); 
         if (!file.exists()) {
            return newFileName;
         }
         count++;
      }
   }

}
