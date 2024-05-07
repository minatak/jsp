package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.do3") // 확장자 패턴! ~~~.do를 입력하면 모두 여기로 옴 
public class Test3Controller2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("이곳은 *.do3 서블릿입니다");
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		
		int su1 = request.getParameter("su1")==null ? 0 : Integer.parseInt(request.getParameter("su1"));
		int su2 = request.getParameter("su2")==null ? 0 : Integer.parseInt(request.getParameter("su2"));
		
		Test3Service service = new Test3Service();
		int hap = service.hap(su1, su2);
		int cha = service.cha(su1, su2);
		int gop = service.gop(su1, su2);
		String mok = service.mok(su1, su2);
		
		if(com.equals("hap")) {
			request.setAttribute("hap", hap);
		}
		else if(com.equals("cha")) {
			request.setAttribute("cha", cha);
		}
		else if(com.equals("gop")) {
			request.setAttribute("gop", gop);
		}
		else if(com.equals("mok")) {
			request.setAttribute("mok", mok);
		}
		else if(com.equals("allRes")) {
			request.setAttribute("hap", hap);
			request.setAttribute("cha", cha);
			request.setAttribute("gop", gop);
			request.setAttribute("mok", mok);
		}
		
		request.setAttribute("su1", su1);
		request.setAttribute("su2", su2);
		
		String viewPage = "/WEB-INF/study2/mapping/test3.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
