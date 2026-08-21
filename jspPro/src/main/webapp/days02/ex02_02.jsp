<%@page import="java.sql.SQLException"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   // http://localhost/days02/ex02_02.jsp?[deptno=10]&deptno=20&deptno=30 
   String[] deptnoArr = request.getParameterValues("deptno");

    String deptnos = "";

   if (deptnoArr != null) {
       for (String deptno : deptnoArr) {
           // out.println(deptno + "<br>");
           deptnos += deptno +", ";
       }
   } 
   // "10, 20, 30, "
   // "10, 20, 30"
   deptnos = deptnos.substring(0, deptnos.lastIndexOf(","));
%>
<%
    // http://localhost/days01/ex05_02.jsp?deptno=20
    // JSP 기본 내장 객체 9개 : out, request
    int deptno ;

   Connection conn = null;
   PreparedStatement pstmt = null; 
   ResultSet  rs   = null; 
   ArrayList<EmpVO> list = null;
   EmpVO vo = null;
   Iterator<EmpVO> ir = null;
   
   conn = DBConn.getConnection();
   
   String sql = """
               SELECT empno, ename, job, mgr
                 , TO_CHAR( hiredate, 'yyyy-MM-dd') hiredate, sal, comm, deptno
               FROM emp
               WHERE deptno IN ( %s )
               ORDER BY deptno ASC
              """.formatted( deptnos );
   
   out.print(sql);
   
   try {
      pstmt = conn.prepareStatement(sql);
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
<title>2026. 8. 4. 오후 3:51:58</title>
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
    [문제] emp 사원 정보 조회해서 table 생성하기.
     [ ex05_02.jsp ]
  </xmp>
  
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
       if( list == null){
    %>
        <tr>
          <td colspan="8">사원이 존재하지 않습니다.</td>
        </tr>
    <%      
       }else{
         ir = list.iterator();
         while( ir.hasNext() ){
           vo = ir.next();
    %>
         <tr>
           <td><%= vo.getEmpno() %></td>
           <td><%= vo.getEname() %></td>
           <td><%= vo.getJob() %></td>
           <td><%= vo.getMgr() %></td>
           <td><%= vo.getHiredate() %></td>
           <td><%= vo.getSal() %></td>
           <td><%= vo.getComm() %></td>
           <td><%= vo.getDeptno() %></td>
         </tr>
    <%       
         } // while
       } // if
    %>   
    </tbody>
    <tfoot>
      <tr>
        <td colspan="8">
          <span class="badge left red"><%= list == null ? 0 : list.size() %>명</span>
          <a href="javascript:history.back()">뒤로 가기</a>
        </td>
      </tr>
    </tfoot>
  </table>
  
</div>
<script>
</script>
</body>
</html>

