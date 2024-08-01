package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Gosu_zim_InsertDao {
	Connection getConnection() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,id,pw);
		
		return conn;
		
	}
	public void GosuZimInsert(int users_idx1, int users_idx) throws Exception{
		Connection conn = getConnection();
		String sql = "INSERT INTO gosu_zim(users_idx,g_users_idx)\r\n" + 
					"VALUES(?,?)";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, users_idx1);
		pstmt.setInt(2, users_idx);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}
