package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Search_profile_3Dto;
import dto.Search_profile_1Dto;

public class Search_profile_1Dao {
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
			
			//ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드. 아래 Dao 사용시 Dto 확인후 rnum값을 rs.getInt 해줘야함.
			public ArrayList<Search_profile_1Dto> getSeachprofile() throws Exception{
				ArrayList<Search_profile_1Dto> listRet = new ArrayList<Search_profile_1Dto>();
				
				String sql = " SELECT \r\n" + 
						"    gi.users_idx,\r\n" + 
						"    gi.name,\r\n" + 
						"    gi.career,\r\n" + 
						"    gi.f_img,\r\n" + 
						"    gs.intro,\r\n" + 
						"    ROUND(AVG(r.score), 1) AS avg_score_review,\r\n" + 
						"    COUNT(r.g_users_idx) AS count_reviews,\r\n" + 
						"    (SELECT COUNT(*) FROM transaction t WHERE t.g_users_idx = gi.users_idx) AS count_transactions\r\n" + 
						"FROM \r\n" + 
						"    gosu_infor gi\r\n" + 
						"JOIN \r\n" + 
						"    gosu_service gs ON gi.users_idx = gs.users_idx\r\n" + 
						"LEFT JOIN \r\n" + 
						"    review r ON gs.users_idx = r.g_users_idx\r\n" + 
						"GROUP BY \r\n" + 
						"    gi.users_idx,\r\n" + 
						"    gi.name,\r\n" + 
						"    gi.career,\r\n" + 
						"    gi.f_img,\r\n" + 
						"    gs.intro";
				Connection conn = getConnection();
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					int users_idx = rs.getInt(1);
					String name = rs.getString(2);
					int career = rs.getInt(3);
					String f_img = rs.getString(4);
					String intro = rs.getString(5);
					int score = rs.getInt(6);
					int c_review = rs.getInt(7);
					int c_transaction = rs.getInt(8);
					
					Search_profile_1Dto dto = new Search_profile_1Dto(users_idx, name, career, f_img, intro, score, c_review, c_transaction);
					listRet.add(dto);
				}
				rs.close();
				pstmt.close();
				conn.close();
				
				return listRet;
	
			}
			public ArrayList<Search_profile_1Dto> getSeachprofileReviewDESC() throws Exception{
				ArrayList<Search_profile_1Dto> listRet = new ArrayList<Search_profile_1Dto>();
				
				String sql = " SELECT \r\n" + 
						"gi.users_idx,\r\n" + 
						"gi.name,\r\n" + 
						"gi.career,\r\n" + 
						"gi.f_img,\r\n" + 
						"gs.intro, \r\n" + 
						"ROUND(AVG(r.score), 1) AS avg_score_review,\r\n" + 
						"COUNT(r.g_users_idx) AS count_reviews,\r\n" + 
						"(SELECT COUNT(*) FROM transaction t WHERE t.g_users_idx = gi.users_idx) AS count_transactions \r\n" + 
						"FROM \r\n" + 
						"gosu_infor gi\r\n" + 
						"JOIN \r\n" + 
						"gosu_service gs ON gi.users_idx = gs.users_idx\r\n" + 
						"LEFT JOIN \r\n" + 
						"review r ON gs.users_idx = r.g_users_idx \r\n" + 
						"GROUP BY \r\n" + 
						"gi.users_idx,\r\n" + 
						"gi.name,\r\n" + 
						"gi.career,\r\n" + 
						"gi.f_img,\r\n" + 
						"gs.intro\r\n" + 
						"ORDER BY \r\n" + 
						"avg_score_review DESC";
				Connection conn = getConnection();
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					int users_idx = rs.getInt(1);
					String name = rs.getString(2);
					int career = rs.getInt(3);
					String f_img = rs.getString(4);
					String intro = rs.getString(5);
					int score = rs.getInt(6);
					int c_review = rs.getInt(7);
					int c_transaction = rs.getInt(8);
					
					Search_profile_1Dto dto = new Search_profile_1Dto(users_idx, name, career, f_img, intro, score, c_review, c_transaction);
					listRet.add(dto);
				}
				rs.close();
				pstmt.close();
				conn.close();
				
				return listRet;
	
			}
			
			// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
						public ArrayList<Search_profile_3Dto> getSeachprofilePageNum(int pageNum) throws Exception{
							ArrayList<Search_profile_3Dto> listRet = new ArrayList<Search_profile_3Dto>();
							int endNum = pageNum * 10;
							int startNum = endNum - 9;
							
							
							String sql = "SELECT t2.*\r\n" + 
									"FROM (\r\n" + 
									"    SELECT rownum rnum, t1.*\r\n" + 
									"    FROM (\r\n" + 
									"        SELECT\r\n" + 
									"            gi.users_idx,\r\n" + 
									"            gi.name, \r\n" + 
									"            gi.career,\r\n" + 
									"            gi.f_img,\r\n" + 
									"            gs.intro,\r\n" + 
									"            TRUNC(AVG(r.score)) AS avg_score_review, \r\n" + 
									"            COUNT(r.g_users_idx) AS count_reviews,\r\n" + 
									"            (SELECT COUNT(*) FROM transaction t WHERE t.g_users_idx = gi.users_idx) AS count_transactions\r\n" + 
									"        FROM  \r\n" + 
									"            gosu_infor gi \r\n" + 
									"        JOIN\r\n" + 
									"            gosu_service gs ON gi.users_idx = gs.users_idx\r\n" + 
									"        LEFT JOIN\r\n" + 
									"            review r ON gs.users_idx = r.g_users_idx\r\n" + 
									"        GROUP BY \r\n" + 
									"            gi.users_idx,\r\n" + 
									"            gi.name,\r\n" + 
									"            gi.career,\r\n" + 
									"            gi.f_img,\r\n" + 
									"            gs.intro\r\n" + 
									"    ) t1\r\n" + 
									") t2\r\n" + 
									"WHERE rnum >= ? AND rnum <= ?";
							
							try (Connection conn = getConnection();
					         PreparedStatement pstmt = conn.prepareStatement(sql)) {
						        pstmt.setInt(1, startNum);
						        pstmt.setInt(2, endNum);

						        try (ResultSet rs = pstmt.executeQuery()) {
						            while (rs.next()) {
						                try {
						                	int rnum = rs.getInt(1);
						                    int users_idx = rs.getInt(2);
						                    String name = rs.getString(3);
						                    int career = rs.getInt(4);
						                    String f_img = rs.getString(5);
						                    String intro = rs.getString(6);
						                    int score = rs.getInt(7);
						                    int c_review = rs.getInt(8);
						                    int c_transaction = rs.getInt(9);

						                    Search_profile_3Dto dto = new Search_profile_3Dto(rnum, users_idx, name, career, f_img, intro, score, c_review, c_transaction);
						                    listRet.add(dto);
						                } catch (SQLException e) {
						                    // 특정 행에서 발생한 예외를 로그로 출력
						                    System.err.println("ResultSet 처리 중 오류 발생: " + e.getMessage());
						                }
						            }
						        }
						    } catch (SQLException e) {
						        // 전체 SQL 예외를 로그로 출력
						        System.err.println("SQL 쿼리 실행 중 오류 발생: " + e.getMessage());
						        throw new Exception("데이터베이스 오류", e);
						    }

						    return listRet;
						}
}