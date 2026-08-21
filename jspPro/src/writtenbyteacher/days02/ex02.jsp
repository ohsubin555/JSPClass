<%@page import="java.util.function.Consumer"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null; 
	ResultSet  rs   = null; 
	ArrayList<DeptVO> list = null;
	DeptVO vo = null;
	Iterator<DeptVO> ir = null;
		
	conn = DBConn.getConnection();
 
	String sql = """
			      SELECT *
			      FROM dept
			      ORDER BY deptno ASC
		     """;
       
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		int deptno;
		String dname, loc;
		
		if ( rs.next()  ) {   
			list = new ArrayList<DeptVO>();
			do {
				deptno = rs.getInt("deptno");
				dname = rs.getString("dname");
				loc = rs.getString("loc");
				
				vo = DeptVO.builder()
						   .deptno(deptno)
						   .dname(dname)
						   .loc(loc)
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
<title>2026. 8. 5. 오전 11:02:48</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.2/jquery-ui.js"></script>
<script>
	$( function() {
	  $( "fieldset :checkbox[name=deptno]" ).checkboxradio();
	} );
</script>
  
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
    ex02.jsp
  </xmp>
  
  <h2>부서 선택</h2>
 
  <fieldset>
    <legend>dept info: </legend>
    <!-- 
    <label for="checkbox-1">2 Star</label>
    <input type="checkbox" name="checkbox-1" id="checkbox-1">
    <label for="checkbox-2">3 Star</label>
    <input type="checkbox" name="checkbox-2" id="checkbox-2">
    <label for="checkbox-3">4 Star</label>
    <input type="checkbox" name="checkbox-3" id="checkbox-3">
    <label for="checkbox-4">5 Star</label>
    <input type="checkbox" name="checkbox-4" id="checkbox-4">
     -->
    <%
        ir = list.iterator();
    	while( ir.hasNext() ){
    		vo = ir.next();
    		int  deptno = vo.getDeptno();
    		String dname = vo.getDname();
    %>
    <label for="deptno-<%= deptno %>"><%= dname %></label>
    <input type="checkbox" name="deptno" id="deptno-<%= deptno %>" value="<%= deptno %>">
    <%    		
    	} // while
    %> 
  </fieldset>  
  
  <input type="button" value="사원 확인">
 
</div>

<script>
 
  $(":button[value='사원 확인']").on("click", function (){
	  let cbox = $(":checkbox[name=deptno]:checked");
	  if( cbox.length == 0 ){
		  alert("부서를 선택하세요!!");
		  return ;
	  } // if
	  
	  // http://localhost/days02/ex02_02.jsp
	  // ?[deptno=10]&deptno=20&deptno=30
	  const deptnos = [];
	  cbox.each(function (index, element){
		  let deptno = $(element).val();
		  deptnos.push(`deptno=\${deptno}`);
	  });
	  
	  location.href = `ex02_02.jsp?\${ deptnos.join('&') }`;
  });
 
</script>
</body>
</html>









