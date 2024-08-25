package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommuServiceDao;
import dao.CommunityDao;
import dao.ProvinceTownDao;
import dto.CommuPostDto;
import dto.CommuProvinceDto;
import dto.CommuServiceCountDto;

public class PostUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postIdx = 0;
		try {
		    if (request.getParameter("post_idx") != null) {
		        postIdx = Integer.parseInt(request.getParameter("post_idx"));
		    }
		} catch (NumberFormatException e) {
		    e.printStackTrace(); // 또는 적절한 예외 처리
		}
		CommunityDao dao = new CommunityDao();
		CommuServiceDao serviceDao = new CommuServiceDao();
		ProvinceTownDao ptDao = new ProvinceTownDao();
		
		CommuPostDto dto = null;
		ArrayList<CommuServiceCountDto> listServiceCount = null;
		ArrayList<CommuProvinceDto> ptDto = null;
		try {
			dto = dao.getPostViewSelect(postIdx);
			/* 서비스 지역필터 */
			listServiceCount = serviceDao.serviceSelect();
//	    	지역 필터
			ptDto =  ptDao.getProvinceSelect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("postIdx", postIdx);
		request.setAttribute("dto", dto);
		request.setAttribute("listServiceCount", listServiceCount);
		request.setAttribute("ptDto", ptDto);
		
		request.getRequestDispatcher("SoomgoWriteUpdateForm.jsp").forward(request, response);
		
		// 게시글 업데이트
//		dao.postUpdate(dto.getPostTitle(), dto.getPostContents(), 26, 11, 6, postIdx);
	}
}
