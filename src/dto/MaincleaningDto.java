package dto;

public class MaincleaningDto {
	private String serviceTitle;
	private int serviceIdx;
	private String serviceImg;
	
	public MaincleaningDto(String serviceTitle, int serviceIdx, String serviceImg) {
		this.serviceTitle = serviceTitle;
		this.serviceIdx = serviceIdx;
		this.serviceImg = serviceImg;
	}

	public String getServiceTitle() {
		return serviceTitle;
	}

	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}

	public int getServiceIdx() {
		return serviceIdx;
	}

	public void setServiceIdx(int serviceIdx) {
		this.serviceIdx = serviceIdx;
	}

	public String getServiceImg() {
		return serviceImg;
	}

	public void setServiceImg(String serviceImg) {
		this.serviceImg = serviceImg;
	}
	
	
	
	
}
