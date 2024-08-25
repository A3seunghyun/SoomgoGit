package dto;

public class CommuServiceTitleDto {
	private int serviceIdx;
	private String serviceTitle;
	
	public CommuServiceTitleDto(int serviceIdx, String serviceTitle) {
		this.serviceIdx = serviceIdx;
		this.serviceTitle = serviceTitle;
	}
	
	public int getServiceIdx() {
		return serviceIdx;
	}
	public void setServiceIdx(int serviceIdx) {
		this.serviceIdx = serviceIdx;
	}
	public String getServiceTitle() {
		return serviceTitle;
	}
	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}
	
	
	
}
