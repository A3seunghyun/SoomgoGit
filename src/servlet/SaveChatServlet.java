package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChatRoomDAO;
import dto.ChatContentsDTO;

@WebServlet("/SaveChatServlet")
public class SaveChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message = request.getParameter("my_chatting");
		/*
		String file = request.getParameter("file")
		*/
		
		try {
			int chatRoomIdx= Integer.parseInt(request.getParameter("chatroom_idx").toString());
			int usersIdx =  Integer.parseInt(request.getParameter("my_idx").toString());
			System.out.println(message + "|"+ chatRoomIdx + "|"+ usersIdx);
			
			ChatRoomDAO crDAO = new ChatRoomDAO();
			crDAO.insertChatContents(chatRoomIdx, usersIdx, message);
			ArrayList<ChatContentsDTO> crDTO = crDAO.getChatContentsByChatRoom(chatRoomIdx);
			
			// soomgo_chat_room 로 이동
			HttpSession session = request.getSession();
			session.setAttribute("servletType", "chatContentsServlet");
			session.setAttribute("chatroomIdx", chatRoomIdx);
			session.setAttribute("myIdx", 1);
			session.setAttribute("crDTO", crDTO);
		
		} catch(Exception e) {
			System.out.println("서블릿에서 오류발생");
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("sgRequestChatroom.jsp");
		rd.forward(request, response);
	}

}
