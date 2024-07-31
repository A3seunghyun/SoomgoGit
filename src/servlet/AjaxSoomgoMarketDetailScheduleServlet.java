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

import dao.MarketProductDetailDAO;
import dto.MarketProductDetailScheduleDTO;

@WebServlet("/AjaxSoomgoMarketDetailScheduleServlet")
public class AjaxSoomgoMarketDetailScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int marketIdx = Integer.parseInt(request.getParameter("marketIdx"));
		String dayWeek = request.getParameter("dayWeek");
		
		MarketProductDetailDAO mpddao = new MarketProductDetailDAO();
		ArrayList<MarketProductDetailScheduleDTO> mpdSlist = null;
		
		try {
			mpdSlist = mpddao.getMarketSchedule(marketIdx, dayWeek);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		JSONArray array = new JSONArray();
		for(MarketProductDetailScheduleDTO dto : mpdSlist) {
			JSONObject obj = new JSONObject();
			obj.put("stTime", dto.getStTime());
			array.add(obj);
		}
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(array);
	}

}
