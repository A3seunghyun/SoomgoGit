package dto;

public class CommuMainpostListDto {
	private String commuTitle;		// 커뮤타이틀 명
	private String postTitle;		// 게시글 제목
	private String postContents;	// 게시글 내용
	private String postWrite;		// 게시글 작성일시
	private String postImg;			// 게시글img
	private int postIdx;			// 게시글idx
	
	public CommuMainpostListDto(String commuTitle, String postTitle, String postContents, String postWrite, String postImg, int postIdx) {
		this.commuTitle = commuTitle;
		this.postTitle = postTitle;
		this.postContents = postContents;
		this.postWrite = postWrite;
		this.postImg = postImg;
		this.postIdx = postIdx;
	}

	public String getCommuTitle() {
		return commuTitle;
	}

	public void setCommuTitle(String commuTitle) {
		this.commuTitle = commuTitle;
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

	public String getPostWrite() {
		return postWrite;
	}

	public void setPostWrite(String postWrite) {
		this.postWrite = postWrite;
	}
	public String getPostImg() {
		return postImg;
	}

	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}

	public int getPostIdx() {
		return postIdx;
	}

	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}


	
	
	
}
