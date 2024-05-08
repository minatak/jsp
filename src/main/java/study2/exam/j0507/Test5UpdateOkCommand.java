package study2.exam.j0507;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test5UpdateOkCommand implements Test5Interface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message =  "회원님의 아이디가 수정되었습니다.";
		
		request.setAttribute("message", message);
		request.setAttribute("url", "test5.do5");
	}

}
