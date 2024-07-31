package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MarketProductDetailDTO;

public class MarketRegistrationDAO {
	
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		return conn;
	}
	
//	public int seqCurrval() throws Exception {
//		// 현재 시퀀스 값
//		Connection conn = getConnection();
//		
//		String seqSql = "SELECT MARKET_IDX_SEQ.CURRVAL FROM DUAL";
//		PreparedStatement pstmt = conn.prepareStatement(seqSql);
//		
//		
//		ResultSet rs = pstmt.executeQuery();
//
//
//		int result = 0;
//		if (rs.next()) {
//			result = rs.getInt(1);
//		}
//		
//		rs.close();
//		pstmt.close();
//		conn.close();
//		
//		return result;
//	}
	
	// 마켓idx, 카테고리명, 상품명, 유저idx, 상품등록날짜
	int marketIdx = 0;
	public int market(int category, String mTitle, int userIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO MARKET(MARKET_IDX, SERVICE_IDX, NAME,  USERS_IDX, PRODUCT_DATE) VALUES(market_idx_seq.nextval, ?, ?, ?, sysdate)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql, new String[] {"market_idx"});
		
		pstmt.setInt(1, category);
		pstmt.setString(2, mTitle);
		pstmt.setInt(3, userIdx);
		pstmt.executeUpdate();
		
		ResultSet rs = pstmt.getGeneratedKeys();
		int newMarketIdx = 0;
		if(rs.next()) {
			newMarketIdx = rs.getInt(1);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return newMarketIdx;
		
	}
	
	// 마켓idx, 온라인여부, 대면여부, 서비스지역, 상세설명
	public void marketDetail(int marketIdx, String untact, String contact, int serviceArea, String detailContent) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO MARKET_DETAIL(MARKET_IDX, UNTACT, CONTACT, SERVICE_AREA_IDX, CONTENTS) VALUES (?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.setString(2, untact);
		pstmt.setString(3, contact);
		pstmt.setInt(4, serviceArea);
		pstmt.setString(5, detailContent);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
	
	// 마켓idx, 옵션idx, 옵션명, 옵션설명, 옵션가격
	public void marketOption(int marketIdx, String optionTitle, String optionContent, int optionPrice) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO MARKET_ITEM_PRICE(MARKET_IDX, PRICE_IDX, NAME, DETAIL, PRICE) VALUES(?, marekt_option_price_idx_seq.nextval, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.setString(2, optionTitle);
		pstmt.setString(3, optionContent);
		pstmt.setInt(4, optionPrice);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
	
	// 마켓idx, 요일, 시작시간, 종료시간, 스케쥴idx
	public void marketSchedule(int marketIdx, String dayWeek, String st_time, String ed_time) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO SCHEDULE(MARKET_IDX, DAYWEEK, ST_TIME, ED_TIME, SCHEDULE_IDX) VALUES(?, ?, ?, ?, MARKET_SCHEDULE_IDX_SEQ.NEXTVAL)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.setString(2, dayWeek);
		pstmt.setString(3, st_time);
		pstmt.setString(4, ed_time);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
	
	// 마켓idx, 자주묻는질문, 답변
	public void marketAsk(int marketIdx, String question, String answer) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO MARKET_ASK(MARKET_IDX, QUESTION, ANSWER) VALUES(?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.setString(2, question);
		pstmt.setString(3, answer);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
	
	// 마켓idx, 취소환불
	public void marketAskRefund(int marketIdx, String refund) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO MARKET_ASK_REFUND(MARKET_IDX, REFUND) VALUES(?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.setString(2, refund);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
	
	// 마켓idx, 이미지idx, 이미지url		// 마켓 대표이미지
	public void marketThumbnailImg(int marketIdx, String url) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO MARKET_IMG(MARKET_IDX, IMG_IDX, IMG_URL) VALUES(?, MARKET_THUMBNAIL_IMG_IDX_SEQ.nextval, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.setString(2, url);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
	
	// 마켓idx, 이미지idx, 이미지url		// 마켓 상세이미지
	public void marketDetailImg(int marketIdx, String url) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO MARKET_ITEM_IMG(MARKET_IDX, IMG_IDX, IMG_URL) VALUES(?, MARKET_DETAIL_IMG_IDX_SEQ.nextval, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.setString(2, url);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
	
	
	//	DELETE 
	//	  FROM 
	//	 WHERE 
	public void marketDelete(int marketIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "DELETE FROM market WHERE market_idx=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
	
	public void marketDetailDelete(int marketIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "DELETE FROM market_detail WHERE market_idx=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
	
	public void marketOptionDelete(int marketIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "DELETE FROM MARKET_ITEM_PRICE WHERE market_idx=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
	
	public void marketScheduleDelete(int marketIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "DELETE FROM schedule WHERE market_idx=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
	
	
	public void marketAskDelete(int marketIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "DELETE FROM market_ask WHERE market_idx=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
	
	public void marketAskRefundDelete(int marketIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "DELETE FROM market_ask_refund WHERE market_idx=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
	
	public void marketThumbnailImgDelete(int marketIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "DELETE FROM market_img WHERE market_idx=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
	
	public void marketDetailImgDelete(int marketIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "DELETE FROM market_item_img WHERE market_idx=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
	
	

}
