package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommuNoticeDao;
import dao.CommunityDao;
import dto.CommuCommentsDto;
import dto.CommuNoticeDto;
import dto.CommuPostDto;
import dto.CommuPostLikeViewCommentDto;

public class PostDetailAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기로 와");
		
		
		// 로그인 user_idx
		HttpSession session = request.getSession();
		Integer userIdx = (Integer)(session.getAttribute("L_usres_idx"));
		Integer isgosu = (Integer)(session.getAttribute("isgosu"));
		
	    // 세션에서 isgosu를 가져옴, 존재하지 않으면 기본값 2 설정
		if(userIdx == null) {
			userIdx = 0;
		}
		
	    if (isgosu == null) {	
	    	// 고수일때 실행할 메서드
	    	isgosu = 2; // 기본값 2
	    }	//else{
	    	// 고수아닐때 일반회원일때 실행할 메서드
	    	// }
		//System.out.println("PostDetailAction-유저Idx (userIdx): " + userIdx);
		//System.out.println("PostDetailAction-고수Idx (isgosu): " + isgosu);
		// 여기까지 
		
		CommunityDao dao = new CommunityDao();
		CommuNoticeDao nDao = new CommuNoticeDao();
		

		int postIdx = 0;
		int commentsIdx = 0;
		boolean result = false;
		
		// 조회수 중복 증가 방지
		if(request.getParameter("post_idx") != null) {
			postIdx = Integer.parseInt(request.getParameter("post_idx"));
		} else {
			try { 
				commentsIdx = Integer.parseInt(request.getParameter("comments_idx"));
				postIdx = dao.getPostIdxFromCommentsIdx(commentsIdx);
				result = dao.postViewsOnlyOne(postIdx, userIdx);
			} catch (Exception e) {}   /* 예외가 있으면 아무짓도 하지않고 그냥 넘어가기 위한 catch */
		}
		//System.out.println("PostDetailAction - postIdx : " + postIdx);
		
		// 조회수 증가 
		if(!result) {
			try {
				dao.postViewInsert(postIdx, userIdx);
				System.out.println("insert 삭ㅈ");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		CommuPostDto postDto = null;
		ArrayList<CommuCommentsDto> listCommentDto = null;
		ArrayList<CommuNoticeDto> nList = null;
		
		 // 게시글 정보를 불러오는 메서드
		CommuPostLikeViewCommentDto likeViewDto = null;	// 게시글의 댓글수,좋아요,조회수를 불러오는 메서드
		try {
			 postDto = dao.getPostViewSelect(postIdx);
			 listCommentDto = dao.getComments(postIdx); // 게시글에 댓글을 불러오는 메서드
			 likeViewDto = dao.getLikeCommentView(postIdx);
			 nList = nDao.getNoticeList(userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("commentsIdx", commentsIdx);
		request.setAttribute("postIdx", postIdx);
		request.setAttribute("postDto", postDto);
		request.setAttribute("listCommentDto", listCommentDto);
		request.setAttribute("likeViewDto", likeViewDto);
		request.setAttribute("nList",nList);
		
		request.getRequestDispatcher("soomgoQnA_Post.jsp").forward(request, response);
		
		
	}
}
