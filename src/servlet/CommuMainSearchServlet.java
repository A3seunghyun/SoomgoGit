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

import dao.CommuServiceDao;
import dto.CommuServiceList;

@WebServlet("/mainSearchServlet")
public class CommuMainSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("요청 들어옴");
		String searchText = request.getParameter("search_text");
		
		CommuServiceDao sDao = new CommuServiceDao();
		ArrayList<CommuServiceList> listService = null;
		try {
			listService = sDao.getServiceList(searchText);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setContentType("application/json; charset=utf-8");
		JSONArray array1 = new JSONArray();
		for(CommuServiceList dto : listService) {
			JSONObject obj = new JSONObject();
			obj.put("service_idx", dto.getServiceIdx());
			obj.put("service_title", dto.getServieTitle());
			array1.add(obj);
		}
		PrintWriter writer = response.getWriter();
		writer.print(array1);
	}
}
