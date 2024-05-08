package study2.exam.j0507;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.do5")
public class Test5Controller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Test5Interface command = null;
		
		String uri = request.getRequestURI();

		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		String viewPage = "";
		if(com.contains("Ok")) {
			viewPage = "/include/message.jsp";
		}
		else viewPage = "/WEB-INF/study2/exam/0507/"; 
		
		if(com.equals("test5")) {
			viewPage += "test5.jsp";
		}
		else if(com.equals("input")) {
			viewPage += com + ".jsp";
		}
		else if(com.equals("inputOk")) {
			command = new Test5InputOkCommand();
			command.execute(request, response);
		}
		else if(com.equals("update")) {
			viewPage += com + ".jsp";
		}
		else if(com.equals("updateOk")) {
			command = new Test5UpdateOkCommand();
			command.execute(request, response);
		}
		else if(com.equals("delete")) {
			viewPage += com + ".jsp";
		}
		else if(com.equals("deleteOk")) {
			command = new Test5DeleteOkCommand();
			command.execute(request, response);
		}
		else if(com.equals("search")) {
			viewPage += com + ".jsp";
		}
		else if(com.equals("searchOk")) {
			command = new Test5SearchOkCommand();
			command.execute(request, response);
		}
		else if(com.equals("list")) {
			viewPage += com + ".jsp";
		}
		else if(com.equals("listOk")) {
			command = new Test5ListOkCommand();
			command.execute(request, response);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
