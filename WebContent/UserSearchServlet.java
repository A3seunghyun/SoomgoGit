package users;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String userName = request.getParameter("userName");
		
		try {
			response.getWriter().write(getJSON(userName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public String getJSON(String userName) throws Exception {
		if(userName == null) {
			userName = "";
		}
		StringBuffer result = new StringBuffer();
		result.append("{\"result\":[");
		
		UserDao uDao = new UserDao();
		ArrayList<UserDto> userList = uDao.getBoardList(userName);
		
		for(UserDto dto : userList) {
			result.append("{\"name\": \""+dto.getUserName()+"\",");
			result.append("\"age\": \""+dto.getUserAge()+"\",");
			result.append("\"gender\": \""+dto.getUserGender()+"\",");
			result.append("\"email\": \""+dto.getUserEmail()+"\"},");
		}
		if (result.length() > 10) {
		    result.deleteCharAt(result.length() - 1);
		}
		result.append("]}");
		System.out.println(result.toString());
		
		return result.toString();
		
	}

}
