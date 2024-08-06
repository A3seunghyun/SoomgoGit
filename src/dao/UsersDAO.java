package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import dto.GosuServiceTownDTO;
import dto.GosuInforDTO;
import dto.UsersDTO;

public class UsersDAO {
		Connection getConnection() throws Exception {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "soomgo";
			String pw = "soomgo";
			
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, id, pw);
			
			return conn;
		}
		public UsersDTO getUsersInfoByUsersIdx(int usersIdx) throws Exception {
			// 유저idx로 유저 정보 확인
			Connection conn = getConnection();
			 
			String sql = "SELECT *\r\n" + 
						"FROM users\r\n" + 
						"WHERE users_idx = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, usersIdx);
	        ResultSet rs  = pstmt.executeQuery();
	        
	        UsersDTO dto = null;
	        if(rs.next()) {
	        	String alias = rs.getString("alias");
	        	String pw = rs.getString("pw");
	        	String phone = rs.getString("phone");
	        	String name = rs.getString("name");
	        	String email = rs.getString("email");
	        	String f_img = rs.getString("f_img");
	        	String gender = rs.getString("gender");
	        	String birth = rs.getString("birth");
	        	int cash = rs.getInt("cash");
	        	int town_idx = rs.getInt("town_idx");
	        	int verification = rs.getInt("verification");
	        	dto  = new UsersDTO(usersIdx, alias, pw, phone
			        			, name, email, f_img, gender
			        			, birth, cash, town_idx, verification);
	        }
		    rs.close();
			pstmt.close();
			conn.close();
			
			return dto;
		}
		
		public GosuInforDTO getGosuInfoByUsersIdx(int usersIdx) throws Exception {
			// 유저idx로 유저 정보 확인
			Connection conn = getConnection();
			 
			String sql = "SELECT *\r\n" + 
						"FROM gosu_infor\r\n" + 
						"WHERE users_idx = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, usersIdx);
	        ResultSet rs  = pstmt.executeQuery();
	        
	        GosuInforDTO dto = null;
	        if(rs.next()) {
	        	String name= rs.getString("name");
	        	int real = rs.getInt("real");
	        	String last_login = rs.getString("last_login");
	        	int career = rs.getInt("career");
	        	int member = rs.getInt("member");
	        	String explain = rs.getString("explain");
	        	int onoff = rs.getInt("onoff");
	        	String f_img = rs.getString("F_img");
	        	dto  = new GosuInforDTO(usersIdx, name, real, last_login
			        			, career, member, explain, onoff, f_img);
	        }
		    rs.close();
			pstmt.close();
			conn.close();
			
			return dto;
		}
		
		public GosuServiceTownDTO getGosuServiceTown(int usersIdx) throws Exception {
			Connection conn = getConnection();
			GosuServiceTownDTO gsDTO = null;
		    try {
		    	String sql = "SELECT s.title AS service_title,\r\n" + 
				    		"       t.town_name,\r\n" + 
				    		"       p.province_name\r\n" + 
				    		"FROM gosu_service g\r\n" + 
				    		"JOIN service s ON g.service_idx = s.service_idx\r\n" + 
				    		"JOIN town t ON g.town_idx = t.town_idx\r\n" + 
				    		"JOIN province p ON t.province_idx = p.province_idx\r\n" + 
				    		"WHERE g.users_idx = ?";
				 
				PreparedStatement pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, usersIdx);
		        ResultSet rs  = pstmt.executeQuery();
		        
		        if(rs.next()) {
					String service_title = rs.getNString("service_title");
					String town_name = rs.getNString("town_name");
					String province_name = rs.getNString("province_name");
					gsDTO = new GosuServiceTownDTO(service_title, town_name, province_name);
					
					rs.close();
					pstmt.close();
					conn.close();
				}
		    } catch(Exception e) {
		    	 e.printStackTrace();
		    }
			return gsDTO;
		}
}
