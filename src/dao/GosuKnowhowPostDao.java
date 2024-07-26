package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.GkhpostFooterDto;
import dto.GosuKnowhowPostDto;
import dto.GosuKnowhowPostListDto;

public class GosuKnowhowPostDao {	
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo1";	// 오라클 계정
		String pw = "pass1234";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,id,pw);
//		System.out.println("DB 접속완!");
		return conn;
	}
	
	
	// 메인페이지에서 고수노하우 게시글 리스트를 불러오는 메서드
	public ArrayList<GosuKnowhowPostListDto> getGkhPostList() throws Exception {
		Connection conn = getConnection();
		
		ArrayList<GosuKnowhowPostListDto> gList = new ArrayList<GosuKnowhowPostListDto>();
//		String sql = "SELECT p.post_idx, gkh.img , gkh.title , gi.name" + 
//				" FROM gosu_know_how gkh " + 
//				" JOIN gosu_infor gi ON gkh.users_idx = gi.users_idx " + 
//				" JOIN post p ON p.post_idx = gkh.post_idx " + 
//				" JOIN community c ON c.commu_idx = p.commu_idx";
		
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
			
			GosuKnowhowPostListDto dto = new GosuKnowhowPostListDto(postIdx, serviceTitle, postImg, postTitle, userName);
			gList.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
			
		return gList;
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
	//고수 노하우 상세 게시글을 불러오는 메서드
	public ArrayList<GosuKnowhowPostDto> getGkhPost(int postGetIdx) throws Exception {
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
		
		ArrayList<GosuKnowhowPostDto> gList = new ArrayList<GosuKnowhowPostDto>();
		
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
			
			GosuKnowhowPostDto dto = new GosuKnowhowPostDto(name, explain, img, title, postIdx, startPost, serviceIdx, mainIdx,
											contents, headerPost, mainImg1, mainImg2, mainImg3, serviceTitle, writeDate, commuTitle);
			gList.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return gList;
	}
	
	// 고수노하우 상세페이지 하단에 많이보는 노하우 6개 조회  (숨고에서 작성날짜 기준 6개로 조회되는듯 )
	public ArrayList<GkhpostFooterDto> getGkhPostFooter() throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT * " + 
				" FROM (  SELECT p.post_idx \"게시글idx\", gkh.img \"헤더이미지\", gkh.title \"게시글제목\" , gi.name \"고수명\" " + 
				" FROM gosu_know_how gkh " + 
				" INNER JOIN gosu_infor gi ON gkh.users_idx = gi.users_idx " + 
				" INNER JOIN post p ON p.post_idx = gkh.post_idx " + 
				" ORDER BY p.p_date DESC) " + 
				" WHERE ROWNUM <= 6";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ArrayList<GkhpostFooterDto> gList = new ArrayList<GkhpostFooterDto>();
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int postIdx = rs.getInt(1);					// 게시글 idx
			String postImg = rs.getString(2);			// 게시글 헤더img
			String postTitle = rs.getString(3);			// 게시글 제목
			String userName = rs.getString(4);			// 고수 명
			
			gList.add(new GkhpostFooterDto(postIdx, postImg, postTitle, userName));
		}
		rs.close();
		pstmt.close();
		conn.close();
			
		return gList;
	}
	
	
}
