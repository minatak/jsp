package member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;
import guest.GuestDAO;
import guest.GuestVO;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		
		// 로그인시 아이디 체크
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		// 아래로 회원 인증처리
		if(vo.getPwd() == null || vo.getUserDel().equals("OK")) {
			request.setAttribute("message", "입력하신 회원정보가 없습니다. \\n확인하고 다시 로그인하세요.");
			request.setAttribute("url", "MemberLogin.mem");
			return;
		}
		
		// 저장된 비밀번호에서 salt 키를 분리시켜 다시 암호화시킨 후 맞는지 비교처리한다
		String salt = vo.getPwd().substring(0,8);
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
		
		if(!vo.getPwd().substring(8).equals(pwd)) {
			request.setAttribute("message", "비밀번호를 확인하세요");
			request.setAttribute("url", "MemberLogin.mem");
			return;
		}
		
		
		// 로그인 체크 완료후에 처리할 내용 (쿠키/세션 등)
		
		// 회원일때 처리할 부분
		// (1번/2-1번)처리 : 방문포인트 처리를 위한 날짜 추출 비교하기 - 조건에 맞도록 방문 포인트와 카운트를 증가처리한다.
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(today);
		
		if(!strToday.equals(vo.getLastDate().substring(0,10))) {
			// 오늘 처음 방문한 경우이다.(오늘 방문카운트는 1로, 기존 포인트에 +10)
			vo.setTodayCnt(1);
			vo.setPoint((vo.getPoint() + 10));
		}
		else {
			// 오늘 다시 방문한경우(오늘 방문카운트는 오늘방문카운트 + 1, 포인트증가는? 오늘 방문횟수가 5회전까지라면 기존포인트에 +10을 한다.)
			vo.setTodayCnt(vo.getTodayCnt() + 1);
			if(vo.getTodayCnt() <= 5) vo.setPoint(vo.getPoint() + 10);
		}		
		
		// 2-2. 자동 정회원 등업시키기
		// 조건: 방명록에 5회이상 글을 올렸을시 '준회원'에서 '정회원'으로 자동 등업처리한다.(단, 방명록의 글은 1일 여러번 등록해도 1회로 처리한다) 
		GuestDAO gDao = new GuestDAO();
		ArrayList<GuestVO> gVos = gDao.getMemberGuestSearch(mid, vo.getName(), vo.getNickName());

		Set<String> guestTime = new HashSet<>(); // 중복된 날짜를 제거하기 위해 HashSet 사용
		for(GuestVO gVo : gVos) {
			guestTime.add(gVo.getVisitDate().substring(0, 10)); 
		}
		
		int guestCnt = guestTime.size(); 
		
		if(guestCnt >= 5) { 
			vo.setLevel(2);
		}
		
		// 3. 방문포인트와 카운트를 증가처리한내용을 vo에 모두 담았다면 DB 자신의 레코드에 변경된 사항들을 갱신처리해준다.
		dao.setLoginUpdate(vo);		
		
		
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
