package days09;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/filterCheck.do")
public class FilterCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FilterCheck() {
        super();   
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("👍👍 FilterCheck.doGet");
		
		String name = request.getParameter("name");
		System.out.println("이름" + name + "<br>");
		
	    String path = "/days09/ex04_ok.jsp";
	    //포워딩
		RequestDispatcher dispatcher =  request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
