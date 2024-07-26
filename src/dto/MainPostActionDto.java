package dto;

public class MainPostActionDto {
	private int commentCount;
	private int viewCount;
	
	public MainPostActionDto(int commentCount, int viewCount) {
		this.commentCount = commentCount;
		this.viewCount = viewCount;
	}
	
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
}
