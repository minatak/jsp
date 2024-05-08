package study2.exam.j0507;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test5SearchOkCommand implements Test5Interface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		String message =  "~ 검색하신 "+mid+"님의 정보입니다 ~";
		
		request.setAttribute("message", message);
		request.setAttribute("url", "test5.do5");
	}

}
