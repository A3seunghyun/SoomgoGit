package dto;

public class CommuPostWritePowerDto {
	private String commuIdx;
	private String commuTitle;
	
	public CommuPostWritePowerDto(String commuIdx, String commuTitle) {
		this.commuIdx = commuIdx;
		this.commuTitle = commuTitle;
	}
	public String getCommuIdx() {
		return commuIdx;
	}
	public void setCommuIdx(String commuIdx) {
		this.commuIdx = commuIdx;
	}
	public String getCommuTitle() {
		return commuTitle;
	}
	public void setCommuTitle(String commuTitle) {
		this.commuTitle = commuTitle;
	}
	

	
}
