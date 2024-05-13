package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectLevelChangeCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = request.getParameter("level")==null ? 999 : Integer.parseInt(request.getParameter("level"));
		String checkedItems = request.getParameter("checkedItems")==null ? "" : request.getParameter("checkedItems");
		checkedItems = checkedItems.substring(0, checkedItems.length() - 1);
		
		AdminDAO dao = new AdminDAO();
		int res = dao.setSelectMemberLevelChange(checkedItems, level);

		response.getWriter().write(res + "");
	}

}
