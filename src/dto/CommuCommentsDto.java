package dto;

public class CommuCommentsDto {
	private int commentsIdx;
	private String userName;
	private String userImg;
	private String contents;
	private String commentDate;
	private String userAlias;
	private int usersIdx;
	
	public CommuCommentsDto(int commentsIdx, String userName, String userImg, String contents, String commentDate,
			String userAlias, int usersIdx) {
		this.commentsIdx = commentsIdx;
		this.userName = userName;
		this.userImg = userImg;
		this.contents = contents;
		this.commentDate = commentDate;
		this.userAlias = userAlias;
		this.usersIdx = usersIdx;
	}
	
	public int getCommentsIdx() {
		return commentsIdx;
	}
	public void setCommentsIdx(int commentsIdx) {
		this.commentsIdx = commentsIdx;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public String getUserAlias() {
		return userAlias;
	}
	public void setUserAlias(String userAlias) {
		this.userAlias = userAlias;
	}
	public int getUsersIdx() {
		return usersIdx;
	}
	public void setUsersIdx(int usersIdx) {
		this.usersIdx = usersIdx;
	}
	
}
