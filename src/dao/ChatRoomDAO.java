package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.CategoryDTO;
import dto.ChatContentsDTO;

public class ChatRoomDAO {
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		return conn;
	}
	
	public ArrayList<ChatContentsDTO> getChatContentsByChatRoom(int chatIdx) throws Exception {
		// 특정 채팅방--  채팅내용
		Connection conn = getConnection();
		
		String sql = "SELECT *" +
				" FROM chat_contents" +
				" WHERE chatroom_idx = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		pstmt.setInt(1, chatIdx);

		ArrayList<ChatContentsDTO> chatContentsList = new ArrayList<ChatContentsDTO>();

		while (rs.next()) {
			ChatContentsDTO dto = new ChatContentsDTO(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getInt(7));
			chatContentsList.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return chatContentsList;
	}
}
