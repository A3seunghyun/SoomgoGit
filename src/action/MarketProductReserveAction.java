package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MarketProductReserveAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 여기서부터 (로그인 헤더)
		
		HttpSession session = request.getSession();
		Integer userIdx = LoginSessionUtils.getUserIdx(session);
		Integer isgosu = LoginSessionUtils.getIsGosu(session);
				
		System.out.println(userIdx + " " + isgosu);
				
		request.setAttribute("session", session);
		session.setAttribute("L_users_idx", userIdx);
		session.setAttribute("isgosu", isgosu);

		// 여기까지
		int marketIdx = Integer.parseInt(request.getParameter("marketIdx"));
		int optionIdx = Integer.parseInt(request.getParameter("optionIdx"));
		int scheduleIdx = Integer.parseInt(request.getParameter("scheduleIdx"));
		String title = request.getParameter("title");	// 상품명
		String optionTitle = request.getParameter("optionTitle");	// 옵션 명
		String optionPrice = request.getParameter("optionPrice");	// 옵션 가격
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");	// 예약 날짜
		String dayWeek = request.getParameter("dayWeek");	// 예약 요일
		String time = request.getParameter("time");	// 예약 시간
		
		request.setAttribute("marketIdx", marketIdx);
		request.setAttribute("optionIdx", optionIdx);
		request.setAttribute("scheduleIdx", scheduleIdx);
		request.setAttribute("title", title);
		request.setAttribute("optionTitle", optionTitle);
		request.setAttribute("optionPrice", optionPrice);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("dayWeek", dayWeek);
		request.setAttribute("time", time);
		
		request.getRequestDispatcher("soomgo_market_reserve.jsp").forward(request, response);
	}

}
