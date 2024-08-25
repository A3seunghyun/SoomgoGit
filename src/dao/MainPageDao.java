package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.CommuGosuKnowhowPostLisMaintDto;
import dto.CommuMainPostActionDto;
import dto.CommuMainRandomGosuDto;
import dto.CommuMainpostListDto;
import dto.MainPopularGosuDto;
import dto.MaincleaningDto;

public class MainPageDao {
	public static Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
//		String url = "jdbc:oracle:thin:@192.168.0.22:1521:xe";
//		String id = "soomgo1";	//	 오라클 계정
//		String pw = "pass1234";
		String id = "soomgo";	//"hr";	 오라클 계정
		String pw = "soomgo";
		
		Class.forName(driver);
		
		Connection conn = DriverManager.getConnection(url,id,pw);
		return conn;
	}

	
	
// 	메인페이지에서 고수노하우 게시글 리스트를 불러오는 메서드
	public ArrayList<CommuGosuKnowhowPostLisMaintDto> getMainGkhPostList() throws Exception {
		Connection conn = getConnection();
		
		ArrayList<CommuGosuKnowhowPostLisMaintDto> gList = new ArrayList<CommuGosuKnowhowPostLisMaintDto>();
		
		// 위에거 수정 (메인에서 리스트 뿌려주기위해 수정, 최근게시글 2개만 나와야함)
		String sql = "SELECT * " + 
				" FROM (  SELECT p.post_idx \"게시글idx\", s.title \"서비스명\", gkh.img \"헤더이미지\", gkh.title \"게시글제목\" , gi.name \"고수명\", p.p_date \"작성날짜\" " + 
				" FROM gosu_know_how gkh " + 
				" INNER JOIN gosu_infor gi ON gkh.users_idx = gi.users_idx " + 
				" INNER JOIN post p ON p.post_idx = gkh.post_idx " + 
				" INNER JOIN community c ON c.commu_idx = p.commu_idx" + 
				" INNER JOIN service s ON s.service_idx = p.service_idx" + 
				" ORDER BY p.p_date DESC)" + 
				" WHERE ROWNUM <= 2";
		
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int postIdx = rs.getInt(1);					// 게시글 idx
			String serviceTitle = rs.getString(2);		// 서비스 명
			String postImg = rs.getString(3);			// 게시글 헤더img
			String postTitle = rs.getString(4);			// 게시글 제목
			String userName = rs.getString(5);			// 고수 명
			
			CommuGosuKnowhowPostLisMaintDto dto = new CommuGosuKnowhowPostLisMaintDto(postIdx, serviceTitle, postImg, postTitle, userName);
			gList.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
			
		return gList;
	}
	
	
//	 메인페이지 랜덤으로 고수 2명의 게시글이 나옴  <숨은고스를 발견했어요>
	public ArrayList<CommuMainRandomGosuDto> getRandomGosu() throws Exception {
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
		
		ArrayList<CommuMainRandomGosuDto> mList = new ArrayList<CommuMainRandomGosuDto>();
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String gosuImg = rs.getString(1);
			int gosuIdx = rs.getInt(2);
			String gosuName = rs.getString(3);
			String serviceTitle = rs.getString(4);
			double avgScore = rs.getDouble(5);
			String reviewContents = rs.getString(6);
			String userName = rs.getString(7);
			
			mList.add(new CommuMainRandomGosuDto(gosuImg, gosuIdx, gosuName, serviceTitle, avgScore, reviewContents, userName));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return mList;
	}
	
