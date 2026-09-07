<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 31. 오전 9:21:05</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">

<script src="/resources/cdn-main/example.js"></script><link rel="stylesheet" type="text/css" href="/days17/dhtmlxSuite_v51_std/codebase/fonts/font_roboto/roboto.css"/>
   <link rel="stylesheet" type="text/css" href="/days17/dhtmlxSuite_v51_std/codebase/dhtmlx.css"/>
   <script src="/days17/dhtmlxSuite_v51_std/codebase/dhtmlx.js"></script>
   <script src="/days17/dhtmlxSuite_v51_std/samples/dhtmlxChart/common/testdata.js"></script>
   
   <style>
 .container{
     position: relative;
     
     width:450px;
     height:350px;
     
     border:dotted 1px #555;
     padding:10px;
     margin-top:10px;
  }
  
  .loader{
  
    position: absolute;
    
    top:0;
    left:0;
    
    width: 100%;
    height:100%;
    
    background: rgba(255,255,255,0) url('ajax-loader.gif') no-repeat 50% 50%;
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
<div>
  <xmp class="code">
      
  </xmp>
  <a href="#" class="load">Ajax Chart</a>
  <br>
  <div id="chartDiv" class="container" style="width:600px;height:250px;margin:20px;border:1px solid #c0c0c0"></div>
  
</div>
<script>

var res = {
		 
        loader : $("<div />" , {"class":"loader"})  
         , container: $(".container")
  };
		var myBarChart;
		
		//function doOnLoad() {
			// 1. 
			myBarChart = new dhtmlXChart({
				view:"line",
				container:"chartDiv",
				value:"#sal#",
				label:"#sal#",
				radius:0,
				border:true,
				line:{
			         color:"#1293f8",
			         width:3
			      },
			      item:{
			          borderColor: "#1293f8",
			          color: "#ffffff"
			       },
				xAxis:{
					template:"'#ename#"
				},
				yAxis:{
					start:0,
					end:10000,
					step:1000,
					template:function(obj){
						return (obj%20?"":obj)
					}
				}
			});
			
			// 2. 
			//myBarChart.parse(dataset,"json");
	//	}
		$("a.load").on("click" , function(){
			$.ajax({
	            url:"ex01_emp_chart.jsp" , 
	            dataType:"json",
	            type:"get" , 
	            cache:false , 
	            beforeSend:function (xhr){
	                //res.container.empty().append( res.loader );    1번
	               res.container.append( res.loader );
	            },
	            success:function (data){   
	               res.container.find(res.loader).remove();   
	               // 2
	               myBarChart.clearAll();                         // 2번 
	               myBarChart.parse( data ,"json");
	             },
	             error:function (){ 
	                // res.container.find(res.loader).remove();
	                 alert("에러~~~");
	              } 
	         });
		});
  </script>
</body>
</html>