package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.EstimateRequestQuestionDto;
import dto.EstimateRequestOptionDto;
// testDetail에서 사용되는 DAO이므로 사용 금지
public class EstimateRequestOptionDao {
	Connection getConnection() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "soomgo";
		String dbPw	= "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
		
		return conn;
	}

	public ArrayList<EstimateRequestOptionDto> getOptionByRequestIdx(int serviceIdx, int requestIdx) throws Exception {
		ArrayList<EstimateRequestOptionDto> listRet = new ArrayList<EstimateRequestOptionDto>();
		String sql = "SELECT * FROM options WHERE service_idx = ? AND request_idx = ?";
		
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, serviceIdx);
		pstmt.setInt(2, requestIdx);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int optionIdx = rs.getInt("option_number");
			String contents = rs.getNString("contents");
			EstimateRequestOptionDto dto = new EstimateRequestOptionDto(serviceIdx, requestIdx, optionIdx, contents);
			listRet.add(dto);
		}
		return listRet;
		
	}
}
