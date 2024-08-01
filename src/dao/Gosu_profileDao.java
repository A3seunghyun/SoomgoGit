package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Gosu_profile_ReservationDto;
import dto.Gosu_profile_careerDto;
import dto.Gosu_profile_career_yearDto;
import dto.Gosu_profile_countDto;
import dto.Gosu_profile_explainDto;
import dto.Gosu_profile_header_inforDto;
import dto.Gosu_profile_member_inforDto;
import dto.Gosu_profile_photo_videoDto;
import dto.Gosu_profile_portfolio_innerDto;
import dto.Gosu_profile_portfolio_outterDto;
import dto.Gosu_profile_qna_answerDto;
import dto.Gosu_profile_reviewDto;
import dto.Gosu_profile_service_plus_titleDto;
import dto.Gosu_profile_transaction_countDto;

public class Gosu_profileDao {
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
				public ArrayList<Gosu_profile_header_inforDto>getGosuprofileHeader(int gUsers_idx) throws Exception{
					ArrayList<Gosu_profile_header_inforDto> listRet = new ArrayList<Gosu_profile_header_inforDto>();
					
					String sql = "SELECT gs.users_idx,gi.f_img,gi.name,gs.distance,s.title,gs.intro,t.town_name,p.province_name,gi.real\r\n" + 
							"FROM gosu_infor gi,gosu_service gs,service s,town t,province p \r\n" + 
							"WHERE gi.users_idx = gs.users_idx\r\n" + 
							"AND s.service_idx = gs.service_idx\r\n" + 
							"AND t.town_idx = gs.town_idx\r\n" + 
							"AND p.province_idx = t.province_idx\r\n" + 
							"AND gi.users_idx = ?";
					
					Connection conn = getConnection();
					
					
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1,gUsers_idx);
					
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()) {
						int users_idx = rs.getInt(1);
						String f_img = rs.getString(2);
						String name = rs.getString(3);
						int distance = rs.getInt(4);
						String title = rs.getString(5);
						String intro = rs.getString(6);
						String town_name = rs.getString(7);
						String province_name = rs.getString(8);
						int real = rs.getInt(9);
						
						Gosu_profile_header_inforDto dto = new Gosu_profile_header_inforDto(users_idx, f_img, name, title, province_name, town_name, distance, intro, real);
						listRet.add(dto);
					}
					rs.close();
					pstmt.close();
					conn.close();
					
					return listRet;
				}
				
			
			// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
			public ArrayList<Gosu_profile_countDto> getGosuprofileCount(int gUsers_idx) throws Exception{
				ArrayList<Gosu_profile_countDto> listRet = new ArrayList<Gosu_profile_countDto>();
				
				String sql = "SELECT g_users_idx, \r\n" + 
						"       AVG(score) AS average_score, \r\n" + 
						"       COUNT(review_idx) AS review_count\r\n" + 
						"FROM review\r\n" + 
						"WHERE g_users_idx = ?\r\n" + 
						"GROUP BY g_users_idx";
				Connection conn = getConnection();
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, gUsers_idx);
				
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					int g_users_idx = rs.getInt(1);
					int score = rs.getInt(2);
					int review_idx = rs.getInt(3);
 					
					Gosu_profile_countDto dto = new Gosu_profile_countDto(g_users_idx, score, review_idx);
					listRet.add(dto);
				}
				rs.close();
				pstmt.close();
				conn.close();
				
				return listRet;
	
			}
			
			// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
						public ArrayList<Gosu_profile_transaction_countDto> getGosuprofileTransactionCount(int gUsers_idx) throws Exception{
							ArrayList<Gosu_profile_transaction_countDto> listRet = new ArrayList<Gosu_profile_transaction_countDto>();
							
							String sql = "SELECT count(g_users_idx)\r\n" + 
									"FROM transaction\r\n" + 
									"WHERE g_users_idx = ?";
							Connection conn = getConnection();
							
							PreparedStatement pstmt = conn.prepareStatement(sql);
							pstmt.setInt(1, gUsers_idx);
							
							ResultSet rs = pstmt.executeQuery();
							while(rs.next()) {
								int g_users_idx = rs.getInt(1);
			 					
								Gosu_profile_transaction_countDto dto = new Gosu_profile_transaction_countDto(g_users_idx);
								listRet.add(dto);
							}
							rs.close();
							pstmt.close();
							conn.close();
							
							return listRet;
				
						}
			
			
			
			
			public ArrayList<Gosu_profile_member_inforDto> getGosuprofileMember(int gUsers_idx) throws Exception{
				ArrayList<Gosu_profile_member_inforDto> listRet = new ArrayList<Gosu_profile_member_inforDto>();
				
				String sql = "SELECT gi.users_idx\"회원번호\",gi.member \"직원수\",gs.start_contact\"연락시작시간\",gs.end_contact \"연락마감시간\"\r\n" + 
						"FROM gosu_infor gi, gosu_service gs\r\n" + 
						"WHERE gi.users_idx = gs.users_idx\r\n" + 
						"AND gi.users_idx = ?";
				Connection conn = getConnection();
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,gUsers_idx);
				
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					int users_idx = rs.getInt(1);
					int member = rs.getInt(2);
					String start_contact = rs.getString(3);
					String end_contact = rs.getString(4);
					Gosu_profile_member_inforDto dto = new Gosu_profile_member_inforDto(users_idx, member, start_contact, end_contact);
					listRet.add(dto);
				}
				rs.close();
				pstmt.close();
				conn.close();
				
				return listRet;
	
			}
			// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
						public ArrayList<Gosu_profile_explainDto> getGosuprofileExplain(int gUsers_idx) throws Exception{
							ArrayList<Gosu_profile_explainDto> listRet = new ArrayList<Gosu_profile_explainDto>();
							
							String sql = "SELECT explain\r\n" + 
									"FROM gosu_infor\r\n" + 
									"WHERE users_idx = ?";
							Connection conn = getConnection();
							
							PreparedStatement pstmt = conn.prepareStatement(sql);
							pstmt.setInt(1,gUsers_idx);
							
							ResultSet rs = pstmt.executeQuery();
								
							while(rs.next()) {
								String explain = rs.getString(1);
								Gosu_profile_explainDto dto = new Gosu_profile_explainDto(explain);
								listRet.add(dto);
							}
							rs.close();
							pstmt.close();
							conn.close();
							
							return listRet;
				
						}
						// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
						public ArrayList<Gosu_profile_service_plus_titleDto> getGosuprofileServicePlus(int gUsers_idx) throws Exception{
							ArrayList<Gosu_profile_service_plus_titleDto> listRet = new ArrayList<Gosu_profile_service_plus_titleDto>();
							
							String sql = "SELECT gi.users_idx,gsp.service_idx, s.title\r\n" + 
									"FROM gosu_infor gi,gosu_service_plus gsp,service s\r\n" + 
									"WHERE gi.users_idx = gsp.users_idx\r\n" + 
									"AND gsp.service_idx = s.service_idx\r\n" + 
									"AND gi.users_idx = ?";
							Connection conn = getConnection();
							
							PreparedStatement pstmt = conn.prepareStatement(sql);
							pstmt.setInt(1, gUsers_idx);
							
							ResultSet rs = pstmt.executeQuery();
							while(rs.next()) {
								int users_idx = rs.getInt(1);
								int service_idx = rs.getInt(2);
			 					String title = rs.getString(3);
								Gosu_profile_service_plus_titleDto dto = new Gosu_profile_service_plus_titleDto(users_idx, service_idx, title);
								listRet.add(dto);
							}
							rs.close();
							pstmt.close();
							conn.close();
							
							return listRet;
				
						}
			
						// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
						public ArrayList<Gosu_profile_career_yearDto> getGosuprofileCareerYear(int gUsers_idx) throws Exception{
							ArrayList<Gosu_profile_career_yearDto> listRet = new ArrayList<Gosu_profile_career_yearDto>();
							
							String sql = "SELECT gi.users_idx,gi.career\r\n" + 
									"FROM gosu_infor gi\r\n" + 
									"WHERE gi.users_idx = ?";
							Connection conn = getConnection();
							
							PreparedStatement pstmt = conn.prepareStatement(sql);
							pstmt.setInt(1, gUsers_idx);
							ResultSet rs = pstmt.executeQuery();
							while(rs.next()) {
								int users_idx = rs.getInt(1);
								int career = rs.getInt(2);
								Gosu_profile_career_yearDto dto = new Gosu_profile_career_yearDto(users_idx, career);
								listRet.add(dto);
							}
							rs.close();
							pstmt.close();
							conn.close();
							
							return listRet;
				
						}
						// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
						public ArrayList<Gosu_profile_careerDto> getGosuprofileCareer(int gUsers_idx) throws Exception{
							ArrayList<Gosu_profile_careerDto> listRet = new ArrayList<Gosu_profile_careerDto>();
							
							String sql = "SELECT gi.users_idx,gc.title,gc.st_career,gc.ed_career,gc.intro\r\n" + 
									"FROM gosu_infor gi,gosu_career gc \r\n" + 
									"WHERE gi.users_idx = gc.users_idx\r\n" + 
									"AND gi.users_idx = ?";
							Connection conn = getConnection();
							
							PreparedStatement pstmt = conn.prepareStatement(sql);
							pstmt.setInt(1, gUsers_idx);
							
							ResultSet rs = pstmt.executeQuery();
							while(rs.next()) {
								int users_idx = rs.getInt(1);
								String title = rs.getString(2);
			 					String st_career = rs.getString(3);
			 					String ed_career = rs.getString(4);
			 					String intro = rs.getString(5);
								Gosu_profile_careerDto dto = new Gosu_profile_careerDto(users_idx, title, st_career, ed_career, intro);
								listRet.add(dto);
							}
							rs.close();
							pstmt.close();
							conn.close();
							
							return listRet;
						}
						// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
						public ArrayList<Gosu_profile_ReservationDto> getGosuprofileReservation(int gUsers_idx) throws Exception{
							ArrayList<Gosu_profile_ReservationDto> listRet = new ArrayList<Gosu_profile_ReservationDto>();
							
							String sql = "SELECT m.market_idx, m.service_idx, m.name, m.users_idx, mi.img_url, mip.price\r\n" + 
									"FROM market m\r\n" + 
									"JOIN market_img mi ON m.market_idx = mi.market_idx\r\n" + 
									"JOIN market_item_price mip ON m.market_idx = mip.market_idx\r\n" + 
									"WHERE m.users_idx = ?\r\n" + 
									"AND mip.price = (\r\n" + 
									"    SELECT MIN(mip2.price)\r\n" + 
									"    FROM market_item_price mip2\r\n" + 
									"    WHERE mip2.market_idx = mip.market_idx\r\n" + 
									")";
							Connection conn = getConnection();
							
							PreparedStatement pstmt = conn.prepareStatement(sql);
							pstmt.setInt(1, gUsers_idx);
							
							ResultSet rs = pstmt.executeQuery();
							while(rs.next()) {
								int market_idx = rs.getInt(1);
								int service_idx = rs.getInt(2);
			 					String name = rs.getString(3);
			 					int users_idx = rs.getInt(4);
			 					String img_url = rs.getString(5);
			 					int price = rs.getInt(6);
			 					
			 					Gosu_profile_ReservationDto dto = new Gosu_profile_ReservationDto(market_idx, service_idx, name, users_idx, img_url, price);
								listRet.add(dto);
							}
							rs.close();
							pstmt.close();
							conn.close();
							
							return listRet;
						}
						
						// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
						public ArrayList<Gosu_profile_portfolio_outterDto> getGosuprofilePortfolioOutter(int gUsers_idx) throws Exception{
							ArrayList<Gosu_profile_portfolio_outterDto> listRet = new ArrayList<Gosu_profile_portfolio_outterDto>();
							
							String sql = "SELECT p.portfolio_idx,p.title,p.img,s.title\r\n" + 
									"FROM portfolio p, service s\r\n" + 
									"WHERE p.service_idx = s.service_idx\r\n" + 
									"AND p.users_idx = ?";
							Connection conn = getConnection();
							
							PreparedStatement pstmt = conn.prepareStatement(sql);
							pstmt.setInt(1, gUsers_idx);
							ResultSet rs = pstmt.executeQuery();
							while(rs.next()) {
								int portfolio_idx = rs.getInt(1);
								String p_title = rs.getString(2);
								String img = rs.getString(3);
								String s_title = rs.getString(4);
								Gosu_profile_portfolio_outterDto dto = new Gosu_profile_portfolio_outterDto(portfolio_idx, p_title, img, s_title);
								listRet.add(dto);
							}
							rs.close();
							pstmt.close();
							conn.close();
							
							return listRet;
				
						}
						// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
						public ArrayList<Gosu_profile_portfolio_innerDto> getGosuprofilePortfolioInner(int gUsers_idx) throws Exception{
							ArrayList<Gosu_profile_portfolio_innerDto> listRet = new ArrayList<Gosu_profile_portfolio_innerDto>();
							
							String sql = "SELECT p.portfolio_idx,p.users_idx,p.title,p.service_amount,p.work_year,gi.name,gi.f_img,s.title,t.town_name,pr.province_name,p.contents\r\n" + 
									"FROM portfolio p,gosu_infor gi,service s,town t,province pr \r\n" + 
									"WHERE p.users_idx = gi.users_idx\r\n" + 
									"AND p.service_idx = s.service_idx \r\n" + 
									"AND p.town_idx = t.town_idx\r\n" + 
									"AND t.province_idx = pr.province_idx\r\n" + 
									"AND p.users_idx = ?\r\n" + 
									"AND p.portfolio_idx = ?;";
							Connection conn = getConnection();
							
							PreparedStatement pstmt = conn.prepareStatement(sql);
							pstmt.setInt(1,gUsers_idx);
							ResultSet rs = pstmt.executeQuery();
							while(rs.next()) {
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
								
								
								Gosu_profile_portfolio_innerDto dto = new Gosu_profile_portfolio_innerDto(portfolio_idx, users_idx, p_title, service_amount, work_year, name, f_img, s_title, town_name, province_name, contents);
								listRet.add(dto);
							}
							rs.close();
							pstmt.close();
							conn.close();
							
							return listRet;
				
						}
						// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
						public ArrayList<Gosu_profile_photo_videoDto> getGosuprofilePhotoVideo(int gUsers_idx) throws Exception{
							ArrayList<Gosu_profile_photo_videoDto> listRet = new ArrayList<Gosu_profile_photo_videoDto>();
							
							String sql = "SELECT gp.users_idx,gp.photo\r\n" + 
									"FROM gosu_photo gp\r\n" + 
									"WHERE gp.users_idx = ?";
							Connection conn = getConnection();
							
							PreparedStatement pstmt = conn.prepareStatement(sql);
							pstmt.setInt (1, gUsers_idx);
							
							ResultSet rs = pstmt.executeQuery();
							while(rs.next()) {
								int users_idx = rs.getInt(1);
								String photo = rs.getString(2);
								Gosu_profile_photo_videoDto dto = new Gosu_profile_photo_videoDto(users_idx, photo);
								listRet.add(dto);
							}
							rs.close();
							pstmt.close();
							conn.close();
							
							return listRet;
				
						}
						// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
						public ArrayList<Gosu_profile_reviewDto> getGosuprofileReview(int gUsers_idx) throws Exception{
							ArrayList<Gosu_profile_reviewDto> listRet = new ArrayList<Gosu_profile_reviewDto>();
							
							String sql = "SELECT r.g_users_idx,r.score, r.contents, r.r_date, ri.img1_url, ri.img2_url, ri.img3_url, s.title, u.name\r\n" + 
									"FROM review r ,review_img ri,service s,users u\r\n" + 
									"WHERE r.review_idx = ri.review_idx\r\n" + 
									"AND r.service_idx = s.service_idx\r\n" + 
									"AND r.users_idx = u.users_idx\r\n" + 
									"AND r.g_users_idx = ?";
							Connection conn = getConnection();
							
							PreparedStatement pstmt = conn.prepareStatement(sql);
							pstmt.setInt(1,gUsers_idx);
							
							ResultSet rs = pstmt.executeQuery();
							while(rs.next()) {
								int g_users_idx = rs.getInt(1);
								int score = rs.getInt(2);
								String contents = rs.getString(3);
								String r_date = rs.getString(4);
								String img1_url = rs.getString(5);
								String img2_url = rs.getString(6);
								String img3_url = rs.getString(7);
								String title = rs.getString(8);
								String name = rs.getString(9);
								Gosu_profile_reviewDto dto = new Gosu_profile_reviewDto(g_users_idx, score, contents, r_date, img1_url, img2_url, img3_url, title, name);
								listRet.add(dto);
							}
							rs.close();
							pstmt.close();
							conn.close();
							
							return listRet;
				
						}
						// ArrayList<BoardDto> 객체의 참조값을 리턴하는 메서드.
						public ArrayList<Gosu_profile_qna_answerDto> getGosuprofileQnaAnswer(int gUsers_idx) throws Exception{
							ArrayList<Gosu_profile_qna_answerDto> listRet = new ArrayList<Gosu_profile_qna_answerDto>();
							
							String sql = "SELECT users_idx,answer1,answer2,answer3,answer4,answer5\r\n" + 
									"FROM gosu_qna_answer\r\n" + 
									"WHERE users_idx = ?";
							Connection conn = getConnection();
							
							PreparedStatement pstmt = conn.prepareStatement(sql);
							pstmt.setInt(1, gUsers_idx);
							
							ResultSet rs = pstmt.executeQuery();
							while(rs.next()) {
								int users_idx = rs.getInt(1);
								String answer1 = rs.getString(2);
								String answer2 = rs.getString(3);
								String answer3 = rs.getString(4);
								String answer4 = rs.getString(5);
								String answer5 = rs.getString(6);
								Gosu_profile_qna_answerDto dto = new Gosu_profile_qna_answerDto(users_idx, answer1, answer2, answer3, answer4, answer5);
								listRet.add(dto);
							}
							rs.close();
							pstmt.close();
							conn.close();
							
							return listRet;
				
						}
}
