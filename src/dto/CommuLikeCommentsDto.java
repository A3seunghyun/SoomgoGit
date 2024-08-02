package dto;

public class CommuLikeCommentsDto {
	private int likes;
	private int comments;
	
	public CommuLikeCommentsDto(int likes, int comments) {
		this.likes = likes;
		this.comments = comments;
	}
	
	public CommuLikeCommentsDto() {
	}

	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getComments() {
		return comments;
	}
	public void setComments(int comments) {
		this.comments = comments;
	}
//	public String toString() {
//		return (likes, comments);
//	}
	
}
