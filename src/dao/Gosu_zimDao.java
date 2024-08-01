package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Gosu_zimDto;
import dto.Gosu_zim_count1Dto;

public class Gosu_zimDao {
	// getConnection() : Connection 객체를 리턴.
	Connection getConnection() throws Exception{					// Connection 객체의 참조값을 리턴할수 있는 메서드
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "soomgo";
	String pw = "soomgo";
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,id,pw);		// Connection 객체의 참조값을 리턴.
	
	return conn;
	
}
	// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
	public ArrayList<Gosu_zimDto>getGosuZim(int gUsers_idx) throws Exception{
		ArrayList<Gosu_zimDto> listRet = new ArrayList<Gosu_zimDto>();
		
		String sql = "SELECT \r\n" + 
				"    gz.g_users_idx,\r\n" + 
				"    gi.name,\r\n" + 
				"    gi.f_img,\r\n" + 
				"    gs.intro,\r\n" + 
				"    gi.career,\r\n" + 
				"    (\r\n" + 
				"        SELECT ROUND(AVG(score), 1) \r\n" + 
				"        FROM review \r\n" + 
				"        WHERE users_idx = 1\r\n" + 
				"    ) AS avg_score,\r\n" + 
				"    (\r\n" + 
				"        SELECT COUNT(g_users_idx) \r\n" + 
				"        FROM review \r\n" + 
				"        WHERE users_idx = 1\r\n" + 
				"    ) AS review_count,\r\n" + 
				"    (\r\n" + 
				"        SELECT COUNT(g_users_idx) \r\n" + 
				"        FROM transaction \r\n" + 
				"        WHERE g_users_idx = 20\r\n" + 
				"    ) AS transaction_count\r\n" + 
				"FROM \r\n" + 
				"    gosu_zim gz\r\n" + 
				"    JOIN gosu_infor gi ON gz.g_users_idx = gi.users_idx\r\n" + 
				"    JOIN gosu_service gs ON gi.users_idx = gs.users_idx\r\n" + 
				"WHERE \r\n" + 
				"    gz.users_idx = ?";
		
		Connection conn = getConnection();
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,gUsers_idx);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int g_users_idx = rs.getInt(1);
			String name = rs.getString(2);
			String f_img = rs.getString(3);
			String intro = rs.getString(4);
			int career = rs.getInt(5);
			int avg_score = rs.getInt(6);
			int review_count = rs.getInt(7);
			int transaction_count = rs.getInt(8);
			
			Gosu_zimDto dto = new Gosu_zimDto(g_users_idx, name, f_img, intro, career, avg_score, review_count, transaction_count);
			listRet.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return listRet;
	}
	// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
		public ArrayList<Gosu_zim_count1Dto>getGosuZimCount1(int gUsers_idx) throws Exception{
			ArrayList<Gosu_zim_count1Dto> listRet = new ArrayList<Gosu_zim_count1Dto>();
			
			String sql = "SELECT avg(r.score),count(r.g_users_idx)\r\n" + 
					"FROM review r\r\n" + 
					"WHERE g_users_idx = ?";
			
			Connection conn = getConnection();
			
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,gUsers_idx);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int score = rs.getInt(1);
				int g_users_idx = rs.getInt(2);
				
				
				Gosu_zim_count1Dto dto = new Gosu_zim_count1Dto(score, g_users_idx);
				listRet.add(dto);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
			return listRet;
		}
	}
