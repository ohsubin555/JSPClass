package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

import org.doit.domain.DeptVO;
import org.doit.domain.EmpVO;

import com.util.DBConn;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/scott/empsearch.htm")
public class ScottEmpSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ScottEmpSearch() {
		super(); 
	}
	
	private static String makePlaceholders(int count) {
	    return String.join(",", Collections.nCopies(count, "?"));
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// http://localhost/scott/empsearch.htm
		//?
		// deptno=10&deptno=30
		// &job=MANAGER
		// &hstart=2026-08-05T16%3A21&hend=2026-08-20T16%3A21
		String[] deptnoArr = request.getParameterValues("deptno");
		String[] jobArr = request.getParameterValues("job");
		
		System.out.println("> ScottEmpSearch.doGet()... ");	
		// 1. 부서
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet  rs   = null; 
		ArrayList<DeptVO> dlist = null;
		DeptVO dvo = null;
		Iterator<DeptVO> dir = null;

		conn = DBConn.getConnection();

		String sql = """
				  SELECT *
				  FROM dept
				  ORDER BY deptno ASC
				""";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			int deptno;
			String dname, loc;

			if ( rs.next()  ) {   
				dlist = new ArrayList<DeptVO>();
				do {
					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");
					loc = rs.getString("loc");

					dvo = DeptVO.builder()
							.deptno(deptno)
							.dname(dname)
							.loc(loc)
							.build();

					dlist.add(dvo);
				} while (rs.next() );
			} // if

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close(); 
				//DBConn.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		
		// 2. 잡		 
		ArrayList<String> jlist = null;		
		Iterator<String> jir = null;
		String job = null;

		sql = """
				  SELECT DISTINCT job
				  FROM emp
				  ORDER BY job ASC
				""";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 

			if ( rs.next()  ) {   
				jlist = new ArrayList<>();
				do { 
					job = rs.getString("job");  
					jlist.add(job);
				} while (rs.next() );
			} // if

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close(); 
				//DBConn.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		
		// 3. 부서+잡 해당되는 사원
		ArrayList<EmpVO> elist = null;
		EmpVO evo = null;
		Iterator<EmpVO> eir = null;
		
		/* StringBuilder 클래스를 사용해서 문자열을 연결시켜야 된다 */
		sql = """
		      SELECT empno, ename, job, mgr
		        , TO_CHAR( hiredate, 'yyyy-MM-dd') hiredate, sal, comm, deptno
		      FROM emp
		      WHERE 1 = 1 
		      """;
		// deptno, job, hiredate
		if (deptnoArr != null && deptnoArr.length > 0) {
			sql += " AND deptno IN ( " + makePlaceholders(deptnoArr.length) + " ) ";
		}
		if (jobArr != null && jobArr.length > 0) {
			sql += " AND job IN ( " + makePlaceholders(jobArr.length) + " ) ";
		}
		// 
		sql += """
		       ORDER BY deptno ASC
		       """;
		
		System.out.println( "🤩🤩🤩" + sql  );
		
		try {
			pstmt = conn.prepareStatement(sql);
			int index = 1;
			if (deptnoArr != null && deptnoArr.length > 0) {
				for( String deptno : deptnoArr ) {
					pstmt.setInt(index++, Integer.parseInt(deptno));
				}
			}
			if (jobArr != null && jobArr.length > 0) {
				for( String j : jobArr ) {
					pstmt.setString(index++, j);
				}
			}
			rs = pstmt.executeQuery();
			
			// Alt + Shift + A
			int empno;
			String ename;
			//String job;
			int mgr;
			LocalDateTime hiredate;  
			double sal;
			double comm;
			int deptno;
			
			if ( rs.next()  ) {  // 첫 번째 레코드는 존재한다.
				elist = new ArrayList<EmpVO>();
				do {
					empno = rs.getInt("empno");
					ename = rs.getString("ename");
					job = rs.getString("job");
					mgr = rs.getInt("mgr"); 
					hiredate = rs.getDate("hiredate").toLocalDate().atStartOfDay();	 
					sal = rs.getDouble("sal");
					comm = rs.getDouble("comm");
					deptno = rs.getInt("deptno");
					 
					evo = EmpVO.builder()
							   .empno(empno)
							   .ename(ename)
							   .job(job)
							   .mgr(mgr)
							   .hiredate(hiredate)
							   .sal(sal)
							   .comm(comm)
							   .deptno(deptno)
							   .build(); 
					elist.add(evo);
				} while (rs.next() );
			} // if 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close(); 
				DBConn.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}   

		// 
		request.setAttribute("dlist", dlist);
		request.setAttribute("jlist", jlist);
		request.setAttribute("elist", elist);		
		
		// 2. 포워딩
		String path = "/days04/ex07_empsearch.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
