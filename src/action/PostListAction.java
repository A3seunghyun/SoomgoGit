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
import dto.CommuNoticeDto;
import dto.CommuPostListDto;
import dto.CommuPostWritePowerDto;
import dto.CommuProvinceDto;
import dto.CommuServiceCountDto;
import dto.CommunityDto;

public class PostListAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("들어옴");
		
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
		System.out.println("고수 isgosu : " + isgosu);   // 0 : not gosu, 1 : gosu.
		// 여기까지 
		
		
		
		Integer townIdx = null;
		Integer serviceIdx = null;
	 	Integer commuIdx = Integer.parseInt(request.getParameter("commuIdx"));
	 	/* 메인에서 클리한 커뮤idx에 따라 게시글 리스트가 달라짐 */
	 	
	 	if(request.getParameter("townIdx") != null)
	 		townIdx = Integer.parseInt(request.getParameter("townIdx"));
	 	if(request.getParameter("serviceIdx") != null)
	 		serviceIdx = Integer.parseInt(request.getParameter("serviceIdx"));
	 	System.out.println("serviceIdx: " + serviceIdx);
		
		CommunityDao cDao = new CommunityDao();
		CommuServiceDao serviceDao = new CommuServiceDao();
		ProvinceTownDao ptDao = new ProvinceTownDao();
		CommuNoticeDao noticeDao = new CommuNoticeDao();

		ArrayList<CommuServiceCountDto> listServiceCount = null;
		ArrayList<CommunityDto> commuDto = null;
		ArrayList<CommuPostListDto> pList = null;
	 	ArrayList<CommuProvinceDto> ptDto = null;
	 	ArrayList<CommuPostWritePowerDto> listPostWritePower = null;
	 	ArrayList<CommuNoticeDto> nList = null;

		try {
			listServiceCount = serviceDao.serviceSelect();
			commuDto = cDao.commuTitleSelect();
			pList = cDao.getListPostSelect(commuIdx, serviceIdx, townIdx);
			ptDto = ptDao.getProvinceSelect();
			listPostWritePower = cDao.postWritePowerSelect(isgosu);   /* (위에 코드 빼놓음) */
			nList = noticeDao.getNoticeList(userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
	 	
		
		request.setAttribute("commuIdx", commuIdx);
		request.setAttribute("townIdx", townIdx);
		request.setAttribute("serviceIdx", serviceIdx);
	 	request.setAttribute("listServiceCount", listServiceCount);
	 	request.setAttribute("commuDto", commuDto);
	 	request.setAttribute("pList", pList);
	 	request.setAttribute("ptDto", ptDto);
	  	request.setAttribute("listPostWritePower", listPostWritePower);
	  	request.setAttribute("nList", nList);
	  	
	 	request.getRequestDispatcher("soomgoQnA2.jsp").forward(request, response);
		
		
	}
}
