package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommunityDao;

public class PostWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");   // POST방식에서의 한글깨짐 방지.

    	// session 객체를 서블릿에서 써야할 때에는 이렇게.
    	HttpSession session = request.getSession();
    	
    	//int loginUserIdx = 19;   // 가정. (테스트)
		int loginUserIdx = (Integer) session.getAttribute("L_users_idx");
    	
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	Integer serviceIdx = null;
    	if(request.getParameter("input_service_idx") != null && !request.getParameter("input_service_idx").equals(""))
    		serviceIdx = Integer.parseInt(request.getParameter("input_service_idx"));
    	Integer townIdx = null;
    	if(request.getParameter("input_town_idx") != null && !request.getParameter("input_town_idx").equals(""))
    		townIdx = Integer.parseInt(request.getParameter("input_town_idx"));
    	int commuIdx = Integer.parseInt(request.getParameter("commuIdx"));

    	CommunityDao pwDao = new CommunityDao();
    	int newPostIdx = 0;
    	
    	try {
    		newPostIdx = pwDao.postWrite(loginUserIdx, title, content, serviceIdx, townIdx, commuIdx);
    	} catch(Exception e) { e.printStackTrace(); }
    	// soomgoQnA_Post.jsp?post_idx=<%=newPostIdx%>
    	
    	System.out.println("Controller?command=post_detail&post_idx=" + newPostIdx);
    	request.getRequestDispatcher("Controller?command=post_detail&post_idx=" + newPostIdx).forward(request, response);
	}
}
