<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 20. 오전 10:36:00</title>
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
      joinForm.jsp
  </xmp>
  <form action="join.do" method="post">
<p>
   아이디:<br/><input type="text"  id="id"  name="id" value="${param.id}">
   <c:if test="${errors.id}">ID를 입력하세요.</c:if>
   <c:if test="${errors.duplicateId}">이미 사용중인 아이디입니다.</c:if>
   
   <input type="button" id="btnIDDuplicateCheck" value="ID 중복체크"><br>
   <p id="notice"></p>
    <br>
    
    <script>
     $("#btnIDDuplicateCheck").on("click", function (){
           //var params = $("form").serialize();      // ?deptno=10
           var params = null;
           params = "memberid="+$("#id").val();   
          $.ajax({
             url:"/idcheck.ajax" , 
             dataType:"json",
             type:"GET",
             data: params,
             cache:false ,
             //                              {  "count":1 } 
             success: function ( data,  textStatus, jqXHR ){
                if( data.count == 0 ){
                   $("#notice").css("color", "black").text("사용 가능한 ID입니다.");
                }else{  // 1
                   $("#notice").css("color", "red").text("이미 사용 중인 ID입니다.");
                }
                
             },
             error:function (){
                alert("에러~~~ ");
             }
             
          });
     });
   </script>
   
</p>
<p>
   이름:<br/><input type="text" name="name" value="${param.name}">
   <c:if test="${errors.name}">이름을 입력하세요.</c:if>
</p>
<p>
   암호:<br/><input type="password" name="password">
   <c:if test="${errors.password}">암호를 입력하세요.</c:if>
</p>
<p>
   확인:<br/><input type="password" name="confirmPassword">
   <c:if test="${errors.confirmPassword}">확인을 입력하세요.</c:if>
   <c:if test="${errors.notMatch}">암호와 확인이 일치하지 않습니다.</c:if>
</p>
<input type="submit" value="가입">
</form>

<br>
<br>
<a href="/index.do">HOme</a>
</div>
<script>

</script>
</body>
</html>