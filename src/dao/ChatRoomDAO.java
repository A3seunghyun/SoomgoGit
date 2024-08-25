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
	
	public int  getAnotherChatMember(int chatroom_idx, int my_idx) throws Exception {
		// 채팅방 상대방 idx 가져오기
		Connection conn = getConnection();
		String sql = "SELECT users_idx FROM chat_member WHERE chatroom_idx = ? AND users_idx != ?";
		int users_idx = -1;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = null;
		try {
			pstmt.setInt(1, chatroom_idx);
			pstmt.setInt(2, my_idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				users_idx = rs.getInt(1);
	        }
		} catch(Exception e) {
			e.printStackTrace();
		} 
		rs.close();
		pstmt.close();
		conn.close();
		
		return users_idx;
	}
	
	public ArrayList<ChatContentsDTO> getChatContentsByChatRoom(int chatIdx) throws Exception {
		// 특정 채팅방--  채팅내용
		Connection conn = getConnection();
		
		String sql = "SELECT * FROM chat_contents WHERE chatroom_idx = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, chatIdx);
		
		ResultSet rs = pstmt.executeQuery();
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
	
	public void insertChatContents(int chatroomIdx, int usersIdx, String message) throws Exception {
		// 특정 채팅방 채팅내용 저장
		Connection conn = getConnection();
		 
		String sql = "INSERT INTO chat_contents(chat_idx, chatRoom_idx, users_idx, contents, con_date) VALUES (SEQ_ESCHAT_IDX.NEXTVAL, ?, ?, ?, SYSDATE)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, chatroomIdx);
        pstmt.setInt(2, usersIdx);
        pstmt.setString(3, message);
        pstmt.executeUpdate();

	    System.out.println("메시지 저장 완료");
	    
		pstmt.close();
		conn.close();
	}
	
}
