package study.j0425;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j0425/T08Ok")
public class T08Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String[] imgs = request.getParameterValues("img");
//		String[] str = new String[imgs.length];
		
		// 선택한 그림 파일 번호가 있는지 유효성 검사
		if(imgs==null) {
			// jsp로 보내서 그림 파일을 선택하라는 메세지 띄우기
			response.sendRedirect(request.getContextPath()+"/study/0425/t08_image.jsp?msgFlag=no");
			return;
		}
		
		String str = "";
		for(String img : imgs) {
			str +="<img src='"+request.getContextPath()+"/images/"+img+".jpg' width='300px'/><br/>";
		}
		
		// 배열에 담긴 선택한 img 파일 꺼내기
//		String img = "";
//		if(imgs != null) {
//			for(int i=0; i<=imgs.length; i++) {
//				img = imgs[i];
//				str[i] = "<img src='<%=request.getContextPath()%>/images/"+img+".jpg' width='300px'/>";
//				System.out.println(str[i]);
//			}
//		}
//		System.out.println(img);
//		response.sendRedirect(request.getContextPath()+"/study/0425/t08_print.jsp?str="+str);
		
		request.setAttribute("str", str);
		
		String viewPage = "/study/0425/t08_print.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
