package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.CommuProvinceDto;
import dto.CommuTownDto;

public class ProvinceTownDao  {
	public static  Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";	//"hr";	 오라클 계정
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = (Connection) DriverManager.getConnection(url,id,pw);
//		System.out.println("<<DB접속 완료>>");
		return conn;
	}
	
	/* 도시명을 불러오는 메서드 */
	public ArrayList<CommuProvinceDto> getProvinceSelect() throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT province_idx, province_name" + 
				" FROM province";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ArrayList<CommuProvinceDto> pList = new ArrayList<CommuProvinceDto>();
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int provinceIdx = rs.getInt(1);
			String provinceName = rs.getString(2);
			pList.add(new CommuProvinceDto(provinceIdx, provinceName));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return pList;
	}
	
	/* 지역명을 불러오는 메서드 */
	public ArrayList<CommuTownDto> getTownSelect(int idx) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT town_idx, town_name " + 
				" FROM town" + 
				" WHERE province_idx = ?";	
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, idx);
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<CommuTownDto> tList = new ArrayList<CommuTownDto>();  // 객체생성 후 참조변수 선언
		// 단일행 조회는 굳이 ArrayList를 쓰지 않아도 됨.
		while(rs.next()) {
			CommuTownDto dto = new CommuTownDto(rs.getInt(1), rs.getString(2));
			tList.add(dto); // 참조변수 초기화 (파라미터 n개 짜리 생성자 만들며)
		}
		rs.close();
		pstmt.close();
		conn.close();
		return tList;
	}
	
	
	public String getTownNameFromTownIdx(int townIdx) throws Exception {
		
		String sql = "SELECT town_name FROM town WHERE town_idx=?";
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,townIdx);
		
		ResultSet rs = pstmt.executeQuery();
		
		String townName = null;
		if(rs.next()) {
			townName = rs.getString("town_name");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return townName;
	}
	
	
	
	
	
	
}
