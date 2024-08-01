package dao;

import java.sql.*;

public class UsersjoinDao {
	Connection getConnection() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,id,pw);
		
		return conn;
		
	}
	
	public boolean loginCheck(String email, String pw) throws Exception{
		Connection conn = getConnection();
		
		// "SELECT COUNT(*) FROM member WHERE id = ? AND pw = ?"
		String sql = "SELECT COUNT(*) FROM users WHERE email = ? AND pw = ?"; 
    			 
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, pw);
    	
		ResultSet rs =pstmt.executeQuery();
		
		int result = 0;
		if(rs.next()){
			result = rs.getInt(1);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result == 1;
	}
	public void registerMember(String name, String email, String pw) throws Exception{
		Connection conn = getConnection();
		String sql = "INSERT INTO USERS(name,email,pw,users_idx,alias,phone,f_img,gender,birth,cash,town_idx,verification,isgosu)\r\n" + 
				"VALUES(?,?,?,SEQ_USERS_IDX.nextval,'default','default','default','default',sysdate,'0',0,0,0)";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		pstmt.setString(3, pw);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}