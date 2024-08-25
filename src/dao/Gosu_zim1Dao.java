package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Gosu_profile_member_inforDto;
import dto.Gosu_zim1Dto;

public class Gosu_zim1Dao {
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
					public ArrayList<Gosu_zim1Dto> getGosuzim1All() throws Exception{
						ArrayList<Gosu_zim1Dto> listRet = new ArrayList<Gosu_zim1Dto>();
						
						String sql = "SELECT gi.users_idx,gi.name,gi.career,gi.f_img,gs.intro \r\n" + 
								"FROM gosu_infor gi,gosu_service gs\r\n" + 
								"WHERE gi.users_idx = gs.users_idx\r\n" + 
								"AND gi.users_idx = 20";
						Connection conn = getConnection();
						
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();
						while(rs.next()) {
							int users_idx = rs.getInt(1);
							String name = rs.getString(2);
							int career = rs.getInt(3);
							String f_img = rs.getString(4);
							String intro = rs.getString(5);
							Gosu_zim1Dto dto = new Gosu_zim1Dto(users_idx, name, intro, career, f_img);
							listRet.add(dto);
						}
						rs.close();
						pstmt.close();
						conn.close();
						
						return listRet;
			
					}
					public Gosu_zim1Dto getGosu_zim1idx(int users_idx) throws Exception{
						String sql = "SELECT gi.users_idx,gi.name,gi.career,gi.f_img,gs.intro \r\n" + 
								"FROM gosu_infor gi,gosu_service gs\r\n" + 
								"WHERE gi.users_idx = gs.users_idx\r\n" + 
								"AND gi.users_idx = ?";
						
						// Connection 객체 얻기
						Connection conn = getConnection();
						// PreparedStatment 객체 얻기 & 물음표 처리
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, users_idx);
						// 실행 - > ResultSet 객체 얻기
						ResultSet rs = pstmt.executeQuery();
						// rs.next() 등을 사용 ---> 게시글 데이터 읽어오기
						Gosu_zim1Dto dto = null;
						if(rs.next()) {
//							int users_idx = rs.getInt("users_idx");
							String name = rs.getString("name");
							int career = rs.getInt("career");
							String intro = rs.getNString("intro");
							String f_img = rs.getNString("f_img");
							dto = new Gosu_zim1Dto(users_idx, name, intro, career, f_img);
						}
						// BoardDto 객체를 리턴.
						return dto;
					}
		}
