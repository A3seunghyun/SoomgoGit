package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.Gosu_profile_portfolio_innerDto;

public class Gosu_profile_portfolio_innerDao {
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
			public Gosu_profile_portfolio_innerDto getGosuprofilePortfolioInner(int p_idx) throws Exception{
				
				String sql = "SELECT p.portfolio_idx,p.users_idx,p.title,p.service_amount,p.work_year,gi.name,gi.f_img,s.title,t.town_name,pr.province_name,p.contents\r\n" + 
						"FROM portfolio p,gosu_infor gi,service s,town t,province pr \r\n" + 
						"WHERE p.users_idx = gi.users_idx\r\n" + 
						"AND p.service_idx = s.service_idx \r\n" + 
						"AND p.town_idx = t.town_idx\r\n" + 
						"AND t.province_idx = pr.province_idx\r\n" + 
						"AND p.portfolio_idx = ? ";
				Connection conn = getConnection();
				
				
				Gosu_profile_portfolio_innerDto dto = null;
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,p_idx);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
					int portfolio_idx = rs.getInt(1);
					int users_idx = rs.getInt(2);
					String p_title = rs.getString(3);
					int service_amount = rs.getInt(4);
					int work_year = rs.getInt(5);
					String name = rs.getString(6); 
					String f_img = rs.getString(7);
					String s_title = rs.getString(8);
					String town_name = rs.getString(9);
					String province_name = rs.getString(10);
					String contents = rs.getString(11);
					
					
					dto = new Gosu_profile_portfolio_innerDto(portfolio_idx, users_idx, p_title, service_amount, work_year, name, f_img, s_title, town_name, province_name, contents);
				}
				rs.close();
				pstmt.close();
				conn.close();
				
				return dto;
	
			}
//			
}
