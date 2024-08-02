package dto;

public class EstimateQuestionDto {
	private int serviceIdx;
	private int requestIdx;
	private String contents;
	
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public EstimateQuestionDto(int serviceIdx, int requestIdx, String contents) {
		this.serviceIdx = serviceIdx;
		this.requestIdx = requestIdx;
		this.contents = contents;
	}
}
