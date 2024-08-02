package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;

import dto.CommuCategoryDto;
import dto.CommuCommentsChildDto;
import dto.CommuCommentsDto;
import dto.CommuGkhpostFooterDto;
import dto.CommuGosuKnowhowPostDto;
import dto.CommuHotTopicList;
import dto.CommuLatestPhotoReviewsList;
import dto.CommuPageNumDto;
import dto.CommuPostDto;
import dto.CommuPostLikeViewCommentDto;
import dto.CommuPostListDto;
import dto.CommuPostViewsDto;
import dto.CommuPostWritePowerDto;
import dto.CommuServiceTitleDto;
import dto.CommunityDto;
import dto.CommunityGosuDto;

public class CommunityDao {
	public static Connection getConnection() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";	//"hr";	 오라클 계정
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,id,pw);
//		System.out.println("<<DB접속완료>>");
		return conn;
	}
	
	
//	고수, 유저에 따라 글쓰기 권한이 다름
	public static ArrayList<CommuPostWritePowerDto> postWritePowerSelect() throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT c.commu_idx ci, c.title t" + 
					" FROM    community c" + 
					" WHERE  commu_power = 1";
				// (?) 유저, 고수에 따라 글 쓸 수 있는 커뮤니티 카테고리가 다름. 1유저 2 고수
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ArrayList<CommuPostWritePowerDto> pwList = new ArrayList<CommuPostWritePowerDto>();
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String commuIdx = rs.getString("ci");
			String commuTitle = rs.getString("t");
			pwList.add(new CommuPostWritePowerDto(commuIdx,commuTitle));
		}
		rs.close();
		pstmt.close();
		conn.close();
		return pwList;
	}
	
	
//	 일반 유저일때 보이는 커뮤니티 목록
	public ArrayList<CommunityDto> commuTitleSelect() throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT title, commu_idx " +
				" FROM community" +
				" WHERE commu_idx BETWEEN 1 AND 5" +
				" ORDER BY commu_idx"; //숨고생활 사용자일때 출력되는 커뮤 타이틀 
													// 숨고생활 고수는 1~9
		
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
	
	
//	 고수일떄 보이는 커뮤니티 목록
	public static ArrayList<CommunityGosuDto> commuTitleGosuSelect() throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT title, commu_idx" + 
				" FROM community" + 
				" WHERE commu_idx BETWEEN 1 AND 9";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<CommunityGosuDto> list = new ArrayList<CommunityGosuDto>();
		while(rs.next()) {
			int idx = rs.getInt("commu_idx");
			String title = rs.getString("title");
			list.add(new CommunityGosuDto(idx,title));
		}
		rs.close();
		pstmt.close();
		conn.close();
		return list;
	}
	
	
//	커뮤 카테고리목록을 불러오느 메서드
	public ArrayList<CommuCategoryDto> getCategorySelect() throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT category_idx, title, thumbnail " + 
				" FROM category";  // 서비스 카테고리 (대분류) 목록을 조회하는 쿼리문
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// sql 실행
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<CommuCategoryDto> cList = new ArrayList<CommuCategoryDto>();
		while(rs.next()) {
			int categoryIdx = rs.getInt(1);
			String categoryTitle = rs.getString(2);
			String thumbnail = rs.getString(3);
			cList.add(new CommuCategoryDto(categoryIdx, categoryTitle, thumbnail));
		}
		//sql문 출력
		
		rs.close();
		pstmt.close();
		conn.close();
		return cList;
	}
		
	
//gkh.img -> 헤더 이미지 (대표사진)
	//gkh.title -> 게시글 제목 
	//gi.name -> 유저명 
	//gkh.post_idx -> 게시글idx 
	//gkh.start_post -> 시작글 
	//gkh.service_idx -> 서비스idx 
	//mt.contents -> 게시글(본문)내용 
	//mt.header_post -> 본문 머리글 
	//mt.img1 -> 본문 이미지1 
	//mt.img2 -> 본문 이미지2
	//mt.img3 -> 본문 이미지3 
	//s.title -> 서비스명
