package servlet;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import dao.CommunityDao;

@WebServlet("/PostViewInsertServlet")
public class PostViewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int postIdx = Integer.parseInt(request.getParameter("post_idx"));
//		int usersIdx = 12;
////		int postIdx = 124;
//		
//		System.out.println(postIdx);
//		
//		CommunityDao dao = new CommunityDao();
//		boolean result = false;
//		
//		try {
//			//DB에 count가 1인지 0인지, 1이면true, 0이면 false
//			result = dao.postViewsOnlyOne(postIdx, usersIdx);
//			System.out.println("only삭제 - result:" + result);
//		
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		if(result) {
//			RequestDispatcher rd = request.getRequestDispatcher("soomgoQnA_Post.jsp");
//			rd.forward(request, response);
//			
//		} else {
//			
//			try {
//				dao.postViewInsert(postIdx, usersIdx);
//				System.out.println("insert 삭ㅈ");
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			RequestDispatcher rd = request.getRequestDispatcher("soomgoQnA_Post.jsp");
//			rd.forward(request, response);
//		}
//		
//		
//		
	}

}
