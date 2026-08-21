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
<!DOCTYPE html>
<%

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
ArrayList <EmpVO> list = null;
EmpVO eo = null;

conn = DBConn.getConnection();

String sql = """
		    SELECT *
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

	}

	do {
		empno = rs.getInt("empno");
		ename = rs.getString("ename");
		job = rs.getString("job");
		mgr = rs.getInt("mgr");
		hiredate =	rs.getDate("hiredate").toLocalDate().atStartOfDay(); 
		//String hiredate = rs.getString("hiredate")
		// Date hiredate = rs.getDate("hiredate")	
		//LocalDate -> LocalDateTime 변환
//		hd.atStartOfDay();
//		hd.atTime(0,0,0);
		
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

<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 4. 오후 3:51:50</title>
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
<select name="deptno" id="deptno">
  <option>부서 선택...</option>
<table border="1">
    <tr>
        <th>사번</th>
        <th>이름</th>
        <th>직무</th>
        <th>관리자</th>
        <th>입사일</th>
        <th>급여</th>
        <th>커미션</th>
        <th>부서번호</th>
    </tr>


</table>
  </select>
</div>
<script>
</script>
</body>    
</html>