package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MarketOptionDTO;
import dto.MarketProductAskDTO;
import dto.MarketProductDetailAskRefundDTO;
import dto.MarketProductDetailDTO;
import dto.MarketProductDetailScheduleDTO;
import dto.MarketProductDetatilimgDTO;
import dto.MarketProductQnaAnswerDTO;
import dto.MarketProductQnaDTO;

//마켓 상품 상세페이지
public class MarketProductDetailDAO {
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		return conn;
	}

	public ArrayList<MarketProductDetailDTO> mpdlist(int marketIdx) throws Exception {
		//온라인진행, 대면/비대면, 서비스지역, 상세 설명
		Connection conn = getConnection();
		
		String sql = "SELECT mi.img_url \"대표이미지\", md.untact \"온라인 진행 \", md.contact \"대면/비대면\", t.town_name \"서비스 지역\", md.contents \"상세 설명\"" +
				" FROM market m, market_detail md, town t, market_img mi" +
				" WHERE m.market_idx = md.market_idx" +
				" AND m.market_idx = mi.market_idx" +
				" AND md.service_area_idx = t.town_idx" +
				" AND m.market_idx = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		ResultSet rs = pstmt.executeQuery();

		ArrayList<MarketProductDetailDTO> mpdlist = new ArrayList<MarketProductDetailDTO>();

		while (rs.next()) {
			MarketProductDetailDTO dto = new MarketProductDetailDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
			mpdlist.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return mpdlist;
	}
	
	public ArrayList<MarketProductDetatilimgDTO> mpdimglist(int marketIdx) throws Exception {
		//상세이미지
		Connection conn = getConnection();
		
		String sql = "SELECT mii.img_url \"상품 상세이미지\" " +
				" FROM market m, market_detail md, market_item_img mii" +
				" WHERE m.market_idx = md.market_idx" +
				" AND mii.market_idx = md.market_idx" +
				" AND m.market_idx = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		
		ResultSet rs = pstmt.executeQuery();

		ArrayList<MarketProductDetatilimgDTO> mpdimglist = new ArrayList<MarketProductDetatilimgDTO>();

		while (rs.next()) {
			MarketProductDetatilimgDTO dto = new MarketProductDetatilimgDTO(rs.getString(1));
			mpdimglist.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return mpdimglist;
	}
	
	public ArrayList<MarketProductAskDTO> getMarketAsk(int marketIdx) throws Exception {
		//질문 답변
		Connection conn = getConnection();
		
		String sql = "SELECT ma.question \"질문\" , ma.answer \"답변\"" +
				" FROM market_ask ma, market m" +
				" WHERE m.market_idx = ma.market_idx" +
				" AND m.market_idx = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		
		ResultSet rs = pstmt.executeQuery();

		ArrayList<MarketProductAskDTO> mpalist = new ArrayList<MarketProductAskDTO>();

		while (rs.next()) {
			MarketProductAskDTO dto = new MarketProductAskDTO(rs.getString(1),rs.getString(2));
			mpalist.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return mpalist;
	}
	

	public ArrayList<MarketProductQnaDTO> getMarketQna(int marketIdx) throws Exception {
		//문의 질문
		Connection conn = getConnection();
		
		String sql = "SELECT mq.market_qna_idx \"문의idx\", mq.type \"문의유형\", mq.question\"문의내용\", u.name\"작성자이름\", mq.qna_date\"문의일시\", cnt \"댓글개수\"" +
				" FROM market_qna mq, market m, users u,"  +
				" (SELECT market_qna_idx, count(comments) cnt" +
				" FROM market_qna_comment" +
				" GROUP BY market_qna_idx) mqc" +
				" WHERE m.market_idx = mq.market_idx" +
				" AND mq.users_idx = u.users_idx" +
				" AND mqc.market_qna_idx =  mq.market_qna_idx" +
				" AND m.market_idx = ?" +
				" ORDER BY \"문의일시\" DESC ,\"문의유형\" ASC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		
		ResultSet rs = pstmt.executeQuery();

		ArrayList<MarketProductQnaDTO> mpqlist = new ArrayList<MarketProductQnaDTO>();

		while (rs.next()) {
			MarketProductQnaDTO dto = new MarketProductQnaDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
			mpqlist.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return mpqlist;
	}
	
	public ArrayList<MarketOptionDTO> molist(int marketIdx) throws Exception {
		//옵션 가격
		Connection conn = getConnection();
		String sql = "SELECT mip.price_idx \"옵션IDX\", mip.option_title \"옵션이름\" , mip.price \"상품 금액\" " + 
				"FROM market_item_price mip, market m " + 
				"WHERE mip.market_idx = m.market_idx " + 
				"AND m.market_idx = ? " + 
				"ORDER BY mip.price";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		
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
	
	public ArrayList<MarketProductQnaAnswerDTO> getMarketQnaAnswer(int qnaIdx) throws Exception {
		//문의 답변
		Connection conn = getConnection();
		
		String sql = "SELECT  mqc.market_qna_idx \"문의idx\",gi.name \"답변작성자\", mqc.comments \"답변내용\", mqc.comment_date \"답변일시\"" +
				" FROM market_qna_comment mqc, market_qna mq, market m, gosu_infor gi" +
				" WHERE m.market_idx = mq.market_idx" +
				" AND mq.market_qna_idx = mqc.market_qna_idx" +
				" AND m.users_idx = gi.users_idx" +
				" AND mqc.comments IS NOT NULL" +
				" AND mqc.market_qna_idx = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, qnaIdx);
		
		ResultSet rs = pstmt.executeQuery();

		ArrayList<MarketProductQnaAnswerDTO> mpqalist = new ArrayList<MarketProductQnaAnswerDTO>();

		while (rs.next()) {
			MarketProductQnaAnswerDTO dto = new MarketProductQnaAnswerDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
			mpqalist.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return mpqalist;
	}
	
	public ArrayList<MarketProductDetailAskRefundDTO> getMarketAskRefund(int marketIdx) throws Exception {
		//취소 및 환불 규정
		Connection conn = getConnection();
		
		String sql = "SELECT *" +
				" FROM market_ask_refund"+
				" WHERE market_idx = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		
		ResultSet rs = pstmt.executeQuery();

		ArrayList<MarketProductDetailAskRefundDTO> mpdarlist = new ArrayList<MarketProductDetailAskRefundDTO>();

		while (rs.next()) {
			MarketProductDetailAskRefundDTO dto = new MarketProductDetailAskRefundDTO(rs.getInt(1),rs.getString(2));
			mpdarlist.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return mpdarlist;
	}
	
	public ArrayList<MarketProductDetailScheduleDTO> getMarketSchedule(int marketIdx, String dayweek) throws Exception {
		//마켓 스케쥴
		Connection conn = getConnection();
		
		String sql = "SELECT *" +
				" FROM schedule" +
				" WHERE market_idx = ?" +
				" AND dayweek LIKE ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, marketIdx);
		pstmt.setString(2, dayweek);
		
		ResultSet rs = pstmt.executeQuery();

		ArrayList<MarketProductDetailScheduleDTO> mpdslist = new ArrayList<MarketProductDetailScheduleDTO>();

		while (rs.next()) {
			MarketProductDetailScheduleDTO dto = new MarketProductDetailScheduleDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5));
			mpdslist.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return mpdslist;
	}
	
}
