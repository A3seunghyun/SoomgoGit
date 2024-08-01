package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Gosu_zim_DeleteDao {
	Connection getConnection() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,id,pw);
		
		return conn;
		
	}
	public void GosuZimDelete(int users_idx, int g_users_idx) throws Exception{
		Connection conn = getConnection();
		String sql = "DELETE FROM gosu_zim\r\n" + 
					 "WHERE users_idx = ?\r\n" + 
					 "AND g_users_idx = ?";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, users_idx);
		pstmt.setInt(2, g_users_idx);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}
