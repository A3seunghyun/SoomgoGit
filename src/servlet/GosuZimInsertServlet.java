package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.Gosu_zim_InsertDao;

@WebServlet("/GosuZimInsertServlet")
public class GosuZimInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("post 요청 들어옴");
//		int users_idx1 = Integer.parseInt(request.getParameter("users_idx1"));
//		int users_idx = Integer.parseInt(request.getParameter("users_idx"));
//		System.out.println("서버에 들어온 데이터 users_idx: " + users_idx1);
//		System.out.println("서버에 들어온 데이터 g_users_idx: " + users_idx);
		
		 response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");

	        JSONObject jsonResponse = new JSONObject();

	        try {
	            int users_idx1 = Integer.parseInt(request.getParameter("users_idx1"));
	            int users_idx = Integer.parseInt(request.getParameter("users_idx"));

	            System.out.println("서버에 들어온 데이터 users_idx1: " + users_idx1);
	            System.out.println("서버에 들어온 데이터 g_users_idx: " + users_idx);

	            if (users_idx == 0) {
	                jsonResponse.put("status", "error");
	                jsonResponse.put("message", "로그인이 필요합니다.");
	                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	            } else {
	                Gosu_zim_InsertDao dao = new Gosu_zim_InsertDao();
	                dao.GosuZimInsert(users_idx1, users_idx);
	                jsonResponse.put("status", "success");
	                response.setStatus(HttpServletResponse.SC_OK);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            jsonResponse.put("status", "error");
	            jsonResponse.put("message", e.getMessage());
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        }

	        response.getWriter().write(jsonResponse.toString());
	    }
	}