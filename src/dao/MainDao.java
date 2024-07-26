package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MainRandomGosuDto;
import dto.NoticeDto;

public class MainDao {

	public static Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo1";	//	 오라클 계정
		String pw = "pass1234";
		
		Class.forName(driver);
		
		Connection conn = DriverManager.getConnection(url,id,pw);
		return conn;
	}
	
	// 메인페이지 랜덤으로 고수 2명의 게시글이 나옴  <숨은고스를 발견했어요>
	public ArrayList<MainRandomGosuDto> getRandomGosu() throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT * " + 
				"FROM " + 
				" (SELECT gi.f_img\"프로필img\", gi.users_idx\"고수idx\", gi.name\"고수명\" " + 
				" ,s.title\"서비스명\", avg(score) OVER (PARTITION BY gi.users_idx) \"평점\" " + 
				" , r.contents \"리뷰내용\", u.name\"유저명\", " + 
				" row_number() OVER (order BY dbms_random.value) \"랜덤조회\" " + 
				" FROM gosu_infor gi " + 
				" INNER JOIN review r ON r.g_users_idx = gi.users_idx " + 
				" INNER JOIN review_img ri ON ri.review_idx = r.review_idx " + 
				" INNER JOIN gosu_service gs ON gs.users_idx = gi.users_idx " + 
				" INNER JOIN service s ON s.service_idx = gs.service_idx " + 
				" INNER JOIN users u ON u.users_idx = r.users_idx " + 
				") " + 
				"WHERE ROWNUM <=2";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ArrayList<MainRandomGosuDto> mList = new ArrayList<MainRandomGosuDto>();
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String gosuImg = rs.getString(1);
			int gosuIdx = rs.getInt(2);
			String gosuName = rs.getString(3);
			String serviceTitle = rs.getString(4);
			double avgScore = rs.getDouble(5);
			String reviewContents = rs.getString(6);
			String userName = rs.getString(7);
			
			mList.add(new MainRandomGosuDto(gosuImg, gosuIdx, gosuName, serviceTitle, avgScore, reviewContents, userName));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return mList;
	}
	
	
	
	
	
}
