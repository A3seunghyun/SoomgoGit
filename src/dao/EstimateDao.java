package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.ChatContentsDTO;
import dto.EstimateDto;

public class EstimateDao {
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		return conn;
	}
	
	public void insertDataEstimate(int usersIdx, int serviceIdx, String answerJson) throws Exception {
		// 답변들을 answer(estimate) 저장
		Connection conn = getConnection();
		 
		String sql = "INSERT INTO answer" + 
					"VALUES (SEQ_ANSWER_IDX.NEXTVAL, ?, ?, ?);";
		PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, usersIdx);
        pstmt.setInt(2, serviceIdx);
        pstmt.setString(3, answerJson);
        pstmt.executeUpdate();

	    System.out.println("estimate 생성 완료");
	    
		pstmt.close();
		conn.close();
	}

	public EstimateDto getAnswerForUserService(int usersIdx, int serviceIdx) throws Exception {
		// 가장 최신 answer 불러오기
		Connection conn = getConnection();
		
		String sql = "SELECT * FROM ANSWER WHERE users_idx = ? AND SERVICE_IDX = ? ORDER BY answer_idx DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, usersIdx);
		pstmt.setInt(2, serviceIdx);
		
		ResultSet rs = pstmt.executeQuery();
		EstimateDto dto = null;
		if (rs.next()) {
			dto = new EstimateDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return dto;
	}
	
	
}
