package dto;

public class CommuPostLikeViewCommentDto {
	private int CommentCount;
	private int LikeCount;
	private int ViewCount;
//	private int PostIdx;
	
	public CommuPostLikeViewCommentDto() { }
	public CommuPostLikeViewCommentDto(int commentCount, int likeCount, int viewCount/* , int postIdx */) {
		CommentCount = commentCount;
		LikeCount = likeCount;
		ViewCount = viewCount;
//		PostIdx = postIdx;
	}
	public int getCommentCount() {
		return CommentCount;
	}
	public void setCommentCount(int commentCount) {
		CommentCount = commentCount;
	}
	public int getLikeCount() {
		return LikeCount;
	}
	public void setLikeCount(int likeCount) {
		LikeCount = likeCount;
	}
	public int getViewCount() {
		return ViewCount;
	}
	public void setViewCount(int viewCount) {
		ViewCount = viewCount;
	}
//	public int getPostIdx() {
//		return PostIdx;
//	}
//	public void setPostIdx(int postIdx) {
//		PostIdx = postIdx;
//	}
	
	


}
