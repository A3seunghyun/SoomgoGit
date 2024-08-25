package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommunityDao;
import dao.Soomgo_headerDao;
import dto.CommuGkhpostFooterDto;
import dto.CommuGosuKnowhowPostDto;
import dto.CommuPostLikeViewCommentDto;
import dto.Soomgo_header2Dto;
import dto.Soomgo_headerDto;

public class GosuKnhDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//여기부터 헤더 =================================
		/* ArrayList<Soomgo_headerDto> SoomgoHeader = new ArrayList<>(); // 초기화
		ArrayList<Soomgo_header2Dto> SoomgoHeader2 = new ArrayList<>(); // 초기화
		
//		HttpSession hs = request.getSession();
		HttpSession hs = (HttpSession)request.getAttribute("hs");
		
		int users_idx = (int)(hs.getAttribute("L_users_idx"));
		int isgosu = (int)(hs.getAttribute("isgosu"));
		
		try{
			Soomgo_headerDao shdao = new Soomgo_headerDao();
			SoomgoHeader = shdao.getSoomgoHeader(users_idx);
			SoomgoHeader2 = shdao.getSoomgoHeader2(users_idx);
			
		}catch(Exception e){} 
		*/
		
		
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

//		여기까지 헤더=================================
		
		int postIdx = Integer.parseInt(request.getParameter("post_idx"));
//		Integer commuIdx = Integer.parseInt(request.getParameter("commuIdx"));
		
		CommunityDao gDao = new CommunityDao();
		
		
		ArrayList<CommuGosuKnowhowPostDto> gDto = null;
		CommuPostLikeViewCommentDto likeViewDto = null; // 게시글의 댓글수,좋아요,조회수를 불러오는 메서드
		//게시글 정보를 불러올 Dto
		ArrayList<CommuGkhpostFooterDto> gList = null;
		// GosuKnowhowPostDto에서 반복할것들과 반복하지 않을 것들을 구분하기 위함    
		CommuGosuKnowhowPostDto mainDto = null;
		try {
			gDto = gDao.getGkhPost(postIdx);
			likeViewDto = gDao.getLikeCommentView(postIdx);	
			gList = gDao.getGkhPostFooter();
			mainDto = gDto.isEmpty() ? null : gDto.get(0);
			// isEmpty() 메서드는 리스트가 비어 있으면 true, 그렇지 않으면 false를 반환
			// gDto가 비어 있지 않으면, gDto.get(0)을 반환합니다. gDto의 첫 번째 요소를 반환
		} catch (Exception e) {e.printStackTrace();}  
		
//		request.setAttribute("commuIdx", commuIdx);
		request.setAttribute("postIdx", postIdx);
		request.setAttribute("gDto", gDto);
		request.setAttribute("likeViewDto", likeViewDto);
		request.setAttribute("gList", gList);
		request.setAttribute("mainDto", mainDto);
		
		request.getRequestDispatcher("soomgoGosu_knowhow_post.jsp").forward(request, response);
		
		
		
		
		
	}
}
