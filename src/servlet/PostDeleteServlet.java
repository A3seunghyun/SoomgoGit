package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommunityDao;
@WebServlet("/PostDeleteServlet")
public class PostDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postIdx = Integer.parseInt(request.getParameter("post_idx"));
		
		System.out.println("삭제된 게시글번호: " + postIdx);
		
		CommunityDao dao = new CommunityDao();
		
		
		// 인설트했던 좋아요, 댓글, 도 다 같이 DELETE 해야 하는건지?
		try {
			dao.postDelete(postIdx);
			dao.commentsDelete(postIdx);
			dao.postLikeDelete(postIdx);
			dao.postViewDelete(postIdx);
			dao.postImgDelete(postIdx);
			System.out.println("실행됨");
		} catch (Exception e) {
			e.printStackTrace();
		}
//		RequestDispatcher rd = request.getRequestDispatcher("soomgoCommu.jsp");
//		rd.forward(request, response);
		response.sendRedirect("soomgoCommu.jsp");
		
		
	}
}
