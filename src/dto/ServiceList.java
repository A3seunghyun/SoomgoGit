package dto;

public class ServiceList {
	private String servieTitle;
	private int serviceIdx;
	
	public ServiceList(String servieTitle, int serviceIdx) {
		this.servieTitle = servieTitle;
		this.serviceIdx = serviceIdx;
	}
	
	public String getServieTitle() {
		return servieTitle;
	}
	public void setServieTitle(String servieTitle) {
		this.servieTitle = servieTitle;
	}
	public int getServiceIdx() {
		return serviceIdx;
	}
	public void setServiceIdx(int serviceIdx) {
		this.serviceIdx = serviceIdx;
	}

	@Override
	public String toString() {
		return "ServiceList [servieTitle=" + servieTitle + ", serviceIdx=" + serviceIdx + "]";
	}
	
	
}
	
