<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.time.LocalDateTime"%>
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
<%
   // http://localhost/days02/ex02_02.jsp?[deptno=10]&deptno=20&deptno=30 
String pDeptno = request.getParameter("deptno");
int dno = (pDeptno == null || pDeptno.trim().isEmpty())
? 10
: Integer.parseInt(pDeptno);

Connection conn = null;
PreparedStatement pstmt = null; // SQL 실행하는 객체
ResultSet  rs   = null; // 실행 결과를 저장하는 객체
ArrayList<DeptVO> dlist = null;
DeptVO dvo = null;
Iterator<DeptVO> dir = null;

// 1 + 2
conn = DBConn.getConnection();

String dsql = """
            SELECT *
            FROM dept
            ORDER BY deptno ASC
           """;
try {
   pstmt = conn.prepareStatement(dsql);
   rs = pstmt.executeQuery();		   
   
   int deptno;
   String dname, loc;
   
   if ( rs.next()  ) {  // 첫 번째 레코드는 존재한다.
      dlist = new ArrayList<DeptVO>();
      do {
         deptno = rs.getInt("deptno");
         dname = rs.getString("dname");
         loc = rs.getString("loc");
//         vo = new DeptVO(deptno, dname, loc);
         dvo = DeptVO.builder()
                  .deptno(deptno)
                  .dname(dname)
                  .loc(loc)
                  .build();
         
//         System.out.println( vo );
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
// http://localhost/days01/ex05_02.jsp?deptno=20
    // JSP 기본 내장 객체 9개 : out, request
    int deptno;

   ArrayList<EmpVO> elist = null;
   EmpVO evo = null;
   Iterator<EmpVO> eir = null;
   
   
   String sql = """
               SELECT empno, ename, job, mgr
                 , TO_CHAR( hiredate, 'yyyy-MM-dd') hiredate, sal, comm, deptno
               FROM emp
               WHERE deptno = ?
               ORDER BY deptno ASC
              """;
   
   
 //  out.print(sql);
   
   try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, pDeptno);
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

		if (rs.next()) { // 첫 번째 레코드는 존재한다.
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

		evo = EmpVO.builder().empno(empno).ename(ename).job(job).mgr(mgr).hiredate(hiredate).sal(sal).comm(comm)
				.deptno(deptno).build();
		elist.add(evo);
	} while (rs.next());
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
<title>2026. 8. 5. 오후 4:07:54</title>
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
     <%
       dir = dlist.iterator();
       while(dir.hasNext()){
    	   dvo= dir.next();
    	   int deptnos = dvo.getDeptno();
    	   String dname = dvo.getDname();	   
    	   %>
    	   <option value="<%= dno%>" ><%= dname %></option>
    	   <%
       }//while
    	   %>

   </select>
    <input type="button" value="사원확인"/>
    
     <h3>emp list</h3>
  
  <table>
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
        </td>
      </tr>
    </tfoot>
  </table>
  
</div>
<script>
$(":button[value='사원확인']").on("click", function () {
	 //alert("확인");
  location.href=`ex04.jsp?deptno=\${$("#deptno").val()}`;
});
</script>
</body>
</html>