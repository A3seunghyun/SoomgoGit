package dto;

public class EstimateRequestQuestionDto {
	private int requestIdx;
	private String contents;
	private int serviceIdx;
	
	public EstimateRequestQuestionDto(int requestIdx, String contents, int serviceIdx) {
		this.requestIdx = requestIdx;
		this.contents = contents;
		this.serviceIdx = serviceIdx;
	}
	
	public int getRequestIdx() {
		return requestIdx;
	}
	public void setRequestIdx(int requestIdx) {
		this.requestIdx = requestIdx;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getServiceIdx() {
		return serviceIdx;
	}
	public void setServiceIdx(int serviceIdx) {
		this.serviceIdx = serviceIdx;
	}
	
}
