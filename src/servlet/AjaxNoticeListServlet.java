package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.CommuNoticeDao;
import dto.CommuNoticeDto;
import dto.CommuServiceList;

@WebServlet("/AjaxNoticeListServlet")
public class AjaxNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("...ohm");
		System.out.println("user_idx : " + request.getParameter("user_idx"));
		
		CommuNoticeDao nDao = new CommuNoticeDao();
		ArrayList<CommuNoticeDto> list = null;
		
		int userIdx = Integer.parseInt(request.getParameter("user_idx"));
		try {
			list = nDao.getNoticeList(userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.setContentType("application/json; charset=utf-8");
		JSONArray array1 = new JSONArray();
		for(CommuNoticeDto dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("chat_idx", dto.getChatIdx());
			obj.put("estimate_idx", dto.getEstimateIdx());
			obj.put("comments_idx", dto.getCommentsIdx());
			obj.put("notice_date", dto.getNoticeDate().substring(2,10));
			obj.put("message", dto.getMessage());
			obj.put("name", dto.getName());
			obj.put("svc_name", dto.getServiceName());
			array1.add(obj);
		}
		PrintWriter writer = response.getWriter();
		writer.print(array1);
	}
}
