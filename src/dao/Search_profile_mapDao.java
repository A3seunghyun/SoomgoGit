package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Search_profile_mapDto;

public class Search_profile_mapDao {
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
			public ArrayList<Search_profile_mapDto> getSeachprofilemap() throws Exception{
				ArrayList<Search_profile_mapDto> listRet = new ArrayList<Search_profile_mapDto>();
				
				String sql = "SELECT ga.users_idx,ga.latitude,ga.hardness,gi.name,gi.f_img,gs.intro\r\n" + 
						"FROM gosu_address ga,gosu_infor gi,gosu_service gs\r\n" + 
						"WHERE ga.users_idx = gi.users_idx\r\n" + 
						"AND gi.users_idx = gs.users_idx";
				Connection conn = getConnection();
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					int users_idx = rs.getInt(1);
					double latitude = rs.getDouble(2);
					double hardness = rs.getDouble(3);
					String name = rs.getString(4);
					String f_img = rs.getString(5);
					String intro = rs.getString(6);
					
					
					Search_profile_mapDto dto = new Search_profile_mapDto(users_idx, latitude, hardness, name, f_img, intro);
					listRet.add(dto);
				}
				rs.close();
				pstmt.close();
				conn.close();
				
				return listRet;
	
			}
}
