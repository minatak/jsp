package guest;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mineSearch")
public class mineSearch extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
		
		GuestDAO dao = new GuestDAO();
		
		PrintWriter out = response.getWriter();
		System.out.println("hostIp : " + hostIp);
		if(hostIp.equals("")) {
			out.println("<script>");
			out.println("alert('작성하신 글 조회에 실패했습니다.');");
			out.println("location.href='"+request.getContextPath()+"/GuestList';");
			out.println("</script>");
		}
		else {
			ArrayList<GuestVO> vos = dao.getMineSearch(hostIp);
			
			request.setAttribute("vos", vos);
			
			String viewPage = "/guest/guestList.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
	}
}
