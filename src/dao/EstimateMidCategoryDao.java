package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.EstimateMidCategoryDto;

public class EstimateMidCategoryDao {
	Connection getConnection() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "soomgo";
		String dbPw	= "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,dbId,dbPw);
		
		return conn;		
	}
	
	public ArrayList<EstimateMidCategoryDto> getMidCategoryByCategoryIdx(int categoryIdx) throws Exception {
		ArrayList<EstimateMidCategoryDto> listRet = new ArrayList<EstimateMidCategoryDto>();
		Connection conn = getConnection();
		String sql = "SELECT * FROM middle_category WHERE category_idx = ? ORDER BY middle_category_idx";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, categoryIdx);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int midCategoryIdx = rs.getInt("middle_category_idx");
			String title = rs.getString("title");
			EstimateMidCategoryDto dto = new EstimateMidCategoryDto(midCategoryIdx, categoryIdx, title);
			listRet.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return listRet;
	}
	
}
