package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SoomgoMypageAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// 여기서부터 (로그인 헤더)
//		
//		HttpSession session = request.getSession();
//        Integer userIdx = LoginSessionUtils.getUserIdx(session);
//        Integer isgosu = LoginSessionUtils.getIsGosu(session);
//		
//		System.out.println(userIdx + " " + isgosu);
//		
//		request.setAttribute("session", session);
//		session.setAttribute("L_users_idx", userIdx);
//		session.setAttribute("isgosu", isgosu);
//		// 여기까지
		
		request.getRequestDispatcher("soomgo_Mypage.jsp").forward(request, response);
		
	}

}
