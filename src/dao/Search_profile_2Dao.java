package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Search_profile_2Dto;

public class Search_profile_2Dao {
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
			public ArrayList<Search_profile_2Dto> getSeachprofile() throws Exception{
				ArrayList<Search_profile_2Dto> listRet = new ArrayList<Search_profile_2Dto>();
				
				String sql = "SELECT \r\n" + 
						"    COALESCE(r.g_users_idx, t.g_users_idx) AS g_users_idx,\r\n" + 
						"    COALESCE(r.average_score, 0) AS average_score,\r\n" + 
						"    COALESCE(r.review_count, 0) AS review_count,\r\n" + 
						"    COALESCE(t.transaction_count, 0) AS transaction_count\r\n" + 
						"FROM \r\n" + 
						"    (\r\n" + 
						"        SELECT \r\n" + 
						"            g_users_idx,\r\n" + 
						"            AVG(score) AS average_score,\r\n" + 
						"            COUNT(g_users_idx) AS review_count\r\n" + 
						"        FROM \r\n" + 
						"            review\r\n" + 
						"        GROUP BY \r\n" + 
						"            g_users_idx\r\n" + 
						"    ) r\r\n" + 
						"    FULL JOIN (\r\n" + 
						"        SELECT \r\n" + 
						"            g_users_idx,\r\n" + 
						"            COUNT(g_users_idx) AS transaction_count\r\n" + 
						"        FROM \r\n" + 
						"            transaction\r\n" + 
						"        GROUP BY \r\n" + 
						"            g_users_idx\r\n" + 
						"    ) t ON r.g_users_idx = t.g_users_idx\r\n" + 
						"ORDER BY \r\n" + 
						"    COALESCE(r.g_users_idx, t.g_users_idx)";
				Connection conn = getConnection();
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					int g_users_idx = rs.getInt(1);
					int score = rs.getInt(2);
					int r_g_users_idx = rs.getInt(3);
					int t_g_users_idx = rs.getInt(4);
					
					Search_profile_2Dto dto = new Search_profile_2Dto(g_users_idx, score, r_g_users_idx, t_g_users_idx);
					listRet.add(dto);
				}
				rs.close();
				pstmt.close();
				conn.close();
				
				return listRet;
	
			}
//			public Gosu_profileDto getGosu_profileidx(int users_idx) throws Exception{
//				String sql = "SELECT gi.users_idx\"회원번호\",gi.member \"직원수\",gs.start_contact\"연락시작시간\",gs.end_contact \"연락마감시간\"\r\n" + 
//						"FROM gosu_infor gi, gosu_service gs\r\n" + 
//						"WHERE gi.users_idx = gs.users_idx\r\n" + 
//						"AND gi.users_idx = ?";
//				
//				// Connection 객체 얻기
//				Connection conn = getConnection();
//				// PreparedStatment 객체 얻기 & 물음표 처리
//				PreparedStatement pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, users_idx);
//				// 실행 - > ResultSet 객체 얻기
//				ResultSet rs = pstmt.executeQuery();
//				// rs.next() 등을 사용 ---> 게시글 데이터 읽어오기
//				Gosu_profileDto dto = null;
//				if(rs.next()) {
////					int users_idx = rs.getInt("users_idx");
//					int member = rs.getInt("member");
//					String start_contact = rs.getString("start_contact");
//					String end_contact = rs.getString("end_contact");
//					dto = new Gosu_profileDto(users_idx, member, start_contact, end_contact);
//				}
//				// BoardDto 객체를 리턴.
//				return dto;
//			}
}
