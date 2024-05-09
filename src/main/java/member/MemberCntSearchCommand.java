package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberCntSearchCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName")== null ? "" : request.getParameter("nickName");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberCntSearch(nickName);
		
		String str = vo.getVisitCnt() + "/" + vo.getTodayCnt() + "/" + vo.getPoint();
		
		response.getWriter().write(str);
	}

}
