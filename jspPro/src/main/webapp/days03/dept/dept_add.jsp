<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오후 2:27:41</title>
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
    color:white;
    text-decoration:none;
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
    max-width:900px;
    margin:50px auto;
    background:white;
    padding:35px;
    border-radius:18px;
    box-shadow:0 10px 25px rgba(0,0,0,.15);
}

/* ================= Title ================= */

h2{
    text-align:center;
    color:#4f46e5;
    font-size:35px;
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
    border-radius:15px;
    overflow:hidden;
}

th{
    width:120px;
    background:linear-gradient(90deg,#4f46e5,#6366f1);
    color:white;
    padding:18px;
    text-align:center;
}

td{
    padding:15px;
    background:#f8fafc;
}

input{
    width:100%;
    padding:10px;
    border:1px solid #cbd5e1;
    border-radius:8px;
    font-size:15px;
    transition:.3s;
}

input:focus{
    outline:none;
    border-color:#4f46e5;
    box-shadow:0 0 8px rgba(79,70,229,.3);
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
    background:#3730a3;
    transform:translateY(-2px);
}

button[type=reset]{
    background:#64748b;
}

button[type=reset]:hover{
    background:#475569;
    transform:translateY(-2px);
}

.list{
    background:#06b6d4;
}

.list:hover{
    background:#0891b2;
    transform:translateY(-2px);
}

/* ================= Animation ================= */

.container{
    animation:fade .6s ease;
}

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
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">Subin YaHo</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div class="container">
  <xmp class="code">
   
  </xmp>
<h2>부서추가</h2>

<form action="dept_add_ok.jsp" method="post" onsubmit="return checkForm()">


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
        <td><input type="text" id="deptno" name="deptno" autofocus="autofocus"></td>
    </tr>

    <tr>
        <th>부서명</th>
        <td><input type="text" id="dname" name="dname"></td>
    </tr>

    <tr>
        <th>지역명</th>
        <td><input type="text" id="loc" name="loc"></td>
    </tr>
</table>

<div class="btn-area">
    <button type="submit" class="add">저장</button>
    <button type="reset">다시입력</button>
    <button type="button" class="list">목록</button>
</div>

</form>
<script>
 $(".btn-area button.list").on("click", function () {
	location.href = "dept_list.jsp"
});
</script>
<script>
var deptno =  $("#deptno")
            , dname = $("#dname")
            , loc = $("#loc")
				, allFields = $( [] ).add( deptno ).add( dname ).add( loc )
				, tips = $( ".validateTips" );
				

function updateTips( t ) {
  tips
    .text( t )
    .addClass( "ui-state-highlight" );
  setTimeout(function() {
    tips.removeClass( "ui-state-highlight", 1500 );
  }, 500 );
}

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
  

      
 function checkForm() {
	  var valid = true;
	  allFields.removeClass( "ui-state-error" );

	  valid = valid && checkLength( deptno, "deptno", 2, 2 );
	  valid = valid && checkLength( dname, "dname", 3, 14 );
	  valid = valid && checkLength( loc, "loc", 3, 13 );
	  return valid;
}
</script>
</body>
</html>