// 	메인에 뿌릴 커뮤니티 최근작성 게시글 3개
	public ArrayList<CommuMainpostListDto> getMainPostList() throws Exception {
		Connection conn = getConnection();
		
		String sql = " SELECT *     " + 
				" FROM (SELECT c.title \"커뮤명\", p.title \"게시글제목\", p.contents \"게시글내용\",  p.p_date \"작성일자\", " + 
				" (SELECT img_url FROM post_img pi WHERE pi.post_idx=p.post_idx AND img_idx=(SELECT MIN(img_idx) FROM post_img pi WHERE pi.post_idx=p.post_idx)) imgUrl " + 
				" , p.post_idx \"게시글idx\" " + 
				" FROM community c  " + 
				" INNER JOIN post p ON c.commu_idx = p.commu_idx  " + 
				" INNER JOIN town t ON p.town_idx = t.town_idx   " + 
				" INNER JOIN province pr ON pr.province_idx = t.province_idx  " + 
				" ORDER BY p.p_date DESC) " + 
				" WHERE ROWNUM <= 3";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ArrayList<CommuMainpostListDto> mainPostList = new ArrayList<CommuMainpostListDto>();
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String commuTitle = rs.getString(1);	// 커뮤타이틀 명
			String postTitle = rs.getString(2);		// 게시글 제목
			String postContents = rs.getString(3);	// 게시글 내용
			String postWrite = rs.getString(4);		// 게시글 작성일시
			String postImg = rs.getString(5);		// 게시글이미지
			int postIdx = rs.getInt(6);				// 게시글idx
			
			mainPostList.add(new CommuMainpostListDto(commuTitle, postTitle, postContents, postWrite, postImg, postIdx));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return mainPostList;
	}
	
//	메인 게시글(3개출력) 게시물의 댓글수, 조회수를 불러오는 메서드
	public ArrayList<CommuMainPostActionDto> getMainAction(int postIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT (SELECT count(comments_idx) FROM comments WHERE post_idx = ?) AS 댓글수  " + 
				" , (SELECT count(post_idx) FROM post_views WHERE post_idx = ?) AS 조회수 " + 
				" FROM post " + 
				" WHERE post_idx = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postIdx);	// 댓글수
		pstmt.setInt(2, postIdx);	// 조회수
		pstmt.setInt(3, postIdx);	// 어떤 게시글idx인지
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<CommuMainPostActionDto> actionList = new ArrayList<CommuMainPostActionDto>();
		
		if(rs.next()) {
			int commentCount = rs.getInt("댓글수");
			int viewCount = rs.getInt("조회수");
			
			actionList.add(new CommuMainPostActionDto(commentCount, viewCount));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return actionList;
	}
	
	
//	메인 인기있는 고수 (평점상위5명) 조회 
	public ArrayList<MainPopularGosuDto> getMainPopularGosuSelect() throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT * " + 
				"	 FROM ( " + 
				"    SELECT gi.users_idx \"고수idx\", gi.name\"고수명\", gi.f_img\"고수img\", gi.career\"경력\", avg(r.score) \"평점\" " + 
				"    FROM review r " + 
				"    INNER JOIN gosu_infor gi ON gi.users_idx = r.g_users_idx " + 
				"    GROUP BY gi.users_idx, gi.name, gi.career, gi.f_img " + 
				"    ORDER BY avg(r.score) DESC " + 
				"    ) " + 
				"	WHERE ROWNUM <=5";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<MainPopularGosuDto> list = new ArrayList<MainPopularGosuDto>();
		
		while(rs.next()) {
			int gosuIdx = rs.getInt("고수idx");
			String gosuName = rs.getString("고수명");
			String gosuImg = rs.getString("고수img");
			int career = rs.getInt("경력");
			int score = rs.getInt("평점");
			
			list.add(new MainPopularGosuDto(gosuIdx, gosuName, gosuImg, career, score));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return list;
	}
	
	
//	메인 인기있는 고수 (평점상위5명) 조회 
	public ArrayList<MaincleaningDto> getMaincleaningListSelect() throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT * " + 
				"		 FROM ( " + 
				"        SELECT s.title \"서비스명\", s.service_idx \"서비스idx\", s.service_thumbnail  \"서비스img\"" + 
				"        FROM service s " + 
				"        INNER JOIN category c ON c.category_idx = s.category_idx " + 
				"        WHERE s.category_idx = 1 " + 
				"        ORDER BY s.service_idx  " + 
				"     ) " + 
				"	  	 WHERE rownum <= 4";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<MaincleaningDto> list = new ArrayList<MaincleaningDto>();
		
		while(rs.next()) {
			String serviceTitle = rs.getString("서비스명");
			int serviceIdx = rs.getInt("서비스idx");
			String serviceImg = rs.getString("서비스img");
			
			list.add(new MaincleaningDto(serviceTitle, serviceIdx, serviceImg));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return list;
	}
	
	
	
	public static void main(String[] args) throws Exception {
		MainPageDao dao = new MainPageDao();
		System.out.println(dao.getMaincleaningListSelect());
	}
}
