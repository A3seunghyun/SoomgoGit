package dto;

public class CommuCommentsChildDto {
//	private int commentsIdx;
	private String commentsContents;
	private String userName;
	private String userAlias;
	private String userImg;
	private String commentDate;
	private int postIdx;
	private int parentIdx;
	
	public CommuCommentsChildDto( /* int commentsIdx, */ String commentsContents, String userName,  String userAlias, String userImg, String commentDate, int postIdx,
			int parentIdx) {
//		this.commentsIdx = commentsIdx;
		this.commentsContents = commentsContents;
		this.userName = userName;
		this.userImg = userImg;
		this.commentDate = commentDate;
		this.postIdx = postIdx;
		this.parentIdx = parentIdx;
	}

//	public int getCommentsIdx() {
//		return commentsIdx;
//	}

//	public void setCommentsIdx(int commentsIdx) {
//		this.commentsIdx = commentsIdx;
//	}

	public String getCommentsContents() {
		return commentsContents;
	}

	public void setCommentsContents(String commentsContents) {
		this.commentsContents = commentsContents;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserAlias() {
		return userAlias;
	}
	
	public void setUserAlias(String userAlias) {
		this.userAlias = userAlias;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}

	public int getPostIdx() {
		return postIdx;
	}

	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}

	public int getParentIdx() {
		return parentIdx;
	}

	public void setParentIdx(int parentIdx) {
		this.parentIdx = parentIdx;
	}
	
	
	
	
}
