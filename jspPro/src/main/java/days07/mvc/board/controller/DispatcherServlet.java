package days07.mvc.board.controller;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.Map.Entry;

import days07.mvc.board.command.CommandHandler;
import days07.mvc.board.command.NullHandler;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public DispatcherServlet() {
		super();

	}



	private Map<String , CommandHandler> commandHandlerMap = new HashMap();

	@Override
	public void init() throws ServletException {

		super.init();
		System.out.println("😒😒😒😒DispatcherServelt.init()");
		String urlMappingPath = this.getInitParameter("urlMappingPath");
		System.out.println("😒😒😒😒urlMappingPath" + urlMappingPath);
		String realPath = this.getServletContext().getRealPath(urlMappingPath);

		Properties p = new Properties();

		try(FileReader reader = new FileReader(realPath)) {
			p.load(reader);
		} catch (Exception e) {
			throw new ServletException(e);

		}

		//Properties p -> c
		Set<Entry<Object, Object>> set = p.entrySet();
		Iterator<Entry<Object, Object>> ir = set.iterator();

		while (ir.hasNext()) {
			Entry<Object, Object> entry = ir.next();
			String url = (String) entry.getKey();
			String fullName = (String) entry.getValue();
			// fullName 문자열 -> 생성된 커맨드 객체
			try {
				Class<?> commandHandlerClass = Class.forName(fullName);
				CommandHandler handler = (CommandHandler) commandHandlerClass
						.getDeclaredConstructor()
						.newInstance();
				commandHandlerMap.put(url, handler);
			} catch (Exception e) { 
				e.printStackTrace();
			}
		}// while
		System.out.println(this.commandHandlerMap.size());

	} 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 1. 요청 URL 분석
		String requestURI = request.getRequestURI();
		System.out.println("requestURI" + requestURI);

		String contextPath = request.getContextPath();
		String path = requestURI.substring(contextPath.length());
		System.out.println("path" + path);

		CommandHandler handler = this.commandHandlerMap.get(path);
		if (handler == null) {
			handler = new NullHandler();
		}
		String viewName = null;
		try {

			viewName = handler.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (viewName == null) {
			return;
		}
		
		if (viewName.startsWith("redirect:")) {

			//5-2 redirect
			String location = viewName.substring("redirect:".length());
			response.sendRedirect(location);

		} else {
			//포워딩
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewName);
			dispatcher.forward(request, response);
		}



	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// POST 요청이 오면 그냥 doGet을 대신 실행해라!
		doGet(request, response); 
	}
}
