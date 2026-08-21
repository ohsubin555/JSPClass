<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.doit.domain.DeptVO, java.util.*, java.sql.*, com.util.DBConn" %>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    ArrayList<DeptVO> dlist = new ArrayList<>();

    try {
        conn = DBConn.getConnection();
        String dsql = "SELECT * FROM dept ORDER BY deptno ASC";
        pstmt = conn.prepareStatement(dsql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            DeptVO dvo = DeptVO.builder()
                    .deptno(rs.getInt("deptno"))
                    .dname(rs.getString("dname"))
                    .loc(rs.getString("loc"))
                    .build();
            dlist.add(dvo);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) DBConn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 18.</title>
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
      ex08.jsp - 부서 선택 시 ex08_emp_json.jsp를 통한 AJAX 비동기 사원 조회
  </xmp>

  <select name="deptno" id="deptno">
    <% for (DeptVO dvo : dlist) { %>
        <option value="<%= dvo.getDeptno() %>"><%= dvo.getDname() %></option>
    <% } %>
  </select>
  <input type="button" id="btnEmp" value="사원확인"/>

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
    <tbody id="empTbody">
        <tr>
          <td colspan="8">사원을 조회하려면 부서를 선택하세요.</td>
        </tr>
    </tbody>
    <tfoot>
      <tr>
        <td colspan="8">
          <span class="badge left red" id="empCount">0명</span>
          <a href="javascript:history.back()">뒤로 가기</a>
        </td>
      </tr>
    </tfoot>
  </table>
</div>

<script>
// AJAX 사원 목록 조회 함수
function getEmpList(deptno) {
    $.ajax({
        url: "ex08_emp_json.jsp",
        type: "POST",
        data: { "deptno": deptno },
        dataType: "json",
        cache: false,
        success: function(data) {
            let tbodyContent = "";
            
            if (!data || data.length === 0) {
                tbodyContent = `<tr><td colspan="8">해당 부서에 사원이 존재하지 않습니다.</td></tr>`;
                $("#empCount").text("0명");
            } else {
                $.each(data, function(index, emp) {
                    tbodyContent += `
                        <tr>
                            <td>\${emp.empno}</td>
                            <td>\${emp.ename}</td>
                            <td>\${emp.job}</td>
                            <td>\${emp.mgr === 0 ? '' : emp.mgr}</td>
                            <td>\${emp.hiredate}</td>
                            <td>\${emp.sal}</td>
                            <td>\${emp.comm}</td>
                            <td>\${emp.deptno}</td>
                        </tr>`;
                });
                $("#empCount").text(`\${data.length}명`);
            }
            
            $("#empTbody").html(tbodyContent);
        },
        error: function(xhr, status, error) {
            alert("사원 데이터 조회 실패: " + error);
        }
    });
}

$(function() {
    // 1. 초기 진입 시 첫 번째 부서 정보로 자동 조회
    getEmpList($("#deptno").val());

    // 2. '사원확인' 버튼 클릭 시 AJAX 호출
    $("#btnEmp").on("click", function() {
        getEmpList($("#deptno").val());
    });

    // 3. select 옵션 변경 시 자동 AJAX 호출
    $("#deptno").on("change", function() {
        getEmpList($(this).val());
    });
});
</script>
</body>
</html>