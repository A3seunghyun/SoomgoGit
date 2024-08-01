package dto;

public class Search_profile_2Dto {
	private int g_users_idx;
	private int score;
	private int r_g_users_idx;
	private int t_g_users_idx;
	
	public Search_profile_2Dto(int g_users_idx, int score, int r_g_users_idx, int t_g_users_idx) {
		this.g_users_idx = g_users_idx;
		this.score = score;
		this.r_g_users_idx = r_g_users_idx;
		this.t_g_users_idx = t_g_users_idx;
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

	public int getR_g_users_idx() {
		return r_g_users_idx;
	}

	public void setR_g_users_idx(int r_g_users_idx) {
		this.r_g_users_idx = r_g_users_idx;
	}

	public int getT_g_users_idx() {
		return t_g_users_idx;
	}

	public void setT_g_users_idx(int t_g_users_idx) {
		this.t_g_users_idx = t_g_users_idx;
	}
	
	
}
