package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.EstimateOptionContentDto;
import dto.EstimateOptionDto;

public class EstimateOptionDao {
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "soomgo";
		String dbPw	= "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
		
		return conn;
	}
	
	public ArrayList<EstimateOptionDto> getQuestionListAll() throws Exception {
		ArrayList<EstimateOptionDto> listRet = new ArrayList<EstimateOptionDto>();

		String sql = "SELECT * FROM options ORDER BY service_idx, request_idx";
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()) {
			int serviceIdx = rs.getInt("SERVICE_IDX");
			int requestIdx = rs.getInt("REQUEST_IDX");
			int optionNumber = rs.getInt("OPTION_NUMBER");
			String contents = rs.getString("CONTENTS");
			int optionType = rs.getInt("OPTION_TYPE");
			EstimateOptionDto dto = new EstimateOptionDto(serviceIdx, requestIdx, optionNumber, contents, optionType);
			listRet.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return listRet;
	}
	
	public ArrayList<EstimateOptionDto> getOptionByServiceIdx(int serviceIdx) throws Exception {
		ArrayList<EstimateOptionDto> listRet = new ArrayList<EstimateOptionDto>();

		String sql = "SELECT * FROM options WHERE service_idx=? ORDER BY service_idx, request_idx";
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, serviceIdx);
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()) {
			int requestIdx = rs.getInt("REQUEST_IDX");
			int optionNumber = rs.getInt("OPTION_NUMBER");
			String contents = rs.getString("CONTENTS");
			int optionType = rs.getInt("OPTION_TYPE");
			EstimateOptionDto dto = new EstimateOptionDto(serviceIdx, requestIdx, optionNumber, contents, optionType);
			listRet.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return listRet;
	}
	
}
