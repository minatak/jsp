package board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Pagination;

public class BoardListCommand3 implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		
		// 페이징 처리 시작
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 10 : Integer.parseInt(request.getParameter("pageSize"));
		String part = request.getParameter("part")==null ? "전체" : request.getParameter("pageSize");
		int totRecCnt = dao.getTotRecCnt(); // 게시판의 전체 레코드 수 구하기
		
		Pagination pagination = new Pagination();
		
		int startIndexNo = (pag - 1) * pageSize;
		List<BoardVO> vos = dao.getBoardList(startIndexNo, pageSize); // 게시판의 전체 자료 가져오기
		request.setAttribute("vos", vos);

//		pagination.pageChange(request, pag, pageSize, totRecCnt, startIndexNo, part);
		
	}

}
