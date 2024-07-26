package dto;

//SELECT mip.name "옵션이름" , mip.price "상품 금액"
//FROM market_item_price mip, market m
//WHERE mip.market_idx = m.market_idx
//AND users_idx = 1
//ORDER BY mip.price;

public class MarketOptionDTO {
	
	private String optionName;
	private int optionPrice;
	
	
	
	public MarketOptionDTO(String optionName, int optionPrice) {
		this.optionName = optionName;
		this.optionPrice = optionPrice;
	}
	
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	
	public int getOptionPrice() {
		return optionPrice;
	}
	public void setOptionPrice(int optionPrice) {
		this.optionPrice = optionPrice;
	}
	
}
