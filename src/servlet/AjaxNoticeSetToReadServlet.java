package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.CommuNoticeDao;

@WebServlet("/AjaxNoticeSetToReadServlet")
public class AjaxNoticeSetToReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userIdx = Integer.parseInt(request.getParameter("user_idx"));
		
		CommuNoticeDao dao = new CommuNoticeDao();
		
		try {
			dao.noticeSetToRead(userIdx);
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
