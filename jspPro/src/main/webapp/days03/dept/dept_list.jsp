<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.doit.domain.DeptVO"%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.function.Consumer"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<% 
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
<title>2026. 8. 6. 오후 2:06:45</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"맑은 고딕",sans-serif;
}

body{
    background:#eef2ff;
    min-height:100vh;
}

/* ================= Header ================= */

header{
    height:90px;
    background:linear-gradient(90deg,#4f46e5,#7c3aed,#06b6d4);
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:0 50px;
    box-shadow:0 5px 20px rgba(0,0,0,.2);
}

header h1{
    margin:0;
}

header h1 a{
    color:white;
    text-decoration:none;
    font-size:35px;
    font-weight:bold;
    letter-spacing:2px;
}

header ul{
    list-style:none;
    display:flex;
    gap:20px;
    margin-left:auto; 
}

header li{
    list-style:none;
}

header li a{
    text-decoration:none;
    color:white;
    font-weight:bold;
    padding:10px 18px;
    border-radius:30px;
    transition:.3s;
}

header li a:hover{
    background:white;
    color:#4f46e5;
}

/* ================= Container ================= */

.container{
    width:90%;
    max-width:1100px;
    margin:45px auto;
    background:white;
    padding:35px;
    border-radius:18px;
    box-shadow:0 10px 25px rgba(0,0,0,.12);
    animation:fade .6s ease;
}

/* ================= Title ================= */

h2{
    text-align:center;
    color:#4f46e5;
    font-size:36px;
    margin-bottom:30px;
}

h2::after{
    content:"";
    display:block;
    width:90px;
    height:4px;
    background:#4f46e5;
    margin:12px auto;
    border-radius:10px;
}
/* Button */

.btn-area{
    margin-top:30px;
    display:flex;
    justify-content:flex-end;
    gap:15px;
}

.btn-area button{
    padding:12px 28px;
    border:none;
    border-radius:30px;
    color:white;
    font-size:15px;
    font-weight:bold;
    cursor:pointer;
    transition:.3s;
}


.add{
    background:#4f46e5;
}

.add:hover{
    background:#3730a3;
    transform:translateY(-2px);
}

/* ================= Table ================= */

table{
    width:100%;
    border-collapse:collapse;
    overflow:hidden;
    border-radius:15px;
}

thead{
    background:linear-gradient(90deg,#4f46e5,#6366f1);
    color:white;
}

thead th{
    padding:16px;
    font-size:18px;
}

tbody td{
    padding:16px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

tbody tr:nth-child(even){
    background:#f8fafc;
}

tbody tr{
    transition:.25s;
}

tbody tr:hover{
    background:#dbeafe;
    transform:scale(1.01);
}

tbody tr:hover td{
    color:#1d4ed8;
    font-weight:bold;
}

/* ================= Scroll ================= */

::-webkit-scrollbar{
    width:10px;
}

::-webkit-scrollbar-thumb{
    background:#4f46e5;
    border-radius:20px;
}

/* ================= Animation ================= */

@keyframes fade{
    from{
        opacity:0;
        transform:translateY(25px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}
</style>
</head>
<body>
<header>
    <h1 class="main">
        <a href="#">Subin YaHo</a>
    </h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div class="container">
  <xmp class="code">
   
  </xmp>
   <h2>부서목록</h2>
   <div class="btn-area" style="text-align:right; margin-bottom:15px;"> <button class="add" >부서추가</button></div>
 
  <table>
    <thead>
        <tr>
         <th>부서번호</th>   
         <th>부서명</th>
         <th>지역명</th>
        </tr>    
     </thead>
      <tbody>
        <c:forEach items="<%= dlist%>" var="dvo">
        <tr>
          <td>${dvo.deptno}</td>
          <td><a href="dept_view.jsp?deptno=${dvo.deptno}">${dvo.dname}</a></td>
          <td>${dvo.loc}</td>        
        
        </tr>
        </c:forEach>
      </tbody>
      <tfoot>
      
      </tfoot>
  </table>
</div>
<script>
 $(".btn-area button.add").on("click", function () {
	location.href = "dept_add.jsp"
});
</script>
</body>
</html>