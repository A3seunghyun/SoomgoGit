package dto;

public class EstimateRequestOptionDto {
	private int serviceIdx;
	private int requestIdx;
	private int optionNumber;
	private String contents;
	
	public EstimateRequestOptionDto(int serviceIdx, int requestIdx, int optionNumber, String contents) {
		this.serviceIdx = serviceIdx;
		this.requestIdx = requestIdx;
		this.optionNumber = optionNumber;
		this.contents = contents;
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
	
}
