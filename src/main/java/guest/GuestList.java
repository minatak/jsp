package guest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/GuestList")
public class GuestList extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		
		// 1. 현재 페이지 번호를 구해온다.
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		// 2. 한 페이지의 분량을 구한다. (이 숫자를 바꾸면 한 페이지에서 보이는 게시글 수가 바뀜 !)
		int pageSize = request.getParameter("pageSize")==null ? 3 : Integer.parseInt(request.getParameter("pageSize"));
		
		if(pageSize > 5) pag = 1;
			
		// 3. 총 레코드 건수를 구한다. (sql 명령어 중 count 함수를 이용)
		int totRecCnt = dao.getTotRecCnt();
		
		// 4. 총 페이지 건수를 구한다. 
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;
		if(pag > totPage) pag = 1;
		
		// 5. 현재 페이지에서 출력할 '시작 인덱스 번호'를 구한다.
		int startIndexNo = (pag - 1) * pageSize;
		
		// 6. 현재 화면에 표시될 시작 실제번호를 구한다.
		int curScrStartNo = totRecCnt - startIndexNo;
		
		// 블록 페이징 처리 (시작 블록을 0으로 처리함)
		// 1. 블록의 크기 결정 (여기서는 3으로 결정했다)
		int blockSize = 3;
		
		// 2. 현재 페이지가 속한 블록번호를 구한다. (예: 총 레코드 수가 38개일 경우, 1페이지 분량이 5개라면, 총 페이지 수는 8개이다.)
		// 		이 때 0블록은 '1/2/3', 1블록은 '4/5/6', 2블록은 '7/8' 이런 식으로 블록 안에 페이지가 들어감
		int curBlock = (pag - 1) / blockSize;
		
		// 3. 마지막 블록을 구한다.
		int lastBlock = (totPage - 1) / blockSize;
		
		// 한 페이지에 표시할 건수만(pageSize 수만큼)을 DAO에서 가져온다. 
		ArrayList<GuestVO> vos = dao.getGuestList(startIndexNo, pageSize);
		
		// 설정(지정)된 페이지의 모든 자료(변수)들을 viewPage로 넘겨줄 준비를 한다.
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		request.setAttribute("vos", vos);
		
		String viewPage = "/guest/guestList.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
