package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.EstimateCategoryDto;
import dto.EstimateServiceDto;

public class EstimateCategoryDao {
	Connection getConnection() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "soomgo";
		String dbPw	= "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,dbId,dbPw);
		
		return conn;		
	}
	
	public ArrayList<EstimateCategoryDto> getCategoryListAll() throws Exception {
		ArrayList<EstimateCategoryDto> listRet = new ArrayList<EstimateCategoryDto>();

		String sql = "SELECT * FROM category ORDER BY category_idx";
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()) {
			int categoryIdx = rs.getInt("category_idx");
			String title = rs.getString("title");
			String thumbnail = rs.getString("thumbnail");
			EstimateCategoryDto dto = new EstimateCategoryDto(categoryIdx, title, thumbnail);
			listRet.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return listRet;
		
		
	}
	
	public int getCategoryIdxByService(int serviceIdx) throws Exception{
		String sql = "SELECT category_idx FROM service WHERE service_idx = ?";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, serviceIdx);
		
		ResultSet rs = pstmt.executeQuery();
		
		int categoryIdx = -1;
		if(rs.next()) {
			categoryIdx = rs.getInt(1);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return categoryIdx;
	}
	
	public EstimateCategoryDto getCategoryByIdx(int categoryIdx) throws Exception {
		String sql = "SELECT * FROM category WHERE category_idx = ?";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, categoryIdx);
		ResultSet rs = pstmt.executeQuery();
		
		EstimateCategoryDto dto = null;
		if(rs.next()) {
			String title = rs.getString("title");
			String thumbnail = rs.getString("thumbnail");
			dto = new EstimateCategoryDto(categoryIdx, title, thumbnail);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return dto;
	}

}
