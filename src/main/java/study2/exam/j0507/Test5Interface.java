package study2.exam.j0507;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Test5Interface {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException; 
}
