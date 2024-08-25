package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersjoinDao;

public class UserJoinAction implements Action{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name"); 
		String email =request.getParameter("email"); 
		String pw = request.getParameter("pw"); 
		System.out.println(name + email + pw);
		
		UsersjoinDao userDAO = new UsersjoinDao();
		
		try { userDAO.registerMember(name, email, pw);
		 response.sendRedirect("User.joinPage2.jsp"); 
		 
		 } catch(Exception e) { 
			 e.printStackTrace(); 
			response.sendRedirect("User.join.jsp");
		 }
	}
}
