package users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.BoardDto;

public class UserDao {
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "user0404";
		String pw = "pass1234";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		return conn;
	}
	
	public ArrayList<UserDto> getBoardList(String name) throws Exception {
		Connection conn = getConnection();
		
		ArrayList<UserDto> listGet = new ArrayList<UserDto>();
		
		String sql = "SELECT * FROM users WHERE user_name LIKE ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, "%" + name + "%");
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			UserDto dto = new UserDto(rs.getString(1),rs.getInt(2),rs.getString(3),rs.getString(4));
			listGet.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return listGet;
	}
} 
		
