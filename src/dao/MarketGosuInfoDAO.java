package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MarketGosuInfoDTO;
import dto.MarketGosuReviewDTO;

public class MarketGosuInfoDAO {
	
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		return conn;
	}
	
	public ArrayList<MarketGosuInfoDTO> gosuinfo(int marketIdx) throws Exception {
			
			Connection conn = getConnection();
			
			String sql = "SELECT gi.users_idx \"고수idx\",gi.name \"고수 활동명\", gi.f_img \"프로필이미지\", gi.real \"본인인증 유무\", gi.career  \"경력\"" +
					" FROM gosu_infor gi, market m" +
					" WHERE gi.users_idx = m.users_idx" +
					" AND m.market_idx = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, marketIdx);
			ResultSet rs = pstmt.executeQuery();
	
			ArrayList<MarketGosuInfoDTO> infolist = new ArrayList<MarketGosuInfoDTO>();
	
			while (rs.next()) {
				MarketGosuInfoDTO dto = new MarketGosuInfoDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
				infolist.add(dto);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return infolist;
			
		}
	
	public ArrayList<MarketGosuReviewDTO> gosuReview(int guserIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT r.score \"리뷰평점\", r.contents \"리뷰내용\", u.name \"리뷰작성자\"" +
				" FROM (SELECT * FROM review ORDER BY review_idx DESC) r, users u, gosu_infor gi" +
				" WHERE r.g_users_idx = gi.users_idx" +
				" AND r.users_idx = u.users_idx" +
				" AND gi.users_idx = ?" +
				" AND ROWNUM <= 2";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, guserIdx);
		
		ResultSet rs = pstmt.executeQuery();

		ArrayList<MarketGosuReviewDTO> reviewList = new ArrayList<MarketGosuReviewDTO>();

		while (rs.next()) {
			MarketGosuReviewDTO dto = new MarketGosuReviewDTO(rs.getInt(1), rs.getString(2), rs.getString(3));
			reviewList.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return reviewList;
	}

}
