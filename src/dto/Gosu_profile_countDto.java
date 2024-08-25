package dto;

public class Gosu_profile_countDto {
	private int g_users_idx;
	private int score;
	private int review_idx;
	
	public Gosu_profile_countDto(int g_users_idx, int score, int review_idx) {
		this.g_users_idx = g_users_idx;
		this.score = score;
		this.review_idx = review_idx;
	}

	public int getG_users_idx() {
		return g_users_idx;
	}

	public void setG_users_idx(int g_users_idx) {
		this.g_users_idx = g_users_idx;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	
	
	
}
