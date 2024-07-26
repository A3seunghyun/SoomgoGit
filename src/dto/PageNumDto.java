package dto;

public class PageNumDto {
	private String commuTitle;
	private String serviceTitle;
	private String postTitle;
	private String postContents;
	private String provinceName;
	private String townName;
	private String pDate;
	private String imgUrl;
	private int postIdx;
	
	public PageNumDto(String commuTitle, String serviceTitle, String postTitle, String postContents,
			String provinceName, String townName, String pDate, String imgUrl, int postIdx) {
		this.commuTitle = commuTitle;
		this.serviceTitle = serviceTitle;
		this.postTitle = postTitle;
		this.postContents = postContents;
		this.provinceName = provinceName;
		this.townName = townName;
		this.pDate = pDate;
		this.imgUrl = imgUrl;
		this.postIdx = postIdx;
	}
	
	public String getCommuTitle() {
		return commuTitle;
	}
	public void setCommuTitle(String commuTitle) {
		this.commuTitle = commuTitle;
	}
	public String getServiceTitle() {
		return serviceTitle;
	}
	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContents() {
		return postContents;
	}
	public void setPostContents(String postContents) {
		this.postContents = postContents;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public String getTownName() {
		return townName;
	}
	public void setTownName(String townName) {
		this.townName = townName;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public int getPostIdx() {
		return postIdx;
	}
	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}
	
	
	
}
