package dto;

public class CommuGkhpostFooterDto {
	int postIdx;		// 게시글 idx
	String postImg;		// 게시글 헤더img
	String postTitle;	// 게시글 제목
	String userName;	//고수 명
	
	public CommuGkhpostFooterDto(int postIdx, String postImg, String postTitle, String userName) {
		this.postIdx = postIdx;
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
