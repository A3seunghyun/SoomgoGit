package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.ChatRoomListDTO;

public class ChatRoomListDAO {
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		return conn;
	}
	
	public ArrayList<ChatRoomListDTO> getChatRoomList(int usersIdx) throws Exception {
		
		Connection conn = getConnection();
		
		String sql = "SELECT c.chatroom_idx \"채팅방IDX\", cmm.\"채팅방이름\", cmm.\"서비스명\", cmm.\"서비스지역\", cmm.\"고수소개\", TO_CHAR(cmm.\"채팅방 생성일시\", \'YYYY-MM-DD\'), cmm.\"접속여부\", cmm.\"프로필이미지\"" +
						" FROM chat c, chat_member cm, (" +
								"SELECT c.chatroom_idx \"채팅방IDX\", cm.users_idx \"채팅방 유저 IDX\", c.name \"채팅방이름\",  s.title \"서비스명\", t.town_name \"서비스지역\", gi.explain \"고수소개\", c.chat_date \"채팅방 생성일시\",  gi.onoff \"접속여부\", gi.f_img \"프로필이미지\"" +
								" FROM chat c, chat_member cm, gosu_infor gi, gosu_service gs, service s, town t" +
								" WHERE c.chatroom_idx = cm.chatroom_idx" +
								" AND cm.users_idx = gi.users_idx" +
								" AND gi.users_idx = gs.users_idx" +
								" AND gs.service_idx = s.service_idx" +
								" AND gs.town_idx = t.town_idx" +
								" AND cm.gosu = 1" +
								" ORDER BY c.chat_date DESC" +
								") cmm" +
						" WHERE c.chatroom_idx = cm.chatroom_idx" +
						" AND c.chatroom_idx = cmm.\"채팅방IDX\"" +
						" AND cm.users_idx = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, usersIdx);
		
		ResultSet rs = pstmt.executeQuery();
		

		ArrayList<ChatRoomListDTO> chatRoomList = new ArrayList<ChatRoomListDTO>();

		while (rs.next()) {
			ChatRoomListDTO dto = new ChatRoomListDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
			chatRoomList.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return chatRoomList;
	}

}
