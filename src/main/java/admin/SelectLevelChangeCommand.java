package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectLevelChangeCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int levelIdx = request.getParameter("levelIdx")==null ? 999 : Integer.parseInt(request.getParameter("levelIdx"));
		
		AdminDAO dao = new AdminDAO();
		
		int res = dao.setMemberLevelChange(idx, level);

이거수정해야됨!!!!!!!!!!!!!!
		response.getWriter().write(res + "");
	}

}
