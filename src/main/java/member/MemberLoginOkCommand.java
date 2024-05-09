package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.database.LoginDAO;
import study.database.LoginVO;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		
		// 로그인시 아이디 체크
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		// 아래로 회원 인증처리
		if(vo.getPwd() == null || !vo.getPwd().equals(pwd)) {
			request.setAttribute("message", "아이디를 확인하세요.");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			return;
		}
		
		// 로그인 체크 완료후에 처리할 내용 (쿠키/세션 등)
		
		// 회원일때 처리할 부분
		 
		// 회원이 맞으면 vo.getMid 값이 null이 아니다.
		if(vo.getMid() != null) {
			
			// 방문일 비교처리
			String strLastDate = vo.getLastDate().substring(0, 10); // 마지막 접속일
			LocalDate now = LocalDate.now(); // 현재 접속 날짜
			String strNow = now.toString(); // 문자 형식으로 변환
			String nowDate = strNow.substring(0, 10);
			
			int visitCnt = vo.getVisitCnt(); // 누적된 방문횟수 가져옴
			int todayCnt = vo.getTodayCnt(); // 누적된 방문횟수 가져옴
			int pointCnt = vo.getPoint(); // 누적된 포인트 가져옴
			if(strLastDate.equals(nowDate)) { // 오늘 한 번 이상 접속한 적이 있는 경우
				vo.setTodayCnt(todayCnt + 1);
				// 방문포인트지급 - 매번 10포인트씩 지급, 단 1일 최대 50포인트까지만 지급
				if(todayCnt < 5 ) {
					vo.setPoint(pointCnt+10);
				}
			}
			else { // 새로 접속한 경우
				vo.setTodayCnt(1);
				vo.setPoint(pointCnt+10);
			}
			vo.setVisitCnt(visitCnt+1);
			vo.setLastDate(nowDate);
			
			dao.setCnts(vo);
		}
		
		// 쿠키에 아이디를 저장/해제 처리한다.
		// 로그인시 아이디 저장 시킨다고 체크하면 쿠키에 아이디 저장하고, 그렇지 않으면 쿠키에서 아이디를 제거한다.
		String idSave = request.getParameter("idSave")==null ? "off" : "on";
		Cookie cookieMid = new Cookie("cMid", mid);
		cookieMid.setPath("/");
		if(idSave.equals("on")) {
			cookieMid.setMaxAge(60*60*24*7);	// 쿠키의 만료시간은 1주일로 한다.
		}
		else {
			cookieMid.setMaxAge(0);
		}
		response.addCookie(cookieMid);
			
		// 등급레벨별 등급명칭을 저장한다.
		String strLevel = "";
		if(vo.getLevel() == 0) strLevel = "관리자";
		else if(vo.getLevel() == 1) strLevel = "준회원";
		else if(vo.getLevel() == 2) strLevel = "정회원";
		else if(vo.getLevel() == 3) strLevel = "우수회원";
			
		// 필요한 정보를 session에 저장처리한다.
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("strLevel", strLevel);

		request.setAttribute("message", mid+"님 로그인 되셨습니다.");
		request.setAttribute("url", request.getContextPath()+"/MemberMain.mem");
	}

}
