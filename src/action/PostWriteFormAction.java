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
import dto.CommuPostWritePowerDto;
import dto.CommuProvinceDto;
import dto.CommuServiceCountDto;

public class PostWriteFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Integer userIdx = (Integer)(session.getAttribute("L_users_idx"));
		Integer isgosu = (Integer)(session.getAttribute("isgosu"));
		
	
		int commuIdx = Integer.parseInt(request.getParameter("commu_idx"));
		String selected = request.getParameter("selected");   // ex. 함께해요

		// 세션에서 isgosu를 가져옴, 존재하지 않으면 기본값 2 설정
				if (isgosu == null) {	
					// 고수일때 실행할 메서드
					isgosu = 2; // 기본값 2
				}	//else{
//				if (userIdx == null) {
//					userIdx = 0;
//				}
				// 고수아닐때 일반회원일때 실행할 메서드
				// }
				System.out.println("유저Idx (userIdx): " + userIdx);
				System.out.println("고수Idx (isgosu): " + isgosu);
				// 여기까지 
		
		
		CommunityDao dao = new CommunityDao();
		CommuServiceDao serviceDao = new CommuServiceDao();
		ProvinceTownDao ptDao = new ProvinceTownDao();
		CommuNoticeDao nDao = new CommuNoticeDao();
		
		ArrayList<CommuPostWritePowerDto> listWritePower = null;
		ArrayList<CommuServiceCountDto> listServiceCount = null;
		ArrayList<CommuProvinceDto> ptDto = null;
		ArrayList<CommuNoticeDto>nList = null;
		
		try {
			listWritePower = dao.postWritePowerSelect(isgosu);
			listServiceCount =  serviceDao.serviceSelect();
			ptDto = ptDao.getProvinceSelect();
			nList = nDao.getNoticeList(userIdx);
		} catch (Exception e) {e.printStackTrace(); }
		
		request.setAttribute("listWritePower", listWritePower);
		request.setAttribute("listServiceCount", listServiceCount);
		request.setAttribute("ptDto", ptDto);
		request.setAttribute("nList", nList);
		request.getRequestDispatcher("soomgoWrite.jsp").forward(request, response);
		
		
		 
		
		
	}
}
