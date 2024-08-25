package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.EstimateRequestQuestionDto;

//서블릿 테스트에서 사용되는 DAO이므로 사용 금지
public class EstimateRequestQuestionDao {
	Connection getConnection() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "soomgo";
		String dbPw	= "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
		
		return conn;
	}
	
	public ArrayList<EstimateRequestQuestionDto> getQuestionsByServiceIdx(int requestServiceIdx) throws Exception {
		ArrayList<EstimateRequestQuestionDto> listRet = new ArrayList<EstimateRequestQuestionDto>();
		Connection conn = getConnection();
		String sql = "SELECT req.request_idx,\r\n" + 
				"		req.contents,\r\n" + 
				"		ser.service_idx\r\n" + 
				"		FROM request req, service ser\r\n" + 
				"		WHERE ser.service_idx = req.service_idx\r\n" + 
				"		AND ser.service_idx = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, requestServiceIdx);

		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int requestIdx = rs.getInt(1);
			String contents = rs.getString(2);
			EstimateRequestQuestionDto dto = new EstimateRequestQuestionDto(requestIdx, contents, requestServiceIdx);
			listRet.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return listRet;
	}
	
}
