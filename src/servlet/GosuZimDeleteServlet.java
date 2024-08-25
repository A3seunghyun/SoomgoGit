package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.Gosu_zim_DeleteDao;

@WebServlet("/GosuZimDeleteServlet")
public class GosuZimDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post 요청 들어옴");
		int users_idx = Integer.parseInt(request.getParameter("users_idx"));
		System.out.println("서버에 들어온 데이터 users_idx" + users_idx);
		int g_users_idx = Integer.parseInt(request.getParameter("g_users_idx"));
		System.out.println("서버에 들어온 데이터 g_users_idx" + g_users_idx);
		
		 

		 Gosu_zim_DeleteDao dao = new Gosu_zim_DeleteDao();

	        try {
	            // Perform the delete operation
	            dao.GosuZimDelete(users_idx, g_users_idx);
	            
	            // Create a JSON response object
	            JSONObject jsonResponse = new JSONObject();
	            jsonResponse.put("status", "success");
	            jsonResponse.put("message", "Delete operation completed successfully.");

	            // Set response content type and character encoding
	            response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	            response.getWriter().write(jsonResponse.toString());
	        } catch (Exception e) {
	            e.printStackTrace();
	            JSONObject jsonResponse = new JSONObject();
	            jsonResponse.put("status", "error");
	            jsonResponse.put("message", "An error occurred: " + e.getMessage());
	            
	            response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	            response.getWriter().write(jsonResponse.toString());
	        }
	    }
	}