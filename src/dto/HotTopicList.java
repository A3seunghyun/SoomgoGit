package dto;

public class HotTopicList {
	private int postIdx;
	private String postTitle;
	private int commentsCount;
	private int viewCount;
	
	public HotTopicList(int postIdx, String postTitle, int commentsCount, int viewCount) {
		this.postIdx = postIdx;
		this.postTitle = postTitle;
		this.commentsCount = commentsCount;
		this.viewCount = viewCount;
	}
	
	public int getPostIdx() {
		return postIdx;
	}
	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public int getCommentsCount() {
		return commentsCount;
	}
	public void setCommentsCount(int commentsCount) {
		this.commentsCount = commentsCount;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
	
}
