package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MarketProductReserveDAO;

public class MarketProductReserveCompleteAction implements Action {

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
		int usersIdx = userIdx;
		int optionIdx = Integer.parseInt(request.getParameter("optionIdx"));
		int scheduleIdx = Integer.parseInt(request.getParameter("scheduleIdx"));
		// priceIdx
		// scheduleIdx
		
		System.out.println("marketIdx : " + marketIdx);
		System.out.println("usersIdx : " + usersIdx);
		System.out.println("optionIdx : " + optionIdx);
		System.out.println("scheduleIdx : " + scheduleIdx);
				
		MarketProductReserveDAO mprdao = new MarketProductReserveDAO();
		try {
			mprdao.reserve(marketIdx, usersIdx, optionIdx, scheduleIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("soomgo_market_reserve_success.jsp").forward(request, response);
		
		
		
	}

}
