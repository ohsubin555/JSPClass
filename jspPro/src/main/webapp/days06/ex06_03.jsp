<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 11. 오후 2:40:10</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<style>
 .demo{
  border: 1px solid gray;
  padding: 5px;
  margin-top: 10px;
  max-height: 500px;
  overflow: auto;
 
 
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
     days06 폴더 안에 있는 jsp 파일 읽어와서 select 에 option태그로 추가. 
  </xmp>
  <%
    // web.xml에 설정된 path
    String path = application.getInitParameter("path");

    // 톰캣에 배포된 실제 경로
    String realPath = application.getRealPath(path);

    // days06 폴더
    File dir = new File(realPath);

    // jsp 파일만 가져오기
    File[] files = dir.listFiles(
        (file, name) -> name.toLowerCase().endsWith(".jsp")
    );
%>
  
path = <%= path %><br>
realPath = <%= realPath %><br>

<form method="get">

    <select name="file" id="file" onchange="this.form.submit()">

        <option value="">-- 파일 선택 --</option>

        <c:forEach items="<%= files %>" var="file">

            <option value="${file.name}"
                ${param.file == file.name ? 'selected' : ''}>
                ${file.name}
            </option>

        </c:forEach>

    </select>

</form>

 
<%
    StringBuilder sb = new StringBuilder();

    // 선택한 파일
    String fileName = request.getParameter("file");

    if (fileName != null && !fileName.isEmpty()) {

        // 파일명만 사용하도록 처리
        File selectedFile = new File(dir, fileName);

        // days06 폴더 안에 실제 존재하는 JSP인지 확인
        if (selectedFile.isFile()
                && fileName.toLowerCase().endsWith(".jsp")) {

            try (
                FileReader fr = new FileReader(selectedFile);
                BufferedReader br = new BufferedReader(fr);
            ) {

                String line = null;

                while ((line = br.readLine()) != null) {

                    line = line
                            .replace("<", "&lt;")
                            .replace(">", "&gt;");

                    sb.append(line).append("<br>");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            sb.append("존재하지 않는 JSP 파일입니다.");
        }
    }
%>

  <div class="demo">
  <code>           
  <%=sb.toString() %>
  </code>
  </div>
</div>
<script>
</script>
</body>
</html>