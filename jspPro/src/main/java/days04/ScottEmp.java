package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import org.doit.domain.EmpVO;

import com.util.DBConn;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ScottEmp
 */
@WebServlet("/scott/emp")
public class ScottEmp extends HttpServlet {
   private static final long serialVersionUID = 1L;


   public ScottEmp() {
      super();
      // TODO Auto-generated constructor stub
   }


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("> ScottEmp.doGet()....");

      String strDeptno = request.getParameter("deptno");
      int deptno = Integer.parseInt(strDeptno);

      Connection conn = null;
      PreparedStatement  pstmt = null; 
      ResultSet  rs   = null; 
      ArrayList<EmpVO> list = null;
      EmpVO vo = null;

      conn = DBConn.getConnection();

      String sql = """
            SELECT empno,ename,job,mgr,TO_CHAR(hiredate, 'yyyy-MM-dd') hiredate,sal,comm,deptno 
            FROM emp
            WHERE deptno = ? ORDER BY empno""";

      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, deptno);

         rs = pstmt.executeQuery();   

         // Alt + Shift + A
         int empno;
         String ename;
         String job;
         int mgr;
         LocalDateTime hiredate;  
         double sal;
         double comm;

         if ( rs.next()  ) {  // 첫 번째 레코드는 존재한다.
            list = new ArrayList<EmpVO>();
            do {
               empno = rs.getInt("empno");
               ename = rs.getString("ename");
               job = rs.getString("job");
               mgr = rs.getInt("mgr");
               hiredate = rs.getDate("hiredate").toLocalDate().atStartOfDay();   
               sal = rs.getDouble("sal");
               comm = rs.getDouble("comm");
               deptno = rs.getInt("deptno");

               vo = EmpVO.builder()
                     .empno(empno)
                     .ename(ename)
                     .job(job)
                     .mgr(mgr)
                     .hiredate(hiredate)
                     .sal(sal)
                     .comm(comm)
                     .deptno(deptno)
                     .build();
               list.add(vo);
            } while (rs.next() );
         } // if

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            rs.close();
            pstmt.close();
            // 4
            DBConn.close();
         } catch (SQLException e) { 
            e.printStackTrace();
         }
      } 

      
      String path = "/days04/ex05_emp.jsp";
      request.setAttribute("list", list);
      RequestDispatcher dispatcher = request.getRequestDispatcher(path);
      dispatcher.forward(request, response);
   }


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}
