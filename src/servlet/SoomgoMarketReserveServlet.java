package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SoomgoMarketReserveServlet")
public class SoomgoMarketReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String title = request.getParameter("title");	// 상품명
		String optionTitle = request.getParameter("optionTitle");	// 옵션 명
		String optionPrice = request.getParameter("optionPrice");	// 옵션 가격
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");	// 예약 날짜
		String dayWeek = request.getParameter("dayWeek");	// 예약 요일
		String time = request.getParameter("time");	// 예약 시간
		
		request.setAttribute("title", title);
		request.setAttribute("optionTitle", optionTitle);
		request.setAttribute("optionPrice", optionPrice);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("dayWeek", dayWeek);
		request.setAttribute("time", time);
		
		RequestDispatcher rd = request.getRequestDispatcher("soomgo_market_reserve.jsp");
		rd.forward(request, response);
	}

}
