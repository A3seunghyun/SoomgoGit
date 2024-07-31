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
		
		boolean result = false;
		
		try {
			result = mccDao.getMarketChatContentsCnt(roomIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		JSONArray array = new JSONArray();
		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if(result) {
			try {
				chatContents = mccDao.getMarketChatContents(roomIdx);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			for(MarketChatContentsDTO dto : chatContents) {
				JSONObject obj = new JSONObject();
				System.out.println(dto.getChatRoomIdx());
				obj.put("roomIdx", dto.getChatRoomIdx());
				obj.put("usersIdx", dto.getUsersIdx());
				obj.put("contents", dto.getContents());
				array.add(obj);
				writer.print(array);
				
			}
		} else {
//			try {
//				chatContents = mccDao.getMarketChatContents(roomIdx);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			
			int idx = roomIdx;
//			System.out.println(idx);
//			for(MarketChatContentsDTO dto : chatContents) {
				JSONObject obj = new JSONObject();
//				System.out.println(dto.getChatRoomIdx());
				obj.put("roomIdx", idx);
				writer.print(obj);
//				array.add(obj);
//			}
		}
		
		
		
		
	}

}
