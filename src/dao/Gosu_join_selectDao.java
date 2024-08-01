package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Gosu_join_select1Dto;
import dto.Gosu_join_selectDto;

public class Gosu_join_selectDao {
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
			public ArrayList<Gosu_join_selectDto> getGosuJoinSelect (int Category_idx) throws Exception{
				ArrayList<Gosu_join_selectDto> listRet = new ArrayList<Gosu_join_selectDto>();
				
				String sql = "SELECT mc.middle_category_idx,mc.category_idx,mc.title,c.title\r\n" + 
						"FROM middle_category mc, category c\r\n" + 
						"WHERE c.category_idx = mc.category_idx \r\n" + 
						"AND mc.category_idx = ?";
				Connection conn = getConnection();
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Category_idx);
				
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					int middle_category_idx = rs.getInt(1);
					int category_idx = rs.getInt(2);
					String title = rs.getString(3);
					String c_title = rs.getString(4);
					Gosu_join_selectDto dto = new Gosu_join_selectDto(middle_category_idx, category_idx, title, c_title);
					listRet.add(dto);
				}
				rs.close();
				pstmt.close();
				conn.close();
				
				return listRet;
	

			}
			
			// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
						public ArrayList<Gosu_join_select1Dto> getGosuJoinSelect1 (int list_idx) throws Exception{
							ArrayList<Gosu_join_select1Dto> listRet = new ArrayList<Gosu_join_select1Dto>();
							
							String sql = "SELECT service_idx,title,middle_category_idx\r\n" + 
									"FROM service\r\n" + 
									"WHERE middle_category_idx = ?";
							Connection conn = getConnection();
							
							PreparedStatement pstmt = conn.prepareStatement(sql);
							pstmt.setInt(1, list_idx);
							
							ResultSet rs = pstmt.executeQuery();
							while(rs.next()) {
								int service_idx = rs.getInt(1);
								String title = rs.getString(2);
								int middle_category_idx = rs.getInt(3);
								Gosu_join_select1Dto dto = new Gosu_join_select1Dto(service_idx, title, middle_category_idx);
								listRet.add(dto);
							}
							rs.close();
							pstmt.close();
							conn.close();
							
							return listRet;
				

						}
}
