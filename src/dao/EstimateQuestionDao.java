package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.EstimateQuestionDto;
import dto.EstimateServiceDto;

public class EstimateQuestionDao {
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "soomgo";
		String dbPw	= "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
		
		return conn;
	}
	
	public ArrayList<EstimateQuestionDto> getQuestionListAll() throws Exception {
		ArrayList<EstimateQuestionDto> listRet = new ArrayList<EstimateQuestionDto>();

		String sql = "SELECT * FROM request ORDER BY service_idx, request_idx";
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()) {
			int serviceIdx = rs.getInt("SERVICE_IDX");
			int requestIdx = rs.getInt("REQUEST_IDX");
			String contents = rs.getString("CONTENTS");
			EstimateQuestionDto dto = new EstimateQuestionDto(serviceIdx, requestIdx, contents);
			listRet.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return listRet;
	}
	
	public ArrayList<EstimateQuestionDto> getQuestionByServiceIdx(int serviceIdx) throws Exception {
		ArrayList<EstimateQuestionDto> listRet = new ArrayList<EstimateQuestionDto>();

		String sql = "SELECT * FROM request WHERE service_idx = ? ORDER BY service_idx, request_idx";
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, serviceIdx);
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()) {
			int requestIdx = rs.getInt("REQUEST_IDX");
			String contents = rs.getString("CONTENTS");
			EstimateQuestionDto dto = new EstimateQuestionDto(serviceIdx, requestIdx, contents);
			listRet.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return listRet;
	}
		
}
