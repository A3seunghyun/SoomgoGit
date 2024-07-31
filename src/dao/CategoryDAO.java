package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.CategoryDTO;
import dto.MiddleCategoryDTO;

public class CategoryDAO {
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		return conn;
	}
	
	public ArrayList<CategoryDTO> catelist() throws Exception {
		//대주제 카테고리
		Connection conn = getConnection();
		
		String sql = "SELECT category_idx \"카테고리idx\", TITLE \"카테고리명\"" +
				" FROM category";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		ArrayList<CategoryDTO> categorylist = new ArrayList<CategoryDTO>();

		while (rs.next()) {
			CategoryDTO dto = new CategoryDTO(rs.getInt(1),rs.getString(2));
			categorylist.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return categorylist;
	}
	
	public ArrayList<MiddleCategoryDTO> middleCateList(int cateIdx) throws Exception {
		//중주제 카테고리
		Connection conn = getConnection();
		
		String sql = "SELECT middle_category_idx \"중주제idx\", category_idx \"대주제idx\", title \"중주제명\"" +
				" FROM middle_category" +
				" WHERE category_idx = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, cateIdx);
		
		ResultSet rs = pstmt.executeQuery();

		ArrayList<MiddleCategoryDTO> middleCategorylist = new ArrayList<MiddleCategoryDTO>();

		while (rs.next()) {
			MiddleCategoryDTO dto = new MiddleCategoryDTO(rs.getInt(1),rs.getInt(2),rs.getString(3));
			middleCategorylist.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return middleCategorylist;
	}
}
