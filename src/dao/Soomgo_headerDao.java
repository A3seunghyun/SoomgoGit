package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Soomgo_header2Dto;
import dto.Soomgo_headerDto;

public class Soomgo_headerDao {
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
					public ArrayList<Soomgo_headerDto>getSoomgoHeader(int gUsers_idx) throws Exception{
						ArrayList<Soomgo_headerDto> listRet = new ArrayList<Soomgo_headerDto>();
						
						String sql = "SELECT users_idx,name,f_img\r\n" + 
								"FROM users\r\n" + 
								"WHERE users_idx = ?";
						
						Connection conn = getConnection();
						
						
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1,gUsers_idx);
						
						ResultSet rs = pstmt.executeQuery();
						while(rs.next()) {
							int users_idx = rs.getInt(1);
							String name = rs.getString(2);
							String f_img = rs.getString(3);
							
							Soomgo_headerDto dto = new Soomgo_headerDto(users_idx, name, f_img);
							listRet.add(dto);
						}
						rs.close();
						pstmt.close();
						conn.close();
						
						return listRet;
					}
					
					// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
					public ArrayList<Soomgo_header2Dto>getSoomgoHeader2(int gUsers_idx) throws Exception{
						ArrayList<Soomgo_header2Dto> listRet = new ArrayList<Soomgo_header2Dto>();
						
						String sql = "SELECT \r\n" + 
								"    gi.users_idx,\r\n" + 
								"    gi.name,\r\n" + 
								"    gi.f_img,\r\n" + 
								"    AVG(r.score) AS avg_score,\r\n" + 
								"    COUNT(r.g_users_idx) AS review_count\r\n" + 
								"FROM \r\n" + 
								"    gosu_infor gi\r\n" + 
								"JOIN \r\n" + 
								"    review r ON gi.users_idx = r.g_users_idx\r\n" + 
								"WHERE \r\n" + 
								"    gi.users_idx = ?\r\n" + 
								"GROUP BY \r\n" + 
								"    gi.users_idx,\r\n" + 
								"    gi.name,\r\n" + 
								"    gi.f_img";
						
						Connection conn = getConnection();
						
						
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1,gUsers_idx);
						
						ResultSet rs = pstmt.executeQuery();
						while(rs.next()) {
							int users_idx = rs.getInt(1);
							String name = rs.getString(2);
							String f_img = rs.getString(3);
							int avg_score = rs.getInt(4);
							int count_review = rs.getInt(5);
							
							Soomgo_header2Dto dto = new Soomgo_header2Dto(users_idx, name, f_img, avg_score, count_review);
							listRet.add(dto);
						}
						rs.close();
						pstmt.close();
						conn.close();
						
						return listRet;
					}
}
