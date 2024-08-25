package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class MarketProductReserveDAO {
	
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		return conn;
	}
	
	public void reserve(int marketIdx, int usersIdx, int priceIdx, int scheduleIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO market_reserve(market_idx, users_idx, price_idx, schedule_idx) VALUES(?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.setInt(2, usersIdx);
		pstmt.setInt(3, priceIdx);
		pstmt.setInt(4, scheduleIdx);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}

}
