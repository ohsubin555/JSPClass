<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 18. 오후 12:02:01</title>
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
  
  <input type="button" value="EmpTop5"  /> <br>
		<p id="demo"></p>
</div>
<script>
$(":button").on("click", function (){
    let url = 'ex06_cd_catalog.xml';
    $.ajax({
    	url: url, 
    	type : "GET", 
    	//data: params
    	cache: false , 
        dataType: "xml", 
        success: function (data) {
        	const cdList = data.getElementsByTagName("CD");
        	//alert(cdList.length);
        	let content =  `<table>
                <tr>
                <th>TITLE</th>
                <th>ARTIST</th>
            </tr>`;
            for (var i = 0; i < cdList.length; i++) {
            	let title = cdList[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue
            	let artist = cdList[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue
            content += `
                 <tr>
                   <td>\${title}</td>
                   <td>\${artist}</td>
                 </tr>
               `;
            };      
           
            content += `</table>`;
            $("#demo").html(content);
			
		}, err: function (xhr, status, error) {
			alert("에러발생" + error);
		}
    });
	  });
</script>
</body>
</html>