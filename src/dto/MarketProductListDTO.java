package dto;
//SELECT mimg.img_url "대표이미지", s.title "서비스카테고리", 

//SELECT mimg.img_url "대표이미지", s.title "서비스카테고리", 
//m.name "마켓 상품명", mip.price "가격",avg(r.score) "평점", count(r.g_users_idx) "리뷰수"
//FROM market m, market_img mimg, service s, market_item_price mip, review r,category c, province p, town t, gosu_infor gi,  gosu_service gs
//WHERE m.market_idx = mimg.market_idx
//AND m.users_idx = gi.users_idx
//AND gi.users_idx = gs.users_idx
//AND gs.town_idx = t.town_idx
//AND p.province_idx = t.province_idx
//AND m.service_idx = s.service_idx
//AND m.market_idx = mip.market_idx
//AND r.g_users_idx = m.users_idx
//AND c.category_idx = s.category_idx
//AND m.service_idx = 1 -- 사용자가 입력한 서비스
//AND c.category_idx = 1 --  사용자가 입력한 카테고리
//AND t.town_idx = 1 -- 사용자가 입력한 지역
//GROUP BY mimg.img_url, s.title, m.name, mip.price
//ORDER BY "평점" DESC,  "리뷰수" DESC;

public class MarketProductListDTO {
	private int market_idx;
	private String imgUrl, title, marketName;
	private int marketMinPrice;
	private double marketAvg;
	private int marketCount;
	public MarketProductListDTO(int market_idx, String imgUrl, String title, String marketName,
			int marketMinPrice, double marketAvg, int marketCount) {
		this.market_idx = market_idx;
		this.imgUrl = imgUrl;
		this.title = title;
		this.marketName = marketName;
		this.marketMinPrice = marketMinPrice;
		this.marketAvg = marketAvg;
		this.marketCount = marketCount;
	}
	public int getMarket_idx() {
		return market_idx;
	}
	public void setMarket_idx(int market_idx) {
		this.market_idx = market_idx;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMarketName() {
		return marketName;
	}
	public void setMarketName(String marketName) {
		this.marketName = marketName;
	}
	public int getMarketMinPrice() {
		return marketMinPrice;
	}
	public void setMarketMinPrice(int marketMinPrice) {
		this.marketMinPrice = marketMinPrice;
	}
	public double getMarketAvg() {
		return marketAvg;
	}
	public void setMarketAvg(double marketAvg) {
		this.marketAvg = marketAvg;
	}
	public int getMarketCount() {
		return marketCount;
	}
	public void setMarketCount(int marketCount) {
		this.marketCount = marketCount;
	}
	
}
