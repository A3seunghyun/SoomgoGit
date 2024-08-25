package dto;

public class EstimateDto {
	private int answerIdx;
	private int usersIdx;
	private int serviceIdx;
	private String answerJson;
	
	public int getAnswerIdx() {
		return answerIdx;
	}


	public void setAnswerIdx(int answerIdx) {
		this.answerIdx = answerIdx;
	}


	public int getUsersIdx() {
		return usersIdx;
	}


	public void setUsersIdx(int usersIdx) {
		this.usersIdx = usersIdx;
	}


	public int getServiceIdx() {
		return serviceIdx;
	}


	public void setServiceIdx(int serviceIdx) {
		this.serviceIdx = serviceIdx;
	}


	public String getAnswerJson() {
		return answerJson;
	}


	public void setAnswerJson(String answerJson) {
		this.answerJson = answerJson;
	}

	public EstimateDto(int answerIdx, int usersIdx, int serviceIdx, String answerJson) {
		this.answerIdx = answerIdx;
		this.usersIdx = usersIdx;
		this.serviceIdx = serviceIdx;
		this.answerJson = answerJson;
	}
	
}
