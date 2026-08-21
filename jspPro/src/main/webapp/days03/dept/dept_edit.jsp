<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
int deptno = Integer.parseInt(request.getParameter("deptno"));

Connection conn = null;
PreparedStatement  pstmt = null;
ResultSet  rs   = null;  

DeptVO vo = null;
String dname=null, loc=null;

conn = DBConn.getConnection();

String sql = """
       SELECT *
       FROM dept
       WHERE deptno = ?
      """;



try {
	pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1,deptno);
    rs = pstmt.executeQuery();

   if ( rs.next()  ) {  // 첫 번째 레코드는 존재한다.
      
  
         deptno = rs.getInt("deptno");
         dname = rs.getString("dname");
         loc = rs.getString("loc"); 
      
   }else{
    %>
    <script>
    alert("존재하지 않는 부서번호입니다.");
    location.href = "dept_list.jsp"
    </script>
    <% 	   
	   return;
	   
   }// if

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

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오후 3:34:59</title>
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
    align-items:center;
    padding:0 50px;
    box-shadow:0 5px 20px rgba(0,0,0,.15);
}

header h1{
    margin:0;
}

header h1 a{
    text-decoration:none;
    color:white;
    font-size:35px;
    font-weight:bold;
    letter-spacing:2px;
}

header ul{
    margin-left:auto;
    display:flex;
    list-style:none;
    gap:20px;
}

header ul li a{
    text-decoration:none;
    color:white;
    font-weight:bold;
    padding:10px 18px;
    border-radius:25px;
    transition:.3s;
}

header ul li a:hover{
    background:white;
    color:#4f46e5;
}

/* ================= Container ================= */

.container{
    width:90%;
    max-width:700px;
    margin:50px auto;
    background:white;
    padding:35px;
    border-radius:18px;
    box-shadow:0 10px 25px rgba(0,0,0,.15);
    animation:fade .5s;
}

h2{
    text-align:center;
    color:#4f46e5;
    font-size:34px;
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

/* ================= Table ================= */

table{
    width:100%;
    border-collapse:collapse;
    overflow:hidden;
    border-radius:12px;
}

th{
    width:180px;
    background:linear-gradient(90deg,#4f46e5,#6366f1);
    color:white;
    padding:18px;
    text-align:center;
}

td{
    padding:18px;
    background:#f8fafc;
    border-bottom:1px solid #ddd;
    font-size:16px;
}

tr:last-child td{
    border-bottom:none;
}

/* ================= Buttons ================= */


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
    background:#4338ca;
    transform:translateY(-2px);
}

.cancel{
    background:#ef4444;
}

.cancel:hover{
    background:#dc2626;
    transform:translateY(-2px);
}
/* ================= Animation ================= */

@keyframes fade{
    from{
        opacity:0;
        transform:translateY(20px);
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
  <h1 class="main"><a href="#">Subin YaHo</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div class="container">
  <xmp class="code">
    
  </xmp>
  
  <h2>부서 수정</h2>
  <form action="dept_edit_ok.jsp" method="post" onsubmit="return checkForm();">

  
<p
    style="
        margin:0 0 15px;
        padding:12px 18px;
        background:#eef2ff;
        border-left:5px solid #4f46e5;
        border-radius:8px;
        color:#4338ca;
        font-size:15px;
        font-weight:600;
    ">
    💡 All form fields are required.
</p>
  <table>
      
      <tr>
         <th>부서번호</th>
         <td><input type="text" id="deptno" name="deptno" value="<%= deptno %>" readonly="readonly"></td>
      </tr>
      <tr>
         <th>부서명</th>
         <td><input type="text" id="dname" name="dname" class="long" value="<%= dname %>" onfocus="this.value='' "></td>
      </tr>
      <tr>
         <th>지역명</th>
         <td><input type="text" id="loc" name="loc" class="long" value="<%= loc %>" onfocus="this.value='' "></td>
      </tr>
  </caption>

</table>
<div class="btn-area">
    
    <button type="submit" class="add">저장</button>
    <button type="button" class="cancel">취소</button>
    
</div>

<script>
  $(".cancel").on("click", function (){
	 
	  location.href = "dept_view.jsp?deptno=" + $("#deptno").val(); 
  });
</script>

<script>
var  dname = $("#dname")
    , loc = $("#loc")
	, allFields = $( [] ).add( dname ).add( loc )
	, tips = $(".validateTips");
	
	


function checkLength( o, n, min, max ) {
if ( o.val().length > max || o.val().length < min ) {
o.addClass( "ui-state-error" );
updateTips( "Length of " + n + " must be between " +
min + " and " + max + "." );
return false;
} else {
return true;
}
}

function updateTips( t ) {
  tips
    .text( t )
    .addClass( "ui-state-highlight" );
  setTimeout(function() {
    tips.removeClass( "ui-state-highlight", 1500 );
  }, 500 );
}


function checkForm() {
var valid = true;
allFields.removeClass( "ui-state-error" );


valid = valid && checkLength( dname, "dname", 3, 14 );
valid = valid && checkLength( loc, "loc", 3, 13 );
return valid;
}
</script>
</form>
</div>
<script>
</script>
</body>
</html>