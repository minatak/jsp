package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
//@WebServlet("*.do3") // 확장자 패턴! ~~~.do를 입력하면 모두 여기로 옴 
public class Test3Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("이곳은 *.do3 서블릿입니다");
		
		StringBuffer url = request.getRequestURL();
		System.out.println("url : " + url);
		
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);
		
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		System.out.println("보내는 파일 명(com) : " + com);
		
		int su1 = request.getParameter("su1")==null ? 0 : Integer.parseInt(request.getParameter("su1"));
		int su2 = request.getParameter("su2")==null ? 0 : Integer.parseInt(request.getParameter("su2"));
		
		if(com.equals("list")) {
			System.out.println("list 입니다.");
		}
		else if(com.equals("input")) {
			System.out.println("input 입니다.");
		}
		else if(com.equals("update")) {
			System.out.println("update 입니다.");
		}
		else if(com.equals("delete")) {
			System.out.println("delete 입니다.");
		}
		else if(com.equals("search")) {
			System.out.println("search 입니다.");
		}
		else if(com.equals("hap")) {
			System.out.println("hap 입니다.");
			request.setAttribute("hap", (su1 + su2));
		}
		else if(com.equals("cha")) {
			System.out.println("cha 입니다.");
			request.setAttribute("cha", (su1 - su2));
		}
		else if(com.equals("gop")) {
			System.out.println("gop 입니다.");
			request.setAttribute("gop", (su1 * su2));
		}
		else if(com.equals("mok")) {
			System.out.println("mok 입니다.");
			request.setAttribute("mok", (su1 / su2));
		}
		else if(com.equals("allRes")) {
			System.out.println("allRes 입니다.");
			request.setAttribute("hap", (su1 + su2));
			request.setAttribute("cha", (su1 - su2));
			request.setAttribute("gop", (su1 * su2));
			request.setAttribute("mok", (su1 / su2));
		}
		
		request.setAttribute("su1", su1);
		request.setAttribute("su2", su2);
		
		String viewPage = "/WEB-INF/study2/mapping/test3.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
