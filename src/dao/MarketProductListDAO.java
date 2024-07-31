package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MarketProductListDTO;


public class MarketProductListDAO {
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		return conn;
	}

	public ArrayList<MarketProductListDTO> marketList(int cateIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT m.market_idx \"마켓idx\",mi.img_url \"대표이미지\", s.title \"서비스카테고리\", m.name \"마켓 상품명\", MIN(mip.price) \"상품 옵션최저가\", reviewAvg.\"평점\",reviewavg.\"리뷰 수\"\r\n" + 
				" FROM market m, market_img mi, service s,category c, province p, town t, market_detail md, market_item_price mip,\r\n" + 
				" (SELECT m.market_idx \"마켓idx\" ,avg(r.score) \"평점\", count(r.g_users_idx) \"리뷰 수\"\r\n" + 
				" FROM review r, market m\r\n" + 
				" WHERE m.users_idx = r.g_users_idx\r\n" + 
				" GROUP BY m.market_idx) reviewAvg\r\n" + 
				" WHERE m.market_idx = mi.market_idx\r\n" + 
				" AND m.market_idx = md.market_idx\r\n" + 
				" AND m.service_idx =s.service_idx\r\n" + 
				" AND md.service_area_idx = t.town_idx\r\n" + 
				" AND s.category_idx = c.category_idx\r\n" + 
				" AND mip.market_idx = m.market_idx\r\n" + 
				" AND reviewAvg.\"마켓idx\" = m.market_idx\r\n" +
				" AND c.category_idx = ?" +
				" GROUP BY m.market_idx, mi.img_url, s.title,m.name,reviewAvg.\"평점\",reviewavg.\"리뷰 수\"";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, cateIdx);
		
		ResultSet rs = pstmt.executeQuery();

		ArrayList<MarketProductListDTO> mplist = new ArrayList<MarketProductListDTO>();

		while (rs.next()) {
			MarketProductListDTO dto = new MarketProductListDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getDouble(6),rs.getInt(7));
			mplist.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return mplist;
	}
	
	public ArrayList<MarketProductListDTO> marketAllList() throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT m.market_idx \"마켓idx\",mi.img_url \"대표이미지\", s.title \"서비스카테고리\", m.name \"마켓 상품명\", MIN(mip.price) \"상품 옵션최저가\", reviewAvg.\"평점\",reviewavg.\"리뷰 수\"\r\n" + 
				" FROM market m, market_img mi, service s,category c, province p, town t, market_detail md, market_item_price mip,\r\n" + 
				" (SELECT m.market_idx \"마켓idx\" ,avg(r.score) \"평점\", count(r.g_users_idx) \"리뷰 수\"\r\n" + 
				" FROM review r, market m\r\n" + 
				" WHERE m.users_idx = r.g_users_idx\r\n" + 
				" GROUP BY m.market_idx) reviewAvg\r\n" + 
				" WHERE m.market_idx = mi.market_idx\r\n" + 
				" AND m.market_idx = md.market_idx\r\n" + 
				" AND m.service_idx =s.service_idx\r\n" + 
				" AND md.service_area_idx = t.town_idx\r\n" + 
				" AND s.category_idx = c.category_idx\r\n" + 
				" AND mip.market_idx = m.market_idx\r\n" + 
				" AND reviewAvg.\"마켓idx\" = m.market_idx\r\n" +
				" GROUP BY m.market_idx, mi.img_url, s.title,m.name,reviewAvg.\"평점\",reviewavg.\"리뷰 수\"";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();

		ArrayList<MarketProductListDTO> mplist = new ArrayList<MarketProductListDTO>();

		while (rs.next()) {
			MarketProductListDTO dto = new MarketProductListDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getDouble(6),rs.getInt(7));
			mplist.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return mplist;
	}
	
	public ArrayList<MarketProductListDTO> marketSearchList(String title) throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT m.market_idx \"마켓idx\",mi.img_url \"대표이미지\", s.title \"서비스카테고리\", m.name \"마켓 상품명\", MIN(mip.price) \"상품 옵션최저가\", reviewAvg.\"평점\",reviewavg.\"리뷰 수\"" +
				" FROM market m, market_img mi, service s,category c, province p, town t, market_detail md, market_item_price mip," +
				" (SELECT m.market_idx \"마켓idx\" ,avg(r.score) \"평점\", count(r.g_users_idx) \"리뷰 수\"" +
				" FROM review r, market m" +
				" WHERE m.users_idx = r.g_users_idx" +
				" GROUP BY m.market_idx) reviewAvg" +
				" WHERE m.market_idx = mi.market_idx" +
				" AND m.market_idx = md.market_idx" +
				" AND m.service_idx =s.service_idx" +
				" AND md.service_area_idx = t.town_idx" +
				" AND s.category_idx = c.category_idx" +
				" AND mip.market_idx = m.market_idx" +
				" AND reviewAvg.\"마켓idx\" = m.market_idx" +
				" AND m.name LIKE \'%"+title+"%\'" +
				" GROUP BY m.market_idx,mi.img_url, s.title,m.name,reviewAvg.\"평점\",reviewavg.\"리뷰 수\"";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();

		ArrayList<MarketProductListDTO> mplist = new ArrayList<MarketProductListDTO>();

		while (rs.next()) {
			MarketProductListDTO dto = new MarketProductListDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getDouble(6),rs.getInt(7));
			mplist.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return mplist;
	}
	
}
