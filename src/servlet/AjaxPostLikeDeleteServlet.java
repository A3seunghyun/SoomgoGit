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

@WebServlet("/AjaxPostLikeDeleteServlet")
public class AjaxPostLikeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("c->s 요청 옴");
		
		int paramPostIdx = Integer.parseInt(request.getParameter("post_idx"));
		int paramUserIdx = Integer.parseInt(request.getParameter("user_idx"));
		
		CommunityDao pDao = new CommunityDao();
		
		try {
			pDao.likeDelete(paramPostIdx, paramUserIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// s -> c로 응답 만들어줌
		response.setContentType("application/json; charset=utf-8" );
		PrintWriter writer = response.getWriter();
		JSONObject obj = new JSONObject();
		obj.put("result","success");
		writer.print(obj);
		
		
	}

}
