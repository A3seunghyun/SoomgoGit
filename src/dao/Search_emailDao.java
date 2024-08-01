	package dao;
	
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.util.ArrayList;
	
	import dto.Search_emailDto;
	
	public class Search_emailDao {
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
		public ArrayList<Search_emailDto>getSearchEmail(String Phone) throws Exception{
			ArrayList<Search_emailDto> listRet = new ArrayList<Search_emailDto>();
			
			String sql = "SELECT users_idx,name,phone, verification,email\r\n" + 
					"FROM users\r\n" + 
					"WHERE phone = ?";
			
			Connection conn = getConnection();
			
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,Phone);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int users_idx = rs.getInt(1);
				String name = rs.getString(2);
				String phone = rs.getString(3);
				int verification = rs.getInt(4);
				String email = rs.getString(5);
				
				
				Search_emailDto dto = new Search_emailDto(users_idx, name, phone, verification, email);
				listRet.add(dto);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
			return listRet;
		}
	}
