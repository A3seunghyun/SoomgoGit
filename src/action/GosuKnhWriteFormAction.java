package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommuServiceDao;
import dao.CommunityDao;
import dao.ProvinceTownDao;
import dto.CommuPostWritePowerDto;
import dto.CommuProvinceDto;
import dto.CommuServiceCountDto;

public class GosuKnhWriteFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Integer userIdx = (Integer)request.getAttribute("L_users_idx");
		Integer isgosu = (Integer)request.getAttribute("isgosu");
		
		
		// 세션에서 isgosu를 가져옴, 존재하지 않으면 기본값 2 설정
		if (isgosu == null) {	
			// 고수일때 실행할 메서드
			isgosu = 2; // 기본값 2
		}	//else{
//		if (userIdx == null) {
//			userIdx = 0;
//		}
		// 고수아닐때 일반회원일때 실행할 메서드
		// }
		System.out.println("유저Idx (userIdx): " + userIdx);
		System.out.println("고수Idx (isgosu): " + isgosu);
		// 여기까지 
		
		CommunityDao dao = new CommunityDao();
		CommuServiceDao serviceDao = new CommuServiceDao();
		ProvinceTownDao ptDao = new ProvinceTownDao();
		
		
		ArrayList<CommuPostWritePowerDto> listWritePower = null;
		ArrayList<CommuServiceCountDto> listServiceCount = null;
		ArrayList<CommuProvinceDto> ptDto = null;
		
		try {
			listWritePower = dao.postWritePowerSelect(isgosu);
			listServiceCount =  serviceDao.serviceSelect();
			ptDto = ptDao.getProvinceSelect();
		} catch (Exception e) {e.printStackTrace(); }
		
		request.setAttribute("listWritePower", listWritePower);
		request.setAttribute("listServiceCount", listServiceCount);
		request.setAttribute("ptDto", ptDto);
		request.getRequestDispatcher("soomgoGkh_Write.jsp").forward(request, response);
		
		
		
		
	}
}
