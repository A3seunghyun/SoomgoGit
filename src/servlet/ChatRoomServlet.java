package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ChatRoomDAO;

@WebServlet("/ChatRoomServlet")
public class ChatRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int chatroomIdx = Integer.parseInt(request.getParameter("chatroomIdx"));
		int myIdx = Integer.parseInt(request.getParameter("usersIdx"));
		String servletType = "chatroomServlet";
		
		ChatRoomDAO crDao = new ChatRoomDAO();
		int gosuIdx = -1;
		try {
			gosuIdx = crDao.getAnotherChatMember(chatroomIdx, myIdx);
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("서블릿] 채팅방 : "+ chatroomIdx + " 내idx : "+ myIdx +" 고수idx:"+ gosuIdx +" 타입:"+ servletType);
		
		request.setAttribute("chatroom_idx", chatroomIdx);
		request.setAttribute("myIdx", myIdx);
		request.setAttribute("gosuIdx", gosuIdx);
		request.setAttribute("servletType",servletType);
		request.getRequestDispatcher("sgRequestChatroom.jsp").forward(request, response); 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
