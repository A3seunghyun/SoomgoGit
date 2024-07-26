package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MarketProductDetailDAO;
import dto.MarketProductDetailScheduleDTO;

@WebServlet("/SoomgoMarketDetailScheduleSevlet")
public class SoomgoMarketDetailScheduleSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int marketIdx = Integer.parseInt(request.getParameter("marketIdx"));
		
		HttpSession session = request.getSession();
		session.setAttribute("marketIdx", marketIdx);
		
		String dayWeek = request.getParameter("dayWeek");
		
		
		try {
			response.getWriter().write(getJSON(marketIdx,dayWeek));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getJSON(int marketIdx , String dayWeek) throws Exception {
		if(dayWeek == null || marketIdx == 0) {
			dayWeek = "";
			marketIdx = 0;
		}
		
		StringBuffer result = new StringBuffer();
		result.append("{\"result\":[");
		
		MarketProductDetailDAO mpdDao = new MarketProductDetailDAO();
		ArrayList<MarketProductDetailScheduleDTO> scheduleList = mpdDao.getMarketSchedule(marketIdx, dayWeek);
		
		for(MarketProductDetailScheduleDTO dto : scheduleList) {
			result.append("{\"stTime\": \""+dto.getStTime()+"\"},");
		}
		if (result.length() > 10) {
		    result.deleteCharAt(result.length() - 1);
		}
		result.append("]}");
		System.out.println(result.toString());
		
		return result.toString();
	}


}
