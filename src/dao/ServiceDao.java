package dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.ServiceCountDto;
import dto.ServiceDto;
import dto.ServiceList;

public class ServiceDao {
	public static Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo1";	//"hr";	 오라클 계정
		String pw = "pass1234";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,id,pw);
//		System.out.println("<<DB접속 완료>>");
		return conn;
	}
	
	// 서비스 필터 post 디비에 저장된 service_IDX,title만 뽑아 놓고 필터에 적용 (필터적용시 보여줄 수 있는 게시글들만 뽑으려고)
	public static ArrayList<ServiceCountDto> serviceSelect() throws Exception {
		Connection conn = getConnection();
		
/*		String sql = "SELECT c.title t1, s.title t2 " + 
				" FROM category c JOIN service s" + 
				" ON c.category_idx = s.category_idx"; 
				//"-- WHERE s.service_idx = ?"; */
		String sql = "SELECT *" + 
					" FROM " + 
					" (SELECT c.category_idx, c.title ctitle, s.service_idx, s.title stitle, " + 
					" (SELECT COUNT(*) FROM post WHERE service_idx=s.service_idx) cnt" + 
					" FROM category c JOIN service s " + 
					" ON c.category_idx = s.category_idx" +
					" ORDER BY c.category_idx)" +
					" WHERE cnt>0";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ArrayList<ServiceCountDto> sList = new ArrayList<ServiceCountDto>();
		
		ResultSet rs = pstmt.executeQuery();
		int previousCategoryIdx = 0;
		while(rs.next()) {
			int categoryIdx = rs.getInt("category_idx");
			String categoryTitle = rs.getString("ctitle");
			int serviceIdx = rs.getInt("service_idx");
			String serviceTitle = rs.getString("stitle");
			int cnt = rs.getInt("cnt");

			if(categoryIdx > previousCategoryIdx) {
				sList.add(new ServiceCountDto(categoryIdx, categoryTitle, null, null, null));
				previousCategoryIdx = categoryIdx;
			}
			
			sList.add(new ServiceCountDto(categoryIdx, categoryTitle, serviceIdx, serviceTitle, cnt));
		}
		rs.close();
		pstmt.close();
		conn.close();
		return sList;
	}
	
	//메인페이지 서비스 검색기능 (검색단어에 맞는 서비스 목록들이 조회됨)
	public ArrayList<ServiceList> getServiceList(String searchString) throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT title, service_idx " + 
				" FROM service " + 
				" WHERE title like  ? ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%" + searchString + "%");
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<ServiceList> sList = new ArrayList<ServiceList>();
		
		while(rs.next()) {
			String serviceTitle = rs.getString(1);
			int serviceIdx = rs.getInt(2); 
			
			sList.add(new ServiceList(serviceTitle, serviceIdx));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return sList;
	}
	public String getServiceTitleFromServiceIdx(int serviceIdx) throws Exception {
		
		String sql = "SELECT title FROM service WHERE service_idx=?";
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,serviceIdx);
		
		ResultSet rs = pstmt.executeQuery();
		
		String serviceTitle = null;
		if(rs.next()) {
			serviceTitle = rs.getString("title");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return serviceTitle;
	}
	
	
	
	
	public static void main(String[] args) throws Exception {
//		post 게시글에 넣은 서비스만 뽑아놨음
//		ArrayList<ServiceCountDto> sList = serviceSelect();
//		for(int i=0; i<sList.size(); i++) {
//			System.out.println(sList.get(i));
//		}
		
//		ArrayList<ServiceList> list = getServiceList("이");  
//		for(int i=0; i<=list.size()-1; i++) {
//			System.out.println(list.get(i));
//		}
	}
}












