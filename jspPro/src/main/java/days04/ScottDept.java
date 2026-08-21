package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.doit.domain.DeptVO;

import com.util.DBConn;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ScottDept
 */
@WebServlet("/scott/dept")
public class ScottDept extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public ScottDept() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println(">scott..doget");

		Connection conn = null;
		PreparedStatement pstmt = null; // SQL 실행하는 객체
		ResultSet  rs   = null; // 실행 결과를 저장하는 객체
		ArrayList<DeptVO> list = null;
		DeptVO vo = null;
		Iterator<DeptVO> ir = null;

		// 1 + 2
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

			if ( rs.next()  ) {  // 첫 번째 레코드는 존재한다.
				list = new ArrayList<DeptVO>();
				do {
					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");
					loc = rs.getString("loc");
					//         vo = new DeptVO(deptno, dname, loc);
					vo = DeptVO.builder()
							.deptno(deptno)
							.dname(dname)
							.loc(loc)
							.build();

					//         System.out.println( vo );
					list.add(vo);
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
	//	System.out.println("😘💕😍❤️👍🤣😊"+list.size());
		request.setAttribute("list", list);

		String path = "/days04/ex05_dept.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
