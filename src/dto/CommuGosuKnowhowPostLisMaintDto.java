package dto;

public class CommuGosuKnowhowPostLisMaintDto {
	
	private int postIdx;					// 게시글 idx
	private String serviceTitle;		// 서비스 명
	private String postImg;			// 게시글 헤더img
	private String postTitle;			// 게시글 제목
	private String userName;
	
	public CommuGosuKnowhowPostLisMaintDto(int postIdx, String serviceTitle, String postImg, String postTitle,
			String userName) {
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
