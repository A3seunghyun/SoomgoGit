package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.CommunityDto;

public class CommunityDao {
	public static Connection getConnection() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo1";	//"hr";	 오라클 계정
		String pw = "pass1234";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,id,pw);
//		System.out.println("<<DB접속완료>>");
		return conn;
	}
	public ArrayList<CommunityDto> commuTitleSelect() throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT title, commu_idx " +
				" FROM community" +
				" WHERE commu_idx BETWEEN 1 AND 6" +
				" ORDER BY commu_idx"; //숨고생활 사용자일때 출력되는 커뮤 타이틀 
													// 숨고생활 고수는 1~8
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// sql 실행

		ResultSet rs = pstmt.executeQuery();
		// sql문 출력
		
		ArrayList<CommunityDto> cList = new ArrayList<CommunityDto>();
		while(rs.next()) {
			int idx = rs.getInt("commu_idx");
			String title = rs.getString("title");
			cList.add(new CommunityDto(idx, title));
//			System.out.println(title);  출력 확인용 
		}
		rs.close();
		pstmt.close();
		conn.close();
		return cList;
	}
}
