package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommunityDao;
import dao.Soomgo_headerDao;
import dto.CommuPostListDto;
import dto.CommuPostWritePowerDto;
import dto.CommunityDto;
import dto.GosuKnowHowListDto;
import dto.Soomgo_header2Dto;
import dto.Soomgo_headerDto;

public class GosuKnhListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 수정 0810
		ArrayList<Soomgo_headerDto> SoomgoHeader = new ArrayList<>(); // 초기화
		ArrayList<Soomgo_header2Dto> SoomgoHeader2 = new ArrayList<>(); // 초기화
		
		HttpSession session = request.getSession();
		int users_idx = (int)(session.getAttribute("L_users_idx"));
		int isgosu = (int)(session.getAttribute("isgosu"));
		
		try{
			Soomgo_headerDao shdao = new Soomgo_headerDao();
			SoomgoHeader = shdao.getSoomgoHeader(users_idx);
			SoomgoHeader2 = shdao.getSoomgoHeader2(users_idx);
			
		}catch(Exception e){}
		
		Integer townIdx = null;
   		Integer serviceIdx = null;
   		Integer commuIdx = Integer.parseInt(request.getParameter("commuIdx"));
   		  /* 메인에서 클리한 커뮤idx에 따라 게시글 리스트가 달라짐 */
   		    	
   		  // 커뮤니티 게시글 리스트 조회 지역, 서비스 선택 없을시
   		if(request.getParameter("townIdx") != null)
   		   townIdx = Integer.parseInt(request.getParameter("townIdx").trim());
   		if(request.getParameter("serviceIdx") != null)
   		   serviceIdx = Integer.parseInt(request.getParameter("serviceIdx").trim());
		
		
		
		CommunityDao cDao = new CommunityDao();
		
		ArrayList<CommunityDto> commuDto = null;
		// 		고수노하우 포스트 리스트 조회
		ArrayList<GosuKnowHowListDto> list = null;
		ArrayList<CommuPostListDto> pList = null;
		ArrayList<CommuPostWritePowerDto> listPostWritePower = null;
		
   		try {
   			commuDto = cDao.commuTitleSelect();
   			list = cDao.getGosuKnowHowList();
   			pList = cDao.getListPostSelect(commuIdx, serviceIdx, townIdx);
   			listPostWritePower = cDao.postWritePowerSelect(isgosu);
		} catch (Exception e) {e.printStackTrace(); }
   		        	
   		request.setAttribute("commuIdx", commuIdx);     	
   		request.setAttribute("commuDto", commuDto);	
   		request.setAttribute("list", list);
   		request.setAttribute("pList", pList);
   		request.setAttribute("listPostWritePower", listPostWritePower);
   		
   		request.getRequestDispatcher("soomgoG_knowHow.jsp").forward(request, response);
   	
	}
}
