package dto;

public class GosuKnowhowPostListDto {
	
	private int postIdx;
	private String serviceTitle;
	private String postImg;
	private String postTitle;
	private String userName;
	
	public GosuKnowhowPostListDto(int postIdx, String serviceTitle, String postImg, String postTitle, String userName) {
		this.postIdx = postIdx;
		this.serviceTitle = serviceTitle;
		this.postImg = postImg;
		this.postTitle = postTitle;
		this.userName = userName;
	}
	
	public int getPostIdx() {
		return postIdx;
	}
	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}
	public String getServiceTitle() {
		return serviceTitle;
	}
	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}
	public String getPostImg() {
		return postImg;
	}
	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

}