//	고수 노하우 상세 게시글을 불러오는 메서드
	public ArrayList<CommuGosuKnowhowPostDto> getGkhPost(int postGetIdx) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT gi.name, gi.explain,  gkh.img, gkh.title , gkh.post_idx, gkh.start_post, gkh.service_idx, " + 
				"    mt.main_idx, mt.contents, mt.header_post, mt.img1, mt.img2, mt.img3, s.title, p.p_date, " + 
				"    c.title " + 
				" FROM gosu_know_how gkh JOIN gosu_infor gi " + 
				" ON gi.users_idx = gkh.users_idx " + 
				" INNER JOIN main_text mt ON mt.post_idx = gkh.post_idx " + 
				" INNER JOIN service s ON s.service_idx = gkh.service_idx " + 
				" INNER JOIN post p ON p.post_idx = gkh.post_idx " + 
				" INNER JOIN community c ON c.commu_idx = p.commu_idx " + 
				" WHERE gkh.post_idx = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postGetIdx);
		
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<CommuGosuKnowhowPostDto> gList = new ArrayList<CommuGosuKnowhowPostDto>();
		
		while(rs.next()) {
			 	String name = rs.getString(1);
			    String explain = rs.getString(2);
			    String img = rs.getString(3);
			    String title = rs.getString(4);
			    int postIdx = rs.getInt(5);
			    String startPost = rs.getString(6);
			    int serviceIdx = rs.getInt(7);
			    int mainIdx = rs.getInt(8);
			    String contents = rs.getString(9);
			    String headerPost = rs.getString(10);
			    String mainImg1 = rs.getString(11);
			    String mainImg2 = rs.getString(12);
			    String mainImg3 = rs.getString(13);
			    String serviceTitle = rs.getString(14);
			    String writeDate = rs.getString(15);
			    String commuTitle = rs.getString(16);
			
			CommuGosuKnowhowPostDto dto = new CommuGosuKnowhowPostDto(name, explain, img, title, postIdx, startPost, serviceIdx, mainIdx,
											contents, headerPost, mainImg1, mainImg2, mainImg3, serviceTitle, writeDate, commuTitle);
			gList.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return gList;
	}
		
//	 고수노하우 상세페이지 하단에 많이보는 노하우 6개 조회  (숨고에서 작성날짜 기준 6개로 조회되는듯 )
	public ArrayList<CommuGkhpostFooterDto> getGkhPostFooter() throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT * " + 
				" FROM (  SELECT p.post_idx \"게시글idx\", gkh.img \"헤더이미지\", gkh.title \"게시글제목\" , gi.name \"고수명\" " + 
				" FROM gosu_know_how gkh " + 
				" INNER JOIN gosu_infor gi ON gkh.users_idx = gi.users_idx " + 
				" INNER JOIN post p ON p.post_idx = gkh.post_idx " + 
				" ORDER BY p.p_date DESC) " + 
				" WHERE ROWNUM <= 6";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ArrayList<CommuGkhpostFooterDto> gList = new ArrayList<CommuGkhpostFooterDto>();
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int postIdx = rs.getInt(1);					// 게시글 idx
			String postImg = rs.getString(2);			// 게시글 헤더img
			String postTitle = rs.getString(3);			// 게시글 제목
			String userName = rs.getString(4);			// 고수 명
			
			gList.add(new CommuGkhpostFooterDto(postIdx, postImg, postTitle, userName));
		}
		rs.close();
		pstmt.close();
		conn.close();
			
		return gList;
	}
	
	
	// postIdx -> 게시글 번호
