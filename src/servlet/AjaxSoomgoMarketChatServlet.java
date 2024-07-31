package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.MarketChatBotDAO;
import dto.MarketChatContentsDTO;

@WebServlet("/AjaxSoomgoMarketChatServlet")
public class AjaxSoomgoMarketChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getContextPath();
		System.out.println(url);
		
		int roomIdx = Integer.parseInt(request.getParameter("roomIdx"));
		System.out.println("채팅방 IDX 넘어옴 : " + roomIdx);
		
		MarketChatBotDAO mccDao = new MarketChatBotDAO();
		
		ArrayList<MarketChatContentsDTO> chatContents = null;
		
		try {
			chatContents = mccDao.getMarketChatContents(roomIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		JSONArray array = new JSONArray();
		for(MarketChatContentsDTO dto : chatContents) {
			JSONObject obj = new JSONObject();
			obj.put("usersIdx", dto.getUsersIdx());
			obj.put("roomIdx", dto.getChatRoomIdx());
			obj.put("contents", dto.getContents());
			array.add(obj);
		}
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(array);
	}

}
