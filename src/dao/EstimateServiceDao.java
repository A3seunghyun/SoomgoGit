package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.EstimateCategoryDto;
import dto.EstimateServiceDto;

public class EstimateServiceDao {
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "soomgo";
		String dbPw	= "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
		
		return conn;
	}
	
	public ArrayList<EstimateServiceDto> getServiceListAll() throws Exception {
		ArrayList<EstimateServiceDto> listRet = new ArrayList<EstimateServiceDto>();

		String sql = "SELECT * FROM service ORDER BY service_idx";
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()) {
			int categoryIdx = rs.getInt("categoryIdx");
			int serviceIdx = rs.getInt("service_idx");
			String title = rs.getString("title");
			String thumbnail = rs.getString("thumbnail");
			int midCategoryIdx = rs.getInt("middle_category_idx");
			EstimateServiceDto dto = new EstimateServiceDto(categoryIdx, serviceIdx, title, thumbnail, midCategoryIdx);
			listRet.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return listRet;
	}
	
	public EstimateServiceDto getServiceByCategoryIdx(int categoryIdx) throws Exception {
		String sql = "SELECT * FROM service WHERE category_idx = ? ORDER BY service_idx";
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, categoryIdx);
		ResultSet rs = pstmt.executeQuery();
		
		EstimateServiceDto dto = null;
		if(rs.next()) {
			int serviceIdx = rs.getInt("service_idx");
			String title = rs.getString("title");
			String thumbnail = rs.getString("thumbnail");
			int midCategoryIdx = rs.getInt("middle_category_idx");
			dto = new EstimateServiceDto(categoryIdx, serviceIdx, title, thumbnail, midCategoryIdx);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return dto;
	}
	
	public EstimateServiceDto getServiceByServiceIdx(int serviceIdx) throws Exception {
        String sql = "SELECT category_idx, \r\n" + 
	        		"        service_idx,\r\n" + 
	        		"        title,\r\n" + 
	        		"        SERVICE_THUMBNAIL,\r\n" + 
	        		"        middle_category_idx\r\n" + 
	        		"FROM service \r\n" + 
	        		"WHERE service_idx = ?";
        EstimateServiceDto serviceDto = null;
        
        Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, serviceIdx);
        
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
        	int categoryIdx = rs.getInt("category_idx");
			String title = rs.getString("title");
			String thumbnail = rs.getString("SERVICE_THUMBNAIL");
			int midCategoryIdx = rs.getInt("middle_category_idx");
            serviceDto = new EstimateServiceDto(categoryIdx, serviceIdx, title, thumbnail, midCategoryIdx);
        }
        rs.close();
		pstmt.close();
		conn.close();
		
        return serviceDto;
	}
	
	public ArrayList<EstimateServiceDto> getServiceByMidCategoryIdx(int midCategoryIdx) throws Exception {
		ArrayList<EstimateServiceDto> listRet = new ArrayList<EstimateServiceDto>();

		String sql = "SELECT * FROM service WHERE middle_category_idx = ? ORDER BY service_idx";
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, midCategoryIdx);
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()) {
			int categoryIdx = rs.getInt("CATEGORY_IDX"); 
	        int serviceIdx = rs.getInt("SERVICE_IDX");
	        String title = rs.getString("TITLE");
	        String thumbnail = rs.getString("SERVICE_THUMBNAIL");
	        EstimateServiceDto dto = new EstimateServiceDto(categoryIdx, serviceIdx, title, thumbnail, midCategoryIdx);
	        listRet.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return listRet;
	}
	
	
	
	
	
	
	
}	
