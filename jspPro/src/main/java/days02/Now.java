package days02;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
// 서블릿 클래스 
public class Now extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		//out.write("admin");
		
		Date now = new Date();
	      String pattern = "yyyy-MM-dd hh:mm:ss";
	      SimpleDateFormat sdf = new SimpleDateFormat(pattern);
	      String strNow = sdf.format(now);
	      
	      out.write("<!DOCTYPE html>");
	      out.write("<html>");
	      out.write("<head>");
	      out.write("<meta charset='UTF-8'>");
	      out.write("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
	      out.write("<title>2025. 5. 22. 오후 3:35:05</title>");
	      out.write("<link rel='shortcut icon' type='image/x-icon' href='http:/images/SiSt.ico'>");
	      out.write("<link rel='stylesheet' href='/resources/cdn-main/example.css'>");
	      out.write("<script src='/resources/cdn-main/example.js'></script>");
	      out.write("<style>");
	      out.write(" span.material-symbols-outlined{");
	      out.write("    vertical-align: text-bottom;");
	      out.write(" }   ");
	      out.write("</style>");
	      out.write("</head>");
	      out.write("<body>");
	      out.write("<header>");
	      out.write("  <h1 class='main'><a href='#' style='position: absolute;top:30px;'>kEnik HOme</a></h1>");
	      out.write("  <ul>");
	      out.write("    <li><a href='#'>로그인</a></li>");
	      out.write("    <li><a href='#'>회원가입</a></li>");
	      out.write("  </ul>");
	      out.write("</header>");
	      out.write("<div>");
	      out.write("  <xmp class='code'>"); 
	      out.write("   ");
	      out.write("  </xmp>");
	      
	      out.write("<h3> 현재 날짜 시간 : " + strNow + "</h3>");
	      
	      out.write("</div>");
	      out.write("</body>");
	      out.write("</html>");
		
		
	}
  
}
