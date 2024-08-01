package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.invalidate();
			response.getWriter().write("logcout-success");
			// 메인으로 이동하는 location 써놓기 
			// ex response.sendRedirect("이동할.jsp"); 아마도 main?
		}else {
			 response.getWriter().write("logout-failed");
		}
	}

}
