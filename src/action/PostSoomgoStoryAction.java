package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommunityDao;
import dao.Soomgo_headerDao;
import dto.CommunityDto;
import dto.Soomgo_header2Dto;
import dto.Soomgo_headerDto;

public class PostSoomgoStoryAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// 로그인 수정 0810
		ArrayList<Soomgo_headerDto> SoomgoHeader = new ArrayList<>(); // 초기화
		ArrayList<Soomgo_header2Dto> SoomgoHeader2 = new ArrayList<>(); // 초기화
		
		int users_idx = (int)(session.getAttribute("L_users_idx"));
		int isgosu = (int)(session.getAttribute("isgosu"));
		
		try{
			Soomgo_headerDao shdao = new Soomgo_headerDao();
			SoomgoHeader = shdao.getSoomgoHeader(users_idx);
			SoomgoHeader2 = shdao.getSoomgoHeader2(users_idx);
			
		}catch(Exception e){}
		
		
		CommunityDao cDao = new CommunityDao();
		
		ArrayList<CommunityDto> category = null;
		try {
			category = cDao.commuTitleSelect();
		} catch (Exception e) {e.printStackTrace(); }
		
		request.setAttribute("category", category);
		
		request.getRequestDispatcher("soomgoStory.jsp").forward(request, response);
		
	}

}
