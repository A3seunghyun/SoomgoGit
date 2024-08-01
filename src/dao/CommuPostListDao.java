 package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.CommuMainPostActionDto;
import dto.CommuMainpostListDto;
import dto.CommuPageNumDto;
import dto.CommuPostListDto;


public class CommuPostListDao {
	public /* static */ Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";	//"hr";	 오라클 계정
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,id,pw);
//		System.out.println("<<DB 접속완료>>");
		return conn;
	}
	
	// postSelect(Integer, Integer, Integer) : 커뮤니티 게시글 목록 조회.
	// commuIdx : 커뮤니티idx
	// serviceIdx : 서비스idx	
	// townIdx : 지역idx
	// return -> ArrayList<PostDto : '게시글'>
	public ArrayList<CommuPostListDto> getListPostSelect(Integer commuIdx, Integer serviceIdx, Integer townIdx) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT c.title, s.title, p.title, p.contents, pr.province_name, t.town_name, p.p_date, " + 
				"	(SELECT img_url FROM post_img pi WHERE pi.post_idx=p.post_idx AND img_idx=(SELECT MIN(img_idx) FROM post_img pi WHERE pi.post_idx=p.post_idx)) imgUrl " + 
				"	 , p.post_idx " + 
				"	 FROM community c INNER JOIN post p " + 
				"	 ON c.commu_idx = p.commu_idx " + 
				"	 JOIN service s ON p.service_idx = s.service_idx " + 
				"	 JOIN town t ON p.town_idx = t.town_idx " + 
				"	 JOIN province pr ON pr.province_idx = t.province_idx " + 
				"	 WHERE 1=1";
		
		if(commuIdx != null)
			sql += " AND c.commu_idx = " + commuIdx;
		if(townIdx != null)
			sql += " AND t.town_idx = " + townIdx;
		if(serviceIdx != null)
			sql += " AND s.service_idx = " + serviceIdx;  // 1, 1, 170 궁금해요 글 목록

		sql += "ORDER BY p.p_date DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// 오라클 실행
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<CommuPostListDto> pList = new ArrayList<CommuPostListDto>();
		while(rs.next()) {
			String commuName = rs.getString(1);
			String serviceName = rs.getString(2);
			String title = rs.getString(3);
			String contents = rs.getString(4);
			String provinceName = rs.getString(5);
			String townName = rs.getString(6);
			String pDate = rs.getString(7);
			String imgUrl = rs.getString(8);
			int postIdx = rs.getInt(9);
			pList.add(new CommuPostListDto(commuName, serviceName, title, contents, imgUrl, provinceName, townName, pDate, postIdx));
		}
		rs.close();
		pstmt.close();
		conn.close();
		return pList;
	}
	
	
	// getCategoryNameByCommuIdx(int) : 커뮤니티idx를 받아서 카테고리명을 리턴.
	// 파라미터 commuIdx : 커뮤니티idx
	// return -> 카테고리명
	public String getCategoryNameByCommuIdx(int commuIdx) throws Exception {
		String sql = "SELECT title FROM community WHERE commu_idx = ?";
		String name = "";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, commuIdx);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			name = rs.getString("title");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return name;
	}
	
	// getServiceNameByIdx (int) : 서비스 idx를 받아서 서비스명을 리턴.
	// 파라미터 serviceIdx : 서비스idx
	// return -> 서비스명
	public String getServiceNameByIdx(int serviceIdx) throws Exception {
		String sql = "SELECT title FROM service WHERE service_idx = ? ";
		
		String name = "";
		
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, serviceIdx);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			name = rs.getString("title"); 
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return name;
	}
	
	// 메인에 뿌릴 커뮤니티 최근작성 게시글 3개
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
	
	// 페이지 번호를 불러옴
	public int getLastPageNumber() throws Exception {
		String sql = "SELECT count(*) " + 
				" FROM post";
//		페이지에 번호를 부여하기 위해 post에 모든 게시글 수를 셈
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int countRet = -1;
		if(rs.next()) {
			countRet = rs.getInt(1);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return countRet/10 + (countRet%10 > 0 ? 1 : 0);
	}
	
//	post_idx를 DESC 순으로  post 10개 뽑는 메서드  (무한 스크롤 적용 하기위함)
	public ArrayList<CommuPageNumDto> getPostListByPageNum(int pageNum) throws Exception{
		int endNum = pageNum *10;	// 한페이지에 10개씩 있다는 가정
		int startNum = endNum -9;	// 1, 11, 21, 31... 
		
//		post_idx를 DESC 순으로  post 10개 뽑음 
		String sql = "WITH table1 AS " + 
				"( " + 
				"    SELECT p.post_idx 게시글idx, c.commu_idx 커뮤idx, c.title AS 커뮤타이틀, s.service_idx 서비스idx, s.title AS 서비스명, pv.province_idx 도시idx, pv.province_name 도시명,  " + 
				"				          t.town_idx 지역idx, t.town_name AS 지역명,  " + 
				"				        	p.title AS 게시글제목,  u.alias AS 유저닉네임,  p.p_date AS 작성일시, p.contents AS 게시글내용, pi.img_url AS 게시글img, " + 
				"				        	clv.댓글수 , clv.좋아요수,  clv.조회수    " + 
				"     FROM post p   " + 
				"     INNER JOIN community c ON c.commu_idx = p.commu_idx    " + 
				"     INNER JOIN service s ON s.service_idx = p.service_idx   " + 
				"     INNER JOIN town t ON t.town_idx = p.town_idx    " + 
				"     INNER JOIN users u ON u.users_idx = p.users_idx   " + 
				"     INNER JOIN province pv ON pv.province_idx = t.province_idx " + 
				"     LEFT JOIN post_img pi ON pi.post_idx = p.post_idx " + 
				"     INNER JOIN (  " + 
				"        SELECT   " + 
				"            p.post_idx AS 게시글idx,  " + 
				"            NVL(c.comments_count, 0) AS 댓글수, " + 
				"            NVL(pl.likes_count, 0) AS 좋아요수,  " + 
				"            NVL(pv.views_count, 0) AS 조회수    " + 
				"        FROM post p    " + 
				"        LEFT JOIN (    " + 
				"            SELECT post_idx, COUNT(comments_idx) AS comments_count  " + 
				"            FROM comments    " + 
				"            GROUP BY post_idx   " + 
				"        ) c ON p.post_idx = c.post_idx   " + 
				"        LEFT JOIN (   " + 
				"            SELECT post_idx, COUNT(*) AS likes_count   " + 
				"            FROM post_like   " + 
				"            GROUP BY post_idx   " + 
				"        ) pl ON p.post_idx = pl.post_idx  " + 
				"        LEFT JOIN (    " + 
				"            SELECT post_idx, COUNT(*) AS views_count " + 
				"            FROM post_views    " + 
				"            GROUP BY post_idx    " + 
				"        ) pv ON p.post_idx = pv.post_idx   " + 
				"        ORDER BY p.post_idx DESC " + 
				"    ) clv ON clv.게시글idx = p.post_idx " + 
				"    ORDER BY 게시글idx DESC " + 
				" )" + 
				" SELECT  t2.*   " + 
				" FROM    (SELECT rownum rnum, table1.*   " + 
				"        FROM table1 " + 
				"        ) t2     " + 
				" WHERE   rnum>=? AND rnum<= ?";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startNum);
		pstmt.setInt(2, endNum);
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<CommuPageNumDto> list = new ArrayList<CommuPageNumDto>();
		while(rs.next()) {
			int postIdx = rs.getInt("게시글idx");
			int commuIdx = rs.getInt("커뮤idx");
			String commuTitle = rs.getString("커뮤타이틀");
			int serviceIdx = rs.getInt("서비스idx");
			String serviceTitle = rs.getString("서비스명");
			int provinceIdx = rs.getInt("도시idx");
			String provinceName = rs.getString("도시명");
			int townIdx = rs.getInt("지역idx");
			String townName = rs.getString("지역명");
			String postTitle = rs.getString("게시글제목");
			String userName = rs.getString("유저닉네임");
			String writeDate = rs.getString("작성일시");
			String postContents = rs.getString("게시글내용");
			String postImg = rs.getString("게시글img");
			int postCommentsCount = rs.getInt("댓글수");
			int postLikeCount = rs.getInt("좋아요수");
			int postViewsCount = rs.getInt("조회수");
			
			list.add(new CommuPageNumDto(postIdx, commuIdx, commuTitle, serviceIdx, serviceTitle, provinceIdx, provinceName
					,townIdx, townName, postTitle, userName, writeDate, postContents, postImg, postCommentsCount, postLikeCount, postViewsCount));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return list;
	}
	
//	public static void main(String[] args) {
//		CommuPostListDao dao = new CommuPostListDao();
//		try {
//			ArrayList<PageNumDto> list = dao.getPostListByPageNum(1);
//			for(PageNumDto dto : list) {
//				System.out.println(dto.getPostIdx() + " : " +  dto.getPostTitle());
//			}
//		} catch(Exception e) { e.printStackTrace(); }
//	}
}
