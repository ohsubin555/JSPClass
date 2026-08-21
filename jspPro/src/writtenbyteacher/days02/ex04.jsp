<%@page import="java.util.function.Consumer"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
    // ? 
    // ?deptno     		
	String  pDeptno = request.getParameter("deptno");  
    int deptno = (pDeptno == null || pDeptno.trim().isEmpty()) ? 10	: Integer.parseInt(pDeptno);
%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null; 
	ResultSet  rs   = null; 
	ArrayList<DeptVO> dlist = null;
	DeptVO dvo = null;
	Iterator<DeptVO> dir = null;
		
	conn = DBConn.getConnection();
 
	String dsql = """
			      SELECT *
			      FROM dept
			      ORDER BY deptno ASC
		     """;
       
	try {
		pstmt = conn.prepareStatement(dsql);
		rs = pstmt.executeQuery();
		
		String dname, loc;
		
		if ( rs.next()  ) {   
			dlist = new ArrayList<DeptVO>();
			do {
				int dno = rs.getInt("deptno");
				dname = rs.getString("dname");
				loc = rs.getString("loc");
				
				dvo = DeptVO.builder()
						   .deptno(dno)
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
		} catch (SQLException e) { 
			e.printStackTrace();
		}
	}
%>
<%
	ArrayList<EmpVO> elist = null;
	EmpVO evo = null;
	Iterator<EmpVO> eir = null;
		
	String esql = """
			      SELECT empno, ename, job, mgr
			        , TO_CHAR( hiredate, 'yyyy-MM-dd') hiredate, sal, comm, deptno
			      FROM emp
			      WHERE deptno =  ? 
			      ORDER BY deptno ASC
			     """;
	
	// out.print(esql);
	
	try {
		pstmt = conn.prepareStatement(esql);
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
		// int deptno;
		
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 5. 오후 4:06:20</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kEnik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
   
  </xmp>
  
  <select id="deptno" name="deptno">
    <%
      dir = dlist.iterator();
      while( dir.hasNext() ){
    	  dvo = dir.next();
    	  int dno = dvo.getDeptno();
    	  String dname = dvo.getDname();
    %>
    <%-- <option value="<%= dno %>" <%= dno == deptno ? "selected": "" %>><%= dname %></option> --%>
    <option value="<%= dno %>"><%= dname %></option>
    <%	  
      } // while
    %>
  </select>
  
  <h3>emp list</h3>
  
  <table>
    <thead>
      <tr>     
	      <th><input type="checkbox" id="ckbAll" name="ckbAll"></th>
	      <th>empno</th>
	      <th>ename</th>
	      <th>job</th>
	      <th>mgr</th>
	      <th>hiredate</th>
	      <th>sal</th>
	      <th>comm</th>
	      <th>deptno</th>
	  </tr> 
    </thead>
    <tbody>
    <%
       if( elist == null){
    %>
        <tr>
          <td colspan="8">사원이 존재하지 않습니다.</td>
        </tr>
    <%	   
       }else{
    	  eir = elist.iterator();
    	  while( eir.hasNext() ){
    		 evo = eir.next();
    %>
         <tr>
           <td><input type="checkbox" id="ckb-<%= evo.getEmpno() %>" data-empno="<%= evo.getEmpno() %>"></td>
           <td><%= evo.getEmpno() %></td>
           <td><%= evo.getEname() %></td>
           <td><%= evo.getJob() %></td>
           <td><%= evo.getMgr() %></td>
           <td><%= evo.getHiredate() %></td>
           <td><%= evo.getSal() %></td>
           <td><%= evo.getComm() %></td>
           <td><%= evo.getDeptno() %></td>
         </tr>
    <%		 
    	  } // while
       } // if
    %>   
    </tbody>
    <tfoot>
      <tr>
        <td colspan="8">
          <span class="badge left red"><%= elist == null ? 0 : elist.size() %>명</span>
          <a href="javascript:history.back()">뒤로 가기</a>
          <br>
          <button>체크한 empno 전송</button>     
          <!-- ex04_ok.jsp li  empno 출력 -->     
        </td>
      </tr>
    </tfoot>
  </table>
  
</div>

<script>
  $("#deptno").on("change", function (){
	  let deptno = $(this).val(); // 
	  location.href = `ex04.jsp?deptno=\${deptno}`;
  });
</script>
<script>
   // ex04.jsp?deptno=30
  $("#deptno").val(${ param.deptno });
</script>

</body>
</html>










