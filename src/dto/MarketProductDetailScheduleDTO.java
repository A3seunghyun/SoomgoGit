package dto;

public class MarketProductDetailScheduleDTO {
	private int scheduleIdx, marketIdx;
	private String dayweek, stTime, edTime;
	
	public MarketProductDetailScheduleDTO(int scheduleIdx, int marketIdx, String dayweek, String stTime,
			String edTime) {
		this.scheduleIdx = scheduleIdx;
		this.marketIdx = marketIdx;
		this.dayweek = dayweek;
		this.stTime = stTime;
		this.edTime = edTime;
	}

	public int getScheduleIdx() {
		return scheduleIdx;
	}

	public void setScheduleIdx(int scheduleIdx) {
		this.scheduleIdx = scheduleIdx;
	}

	public int getMarketIdx() {
		return marketIdx;
	}

	public void setMarketIdx(int marketIdx) {
		this.marketIdx = marketIdx;
	}

	public String getDayweek() {
		return dayweek;
	}

	public void setDayweek(String dayweek) {
		this.dayweek = dayweek;
	}

	public String getStTime() {
		return stTime;
	}

	public void setStTime(String stTime) {
		this.stTime = stTime;
	}

	public String getEdTime() {
		return edTime;
	}

	public void setEdTime(String edTime) {
		this.edTime = edTime;
	}
	
}
