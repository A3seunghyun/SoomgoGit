package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MarketGosuInfoDAO;
import dao.MarketProductDetailDAO;
import dto.MarketGosuInfoDTO;
import dto.MarketOptionDTO;
import dto.MarketProductAskDTO;
import dto.MarketProductDetailDTO;
import dto.MarketProductDetatilimgDTO;
import dto.MarketProductQnaDTO;

public class MarketProductDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int marketIdx = Integer.parseInt(request.getParameter("market_idx"));
		String marketTitle = request.getParameter("market_title");
		
		// 여기서부터 (로그인 헤더)
		
		HttpSession session = request.getSession();
        Integer userIdx = LoginSessionUtils.getUserIdx(session);
        Integer isgosu = LoginSessionUtils.getIsGosu(session);
		
		System.out.println(userIdx + " " + isgosu);
		
		request.setAttribute("session", session);
		session.setAttribute("L_users_idx", userIdx);
		session.setAttribute("isgosu", isgosu);

		// 여기까지
		
		MarketProductDetailDAO mpddao = new MarketProductDetailDAO();
		
		ArrayList<MarketProductDetailDTO> mpd = null;
		ArrayList<MarketProductDetatilimgDTO> mpdimg = null;
		ArrayList<MarketOptionDTO> mop = null;
		ArrayList<MarketProductAskDTO> marketask = null;
		ArrayList<MarketProductQnaDTO> mpq = null;
		
		MarketGosuInfoDAO mgidao = new MarketGosuInfoDAO();
		
		ArrayList<MarketGosuInfoDTO> gosuinfo = null;
		
		Calendar cal = Calendar.getInstance();
    	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
    	String todayDayOfWeek = "";
    	switch(dayOfWeek) {
    		case 1:
    			todayDayOfWeek = "일";
    			break;
    		case 2:
    			todayDayOfWeek = "월";
    			break;
    		case 3:
    			todayDayOfWeek = "화";
    			break;
    		case 4:
    			todayDayOfWeek = "수";
    			break;
    		case 5:
    			todayDayOfWeek = "목";
    			break;
    		case 6:
    			todayDayOfWeek = "금";
    			break;
    		case 7:
    			todayDayOfWeek = "토";
    			break;
    	}
		
		try {
			mpd = mpddao.mpdlist(marketIdx);
			mpdimg = mpddao.mpdimglist(marketIdx);
			mop = mpddao.molist(marketIdx);
			marketask = mpddao.getMarketAsk(marketIdx);
			mpq = mpddao.getMarketQna(marketIdx);
			
			gosuinfo = mgidao.gosuinfo(marketIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("market_idx", marketIdx);
		request.setAttribute("marketTitle", marketTitle);
		request.setAttribute("mpd", mpd);
		request.setAttribute("mpdimg", mpdimg);
		request.setAttribute("mop", mop);
		request.setAttribute("marketask", marketask);
		request.setAttribute("mpq", mpq);
		request.setAttribute("gosuinfo", gosuinfo);
		
		request.setAttribute("mpddao", mpddao);
		request.setAttribute("mgidao", mgidao);
		request.setAttribute("todayDayOfWeek", todayDayOfWeek);
		
		request.getRequestDispatcher("soomgo_market_detail.jsp").forward(request, response);
		
	}

}