//	 상세 게시글을 조회하는 메서드
	public CommuPostDto getPostViewSelect(int postIdx) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT p.post_idx 게시글idx, c.commu_idx 커뮤idx, c.title 커뮤타이틀, s.service_idx 서비스idx, s.title 서비스명, t.town_idx 지역idx, t.town_name 지역명 " + 
				" , p.title 게시글제목, u.alias 유저닉네임 " + 
				" , p.p_date 작성일시, p.contents 게시글내용, u.f_img 유저프로필img" + 
				" FROM community c, service s, post p, town t, users u " + 
				" WHERE c.commu_idx = p.commu_idx " + 
				" AND s.service_idx(+) = p.service_idx " + 
				" AND t.town_idx(+) = p.town_idx " + 
				" AND u.users_idx = p.users_idx " + 
				" AND p.post_idx=?";  /*-- 게시글 _idx;*/
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postIdx);
		
		CommuPostDto pDto = null;
		
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
//				int postIdx = rs.getInt("게시글idx");
			int commuIdx = rs.getInt("커뮤idx");
			String commuTitle = rs.getString("커뮤타이틀");
			int serviceIdx = rs.getInt("서비스idx");
			String serviceTitle = rs.getString("서비스명");
			int townIdx = rs.getInt("지역idx");
			String townName = rs.getString("지역명");
			String postTitle = rs.getString("게시글제목");
			String userName = rs.getString("유저닉네임");
			String writeDate = rs.getString("작성일시");
			String postContents = rs.getString("게시글내용");
			String userImg = rs.getString("유저프로필img");
//				int postCommentsCount = rs.getInt("댓글수");
//				int postLikeCount = rs.getInt("좋아요수");
//				int postViewsCount = rs.getInt("조회수");
			pDto = new CommuPostDto(postIdx, commuIdx, commuTitle, serviceIdx, serviceTitle, townIdx
					, townName, postTitle, userName, writeDate, postContents, userImg);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return pDto;
	}
	
	
