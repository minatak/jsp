package study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study2.ajax.AjaxIdCheck0Command;
import study2.ajax.AjaxIdCheck1Command;
import study2.hoewon.HoewonDeleteCommand;
import study2.hoewon.HoewonInputCommand;
import study2.hoewon.HoewonMainCommand;
import study2.hoewon.HoewonSearchCommand;
import study2.hoewon.HoewonUpdateCommand;
import study2.modal.ModelTestCommand;
import study2.pdstest.FileDeleteCommand;
import study2.pdstest.FileDownloadCommand;
import study2.pdstest.FileUpload1OkCommand;
import study2.pdstest.FileUpload2OkCommand;
import study2.pdstest.FileUpload3OkCommand;
import study2.pdstest.FileUpload4OkCommand;

@WebServlet("*.st")
public class StudyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage = "/WEB-INF/study2";
		
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		
		// 인증 처리
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		

		if(level > 4) {
			request.setAttribute("message", "로그인후 사용하세요");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("ajaxTest1")) {
			viewPage += "/ajax/test1.jsp";
		}
		else if(com.equals("ajaxIdCheck0")) {
			command = new AjaxIdCheck0Command();
			command.execute(request, response);
			// viewPage += "/ajax/test1.jsp";
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("ajaxIdCheck1")) {
			command = new AjaxIdCheck1Command();
			command.execute(request, response);
			// viewPage += "/ajax/test1.jsp"; 이걸 다시 불러주면 안됨 !! 이걸 안 불러줘도 백에서 처리한게 불러와지는것이 비동기식 처리이다!
			return;
		}
		else if(com.equals("ajaxTest2")) {
			viewPage += "/ajax/test2.jsp";
		}
		else if(com.equals("ajaxIdCheck2")) {
			viewPage += "/ajax/test2.jsp";
		}
		else if(com.equals("ajaxTest3")) {
			command = new HoewonMainCommand();
			command.execute(request, response);
			viewPage += "/ajax/hoewonMain.jsp";
		}
		else if(com.equals("hoewonInput")) {
			command = new HoewonInputCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("hoewonSearch")) {
			command = new HoewonSearchCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("hoewonUpdate")) {
			command = new HoewonUpdateCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("hoewonDelete")) {
			command = new HoewonDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("uuidForm")) {
			viewPage += "/uuid/uuidForm.jsp";
		}
		else if(com.equals("Modal1")) {
			viewPage += "/modal/modal1.jsp";
		}
		else if(com.equals("Modal1")) {
			viewPage += "/modal/modal1.jsp";
		}
		else if(com.equals("Modal2")) {
			command = new ModelTestCommand();
			command.execute(request, response);
			viewPage += "/modal/modal2.jsp";
		}
		else if(com.equals("FileUpload1")) {
			viewPage += "/pdstest/fileUpload1.jsp";
		}
		else if(com.equals("FileUpload1Ok")) {
			command = new FileUpload1OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("FileUpload2")) {
			viewPage += "/pdstest/fileUpload2.jsp";
		}
		else if(com.equals("FileUpload2Ok")) {
			command = new FileUpload2OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("FileUpload3")) {
			viewPage += "/pdstest/fileUpload3.jsp";
		}
		else if(com.equals("FileUpload3Ok")) {
			command = new FileUpload3OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("FileUpload4")) {
			viewPage += "/pdstest/fileUpload4.jsp";
		}
		else if(com.equals("FileUpload4Ok")) {
			command = new FileUpload4OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("FileDownload")) {
			command = new FileDownloadCommand();
			command.execute(request, response);
			viewPage += "/pdstest/fileDownload.jsp";
		}
		else if(com.equals("FileDelete")) {
			command = new FileDeleteCommand();
			command.execute(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
