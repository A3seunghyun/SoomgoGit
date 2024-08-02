package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.EstimateOptionContentDto;

public class EstimateOptionContentDao {
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "soomgo";
		String dbPw	= "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
		
		return conn;
	}
	

	public ArrayList<EstimateOptionContentDto> getOptionContentByMultiIdx(int serviceIdx, int requestIdx) throws Exception {
		ArrayList<EstimateOptionContentDto> listRet = new ArrayList<EstimateOptionContentDto>();

		String sql = "SELECT OPTION_NUMBER, CONTENTS, OPTION_TYPE FROM options WHERE service_idx=? AND request_idx=? ORDER BY service_idx, request_idx";
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, serviceIdx);
		pstmt.setInt(2, requestIdx);
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()) {
			int optionNumber = rs.getInt("OPTION_NUMBER");
			String contents = rs.getString("CONTENTS");
			int optionType = rs.getInt("OPTION_TYPE");
			EstimateOptionContentDto dto = new EstimateOptionContentDto(optionNumber, contents, optionType);
			listRet.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return listRet;
	}
	
}
