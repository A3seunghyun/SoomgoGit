package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MarketChatContentsDTO;
import dto.MarketChatRoomListDTO;

public class MarketChatBotDAO {
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		return conn;
	}
	
	public ArrayList<MarketChatRoomListDTO> getMarketChatRoomList(int usersIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT cm.chatroom_idx \"채팅방 IDX\", gi.users_idx \"고수IDX\", gi.name \"고수이름\", gi.f_img \"고수프로필사진\"" +
						" FROM chat_member cm, gosu_infor gi, (" +
						" SELECT chatroom_idx \"채팅방 IDX\"" +
						" FROM chat_member" +
						" WHERE users_idx = ?) ci" +
						" WHERE cm.users_idx = gi.users_idx" +
						" AND ci.\"채팅방 IDX\" = cm.chatroom_idx";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, usersIdx);
		
		ResultSet rs = pstmt.executeQuery();
		
				ArrayList<MarketChatRoomListDTO> mChatRoomList = new ArrayList<MarketChatRoomListDTO>();
				while (rs.next()) {
			MarketChatRoomListDTO dto = new MarketChatRoomListDTO(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4));
			mChatRoomList.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
			
		return mChatRoomList;
	}
	
	public ArrayList<MarketChatContentsDTO> getMarketChatContents(int chatroomIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT chatroom_idx \"채팅방IDX\", users_idx \"유저\", contents \"채팅내용\", con_date \"채팅일시\"" +
				" FROM chat_contents" +
				" WHERE chatroom_idx = ?" +
				" ORDER BY con_date ASC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, chatroomIdx);
		
		ResultSet rs = pstmt.executeQuery();
		
				ArrayList<MarketChatContentsDTO> mChatContents = new ArrayList<MarketChatContentsDTO>();
				while (rs.next()) {
					MarketChatContentsDTO dto = new MarketChatContentsDTO(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4));
					mChatContents.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
			
		return mChatContents;
	}
	
	public boolean getMarketChatContentsCnt(int chatroomIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT count(*) " +
				"FROM chat_contents " +
				"WHERE chatroom_idx = ? " + 
				"ORDER BY con_date ASC";
		
		// PreparedStatement 객체 얻고. & 물음표 셋팅.
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, chatroomIdx);
		
		// 실행 -> return true / false.
		ResultSet rs = pstmt.executeQuery();
		int result = 0;  // 0 : 초기값 (사실, 1이 아닌 값이면 오케이)
		if(rs.next()) {
			result = rs.getInt(1);   // 첫 번째 컬럼의 값.
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result==1;
	}
	
	public void marketChatInsert(int roomIdx, int usersIdx, String content) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO chat_contents" + 
				"(chat_idx, chatroom_idx, users_idx, contents, file_idx, con_date, estimate_idx) "+ 
				"VALUES(SEQ_CHAT_CONTENTS.nextval, ?, ?, ? , null, sysdate, null)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, roomIdx);
		pstmt.setInt(2, usersIdx);
		pstmt.setString(3, content);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}
