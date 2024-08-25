package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PostsoomgoStoryDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		    
		    
//		    request.getRequestDispatcher("soomgoStory.jsp").forward(request, response);  상세 페이지가 없어짐....????!!!
	}

}