// 	상세게시글 수정하는 메서드
	public void postUpdate(String title, String contents, Integer serviceIdx, Integer townIdx, int commuIdx, int postIdx) throws Exception {
		Connection conn = getConnection();
		String sql = "UPDATE post SET title=?, contents= ?, service_idx=?, town_idx= ?, commu_idx= ?, p_date=sysdate " + 
				" WHERE post_Idx = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, contents);
		if(serviceIdx == null)
			pstmt.setNull(3, Types.INTEGER);
		else
			pstmt.setInt(3, serviceIdx);
		
		if(townIdx == null)
			pstmt.setNull(4, Types.INTEGER);
		else
			pstmt.setInt(4, townIdx);
		
		pstmt.setInt(5, commuIdx);
		pstmt.setInt(6, postIdx);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	
// 	게시글 삭제하는 메서드
	public void postDelete(int postIdx) throws Exception {
		Connection conn = getConnection();
		String sql = "DELETE FROM post p WHERE p.post_idx = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postIdx);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	
// 	게시글 삭제할때 해당 게시글 댓글도 삭제
	public void commentsDelete(int postIdx) throws Exception {
		Connection conn = getConnection();
		String sql = "DELETE FROM comments WHERE post_idx = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postIdx);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	
// 	게시글 삭제할때 해당 게시글  좋아요 삭제
	public void postLikeDelete(int postIdx) throws Exception {
		Connection conn = getConnection();
		String sql = "DELETE FROM post_like WHERE post_idx = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postIdx);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	
// 	게시글 삭제할때 해당 게시글  조회수 삭제
	public void postViewDelete(int postIdx) throws Exception {
		Connection conn = getConnection();
		String sql = "DELETE FROM post_views WHERE post_idx = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postIdx);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	
// 	게시글 삭제할때 해당 게시글  이미지 삭제
	public void postImgDelete(int postIdx) throws Exception {
		Connection conn = getConnection();
		String sql = "DELETE FROM post_img WHERE post_idx = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postIdx);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	
//	 댓글목록을 불러오는 메서드
	public ArrayList<CommuCommentsDto> getComments(int idx) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT c.comments_idx , c.contents, u.name, u.f_img, c.comment_date, u.alias, c.users_idx " + 
				" FROM comments c JOIN users u " + 
				" ON c.users_idx = u.users_idx " + 
				" WHERE parent_idx IS NULL " + 
				" AND c.post_idx = ? " + 
				" ORDER BY c.comment_date DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		
		ArrayList<CommuCommentsDto> dto = new ArrayList<CommuCommentsDto>();
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int commentsIdx = rs.getInt(1);
			String contents = rs.getString(2);
			String userName = rs.getString(3);
			String userImg = rs.getString(4);
			String commentDate = rs.getString(5);
			String userAlias = rs.getString(6);
			int usersIdx = rs.getInt(7);
			dto.add(new CommuCommentsDto(commentsIdx, userName, userImg, contents,commentDate,userAlias, usersIdx));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return dto;
	}
	
	
//	 대댓글을 불러오는 메서드
	public ArrayList<CommuCommentsChildDto> getCommentsChild(int commentsIdx) throws Exception {
//			System.out.println("getCommentsChild - commentsIdx : " + commentsIdx); 확인용
		
		Connection conn = getConnection();
		String sql = "SELECT c.comments_idx , c.contents, u.name, u.alias, u.f_img, c.comment_date, c.post_idx, c.parent_idx " + 
				" FROM comments c JOIN users u  " + 
				" ON c.users_idx = u.users_idx  " + 
				" WHERE parent_idx is  not null " + 
				" AND c.parent_idx = ?" +
				" ORDER BY c.comment_date DESC ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, commentsIdx);
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<CommuCommentsChildDto> cDto = new ArrayList<CommuCommentsChildDto>();
		while(rs.next()) {
//				 int commentsIdx = rs.getInt("comments_idx");
			 String commentsContents = rs.getString("contents");
			 String userName = rs.getString("name");
			 String userAlias = rs.getString("alias");
			 String userImg = rs.getString("f_img");
			 String commentDate = rs.getString("comment_date");
			 int postIdx = rs.getInt("post_idx");
			 int parentIdx = rs.getInt("parent_idx");
			 cDto.add(new CommuCommentsChildDto(commentsContents, userName, userAlias, userImg, commentDate, postIdx, parentIdx));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return cDto;
	}
	
//	게시물의 댓글수, 좋아요수, 조회수를 불러오는 메서드  (상세게시글)
	public CommuPostLikeViewCommentDto getLikeCommentView(int postIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = " SELECT p.post_idx \"게시글IDX\", NVL( c.comments_count, 0) \"댓글수\", NVL( pl.likes_count, 0) \"좋아요수\", NVL( pv.views_count, 0)\"조회수\" " + 
				" FROM post p " + 
				" LEFT JOIN ( " + 
				"    SELECT post_idx, count(comments_idx) AS comments_count " + 
				"    FROM comments " + 
				"    GROUP BY post_idx  " + 
				" ) c ON p.post_idx = c.post_idx " + 
				" LEFT JOIN ( " + 
				"    SELECT post_idx, count(post_idx) AS likes_count " + 
				"    FROM post_like " + 
				"    GROUP BY post_idx " + 
				" ) pl ON pl.post_idx = p.post_idx " + 
				" LEFT JOIN ( " + 
				"    SELECT post_idx, count(post_idx) AS views_count " + 
				"    FROM post_views " + 
				"    GROUP BY post_idx " + 
				" ) pv ON pv.post_idx = p.post_idx " + 
				" WHERE p.post_idx = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postIdx);	// 어떤 게시글idx인지
		
		ResultSet rs = pstmt.executeQuery();
		CommuPostLikeViewCommentDto ret = null;
		
		if(rs.next()) {
			int commentCount = rs.getInt("댓글수");
			int likeCount = rs.getInt("좋아요수");
			int viewCount = rs.getInt("조회수");
			
			ret = new CommuPostLikeViewCommentDto(commentCount, likeCount, viewCount);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return ret;
	}

	
//	일반 게시글 쓰기 insert메서드
	public int postWrite(int usersIdx, String title, String content, Integer serviceIdx, Integer townIdx, int commuIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO post (post_idx, users_idx, title,contents, service_idx, town_idx" + 
				"                    , p_date, commu_idx )" + 
				" VALUES (seq_post.nextval, ?, ?, ?, ?, ?, sysdate, ? )";
		
		String[] colNamesPk = { "post_idx" };
		
		PreparedStatement pstmt = conn.prepareStatement(sql, colNamesPk);
		
		pstmt.setInt(1, usersIdx);				 // users_idx
		pstmt.setString(2, title);	 // 제목
		pstmt.setString(3, content); // 내용
		
		if(serviceIdx != null)
			pstmt.setInt(4, serviceIdx);		// 서비스idx
		else
			pstmt.setNull(4, Types.INTEGER);
		
		if(townIdx != null)
			pstmt.setInt(5, townIdx);		// 지역idx
		else
			pstmt.setNull(5, Types.INTEGER);
		
		
		pstmt.setInt(6, commuIdx);		// 커뮤idx
		pstmt.executeUpdate();			
		
		int retValue = 0;
		ResultSet rs = pstmt.getGeneratedKeys();
		if(rs.next()) {
			retValue = rs.getInt(1);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return retValue;
		// 오라클 인서트 키값 반환
	}
	
//	고수 노하우 쓰기 기본정보 insert
	public int gosuKnowhowWrite(int usersIdx, String img, int serviceIdx, String title, String startPost) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO gosu_know_how(post_idx, users_idx, img, service_idx, title, start_post) " + 
				" VALUES (seq_post_idx.nextval, ?, ?, ?, ?, ?)";
		
		String[] colNamesPk = { "post_idx" };
		
		PreparedStatement pstmt = conn.prepareStatement(sql, colNamesPk);
		
//		pstmt.setInt(1, postIdx);				// post_idx  시퀀스
		pstmt.setInt(1, usersIdx);				// users_idx
		pstmt.setString(2, img);	 		   	// 대표사진
		pstmt.setInt(3, serviceIdx);		  	// service_idx
		pstmt.setString(4, title); 			 	// 대표제목
		pstmt.setString(5, startPost); 			// 시작글
		
		pstmt.executeUpdate();			
		
		int retValue = 0;
		ResultSet rs = pstmt.getGeneratedKeys();
		if(rs.next()) {
			retValue = rs.getInt(1);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return retValue;
		// 오라클 인서트 키값 반환
	}
	
//	고수 노하우 쓰기  상세정보insert
	public int gosuKnowhowWritePlus(int mainIdx, int postIdx, String headerPost, String contents, String img1, String img2, String img3) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO main_text (main_idx, post_idx, header_post, contents, img1, img2, img3) " + 
				" VALUES (SEQ_GKH_MAIN_IDX.nextval, ?, ?, ?, ?, ?, ?)";
		
		String[] colNamesPk = { "post_idx" };
		
		PreparedStatement pstmt = conn.prepareStatement(sql, colNamesPk);
		
//			pstmt.setInt(1, mainIdx);				// main_idx   시퀀스
		pstmt.setInt(2, postIdx);				// post_idx
		pstmt.setString(3, headerPost);	 		// 상세정보 머릿글
		pstmt.setString(4, contents);	 		// 상세정보 본문내용1
		pstmt.setString(5, img1);	 		   	// 상세정보 본문사진1
		pstmt.setString(6, img2);	 		   	// 상세정보 본문사진2
		pstmt.setString(7, img3);	 		   	// 상세정보 본문사진3
		
		pstmt.executeUpdate();			
		
		int retValue = 0;
		ResultSet rs = pstmt.getGeneratedKeys();
		if(rs.next()) {
			retValue = rs.getInt(1);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return retValue;
		// 오라클 인서트 키값 반환
	}
		
	
//	고수 노하우 쓰기  기본정보  - 고수의  대표,제공서비스 
	public ArrayList<CommuServiceTitleDto> getListServiceFromUsersIdx(int usersIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = " SELECT gs.service_idx, s.title FROM gosu_service gs " + 
					"INNER JOIN service s ON gs.service_idx = s.service_idx " + 
					"WHERE gs.users_idx = ? " + 
					"UNION " + 
					"SELECT gsp.service_idx, s.title FROM gosu_service_plus gsp " + 
					"INNER JOIN service s On gsp.service_idx = s.service_idx " + 
					"WHERE gsp.users_idx = ? ";
		
		ArrayList<CommuServiceTitleDto> list = new ArrayList<CommuServiceTitleDto>();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, usersIdx);
		pstmt.setInt(2, usersIdx);
		
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int serviceIdx = rs.getInt("service_idx");
			String serviceTitle = rs.getString("title");
			
			list.add( new CommuServiceTitleDto(serviceIdx, serviceTitle));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return list;
	}
	

	// postIdx : 게시글 번호
	// usersIdx : 댓글 작성자
	// contents : 댓글 내용
	// return value = comments_idx (댓글idx)
//	댓글 insert 메서드
	public int commentWrite(int postIdx, int usersIdx, String contents, Integer parentIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO comments(comments_idx, post_idx, users_idx, contents, comment_date, parent_idx) " + 
				" VALUES(SEQ_COMMENTS_IDX.nextval, ?, ?, ?, sysdate, ?)"; 
		// 인서트 실행 후 pk값 반환 (=보통은 시퀀스에 의해 만들어진 값)
		// 1) 문자열 배열 - pk로 지정된 컬럼의 이름(들) ---> 보통은 길이가 1 짜리인 배열임. 왜냐하면, pk가 (아마도) 하나일 테니까.
		String[] arrKeyNames = {"comments_idx"};		
		PreparedStatement pstmt = conn.prepareStatement(sql, arrKeyNames);
		pstmt.setInt(1, postIdx);
		pstmt.setInt(2, usersIdx);
		pstmt.setString(3, contents);
		
		if(parentIdx != null) {  // 대댓글인 경우
			pstmt.setInt(4, parentIdx);		// 부모댓글idx
		}
		else {   // 댓글인 경우 parentIDX가 없는 경우 )
			pstmt.setNull(4, Types.INTEGER);
		}
		
		pstmt.executeUpdate();
		
		int retValue = 0;			// 이 부분이 정확하게 이해가안감 여쭤봐야함.
		ResultSet rs = pstmt.getGeneratedKeys();
		
		if(rs.next()) {
			retValue = rs.getInt(1);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return retValue;
	}
	
//	게시글 조회수를 리턴하는 메서드
	public static CommuPostViewsDto postViewsSelect(int postIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT count(pv.post_idx)" 
				+ " FROM post_views pv" 
				+ " WHERE pv.post_idx = ?";   //-- 게시글_idx;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, postIdx);
		
		
		ResultSet rs = pstmt.executeQuery();
		CommuPostViewsDto pDto = null;
		
		if(rs.next()) {
			int count = rs.getInt("count(pv.post_idx)");
			pDto = new CommuPostViewsDto(count);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return pDto;
	}



//	조회수를 증가시키는 메서드
	public int postViewInsert(int postIdx, int usersIdx) throws Exception {
		Connection conn = getConnection();
		
		
		
		String sql = "INSERT INTO post_views(post_idx, users_idx, v_date) " + 
				" VALUES(?, ?, sysdate)";
		
		int result = 0;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postIdx);
		pstmt.setInt(2, usersIdx);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
//	게시글 조회수를 중복 방지메서드 : 이미 있으면 트루를 리턴.
	public boolean postViewsOnlyOne(int postIdx, int usersIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT count(pv.post_idx)" 
				+ " FROM post_views pv" 
				+ " WHERE pv.post_idx = ?"
				+ " AND pv.users_idx = ? ";   //-- 게시글_idx;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, postIdx);
		pstmt.setInt(2, usersIdx);
		
		ResultSet rs = pstmt.executeQuery();
		
		int count = 0;
		if(rs.next()) {
			count = rs.getInt("count(pv.post_idx)");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return count == 1;
	}
	
	
//	좋아요 상태 확인하는 메서드
	public int isLikePost(int userIdx, int postIdx) throws Exception {
		String sql = "SELECT count(*) " + 
				" FROM post_like " + 
				" WHERE users_idx = ? " + 
				" AND post_idx = ?";
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, userIdx);
		pstmt.setInt(2, postIdx);
		
		ResultSet rs = pstmt.executeQuery();
		
		int isLike = 0;
		if(rs.next()) {
			isLike = rs.getInt(1);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return isLike;
	}
	
	// likeInsert(int, int) : 좋아요ON.
//	좋아요 insert 메서드
	public void likeInsert(int postIdx, int userIdx) throws Exception {
		Connection conn = getConnection();
		
		//먼저, select count(*) from ...
		// 0 -> GO
		// 1이상. -> STOP
		
		String sql = "SELECT count(*)" + 
				" FROM post_like" + 
				" WHERE post_idx = ?" + 
				" AND users_idx = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postIdx);
		pstmt.setInt(2, userIdx);
		
		ResultSet rs = pstmt.executeQuery();
		
		int likeCount = 0;
		
		if(rs.next()) {
			 likeCount = rs.getInt(1);
		}
		rs.close();
		pstmt.close();
		
		if(likeCount>=1) {   // likeCount가 1인경우   -> 이미 그 유저의 댓글이 있음 메서드 리턴으로  종료
			return;
		}
		
		// likeCount가 0인경우 좋아요 인설트   (그 유저가 좋아요를 누르지 않은 상황)
		sql="INSERT INTO POST_LIKE(post_idx, users_idx) " + 
				" VALUES(?, ?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postIdx);
		pstmt.setInt(2, userIdx);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	// likeDelete(int, int) : 좋아요OFF
//	좋아요 취소하는 메서드
	public void likeDelete(int postIdx, int userIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql=" DELETE FROM post_like " + 
					" WHERE post_idx = ? " + 
					" AND users_idx = ? ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postIdx);
		pstmt.setInt(2,userIdx);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
//	숨고커뮤 전체 뜨거운숨고픽 조회수 상위6개
	public  ArrayList<CommuHotTopicList> hotTopic() throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT * " + 
				" FROM ( " + 
				" SELECT p.post_idx \"게시글idx\", p.title \"게시글 제목\", COUNT(c.comments_idx) \"댓글수\", pv.\"조회수\" " + 
				" FROM post p " + 
				" JOIN comments c ON p.post_idx = c.post_idx " + 
				" JOIN (" + 
				" SELECT post_idx, COUNT(post_idx) \"조회수\" " + 
				" FROM post_views" + 
				" GROUP BY post_idx" + 
				"  ) pv ON p.post_idx = pv.post_idx" + 
				" GROUP BY p.post_idx, p.title, pv.\"조회수\"" + 
				" ORDER BY pv.\"조회수\" DESC" + 
				") " + 
				"WHERE ROWNUM <= 6";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ArrayList<CommuHotTopicList> hList = new ArrayList<CommuHotTopicList>();
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int postIdx = rs.getInt(1);
			String postTitle = rs.getString(2);
			int commentsCount = rs.getInt(3);
			int viewCount = rs.getInt(4);
			
			hList.add(new CommuHotTopicList(postIdx, postTitle,commentsCount,viewCount));
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return hList;
	}
	
	// getPostIdxFromCommentsIdx(int) : comments_idx ---변환---> post_idx
//	게시글의 댓글 수를 가져옴
	public int getPostIdxFromCommentsIdx(int commentsIdx) throws Exception {
		String sql = "SELECT post_idx FROM comments WHERE comments_idx=?";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, commentsIdx);
		ResultSet rs = pstmt.executeQuery();
		int ret = 0;
		if(rs.next()) {
			ret = rs.getInt("post_idx");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return ret;
	}
	
	
	// getPostUserIdxFromPostIdx(int PostIdx) : post_idx ---> post의 작성자 user_idx.
	// return value = post의 작성자 user_idx.
//	게시글 작성자의 user_idx를 가져옴
	public int getPostUserIdxFromPostIdx(int postIdx) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT users_idx " + 
				" FROM post " + 
				" WHERE post_idx = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postIdx);
		
		ResultSet rs = pstmt.executeQuery();
		
		int usersIdx = 0;
		if(rs.next()) {
			usersIdx = rs.getInt("users_idx");
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return usersIdx;
	}
	
//	유저의 활동명을 가져옴
	public String getAliasFromUsersIdx(int usersIdx) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT alias FROM users WHERE users_idx=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, usersIdx);
		
		ResultSet rs = pstmt.executeQuery();
		
		String alias = null;
		if(rs.next()) {
			alias = rs.getString("alias");
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return alias;
		
	}
	
//	커뮤  최신사진리뷰 6개 조회하기
	public  ArrayList<CommuLatestPhotoReviewsList> latestPhotoReviews() throws Exception {
		Connection conn = getConnection();
		
		String sql = " SELECT * " + 
				" FROM ( " + 
				" SELECT r.review_idx, r.users_idx, r.g_users_idx, r.r_date, r.contents, r.score, s.title, s.service_idx, ri.img1_url,ri.img2_url,ri.img3_url " + 
				" FROM review r " + 
				" INNER JOIN service s ON s.service_idx = r.service_idx " + 
				" INNER JOIN review_img ri ON ri.review_idx = r.review_idx " + 
				" ORDER BY r.r_date DESC " + 
				" ) " + 
				" WHERE rownum <= 6";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ArrayList<CommuLatestPhotoReviewsList> list = new ArrayList<CommuLatestPhotoReviewsList>();
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int reviewIdx = rs.getInt("review_idx");
			int usersIdx = rs.getInt("users_idx");
			int gosuUsersIdx = rs.getInt("g_users_idx");
			String reviewDate = rs.getString("r_date");
			String contents = rs.getString("contents");
			int score = rs.getInt("score");
			String serviceTitle = rs.getString("title");
			int serviceIdx = rs.getInt("service_idx");
			String reviewImg1 = rs.getString("img1_URL");
			String reviewImg2 = rs.getString("img2_URL");
			String reviewImg3 = rs.getString("img2_URL");
			list.add(new CommuLatestPhotoReviewsList(reviewIdx, usersIdx,gosuUsersIdx,reviewDate,contents,score,serviceTitle,serviceIdx,reviewImg1,reviewImg2,reviewImg3));
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return list;
	}
	
	
// 페이지 번호를 불러옴  (페이징 or 무한스크롤 하기 위함)
	public int getLastPageNumber() throws Exception {
		String sql = "SELECT count(*) " + 
				" FROM post";
//			페이지에 번호를 부여하기 위해 post에 모든 게시글 수를 셈
		
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
	
//		post_idx를 DESC 순으로  post 10개 뽑는 메서드  (무한 스크롤 적용 하기위함)
	public ArrayList<CommuPageNumDto> getPostListByPageNum(int pageNum) throws Exception{
		int endNum = pageNum *10;	// 한페이지에 10개씩 있다는 가정
		int startNum = endNum -9;	// 1, 11, 21, 31... 
		
//			post_idx를 DESC 순으로  post 10개 뽑음 
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

	
	// commuIdx : 커뮤니티idx
	// serviceIdx : 서비스idx	
	// townIdx : 지역idx
	// return -> ArrayList<PostDto : '게시글'>
// postSelect(Integer, Integer, Integer) : 커뮤니티 게시글 목록 조회.
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
	
	
	
	
	
	
	
	
	
	
	
	
	
//	테스트용 메인메서드
	public static void main(String[] args) {
		CommunityDao dao = new CommunityDao();
		try {
			ArrayList<CommuPageNumDto> list = dao.getPostListByPageNum(1);
			for(CommuPageNumDto dto : list) {
				System.out.println(dto.getPostIdx() + " : " +  dto.getPostTitle());
			}
		} catch(Exception e) { e.printStackTrace(); }
	}
	
}
