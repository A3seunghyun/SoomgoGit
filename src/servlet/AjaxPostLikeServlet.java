package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.CommunityDao;

@WebServlet("/AjaxPostLIkeServlet")
public class AjaxPostLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("요청 들어옴");
		
		int paramPostIdx = Integer.parseInt(request.getParameter("post_idx"));
		int paramUsersIdx = Integer.parseInt(request.getParameter("users_idx"));
		
//		System.out.println("paramPostIdx : " + paramPostIdx);
//		System.out.println("paramUsersIdx : " + paramUsersIdx);

		CommunityDao pDao = new CommunityDao();
		try {
			pDao.likeInsert(paramPostIdx, paramUsersIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 응답을 만들어 줌
		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		JSONObject obj = new JSONObject();
		obj.put("result", "success");
		writer.print(obj);
	}
}
