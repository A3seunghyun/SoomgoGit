package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MarketOptionDTO;



public class MarketOptionDAO {
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		return conn;
	}

	public ArrayList<MarketOptionDTO> molist() throws Exception {
		
		Connection conn = getConnection();
		String sql = "SELECT mip.price_idx \"옵션IDX\", mip.name \"옵션이름\" , mip.price \"상품 금액\" " 
				+ " FROM market_item_price mip, market m "
				+ " WHERE mip.market_idx = m.market_idx " 
				+ " AND m.market_idx = 1" 
				+ " ORDER BY mip.price";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		ArrayList<MarketOptionDTO> molist = new ArrayList<MarketOptionDTO>();

		while (rs.next()) {
			MarketOptionDTO dto = new MarketOptionDTO(rs.getInt(1),rs.getString(2),rs.getInt(3));
			molist.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return molist;
		
	}
}
