package dto;

public class EstimateOptionDto {
	private int serviceIdx;
	private int requestIdx;
	private int optionNumber;
	private String contents;
	private int optionType;
	
	public EstimateOptionDto(int serviceIdx, int requestIdx, int optionNumber, String contents, int optionType) {
		this.serviceIdx = serviceIdx;
		this.requestIdx = requestIdx;
		this.optionNumber = optionNumber;
		this.contents = contents;
		this.optionType = optionType;
	}
	public int getServiceIdx() {
		return serviceIdx;
	}
	public void setServiceIdx(int serviceIdx) {
		this.serviceIdx = serviceIdx;
	}
	public int getRequestIdx() {
		return requestIdx;
	}
	public void setRequestIdx(int requestIdx) {
		this.requestIdx = requestIdx;
	}
	public int getOptionNumber() {
		return optionNumber;
	}
	public void setOptionNumber(int optionNumber) {
		this.optionNumber = optionNumber;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getOptionType() {
		return optionType;
	}
	public void setOptionType(int optionType) {
		this.optionType = optionType;
	}
}