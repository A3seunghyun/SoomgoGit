package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.CategoryDto;

public class CategoryDao {
	public static Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo1";	//	 오라클 계정
		String pw = "pass1234";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,id,pw);
		//System.out.println("<<DB접속 완료>>");
		return conn;
	}
	public ArrayList<CategoryDto> getCategorySelect() throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT category_idx, title, thumbnail " + 
				" FROM category";  // 서비스 카테고리 (대분류) 목록을 조회하는 쿼리문
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// sql 실행
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<CategoryDto> cList = new ArrayList<CategoryDto>();
		while(rs.next()) {
			int categoryIdx = rs.getInt(1);
			String categoryTitle = rs.getString(2);
			String thumbnail = rs.getString(3);
			cList.add(new CategoryDto(categoryIdx, categoryTitle, thumbnail));
		}
		//sql문 출력
		
		rs.close();
		pstmt.close();
		conn.close();
		return cList;
	}
}
