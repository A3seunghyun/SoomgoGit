package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommuNoticeDao;
import dao.CommuServiceDao;
import dao.CommunityDao;
import dao.ProvinceTownDao;
import dto.CommuHotTopicList;
import dto.CommuLatestPhotoReviewsList;
import dto.CommuNoticeDto;
import dto.CommuPostListDto;
import dto.CommuPostWritePowerDto;
import dto.CommuProvinceDto;
import dto.CommuServiceCountDto;
import dto.CommunityDto;

public class CommuMainListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 user_idx
		HttpSession session = request.getSession();
		Integer userIdx = (Integer)(session.getAttribute("L_users_idx"));
		Integer isgosu = (Integer)(session.getAttribute("isgosu"));
		
	    // 세션에서 isgosu를 가져옴, 존재하지 않으면 기본값 2 설정
//		if(userIdx == null) {
//			userIdx = 0;
//		}
		
	    if (isgosu == null) {	
	    	// 고수일때 실행할 메서드
	    	isgosu = 2; // 기본값 2
	    }	//else{
	    	// 고수아닐때 일반회원일때 실행할 메서드
	    	// }
		System.out.println("유저Idx : " + userIdx);
		System.out.println("고수Idx : " + isgosu);
		// 여기까지 
		
		// 로그인
//		request.setAttribute("session", session);
//		session.setAttribute("L_users_idx", userIdx);
//		session.setAttribute("isgosu", isgosu);
		// 여기까지 
		
		
		
		
		CommunityDao cDao = new CommunityDao();
		CommuServiceDao serviceDao = new CommuServiceDao();
		ProvinceTownDao ptDao = new ProvinceTownDao();
		CommuNoticeDao nDao = new CommuNoticeDao();

		
//		ArrayList<CommuPostWritePowerDto> listPostWritePower = cDao.postWritePowerSelect(isgosu);  
		
		
		// soomgoCommu.jsp?commuIdx=1 
		// --> request.getParameter("commuIdx") : "1"
		// --> Integer.parseInt("1") : 1
		
//		이 코드도 옮겨오는게 맞는건지?
		Integer commuIdx = 0;	// 받아온 값이 없으면 0 (전체)가 기본값
		Integer townIdx = null;
		Integer serviceIdx = null;
		if(request.getParameter("commuIdx") != null)
			commuIdx = Integer.parseInt(request.getParameter("commuIdx"));
		if(request.getParameter("townIdx") != null)
			townIdx = Integer.parseInt(request.getParameter("townIdx"));
		if(request.getParameter("serviceIdx") != null)
			serviceIdx = Integer.parseInt(request.getParameter("serviceIdx"));
		
		
		
		
		/* 커뮤니티 전체 게시글을 뿌려주는 메서드 */
		
		ArrayList<CommuPostListDto> listPost = null; 
		ArrayList<CommunityDto> category = null;
		ArrayList<CommuServiceCountDto> listServiceCount = null;
		ArrayList<CommuProvinceDto> ptDto = null;
		ArrayList<CommuHotTopicList>hList = null;
		ArrayList<CommuLatestPhotoReviewsList> list = null;
		ArrayList<CommuPostWritePowerDto> listPostWritePower = null;
		ArrayList<CommuNoticeDto> nList = null;
		
		try {
			listPost = cDao.getListPostSelect(commuIdx, townIdx, serviceIdx);
			category = cDao.commuTitleSelect();
			listServiceCount =  serviceDao.serviceSelect();
			ptDto = ptDao.getProvinceSelect();
			hList = cDao.hotTopic();
			list = cDao.latestPhotoReviews();
			listPostWritePower = cDao.postWritePowerSelect(isgosu);
			nList = nDao.getNoticeList(userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		
		request.setAttribute("commuIdx", commuIdx);
		request.setAttribute("townIdx", townIdx);
		request.setAttribute("serviceIdx", serviceIdx);
		request.setAttribute("listPost", listPost);
		request.setAttribute("category", category);
		request.setAttribute("listServiceCount", listServiceCount);
		request.setAttribute("ptDto", ptDto);
		request.setAttribute("hList", hList);
		request.setAttribute("list", list);
		request.setAttribute("listPostWritePower", listPostWritePower);
		request.setAttribute("nList",nList);
		
		request.getRequestDispatcher("soomgoCommu.jsp").forward(request, response);
	}
}
