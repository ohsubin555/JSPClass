<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.function.Consumer"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
ArrayList <EmpVO> list = null;
EmpVO eo = null;
Iterator<EmpVO> ir = null;

conn = DBConn.getConnection();

String sql = """
		    SELECT empno, ename, job, mgr, TO_CHAR(hiredate, 'yyyy-MM-dd') hiredate, sal, comm, deptno
		    FROM emp
		    ORDER BY empno ASC
		    """;

try {
	 pstmt = conn.prepareStatement(sql);
	 rs = pstmt.executeQuery();	

	 int empno;
	 String ename;
	 String job;
	 int mgr;
	 LocalDateTime hiredate; //String , Date
	 double sal;
	 double comm;
	 int deptno;
	 
	 if (rs.next()) {// 첫번째 레코드는 존재한다. 
	 	list = new ArrayList<EmpVO>();
		do {
			empno = rs.getInt("empno");
			ename = rs.getString("ename");
			job = rs.getString("job");
			mgr = rs.getInt("mgr");
			hiredate =	rs.getDate("hiredate").toLocalDate().atStartOfDay(); 
			sal = rs.getDouble("sal");
			comm = rs.getDouble("comm");
			deptno = rs.getInt("deptno");
					
			eo = EmpVO.builder()
					.empno(empno)
					.ename(ename)
					.job(job)
					.mgr(mgr)
					.hiredate(hiredate)
					.sal(sal)
					.comm(comm)
					.deptno(deptno)
					.build();
			//		            System.out.println( eo );
			list.add(eo);
		} while (rs.next());
	
	 }//if



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

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 4. 오후 4:30:12</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">Subin YaHo</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
   
  </xmp>
 <h3>emp list</h3>

<table border="1">
    <thead>
        <tr>
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
if (list == null) {
%>
        <tr>
            <td colspan="8">사원 정보가 없습니다.</td>
        </tr>
<%
} else {
    ir = list.iterator();
    while (ir.hasNext()) {
        eo = ir.next();
%>
        <tr>
            <td><%=eo.getEmpno()%></td>
            <td><%=eo.getEname()%></td>
            <td><%=eo.getJob()%></td>
            <td><%=eo.getMgr()%></td>
            <td><%=eo.getHiredate()%></td>
            <td><%=eo.getSal()%></td>
            <td><%=eo.getComm()%></td>
            <td><%=eo.getDeptno()%></td>
        </tr>
<%
    }
}
%>
    </tbody>
    <tfoot>
     <tr>
     <td colspan="8">
       <span class="badge left red"><%= list==null ? 0 : list.size()%>명</span>
     </td>
     </tr>
    </tfoot>
</table>
</div>
<script>
</script>
</body>
</html>