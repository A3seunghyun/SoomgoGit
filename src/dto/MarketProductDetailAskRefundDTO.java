package dto;

public class MarketProductDetailAskRefundDTO {
	private int marketIdx;
	private String askRefund;
	
	public MarketProductDetailAskRefundDTO(int marketIdx, String askRefund) {
		this.marketIdx = marketIdx;
		this.askRefund = askRefund;
	}

	public int getMarketIdx() {
		return marketIdx;
	}

	public void setMarketIdx(int marketIdx) {
		this.marketIdx = marketIdx;
	}

	public String getAskRefund() {
		return askRefund;
	}

	public void setAskRefund(String askRefund) {
		this.askRefund = askRefund;
	}
	
}
