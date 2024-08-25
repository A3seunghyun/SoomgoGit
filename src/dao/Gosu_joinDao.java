package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Gosu_joinDto;

public class Gosu_joinDao {
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
			public ArrayList<Gosu_joinDto> getGosuJoin() throws Exception{
				ArrayList<Gosu_joinDto> listRet = new ArrayList<Gosu_joinDto>();
				
				String sql = "SELECT category_idx,thumbnail,title\r\n" + 
						"FROM category";
				Connection conn = getConnection();
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					int category_idx = rs.getInt(1);
					String thumbnail = rs. getString(2);
					String title = rs. getString(3);
					
					Gosu_joinDto dto = new Gosu_joinDto(category_idx, thumbnail, title);
					listRet.add(dto);
				}
				rs.close();
				pstmt.close();
				conn.close();
				
				return listRet;
	
			}
}
